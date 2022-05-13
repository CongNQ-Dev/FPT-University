/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.VaccineDTO;
import UTILS.CommonUtility;
import java.util.List;

/**
 *
 * @author bangmaple
 */
public class VaccineDAO implements IBaseDAO<VaccineDTO, Integer> {

    public static final List<VaccineDTO> VACCINE_DATA = CommonUtility.getVaccineData();

    @Override
    public boolean add(VaccineDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(VaccineDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public VaccineDTO findOne(Integer id) { //getvaccinebyID
        int size = VACCINE_DATA.size();
        for (int i = 0; i < size; i++) {
            if (VACCINE_DATA.get(i).getVaccineId() == id) {
                return VACCINE_DATA.get(i);
            }
        }
        return null;
    }

    @Override
    public List<VaccineDTO> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int size() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


    public  boolean isVaccineExistedWithId(int id) {
        boolean flag = false;
        int size = VACCINE_DATA.size();

        for (int i = 0; i < size; i++) {
            if (VACCINE_DATA.get(i).getVaccineId() == id) {
                flag = true;
                break;
            }
        }
        return flag;
    }

}
