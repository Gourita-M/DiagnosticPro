package org.example.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBase {
    
    public static Connection connection(){
        String url = "jdbc:mysql://localhost:3306/medical_system";
        String userName = "root";
        String password = "";

        try{
            Connection connection = DriverManager.getConnection(url,userName,password);

            System.out.println("Connected");
            
            return connection;

        }catch(SQLException e){
            e.printStackTrace();
            System.out.println("DataBase Not Connected");
            return null;
        }
    }
}
