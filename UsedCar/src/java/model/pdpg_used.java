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

/**
 *
 * @author yacth_Mon
 */
public class pdpg_used {

    int pdpgId;
    int gradeTentId;
    int NCB_Type;
    String NCB_Name;
    String occupation;
    int carAge;
    int maxLTV;
    int maxTerm;
    long conditionExcept;
    String description;

    public pdpg_used() {
    }

    public int getPdpgId() {
        return pdpgId;
    }

    public void setPdpgId(int pdpgId) {
        this.pdpgId = pdpgId;
    }

    public int getGradeTentId() {
        return gradeTentId;
    }

    public void setGradeTentId(int gradeTentId) {
        this.gradeTentId = gradeTentId;
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

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public int getCarAge() {
        return carAge;
    }

    public void setCarAge(int carAge) {
        this.carAge = carAge;
    }

    public int getMaxLTV() {
        return maxLTV;
    }

    public void setMaxLTV(int maxLTV) {
        this.maxLTV = maxLTV;
    }

    public int getMaxTerm() {
        return maxTerm;
    }

    public void setMaxTerm(int maxTerm) {
        this.maxTerm = maxTerm;
    }

    public long getConditionExcept() {
        return conditionExcept;
    }

    public void setConditionExcept(long conditionExcept) {
        this.conditionExcept = conditionExcept;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void getData(int gradeTentId, int ncb_type,String occupation, int carAgeId) {
        try {
            Connection con = DBConnector.getConnection();
            String sql = "SELECT * FROM pdpg_used WHERE gradeTentId=? AND NCB_Type=? AND occupation=? AND carAge=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, gradeTentId);
            pstm.setInt(2, ncb_type);
            pstm.setString(3,occupation);
            pstm.setInt(4, carAgeId);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()) {
                // to do
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        };

    }
    
    public static Map<Integer,String> getAllNCB(){
        Map<Integer,String> subModels = new HashMap<Integer,String>();
        try{
          Connection con = DBConnector.getConnection();
          String sql = "SELECT DISTINCT NCB_Type,NCB_Name FROM pdpg_used";
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
}
