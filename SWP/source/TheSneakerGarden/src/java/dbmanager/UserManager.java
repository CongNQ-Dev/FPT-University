/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbmanager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Product;
import model.User;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class UserManager {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public User login(String username, String pass) {
        User user = new User();
        String query = "SELECT TOP (1000) [loginId]\n"
                + "      ,[loginUsername]\n"
                + "      ,[loginPassword]\n"
                + "      ,[userId]\n"
                + "      ,[roleId]\n"
                + "  FROM [TSG].[dbo].[tblLogin]\n"
                + "  WHERE [loginUsername] = '" + username + "' AND [loginPassword] = '" + pass + "'";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt("userId"), rs.getInt("roleId"));
            }
        } catch (SQLException e) {
        }
        return user;
    }

    //in all sp 
    public User getUser(int id) {
        User user = new User();
        String query = "SELECT [userId]\n"
                + "      ,[userName]\n"
                + "      ,[userEmail]\n"
                + "      ,[userPhone]\n"
                + "      ,[userAddress]\n"
                + "      ,[roleId]\n"
                + "  FROM [TSG].[dbo].[tblUser]\n"
                + "  WHERE [userId] =" + id + " AND [status] =1";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt("userId"),
                        rs.getString("userName"),
                        rs.getString("userEmail"),
                        rs.getString("userPhone"),
                        rs.getString("userAddress"),
                        rs.getInt("roleId"));
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return user;
    }

    public int getUserID() {
        int id = 0;
        String query = "SELECT MAX(userId) as id\n"
                + "  FROM [TSG].[dbo].[tblUser]";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return id;
    }
    
//in all sp 
    public ArrayList<User> getAllUser() {
        ArrayList<User> list = new ArrayList<>();
        String query = "SELECT  [userId]\n"
                + "      ,[userName]\n"
                + "      ,[userEmail]\n"
                + "      ,[userPhone]\n"
                + "      ,[userAddress]\n"
                + "      ,[roleId]\n"
                + "  FROM [TSG].[dbo].[tblUser]\n"
                + "WHERE [status] = 1";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt("userId"),
                        rs.getString("userName"),
                        rs.getString("userEmail"),
                        rs.getString("userPhone"),
                        rs.getString("userAddress"),
                        rs.getInt("roleId")));
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return list;
    }

    public boolean insert(User user) {
        boolean status = false;

        try {
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement("INSERT [dbo].[tblUser] ([userName], [userEmail], [userPhone], [userAddress], [roleId],[status]) VALUES (N'" + user.getUserName() + "', N'" + user.getUserEmail() + "', N'" + user.getUserPhone() + "', N'" + user.getUserAddress() + "', 2, 1)");
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public boolean insertAccount(String username, String pass, int userID) {
        boolean status = false;

        try {
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement("INSERT [dbo].[tblLogin] ([loginUsername], [loginPassword], [userId], [roleId]) VALUES (N'" + username + "', N'" + pass + "', " + userID + ", 2)");
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public boolean edit(User user) {
        boolean status = false;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement("UPDATE [dbo].[tblUser] SET [userName] = '" + user.getUserName() + "',[userEmail] = '" + user.getUserEmail() + "', [userPhone]= '" + user.getUserPhone() + "', [userAddress] = '" + user.getUserAddress() + "' WHERE [userId] = " + user.getUserId());
            ps.executeUpdate();
            status = true;
            System.out.println("UPDATE [dbo].[tblUser] SET [userName] = '" + user.getUserName() + "',[userEmail] = '" + user.getUserEmail() + "', [userPhone]= '" + user.getUserPhone() + "', [userAddress] = " + user.getUserAddress() + " WHERE [userId] = " + user.getUserId());
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public boolean delete(int userId) {
        boolean status = false;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement("UPDATE [dbo].[tblUser] SET [status] = 0 WHERE [userId] = " + userId);
            ps.executeUpdate();
            status = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
}
