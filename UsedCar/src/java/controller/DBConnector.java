/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnector {
   static String hostName ="localhost";
   static String user = "root";
   static String password = "";
   static String db_Name = "kkp_usedcar";
    public static void main(String[] args) {        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded and registered");            
            String url ="jdbc:mysql://"+hostName+"/"+db_Name;
            //String url = "jdbc:mysql://"+hostName+":3306/"+db_Name+"?user="+user+"&password="+password;
            Connection conn = DriverManager.getConnection(url,user,password);
            //Connection conn = DriverManager.getConnection(url);
            System.out.println("MySQL Connection created\n");            
        }
        catch(ClassNotFoundException cfe){
            System.out.println(cfe);
        }
        catch(SQLException se){
            System.out.println(se);
        }       
        
    }  
    public static Connection getConnection() {
        Connection conn = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded and registered");            
            String url ="jdbc:mysql://"+hostName+"/"+db_Name;
            //String url = "jdbc:mysql://"+hostName+":3306/"+db_Name+"?user="+user+"&password="+password;
            conn = DriverManager.getConnection(url,user,password);
            //Connection conn = DriverManager.getConnection(url);
        }
        catch(ClassNotFoundException cfe){
            System.out.println(cfe);
        }
        catch(SQLException se){
            System.out.println(se);
        } 
        return conn;
    }
}
