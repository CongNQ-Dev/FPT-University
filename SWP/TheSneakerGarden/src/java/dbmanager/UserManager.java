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
 * @author DINHTT
 */
public class UserManager {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils  db = new DBUtils();
    public User login(String username, String pass) {
        User user = new User();
        String query = "SELECT  [CustomerID]\n" +
                        "      ,[RoleID]\n" +
                        "  FROM [dbo].[Customer]\n" +
                        "  WHERE [Account] = '"+username+"' AND [Password] = '"+pass+"'";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt("CustomerID"), rs.getInt("RoleID"));
            }
        } catch (SQLException e) {
        }
        return user;
    }
    //in all sp 
    public User getUser(int id) {
        User user = new User();
        String query = "SELECT [CustomerID]\n" +
                        "      ,[RoleID]\n" +
                        "      ,[Account]\n" +
                        "      ,[Password]\n" +
                        "      ,[Name]\n" +
                        "      ,[Age]\n" +
                        "      ,[Phone]\n" +
                        "      ,[Email]\n" +
                        "      ,[Address]\n" +
                        "  FROM [dbo].[Customer]" +
                        "  WHERE [CustomerID] ="+id;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt("CustomerID"),
                                rs.getString("Account"),
                                rs.getString("Email"),
                                rs.getString("Phone"),
                                rs.getString("Address"),
                                rs.getInt("RoleID"));
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return user;
    }
    public int getUserID() {
        int id = 0;
        String query = "SELECT MAX(CustomerID) as id\n" +
                        "  FROM [dbo].[Customer]";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                id =  rs.getInt("id");
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return id;
    }
     //in all sp 
    public ArrayList<User> getAllUser() {
        ArrayList<User> list = new ArrayList<>();
        String query = "SELECT [CustomerID]\n" +
                        "      ,[RoleID]\n" +
                        "      ,[Account]\n" +
                        "      ,[Password]\n" +
                        "      ,[Name]\n" +
                        "      ,[Age]\n" +
                        "      ,[Phone]\n" +
                        "      ,[Email]\n" +
                        "      ,[Address]\n" +
                        "  FROM [dbo].[Customer]"+
                        "  WHERE [Status] = 1";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt("CustomerID"),
                                rs.getString("Account"),
                                rs.getString("Email"),
                                rs.getString("Phone"),
                                rs.getString("Address"),
                                rs.getInt("RoleID")));
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return list;
    }
    public boolean insert(User user, String password) {
        boolean status = false;
         
        try {
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement("INSERT [dbo].[Customer] ([Account], [Email], [Phone], [Address], [RoleID], [Password], [Name], [Age],[Status]) VALUES (N'"+user.getUserName()+"', N'"+user.getUserEmail()+"', N'"+user.getUserPhone()+"', N'"+user.getUserAddress()+"', 2, '"+password+"','"+user.getUserName()+"', 21, 1)");
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

            PreparedStatement ps = conn.prepareStatement("UPDATE [dbo].[Customer] SET [Account] = '"+user.getUserName()+"',[Email] = '"+user.getUserEmail()+"', [Phone]= '"+user.getUserPhone()+"', [Address] = '"+user.getUserAddress()+"' WHERE [CustomerID] = "+user.getUserId());
            ps.executeUpdate();
            status = true;
            //System.out.println("UPDATE [dbo].[tblUser] SET [userName] = '"+user.getUserName()+"',[userEmail] = '"+user.getUserEmail()+"', [userPhone]= '"+user.getUserPhone()+"', [userAddress] = "+user.getUserAddress()+" WHERE [userId] = "+user.getUserId());
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
    public boolean delete(int userId) {
        boolean status = false;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement("UPDATE [dbo].[Customer] SET [Status] = 0 WHERE [CustomerID] = "+userId);
            ps.executeUpdate();
            status = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
}
