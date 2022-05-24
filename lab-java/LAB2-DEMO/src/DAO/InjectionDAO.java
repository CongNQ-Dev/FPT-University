/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import static DAO.StudentDAO.STUDENT_DATA;
import static DAO.VaccineDAO.VACCINE_DATA;
import DTO.InjectionDTO;
import UTILS.CommonUtility;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class InjectionDAO implements IBaseDAO<InjectionDTO, Integer> {

    public static final List<InjectionDTO> INJECTION_DATA = CommonUtility.getInjectionData();

    @Override
    public boolean add(InjectionDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Integer id) { //delete injection by id
        int size = INJECTION_DATA.size();
        for (int i = 0; i < size; i++) {
            if (INJECTION_DATA.get(i).getInjectionId() == id) {
                INJECTION_DATA.remove(i);
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean update(InjectionDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public InjectionDTO findOne(Integer id) { //getInjectionById
        int size = INJECTION_DATA.size();
        for (int i = 0; i < size; i++) {
            if (INJECTION_DATA.get(i).getInjectionId() == id) {
                return INJECTION_DATA.get(i);
            }
        }
        return null;
    }

    @Override
    public List<InjectionDTO> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int size() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public static boolean isInjectionExistedWithId(int id) {
        boolean flag = false;
        int size = INJECTION_DATA.size();

        for (int i = 0; i < size; i++) {
            if (INJECTION_DATA.get(i).getInjectionId() == id) {
                flag = true;
                break;
            }
        }
        return flag;
    }

    public boolean checkIfStudentInjectedFirstInjection(int injectionId) {
        int size = INJECTION_DATA.size();
        for (int i = 0; i < size; i++) {
            InjectionDTO dto = INJECTION_DATA.get(i);
            if (dto.getInjectionId() == injectionId) {
                if (dto.getFirstInjectionDate() == null || dto.getFirstInjectionPlace() == null) {
                    return false;
                }
                return true;
            }
        }
        return false;
    }

    public boolean checkIfStudentInjectedSecondInjection(int injectionId) {
        int size = INJECTION_DATA.size();
        for (int i = 0; i < size; i++) {
            InjectionDTO dto = INJECTION_DATA.get(i);
            if (dto.getInjectionId() == injectionId) {
                if (dto.getSecondInjectionDate() == null || dto.getSecondInjectionPlace() == null) {
                    return false;
                }
                return true;
            }
        }
        return false;
    }

    public boolean isAllowToInjectSecondInjection(Date date) {
        Calendar c1 = Calendar.getInstance();
        c1.setTime(date);
        c1.add(Calendar.MONTH, 1);
        Calendar c2 = Calendar.getInstance();
        Calendar c3 = Calendar.getInstance();
        c3.setTime(date);
        c3.add(Calendar.MONTH, 3);
        return c2.after(c1) || c2.equals(c1) && (c2.before(c3) || c2.equals(c3));
    }

    public List<InjectionDTO> getInjectionByVaccineId(int id) {
        int size = INJECTION_DATA.size();
        List<InjectionDTO> result = new ArrayList<>();
        for (int i = 0; i < size; i++) {
            if (INJECTION_DATA.get(i).getVaccineId() == id) {
                result.add(INJECTION_DATA.get(i));
            }
        }
        return result;
    }

    public InjectionDTO getInjectionByStudentId(String id) {
        int size = INJECTION_DATA.size();
        for (int i = 0; i < size; i++) {
            if (INJECTION_DATA.get(i).getStudentId().equalsIgnoreCase(id)) {
                return INJECTION_DATA.get(i);
            }

        }
        return null;
    }

    public List<InjectionDTO> getInjectionByVaccineName(String search) {
        List<InjectionDTO> result = new ArrayList<>();
        int size = VACCINE_DATA.size();
        for (InjectionDTO injection : INJECTION_DATA) {
            for (int i = 0; i < size; i++) {
                if (injection.getVaccineId() == VACCINE_DATA.get(i).getVaccineId() && VACCINE_DATA.get(i).getVaccineName().toLowerCase().trim().contains(search.toLowerCase().trim())) {

                    result.add(injection);

                }

            }
        }
        return result;
    }
        public List<InjectionDTO> getInjectionByStudentName(String search) {
        List<InjectionDTO> result = new ArrayList<>();
        int size = STUDENT_DATA.size();
        for (InjectionDTO injection : INJECTION_DATA) {
            for (int i = 0; i < size; i++) {
                if (injection.getStudentId().equals(STUDENT_DATA.get(i).getStudentId()) && STUDENT_DATA.get(i).getFullname().toLowerCase().trim().contains(search.toLowerCase().trim())) {

                    result.add(injection);

                }

            }
        }
        return result;
    }

}
