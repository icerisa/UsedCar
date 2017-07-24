/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import controller.DBConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;


public class gradeTent {
    
    public static Map<Integer,String> getAllGradeTent(){
        Map<Integer,String> gradeTents = new HashMap<Integer,String>();
        try{
          Connection con = DBConnector.getConnection();
          String sql = "SELECT * FROM gradetent";
          PreparedStatement pstm = con.prepareStatement(sql);
          ResultSet rs = pstm.executeQuery();
          while(rs.next()){              
              gradeTents.put(rs.getInt("gradeTentId"),rs.getString("gradeTent"));
          }
          con.close();
        } catch (Exception e){
            System.out.println(e);
        };
        return gradeTents;
    }
    
    public static String getGradeTentNameFromId(int id){
        String result ="";
        try{
          Connection con = DBConnector.getConnection();
          String sql = "SELECT gradeTent FROM gradetent WHERE gradeTentId=?";          
          PreparedStatement pstm = con.prepareStatement(sql);
          pstm.setInt(1, id);
          ResultSet rs = pstm.executeQuery();
          if(rs.next()){              
              result = rs.getString("gradeTent");
          }
          con.close();
        } catch (Exception e){
            System.out.println(e);
        };
        return result;
    }
}
