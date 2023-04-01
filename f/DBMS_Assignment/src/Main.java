import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("input.txt"));
        String relation = reader.readLine();
        String[] fds = reader.readLine().split(",");
        reader.close();

        String[] attributes = relation.substring(relation.indexOf('(')+1, relation.indexOf(')')).split(",");

        List<String> candidateKeys = new ArrayList<>();

        for (int i = 1; i < (1 << attributes.length); i++) {
            StringBuilder key = new StringBuilder();
            for (int j = 0; j < attributes.length; j++) {
                if ((i & (1 << j)) != 0) {
                    key.append(attributes[j]);
                }
            }

            boolean isValid = true;
            for (String fd : fds) {
                String[] parts = fd.split("->");
                String left = parts[0].trim();
                String right = parts[1].trim();
                if (!key.toString().contains(left) && attributesContain(attributes, right)) {
                    isValid = false;
                    break;
                }
            }

            if (isValid) {
                candidateKeys.add(key.toString());
            }
        }

        BufferedWriter writer = new BufferedWriter(new FileWriter("output.txt"));
        writer.write("There are a total of " + candidateKeys.size() + " possible CKs. They are given below:");
        writer.newLine();
        for (int i = 0; i < candidateKeys.size(); i++) {
            writer.write("CK" + (i+1) + ": " + candidateKeys.get(i));
            writer.newLine();
        }
        writer.close();
    }

    private static boolean attributesContain(String[] attributes, String attribute) {
        for (String a : attributes) {
            if (a.equals(attribute)) {
                return true;
            }
        }
        return false;
    }
}
