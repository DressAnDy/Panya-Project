    
package products;

import com.sun.org.apache.bcel.internal.generic.SWITCH;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import user.UserDTO;
import utils.DBUtils;

public class productsDAO {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    
  public List<productsDTO> getAllProduct() {
        List<productsDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM PRODUCTS";
        try {
            con = DBUtils.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                productsDTO product = new productsDTO(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getString("category_name"),
                        rs.getBoolean("is_in_stock")
                );
                list.add(product);
            }
        } catch (SQLException ex) {
            System.out.println("Error database: " + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public productsDTO getProductById(int id) {
        productsDTO product = null;
        String sql = "SELECT * FROM PRODUCTS WHERE id = ?";
        try {
            con = DBUtils.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                product = new productsDTO(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getString("image"),
                        rs.getString("category_name"),
                        rs.getBoolean("is_in_stock")
                );
            }
        } catch (SQLException ex) {
            System.out.println("Error database: " + ex.getMessage());
            ex.printStackTrace();
        }
        return product;
    } 
    
    
    
    
public List<productsDTO> list(String keyword, String sortCol) {
    List<productsDTO> list = new ArrayList<>();
    try {
        con = new DBUtils().getConnection();
        String sql = "SELECT * FROM PRODUCTS";
        if (keyword != null && !keyword.isEmpty()) {
            sql += " WHERE name LIKE ? OR category_name LIKE ?";
        }
        if (sortCol != null && !sortCol.isEmpty()) {
            sql += " ORDER BY " + sortCol + " ASC";
        }

        ps = con.prepareStatement(sql);

        if (keyword != null && !keyword.isEmpty()) {
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
        }

        rs = ps.executeQuery();

        while (rs.next()) {
            productsDTO product = new productsDTO();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getDouble("price"));
            product.setImage(rs.getString("image"));
            product.setCategory_name(rs.getString("category_name"));
            product.setIs_in_stock(rs.getBoolean("is_in_stock"));
            list.add(product);
        }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return list;
}

    public void insertCakes(String id , String name , String description
                            ,String image , double price , String category_name , int is_in_stock){
    
        String sql = "INSERT INTO CAKES(id , name , description , price , image , category_id, is_in_stock)\n" +
                        "VALUES(?, ?, ?, ?, ?, ?, ?)";
           try{
               con = new DBUtils().getConnection();
               ps = con.prepareStatement(sql);
               ps.setString(1, id);
               ps.setString(2, name);
               ps.setString(3, description);
               ps.setDouble(4, price);
               ps.setString(5, image);
               ps.setString(6, category_name);
               ps.setInt(6, is_in_stock);  
               ps.executeUpdate();
           } catch (SQLException ex) {
               System.out.println("Insert error!" + ex.getMessage());
               ex.printStackTrace();
        }
    }
    
        public boolean update(productsDTO product) {
        String sql = " UPDATE PRODUCTS SET name = ? , description = ?, price = ?, image = ?, category_name = ?, is_in_stock = ?";
        sql += " WHERE id = ? ";
        try {
            con = DBUtils.getConnection();
            ps = con.prepareStatement(sql);
            
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getImage());
            ps.setString(5, product.getCategory_name());

            ps.executeUpdate();
            con.close();
            
        } catch (SQLException e) {
            System.err.println("Update product error:" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
         
    public boolean delete(Integer id) {
        String sql = " DELETE PRODUCTS ";
        sql += " WHERE id = ? ";
        try {
            Connection cn = DBUtils.getConnection();
            PreparedStatement ps = cn.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            ps.executeQuery();
            cn.close();
            return true;
        } catch (SQLException e) {
            System.err.println("Delete product error:" + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    public productsDTO load(int id) {

        String sql = "SELECT id, name, description, price , image , category_id, is_in_stock FROM CAKES";
            sql += "WHERE id = 1";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                    int CakeID = rs.getInt("id");
                    String Cakename = rs.getString("name");
                    String CakeDescription = rs.getString("description");
                    double CakePrice = rs.getDouble("price");
                    String Cakeimage = rs.getString("image");
                    String CakeCategory_name = rs.getString("category_name");
                    int CakeStock = rs.getInt("is_in_stock");

                 productsDTO product = new productsDTO();
                    product.setId(CakeID);
                    product.setName(Cakename);
                    product.setDescription(CakeDescription);
                    product.setPrice(CakePrice);
                    product.setImage(Cakeimage);
                    product.setCategory_name(CakeCategory_name);
                    
                    
                return product;
            }
        } catch (SQLException ex) {
            System.out.println("Query Student error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
}    
    
    
    
    
    

