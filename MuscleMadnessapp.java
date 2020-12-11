import java.sql.*;
import java.util.Scanner;

class Scratch {
    public static void main(String[] args) {
        String UserName="";
        String LastName="";
        String FirstName="";
        String EmailAddress="";
        String Pass="";
        int Age=0;
        String Birthdate = "";
        float Weight= 0;
        float Height= 0;
        String Gender="";
        String Phone="";

        Scanner scan = new Scanner(System.in);

        System.out.println("UserName");
        UserName = scan.nextLine();

        System.out.println("LastName");
        LastName = scan.nextLine();

        System.out.println("FirstName");
        FirstName = scan.nextLine();

        System.out.println("EmailAddress");
        EmailAddress = scan.nextLine();

        System.out.println("Pass");
        Pass = scan.nextLine();

        System.out.println("Age");
        Age = scan.nextInt();

        System.out.println("Birthdate");
        Birthdate = scan.nextLine();

        System.out.println("Weight");
        Weight = scan.nextFloat();

        System.out.println("Height");
        Height = scan.nextFloat();

        System.out.println("Gender");
        Gender = scan.nextLine();

        System.out.println("Phone");
        Phone = scan.nextLine();


        connection();
        Register(UserName,LastName,FirstName,EmailAddress,Pass,Age,Birthdate,Weight,Height,Gender,Phone);
    }
    //connection to database
    public static void connection() {
        try {
            Connection con = DriverManager.getConnection("jdbc:postgresql:MUSCLE_MADNESS");
        } catch(Exception e) {
            System.err.println("An Error has occured: "+e);
            return;
        }
    }

        public static void Register(String UserName, String LastName, String FirstName,String EmailAddress, String Pass, int Age, String Birthdate, float Weight, float Height, String Gender, String Phone){
            Connection con;
            try {
                con = DriverManager.getConnection("jdbc:postgresql:MUSCLE_MADNESS");
            } catch(Exception e) {
                System.err.println("An Error has occured: "+e);
                return;
            }

            try{
                PreparedStatement st;
                st = con.prepareStatement("INSERT INTO account_INFO " +
                          "UserName, LastName, FirstName, EmailAddress, Pass, Age, Birthdate, Weight," +
                        "Height, Gender, Phone)" + "VALUES"+ "(?,?,?,?,?,?,?,?,?,?,?)");

                 st.setString(1,UserName);
                 st.setString(2,LastName);
                 st.setString(3,FirstName);
                 st.setString(4,EmailAddress);
                 st.setString(5,Pass);
                 st.setInt(6,Age);
                 st.setString(7,Birthdate);
                 st.setFloat(8,Weight);
                 st.setFloat(9,Height);
                 st.setString(10,Gender);
                 st.setString(11,Phone);

                 ResultSet rs = st.executeQuery();

                 while(rs.next()) {
                     System.out.println(String.format("UserName = %s FirstName = %s EmailAddress = %s " +
                             "Pass = %s Age = %d Birthdate = %s weight = %d Height = %d Gender = %s Phone = %s",
                             rs.getString("UserName"), rs.getString("LastName"), rs.getString("EmailAddress")
                               , rs.getString("Pass"), rs.getInt("Age"), rs.getString("BirthDate")
                                , rs.getFloat("Weight"), rs.getFloat("Height"), rs.getString("Gender")
                               ,  rs.getString("Phone")));
                 }
                rs.close();
                st.close();
            }catch(Exception e) {
                System.err.println("An error occured: "+e);
                return;
            }

            }
    }


