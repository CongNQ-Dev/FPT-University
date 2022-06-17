/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dbmanager.OderManager;
import dbmanager.ProductManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CartItem;
import model.Order;
import model.Product;
import model.Size;

/**
 *
 * @author DINHTT
 */
@WebServlet(name = "ProductSize", urlPatterns = {"/ProductSize"})
public class ProductSize extends HttpServlet {

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
        int id = Integer.valueOf(request.getParameter("id"));
        ProductManager manager = new ProductManager();
        ArrayList<Size> p = manager.getProductSize(id);

        request.setAttribute("listSize", p);
        request.setAttribute("id", id);
        request.getRequestDispatcher("productSize.jsp").forward(request, response);
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
        if(request.getParameter("action")!=null){
            if("add".equals(request.getParameter("action"))){
                //int id = Integer.valueOf(request.getParameter("id"));
                String id = request.getParameter("id");
                String size = request.getParameter("size");
                String quantity = request.getParameter("quantity");
                if(productManager.checkQuantityProduct(Integer.valueOf(size),Integer.valueOf(id))){
                    if(productManager.updateSize(Integer.valueOf(size),Integer.valueOf(id),Integer.valueOf(quantity))){
                        ProductManager manager = new ProductManager();

                        ArrayList<Size> p = manager.getProductSize(Integer.valueOf(id));

                        request.setAttribute("listSize", p);
                        request.setAttribute("id", id);
                    request.getRequestDispatcher("./productSize.jsp").forward(request, response);
                    }else{
                        request.getRequestDispatcher("./add-size.jsp").forward(request, response);
                    }
                }else{
                    if(productManager.insertSize(Integer.valueOf(size),Integer.valueOf(id),Integer.valueOf(quantity))){
                        ProductManager manager = new ProductManager();

                        ArrayList<Size> p = manager.getProductSize(Integer.valueOf(id));

                        request.setAttribute("listSize", p);
                        request.setAttribute("id", id);
                    request.getRequestDispatcher("./productSize.jsp").forward(request, response);
                    }else{
                        request.getRequestDispatcher("./add-size.jsp").forward(request, response);
                    }
                }
                
                
            }
        }
        
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
