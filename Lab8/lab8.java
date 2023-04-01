import java.sql.*;

public class lab8
{
	static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	static final String DB_URL= "jdbc:oracle:thin:@localhost:1521:xe";
	static final String USER="ash200042123";
	static final String PASS="cse4308";
	public static void main (String args[])
	{
		Connection conn=null;
		Statement stmt=null;
		try
		{
			Class.forName(JDBC_DRIVER);
			System.out.println("Connecting to database");
			conn=DriverManager.getConnection(DB_URL, USER, PASS);
			System.out.println("Creating statement");
			stmt=conn.createStatement();
			String sql;
            String sql2,sql3,sql4,sql5;
			sql="SELECT A_ID, AMOUNT, TYPE FROM TRANSACTIONS";
			System.out.println("Executing the query: " + sql);
			ResultSet rs=stmt.executeQuery(sql);
            
			// while(rs.next())
			// {
			// 	int account=rs.getInt("a_id");
			// 	int amount=rs.getInt("amount");
			// 	String type=rs.getString("type");
			// 	System.out.print(amount + " taka has been");
			// 	if(type.charAt(0)=='0')
			// 		System.out.print(" deposited to");
			// 	else
			// 		System.out.print(" taken out from");
			// 	System.out.println(" account" + account);
			// }
			
			// rs.close();


            sql2= "SELECT COUNT(T_ID) A FROM TRANSACTIONS WHERE A_ID = 45";
            System.out.println("Executing the query: " + sql2);
            ResultSet rs2=stmt.executeQuery(sql2);
            while(rs2.next())
            {
                int count_a = rs2.getInt("A");
                System.out.println("Number of transactions conducted under account 45: " + count_a);
            }
            rs2.close();

            sql3= "SELECT COUNT(T_ID) A FROM TRANSACTIONS WHERE TYPE = 1";
            System.out.println("Executing the query: " + sql3);
            ResultSet rs3=stmt.executeQuery(sql3);
            while(rs3.next())
            {
                int count_debit = rs3.getInt("A");
                System.out.println("TOTAL NUMBER OF DEBITS: " + count_debit);
            }
            rs3.close();

            sql4= "SELECT A_ID, AMOUNT, TYPE FROM TRANSACTIONS WHERE EXTRACT(YEAR FROM TO_DATE(DTM, 'DD-MON-RR'))=2020";
            System.out.println("Executing the query: " + sql4);
            ResultSet rs4=stmt.executeQuery(sql4);
            while(rs4.next())
            {
                int account=rs4.getInt("a_id");
				int amount=rs4.getInt("amount");
				String type=rs4.getString("type");
				System.out.print(amount + " taka has been");
				if(type.charAt(0)=='0')
					System.out.print(" deposited to");
				else
					System.out.print(" taken out from");
				System.out.println(" account " + account);
            }
            rs4.close();
            
           
            sql5= "SELECT A_ID,SUM(AMOUNT) A FROM TRANSACTIONS GROUP BY A_ID";
            System.out.println("Executing the query: " + sql5);
            ResultSet rs5=stmt.executeQuery(sql5);
            int count_cip=0;
            int count_vip=0;
            int count_none=0;
            int count_ordinary=0;
            
           
            while(rs5.next())
            {
                int total=0;
                int account=rs5.getInt("a_id");
				int amount=rs5.getInt("a");
                System.out.print(account + "   " + amount + "\n");
                
                String sql6;
                sql6= "SELECT AMOUNT X, TYPE Y FROM TRANSACTIONS WHERE A_ID = '"+ Integer.toString(account) +"'";
                ResultSet rs6=stmt.executeQuery(sql6);
                while(rs6.next()){
				    int amount1=rs6.getInt("X");
				    String type1=rs6.getString("Y");
                if(type1.charAt(0)=='0')
					total+=amount1;
				else
					total-=amount1;
                    //System.out.println(account);
                }
                //System.out.println(total);
                if(amount>5000000 && total>1000000){
                    count_cip++;
                }
                else if(amount>2500000 && amount<4500000 && total>500000 && total>900000){
                    count_vip++;
                }
                else if(amount<1000000 && total<100000){
                    count_ordinary++;
                }
                else{
                    count_none++;
                }
                
            }
            
            System.out.println("Number of CIP: "+count_cip);
            System.out.println("Number of VIP: "+count_vip);
            System.out.println("Number of Ordinary: "+count_ordinary);
            System.out.println("Number of Others: "+count_none);
            
            rs5.close();

			stmt.close();
			conn.close();
			//System.out.println("Thank you for banking with us!");
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}