/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbmanager;

import utils.DBUtils;
import model.Category;
import model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author Admin
 */
public class ProductManager {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    //in all sp 
    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String query = "SELECT * FROM [TSG].[dbo].[tblProduct] WHERE [status] = 1";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("cId"),
                        rs.getInt("status")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //in sp theo id
    public Product getProduct(int id) {
        Product product = new Product();
        String query = "SELECT * FROM [TSG].[dbo].[tblProduct] WHERE [id] = " + id;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                product = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("cId"),
                        rs.getInt("status"));
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return product;
    }
    
    public ArrayList<Product> getProductsWithPagging(int page, int PAGE_SIZE) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            String query = "select *  from [TSG].[dbo].[tblProduct] order by [id]\n"
                    + "offset (?-1)*? row fetch next ? rows only";
            
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("cId"),
                        rs.getInt("status")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<Product> search(String keyword) {
        ArrayList<Product> list = new ArrayList<>();
        String query = "SELECT * FROM [TSG].[dbo].[tblProduct] WHERE name like ?";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + keyword + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("cId"),
                        rs.getInt("status")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public boolean insert(Product product) {
        boolean status = false;

        try {
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement("INSERT [dbo].[tblProduct] ([name], [type], [price], [image], [description], [status], [cId]) VALUES (N'" + product.getName() + "', N'" + product.getcId() + "'," + product.getPrice() + ", N'" + product.getImage() + "', N'" + product.getDescription() + "', 1, N'" + product.getcId() + "')");
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public boolean edit(Product product) {
        boolean status = false;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement("UPDATE [dbo].[tblProduct] SET [name] = '" + product.getName() + "',"
                    + "[type] = '" + product.getcId() + "', [price]= '" + product.getPrice() + "', "
                    + "[image] = '" + product.getImage() + "', [description] = '" + product.getDescription() + "', "
                    + "[status] = '" + product.getStatus() + "' , [cId] = '" + product.getcId() + "' "
                    + "WHERE [id] = " + product.getId());
            ps.executeUpdate();
            status = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public boolean delete(int id) {
        boolean status = false;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement("UPDATE [dbo].[tblProduct] SET [status] = 0 WHERE [id] = " + id);
            ps.executeUpdate();
            status = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public int getTotalProducts() {
        try {
            String sql = "select count(id)  from [dbo].[tblProduct] ";
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
}
