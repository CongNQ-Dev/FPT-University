/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.CountryDTO;
import UTILS.CommonUtility;
import java.util.List;

/**
 *
 * @author cong.nguyen
 */
public class CountryDAO implements IBaseDAO<CountryDTO, Integer> {
         public static final List<CountryDTO> COUNTRY_DATA = CommonUtility.getCountryData();
    @Override
    public boolean add(CountryDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(CountryDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public CountryDTO findOne(Integer id) {  //getCountryById
         int size = COUNTRY_DATA.size();
        for (int i = 0; i < size; i++) {
            if (COUNTRY_DATA.get(i).getId() == id) {
                System.out.println(COUNTRY_DATA.get(i));
                System.out.println("Do you want to choose this country ?");
                boolean choice = CommonUtility.getYesNoInput();
                if (choice) {
                    return COUNTRY_DATA.get(i);
                }
            }
        }
        return null; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<CountryDTO> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int size() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
     public static boolean isCountryExistedWithName(String name) {
        boolean flag = false;
        int size = COUNTRY_DATA.size();
        for (int i = 0; i < size; i++) {
            if (COUNTRY_DATA.get(i).getName().equals(name)) {
                flag = true;
                break;
            }
        }
        return flag;
    }
     
    
    
    
}
