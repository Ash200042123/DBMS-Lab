import java.sql.*;

public class practice {
    public static void main(String[] args) throws ClassNotFoundException {
        
        try{String url = "";
        String uname = "";
        String pass = "";
        String query = "select * from student";


        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, uname, pass);
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);

        String name = rs.getString(2);
    }
    catch(SQLException s){
        System.out.println(s);
    }
    }
}
