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
    int carAgeId;
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

    public int getCarAgeId() {
        return carAgeId;
    }

    public void setCarAgeId(int carAgeId) {
        this.carAgeId = carAgeId;
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

    @Override
    public String toString() {
        return "pdpg_used{" + "pdpgId=" + pdpgId + ", gradeTentId=" + gradeTentId + ", NCB_Type=" + NCB_Type + ", NCB_Name=" + NCB_Name + ", occupation=" + occupation + ", carAgeId=" + carAgeId + ", maxLTV=" + maxLTV + ", maxTerm=" + maxTerm + ", conditionExcept=" + conditionExcept + ", description=" + description + '}';
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
                this.pdpgId = rs.getInt("pdpgId");
                this.gradeTentId = rs.getInt("gradeTentId");
                this.NCB_Type = rs.getInt("NCB_Type");
                this.NCB_Name = rs.getString("NCB_Name");
                this.occupation = rs.getString("occupation");
                this.carAgeId = rs.getInt("carAge");
                String ltv = rs.getString("maxLTV");
                this.maxLTV = Integer.parseInt(ltv.substring(0,ltv.length()-1));
                this.maxTerm = rs.getInt("maxTerm");
                this.conditionExcept = rs.getLong("conditionExcept");
                this.description = rs.getString("description");
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        };

    }
    
}
