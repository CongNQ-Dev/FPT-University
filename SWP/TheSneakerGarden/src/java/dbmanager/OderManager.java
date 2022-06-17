/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbmanager;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.CartItem;
import model.Order;
import model.Product;
import utils.DBUtils;

/**
 *
 * @author DINHTT
 */
public class OderManager {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils  db = new DBUtils();
    public boolean insertOder(Date orderDate,Date shipDate, double price,  int userID){
        String query = "INSERT [dbo].[Orders] ([OrderDate], [ShippedDate], [ShipVia], [CustomerID]) VALUES (?, ?, ?, ?)";//query insert
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement pst = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);//create prepare statement

            pst.setDate(1, orderDate);
            pst.setDate(2, shipDate);
            pst.setString(3, "Speedy Express");
            pst.setInt(4, userID);
            pst.executeUpdate();
            rs = pst.getGeneratedKeys();
            rs.next();//

            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());//display warning message
            return false;
        } catch (Exception e) {
            System.out.println("can't insert product to list.");//display warning message
            return false;

        }
    }
    
    public boolean insertOderItem(int orderId,int itemId, int quantity, double price){
        String query = "INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (?, ?, ?, ?)";//query insert
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement pst = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);//create prepare statement

            pst.setInt(1, orderId);
            pst.setInt(2, itemId);
            pst.setInt(3, quantity);
            pst.setDouble(4, price);
            pst.executeUpdate();
            rs = pst.getGeneratedKeys();
            rs.next();//

            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage()+"+++++++++++++++" + orderId);//display warning message
            return false;
        } catch (Exception e) {
            System.out.println("can't insert product to list.");//display warning message
            return false;

        }
    }
    public int getOrderID() {
        int id = 0;
        try {
           String sql = "SELECT MAX(OrderID) as id\n" +
                        "  FROM [dbo].[Orders]";
        Statement st2 = this.con.createStatement();
        ResultSet rs2 = st2.executeQuery(sql);
        while (rs2.next()) {
            id = rs2.getInt("id");
        }
        
        } catch (Exception e) {
        }
        return id;
    }
    public ArrayList<Order> getAllProduct() {
        ArrayList<Order> list = new ArrayList<>();
        String query = "SELECT [OrderID]\n" +
                        "      ,[CustomerID]\n" +
                        "      ,[ShipVia]\n" +
                        "      ,[OrderDate]\n" +
                        "      ,[ShippedDate]\n" +
                        "  FROM [dbo].[Orders]";
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("OrderID"),
                        rs.getDate("OrderDate"),
                        rs.getDate("ShippedDate"),0,
                        rs.getInt("CustomerID")));
            }
        } catch (SQLException e) {
        }
        return list;
    }
     public ArrayList<Order> getAllProductByUserID(int id) {
        ArrayList<Order> list = new ArrayList<>();
        String query = "SELECT [OrderID]\n" +
                        "      ,[CustomerID]\n" +
                        "      ,[ShipVia]\n" +
                        "      ,[OrderDate]\n" +
                        "      ,[ShippedDate]\n" +
                        "  FROM [dbo].[Orders] " +
                        "  WHERE [CustomerID] = "+ id;
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("OrderID"),
                        rs.getDate("OrderDate"),
                        rs.getDate("ShippedDate"),0,
                        rs.getInt("CustomerID")));
            }
        } catch (SQLException e) {
        }
        return list;
    }
        public ArrayList<CartItem> getAllItemByID(int id) {
        ArrayList<CartItem> list = new ArrayList<>();
        String query = "SELECT [OrderID]\n" +
                        "      ,[ProductID]\n" +
                        "      ,[UnitPrice]\n" +
                        "      ,[Quantity]\n" +
                        "  FROM [dbo].[OrderDetails]" +
                    "  WHERE [OrderDetails].[OrderID] = " + id;
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CartItem(rs.getInt("ProductID"),
                        rs.getInt("Quantity")));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
}
