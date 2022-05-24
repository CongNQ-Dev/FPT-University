/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HANDLER;

import DAO.CountryDAO;
import DAO.InjectionDAO;
import DAO.StudentDAO;
import DAO.VaccineDAO;
import DTO.CountryDTO;
import DTO.InjectionDTO;
import UTILS.CommonUtility;
import java.util.Date;
import java.util.Scanner;

public final class InjectionDTOHandler {

    private static final Scanner SCANNER = new Scanner(System.in);
    private static final InjectionDAO INJECTION = new InjectionDAO();
      private static final StudentDAO STUDENT = new StudentDAO();
          private static final VaccineDAO VACCINE = new VaccineDAO();
          private static final CountryDAO COUNTRY = new CountryDAO();

    public void inputInjectionID(InjectionDTO injectionDTO) {
        while (true) {
            try {
                System.out.println("Please input injection id: ");
                int id = Integer.parseInt(SCANNER.nextLine());
                if (id > 0) {
                    injectionDTO.setInjectionId(id);
                    break;
                }
                else {
                    throw new Exception();
                }
            } catch (Exception e) {
                System.err.println("Invalid injection id. Only accept id larger than 0 and must be integer.");;
            }
        }
    }

    public void inputStudentId(InjectionDTO dto) {
        System.out.println("Please input student id: ");
        while (true) {
            String id = CommonUtility.getInputStringID("^SE[0-9]{6}$");
            if (id == null) {
                break;
            }
            int size = StudentDAO.STUDENT_DATA.size();
            boolean flag = false;
            for (int i = 0; i < size; i++) {
                if (StudentDAO.STUDENT_DATA.get(i).getStudentId().equals(id)) {
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                dto.setStudentId(id);
                throw new IllegalArgumentException("No student found with the associated Id.");
            }
            dto.setStudentId(id);
            break;
        }
    }

    public void inputVaccineId(InjectionDTO dto) {
        System.out.println("Please input vaccine id: ");
        while (true) {

            int id = CommonUtility.getInputIntID();
            if (id < 1) {
                throw new IllegalArgumentException("Invalid vaccine id. Try again.");
            }
            if (!VACCINE.isVaccineExistedWithId(id)) {
                throw new IllegalArgumentException("Vaccine not found in the vaccine database. Try again.");
            }
            int size = VaccineDAO.VACCINE_DATA.size();
            boolean flag = false;
            for (int i = 0; i < size; i++) {
                if (VaccineDAO.VACCINE_DATA.get(i).getVaccineId() == id) {
                    flag = true;
                }
            }
            if (!flag) {
                throw new IllegalArgumentException("No vaccine found with the associated Id");
            }
            dto.setVaccineId(id);
            break;
        }
    }

    public void inputFirstInjectionDate(InjectionDTO injectionDTO) {
        while (true) {
            System.out.println("Please input the first injection date: ");
            Date date = CommonUtility.parseStringToDate(SCANNER.nextLine());
            if (date == null) {
                System.err.println("Invalid date. Please try again.");

            } else {
                Date currentDate = CommonUtility.parseStringToDate(CommonUtility.parseDateToStringDate(new Date()));
                if (date.before(currentDate)) {
                    System.err.println("Out Date. Please try again.");
                } else {
                    injectionDTO.setFirstInjectionDate(date);
                    break;
                }

            }

        }
    }

      public void inputSecondInjectionDate(InjectionDTO injectionDTO) {
        while (true) {
            System.out.println("Please input the second injection date: ");
            Date date = CommonUtility.parseStringToDate(SCANNER.nextLine());
            if (date == null) {
                System.err.println("Invalid date. Please try again.");

            } else {
                Date currentDate = CommonUtility.parseStringToDate(CommonUtility.parseDateToStringDate(new Date()));
                if (date.before(currentDate)) {
                    System.err.println("Out Date. Please try again.");
                } else {
                    injectionDTO.setSecondInjectionDate(date);
                    break;
                }

            }

        }
    }

    public void inputFirstInjectionPlace(InjectionDTO dto) {
        System.out.println("Please input first injection place by country id: ");
        while (true) {
            int id = CommonUtility.getInputIntID();
            if (id < 1) {
                System.out.println("Invalid country id. Must be larger than 0.");
                continue;
            }
            CountryDTO country = COUNTRY.findOne(id);
            if (country == null) {
                System.out.println("No associated country the provided id.");
                break;
            }
            dto.setFirstInjectionPlace(country.getName());
            break;
        }
    }

    public void inputSecondInjectionPlace(InjectionDTO dto) {
        System.out.println("Please input second injection place by country id: ");
        while (true) {
            int id = CommonUtility.getInputIntID();
            if (id < 1) {
                System.out.println("Invalid country id. Must be larger than 0.");
                continue;
            }
            CountryDTO country = COUNTRY.findOne(id);
            if (country == null) {
                System.out.println("No associated country the provided id.");
                break;
            }
            dto.setSecondInjectionPlace(country.getName());
            break;
        }
    }
}
