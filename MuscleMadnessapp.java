package com.example.musclemadness;

import java.sql.*;

class MuscleMadnessapp {

    public static void main(String[] args) {
        String UserName = "";
        String LastName = "";
        String FirstName = "";
        String EmailAddress = "";
        String Pass = "";
        int Age = 0;
        String Birthdate = "";
        int Weight = 0;
        int Height = 0;
        String Gender = "";
        String Phone = "";
        connection();
        Register(UserName, LastName, FirstName, EmailAddress, Pass, Age, Birthdate, Weight, Height, Gender, Phone);
    }

    //connection to database
    public static void connection() {
        Connection con;
        try {
            con = DriverManager.getConnection("jdbc:postgresql:MUSCLE_MADNESS");
        } catch (Exception e) {
            System.err.println("An Error has occured: " + e);
            return;
        }
    }

    public static void Register(String UserName, String LastName, String FirstName, String EmailAddress, String Pass, int Age, String Birthdate, int Weight, int Height, String Gender, String Phone) {
        Connection con;
        try {
            con = DriverManager.getConnection("jdbc:postgresql:MUSCLE_MADNESS");
        } catch (Exception e) {
            System.err.println("An Error has occured: " + e);
            return;
        }

        try {
            PreparedStatement st;
            st = con.prepareStatement("INSERT INTO account_INFO " +
                    "UserName, LastName, FirstName, EmailAddress, Pass, Age, Birthdate, Weight," +
                    "Height, Gender, Phone)" + "VALUES" + "(?,?,?,?,?,?,?,?,?,?,?)");

            st.setString(1, UserName);
            st.setString(2, LastName);
            st.setString(3, FirstName);
            st.setString(4, EmailAddress);
            st.setString(5, Pass);
            st.setInt(6, Age);
            st.setString(7, Birthdate);
            st.setInt(8, Weight);
            st.setInt(9, Height);
            st.setString(10, Gender);
            st.setString(11, Phone);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                System.out.println(String.format("UserName = %s FirstName = %s EmailAddress = %s " +
                                "Pass = %s Age = %d Birthdate = %s weight = %d Height = %d Gender = %s Phone = %s",
                        rs.getString("UserName"), rs.getString("LastName"), rs.getString("EmailAddress")
                        , rs.getString("Pass"), rs.getInt("Age"), rs.getString("BirthDate")
                        , rs.getInt("Weight"), rs.getInt("Height"), rs.getString("Gender")
                        , rs.getString("Phone")));
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            System.err.println("An error occured: " + e);
            return;
        }

    }
}

