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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class pdpg_used {

    int pdpgId;
    int gradeTentId;
    int NCB_Type;
    String NCB_Name;
    String occupation;
    int carAgeId;
    int maxLTV;
    int maxTerm;
    int DBR;
    int IIR;
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

    public int getDBR() {
        return DBR;
    }

    public void setDBR(int DBR) {
        this.DBR = DBR;
    }

    public int getIIR() {
        return IIR;
    }

    public void setIIR(int IIR) {
        this.IIR = IIR;
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

    public void getData(int gradeTentId, int ncb_type, String occupation, int carAgeId) {
        try {
            Connection con = DBConnector.getConnection();
            String sql = "SELECT * FROM pdpg_used WHERE gradeTentId=? AND NCB_Type=? AND occupation=? AND ageId=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, gradeTentId);
            pstm.setInt(2, ncb_type);
            pstm.setString(3, occupation);
            pstm.setInt(4, carAgeId);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                this.pdpgId = rs.getInt("pdpgId");
                this.gradeTentId = rs.getInt("gradeTentId");
                this.NCB_Type = rs.getInt("NCB_Type");
                this.NCB_Name = rs.getString("NCB_Name");
                this.occupation = rs.getString("occupation");
                this.carAgeId = rs.getInt("ageId");
                this.maxLTV = rs.getInt("maxLtv");
                this.maxTerm = rs.getInt("maxTerm");
                this.DBR = rs.getInt("DBR");
                this.IIR = rs.getInt("IIR");
                this.conditionExcept = rs.getLong("conditionExcept");
                this.description = rs.getString("description");
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        };
    }

    public static boolean deletePDPG_UsedData(int id) {
        boolean result = false;
        try {
            Connection con = DBConnector.getConnection();
            String sql = "DELETE FROM `pdpg_used` WHERE pdpgId=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            int rs = pstm.executeUpdate();
            if (rs > 0) {
                result = true;
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        };
        return result;
    }

    public static ArrayList<pdpg_used> getAllPDPG_UsedData() {
        ArrayList<pdpg_used> pdpg_useds = new ArrayList<pdpg_used>();
        try {
            Connection con = DBConnector.getConnection();
            String sql = "SELECT * FROM pdpg_used";
            PreparedStatement pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                pdpg_used pdpg = new pdpg_used();
                pdpg.setPdpgId(rs.getInt("pdpgId"));
                pdpg.setGradeTentId(rs.getInt("gradeTentId"));
                pdpg.setNCB_Type(rs.getInt("NCB_Type"));
                pdpg.setNCB_Name(rs.getString("NCB_Name"));
                pdpg.setOccupation(rs.getString("occupation"));
                pdpg.setCarAgeId(rs.getInt("ageId"));
                pdpg.setMaxLTV(rs.getInt("maxLtv"));
                pdpg.setMaxTerm(rs.getInt("maxTerm"));
                pdpg.setDBR(rs.getInt("DBR"));
                pdpg.setIIR(rs.getInt("IIR"));
                pdpg.setConditionExcept(rs.getLong("conditionExcept"));
                pdpg.setDescription(rs.getString("description"));
                pdpg_useds.add(pdpg);
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        };
        return pdpg_useds;
    }

    public static boolean addPDPG_Used(int gradeTentId, int NCB_Type, String NCB_Name, String occupation, int ageId, int maxLTV, int maxTerm, int DBR, int IIR, long conditionExcept, String description) {
        boolean result = false;
        try {
            Connection con = DBConnector.getConnection();
            String sql = "INSERT INTO `pdpg_used`( `gradeTentId`, `NCB_Type`, `NCB_Name`, `occupation`, `ageId`, `maxLTV`, `maxTerm`, `DBR`, `IIR`, `conditionExcept`, `description`) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, gradeTentId);
            pstm.setInt(2, NCB_Type);
            pstm.setString(3, NCB_Name);
            pstm.setString(4, occupation);
            pstm.setInt(5, ageId);
            pstm.setInt(6, maxLTV);
            pstm.setInt(7, maxTerm);
            pstm.setInt(8, DBR);
            pstm.setInt(9, IIR);
            pstm.setLong(10, conditionExcept);
            pstm.setString(11, description);
            int rs = pstm.executeUpdate();
            if (rs > 0) {
                result = true;
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        };
        return result;
    }

    public static boolean updatePDPG_Used(int dataId,int gradeTentId, int NCB_Type, String NCB_Name, String occupation, int ageId, int maxLTV, int maxTerm, int DBR, int IIR, long conditionExcept, String description) {
        boolean result = false;
        try {
            Connection con = DBConnector.getConnection();
            String sql = "UPDATE `pdpg_used` SET `gradeTentId`=?,`NCB_Type`=?,`NCB_Name`=?,"
                    + "`occupation`=?,`ageId`=?,`maxLTV`=?,`maxTerm`=?,`DBR`=?,`IIR`=?,"
                    + "`conditionExcept`=?,`description`=? WHERE pdpgId=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, gradeTentId);
            pstm.setInt(2, NCB_Type);
            pstm.setString(3, NCB_Name);
            pstm.setString(4, occupation);
            pstm.setInt(5, ageId);
            pstm.setInt(6, maxLTV);
            pstm.setInt(7, maxTerm);
            pstm.setInt(8, DBR);
            pstm.setInt(9, IIR);
            pstm.setLong(10, conditionExcept);
            pstm.setString(11, description);
            pstm.setInt(12, dataId);
            int rs = pstm.executeUpdate();
            if (rs > 0) {
                result = true;
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
}
