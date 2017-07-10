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

/**
 *
 * @author yacth_Mon
 */
public class Brand {
    int id;
    String brandName;
    String brandType;

    public Brand(int id, String brandName, String brandType) {
        this.id = id;
        this.brandName = brandName;
        this.brandType = brandType;
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

    public String getBrandType() {
        return brandType;
    }

    public void setBrandType(String brandType) {
        this.brandType = brandType;
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
              brand.setBrandType(rs.getString("brandType"));
              brands.add(brand);
          }
          con.close();
        } catch (Exception e){
            System.out.println(e);
        };
        return brands;
    }
    
}
