/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dbmanager.ProductManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartItem;
import model.Product;

/**
 *
 * @author DINHTT
 */
@WebServlet(name = "addTocart", urlPatterns = {"/addToCart"})
public class addTocart extends HttpServlet {

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
        //response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        int ID = Integer.valueOf(request.getParameter("id"));
        int size = Integer.valueOf(request.getParameter("size"));
        
        ProductManager pm = new ProductManager();
        System.out.println(pm.getQuantityProduct(size,ID)+"===========");
        HttpSession session = request.getSession();
        Map<Integer,CartItem> cart = null;
        if(session.getAttribute("cart") == null){
                cart = new HashMap<>();
            }else{
                cart = (Map<Integer,CartItem>)session.getAttribute("cart");
            }
        if("add".equals(action)){
            boolean found = false;
            for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
                if(entry.getKey()==ID){
                    if(entry.getValue().getSize() != size){
                        if(request.getParameter("product-quanity")!=null){
                            if(pm.getQuantityProduct(size,ID) < Integer.valueOf(request.getParameter("product-quanity"))){
                                entry.getValue().setQuantity(pm.getQuantityProduct(size,ID));
                            }else{
                                entry.getValue().setQuantity(entry.getValue().getQuantity() + Integer.valueOf(request.getParameter("product-quanity")));
                            }
                      found = true;
                    }else{
                        entry.getValue().setQuantity(entry.getValue().getQuantity()+1);
                        found = true;
                    }
                    }
                }
            }
            if(!found){
                if(request.getParameter("product-quanity")!=null){
                    if(pm.getQuantityProduct(size,ID) < Integer.valueOf(request.getParameter("product-quanity"))){
                        cart.put((ID+1)*size, new CartItem(ID, pm.getQuantityProduct(size,ID), size));
                    }else{
                        cart.put((ID+1)*size, new CartItem(ID, Integer.valueOf(request.getParameter("product-quanity")), size));
                    }
                    
                }else{
                    cart.put((ID+1)*size, new CartItem(ID, 1, size));
                }
                
            }
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("/cart").include(request, response);
        }if("minus".equals(action)){
            for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
                if(entry.getKey()==ID){
                    entry.getValue().setQuantity(entry.getValue().getQuantity()-1);
                    if(entry.getValue().getQuantity()<=0){
                    cart.remove(ID);
                    }
                }
                
            }
        }
        if("plus".equals(action)){
            for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
                if(entry.getValue().getID()==ID){
                    System.out.println(size+"ddddddddddd");
                    if(pm.getQuantityProduct(entry.getValue().getSize(),ID) <= entry.getValue().getQuantity()){
                        entry.getValue().setQuantity(entry.getValue().getQuantity());
                    }else{
                        entry.getValue().setQuantity(entry.getValue().getQuantity()+1);
                    }
                    
                }
                
            }
        }
        if("remove".equals(action)){
            cart.remove(ID);
            
        }
        request.getRequestDispatcher("/cart").include(request, response);
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
        processRequest(request, response);
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
