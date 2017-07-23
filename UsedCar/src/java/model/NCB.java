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


public class NCB {
    int NCB_Type;
    String NCB_Name;

    public NCB() {
    }

    public NCB(int NCB_Type) {
        this.NCB_Type = NCB_Type;
        getNCBData();
    }

    public NCB(int NCB_Type, String NCB_Name) {
        this.NCB_Type = NCB_Type;
        this.NCB_Name = NCB_Name;
    }

    public int getNCB_Type() {
        return NCB_Type;
    }

    public void setNCB_Type(int NCB_Type) {
        this.NCB_Type = NCB_Type;
    }

    public String getNCB_Name() {
        return NCB_Name;
    }

    public void setNCB_Name(String NCB_Name) {
        this.NCB_Name = NCB_Name;
    }

    @Override
    public String toString() {
        return "NCB{" + "NCB_Type=" + NCB_Type + ", NCB_Name=" + NCB_Name + '}';
    }
    
    public void getNCBData(){
        try{
          Connection con = DBConnector.getConnection();
          String sql = "SELECT * FROM ncb WHERE NCB_Type=?";
          PreparedStatement pstm = con.prepareStatement(sql);
          pstm.setInt(1, this.NCB_Type);
          ResultSet rs = pstm.executeQuery();
          if(rs.next()){
              this.NCB_Name = rs.getString("NCB_Name");
          } else {
              this.NCB_Name = "NCB not found";
          }
        } catch(Exception e){
            System.out.println(e);
        }
    }
    
    public static Map<Integer,String> getAllNCB(){
        Map<Integer,String> subModels = new HashMap<Integer,String>();
        try{
          Connection con = DBConnector.getConnection();
          String sql = "SELECT * FROM ncb";
          PreparedStatement pstm = con.prepareStatement(sql);
          ResultSet rs = pstm.executeQuery();
          while(rs.next()){              
              subModels.put(rs.getInt("NCB_Type"),rs.getString("NCB_Name"));
          }
          con.close();
        } catch (Exception e){
            System.out.println(e);
        };
        return subModels;
    }
    
    public static String getNCBNameFromType(int type){
        try{
          Connection con = DBConnector.getConnection();
          String sql = "SELECT * FROM ncb WHERE NCB_Type=?";
          PreparedStatement pstm = con.prepareStatement(sql);
          pstm.setInt(1, type);
          ResultSet rs = pstm.executeQuery();
          if(rs.next()){
              return rs.getString("NCB_Name");
          }
        } catch(Exception e){
            System.out.println(e);
        }
        return "NCB not found";
    }
}
