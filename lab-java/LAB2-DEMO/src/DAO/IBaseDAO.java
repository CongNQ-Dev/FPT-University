/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;



/**
 *
 * @author bangmaple
 */
public interface IBaseDAO<E, ID> {
    boolean add(E e);
    boolean delete(ID id);
    boolean update(E e);
    E findOne(ID id);
    List<E> findAll();
    int size();
    
}
