/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dbmanager.ProductManager;
import dbmanager.UserManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import model.User;

/**
 *
 * @author Amin
 */
@WebServlet(name = "ProductManagerControl", urlPatterns = {"/item-management"})
public class ProductManagerControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductManager productManager = new ProductManager();
        ArrayList<Product> listProduct = productManager.getAllProduct();
        if(request.getParameter("action")!=null){
            if("add".equals(request.getParameter("action"))){
                request.getRequestDispatcher("./add-item.jsp").forward(request, response);
            }
            if("update".equals(request.getParameter("action"))){
                Product product = productManager.getProduct(Integer.valueOf(request.getParameter("id")));
                request.setAttribute("product", product);
                request.getRequestDispatcher("./update-item.jsp").forward(request, response);
            }
            if("delete".equals(request.getParameter("action"))){
                productManager.delete(Integer.valueOf(request.getParameter("id")));
                listProduct = productManager.getAllProduct();
            }
        }
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("./item-management.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductManager productManager = new ProductManager();
        ArrayList<Product> listProduct = productManager.getAllProduct();
        if(request.getParameter("action")!=null){
            if("add".equals(request.getParameter("action"))){
                //int id = Integer.valueOf(request.getParameter("id"));
                String name = request.getParameter("name");
                String type = request.getParameter("type");
                String price = request.getParameter("price");
                String image = request.getParameter("image");
                String description = request.getParameter("description");
                Product product = new Product(0, name, image, Double.valueOf(price), description, Integer.valueOf(type), 1);
                if(productManager.insert(product)){
                    listProduct = productManager.getAllProduct();
                    request.setAttribute("listProduct", listProduct);
                }else{
                    request.getRequestDispatcher("./add-item.jsp").forward(request, response);
                }
                
            }
            if("edit".equals(request.getParameter("action"))){
                int id = Integer.valueOf(request.getParameter("id"));
                String name = request.getParameter("name");
                String type = request.getParameter("type");
                String price = request.getParameter("price");
                String image = request.getParameter("image");
                String description = request.getParameter("description");
                Product product = new Product(id, name, image, Double.valueOf(price), description, Integer.valueOf(type), 1);
                if(productManager.edit(product)){
                    listProduct = productManager.getAllProduct();
                    request.setAttribute("listProduct", listProduct);
                }else{
                    request.getRequestDispatcher("./update-item.jsp").forward(request, response);
                }
            }
        }
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("./item-management.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
