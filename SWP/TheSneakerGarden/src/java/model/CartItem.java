/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 *
 * @author DINHTT
 */
public class CartItem {
    int ID;
    int quantity;
    int size;

    public CartItem() {
    }

    public CartItem(int ID, int quantity) {
        this.ID = ID;
        this.quantity = quantity;
    }

    public CartItem(int ID, int quantity, int size) {
        this.ID = ID;
        this.quantity = quantity;
        this.size = size;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

   
}
