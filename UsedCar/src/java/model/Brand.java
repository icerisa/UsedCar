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


public class Brand {
    int id;
    String brandName;
    int brandTypeId;

    public Brand(int id, String brandName, int brandTypeId) {
        this.id = id;
        this.brandName = brandName;
        this.brandTypeId = brandTypeId;
    }

    public Brand() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public int getBrandTypeId() {
        return brandTypeId;
    }

    public void setBrandTypeId(int brandTypeId) {
        this.brandTypeId = brandTypeId;
    }
    
    public static ArrayList<Brand> getAllBrands(){
        ArrayList<Brand> brands = new ArrayList<Brand>();
        try{
          Connection con = DBConnector.getConnection();
          String sql = "SELECT * FROM brand";
          PreparedStatement pstm = con.prepareStatement(sql);
          ResultSet rs = pstm.executeQuery();
          while(rs.next()){
              Brand brand = new Brand();              
              brand.setId(rs.getInt("brandId"));
              brand.setBrandName(rs.getString("brandName"));
              brand.setBrandTypeId(rs.getInt("brandType"));
              brands.add(brand);
          }
          con.close();
        } catch (Exception e){
            System.out.println(e);
        };
        return brands;
    }
    public static String getBrandNameFromId(int id){
        try{
            Connection con = DBConnector.getConnection();
            String sql = "SELECT brandName FROM brand WHERE brandId=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                return rs.getString("brandName");
            }
        } catch(Exception e){
            System.out.println(e);
        }
        return "Brand Not found";
    }
    public static int getBrandTypeFromId(int id){
        try{
            Connection con = DBConnector.getConnection();
            String sql = "SELECT brandType FROM brand WHERE brandId=?";
            PreparedStatement pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                return rs.getInt("brandType");
            }
        } catch(Exception e){
            System.out.println(e);
        }
        return -1;
    }
    
}
