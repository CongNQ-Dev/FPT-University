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
import model.Order;
import model.Product;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class OderManager {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public boolean insertOder(Date orderDate, Date shipDate, double price, int userID) {
        String query = "INSERT [dbo].[tblOrder] ([orderDate], [shipDate], [totalPrice], [userId]) VALUES (?, ?, ?, ?)";//query insert
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement pst = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);//create prepare statement

            pst.setDate(1, orderDate);
            pst.setDate(2, shipDate);
            pst.setDouble(3, price);
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

    public boolean insertOderItem(int orderId, int itemId, int quantity) {
        String query = "INSERT [dbo].[tblOrItem] ([orderId], [itemId], [quantity]) VALUES (?, ?, ?)";//query insert
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement pst = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);//create prepare statement

            pst.setInt(1, orderId);
            pst.setInt(2, itemId);
            pst.setInt(3, quantity);
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

    public int getOrderID() {
        int id = 0;
        try {
            String sql = "SELECT MAX(orderId) as id\n"
                    + "  FROM [TSG].[dbo].[tblOrder]";
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
        String query = "SELECT TOP (1000) [orderId]\n"
                + "      ,[orderDate]\n"
                + "      ,[shipDate]\n"
                + "      ,[totalPrice]\n"
                + "      ,[userId]\n"
                + "  FROM [TSG].[dbo].[tblOrder]";
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("orderId"),
                        rs.getDate("orderDate"),
                        rs.getDate("shipDate"),
                        rs.getDouble("totalPrice"),
                        rs.getInt("userId")));
            }
        } catch (SQLException e) {
        }
        return list;
    }
}
