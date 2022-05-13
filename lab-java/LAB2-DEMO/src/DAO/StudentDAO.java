/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.StudentDTO;
import UTILS.CommonUtility;
import java.util.List;

/**
 *
 * @author bangmaple
 */
public class StudentDAO implements IBaseDAO<StudentDTO, String>{
    public static final List<StudentDTO> STUDENT_DATA = CommonUtility.getStudentData();
    
    @Override
    public boolean add(StudentDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(StudentDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public StudentDTO findOne(String id) { //getStudentById
        int size = STUDENT_DATA.size();
        for (int i = 0; i < size; i++) {
            if (STUDENT_DATA.get(i).getStudentId().equals(id)) {
                return STUDENT_DATA.get(i);
            }
        }
        return null;
    }

    @Override
    public List<StudentDTO> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int size() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    public  boolean isStudentExistedWithId(String id) {
        boolean flag = false;
        int size = STUDENT_DATA.size();

        for (int i = 0; i < size; i++) {
            if (STUDENT_DATA.get(i).getStudentId().equals(id)) {
                flag = true;
                break;
            }
        }
        return flag;
    }
    
}
