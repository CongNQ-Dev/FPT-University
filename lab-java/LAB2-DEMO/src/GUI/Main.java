/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;

import DAO.CountryDAO;
import DAO.InjectionDAO;
import DAO.StudentDAO;
import DAO.VaccineDAO;
import DTO.CountryDTO;
import DTO.InjectionDTO;
import DTO.StudentDTO;
import DTO.VaccineDTO;
import HANDLER.InjectionDTOHandler;
import HANDLER.StudentDTOHandler;
import UTILS.CommonUtility;
import static UTILS.CommonUtility.writeInjectionToFile;
import java.util.ArrayList;
import java.util.Date;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

public class Main {

    private static final StudentDTOHandler STUDENT_HANDLER = new StudentDTOHandler();
    private static final InjectionDTOHandler INJECTION_HANDLER = new InjectionDTOHandler();

    private static final Scanner SCANNER = new Scanner(System.in);
    private static final InjectionDAO INJECTION_DAO = new InjectionDAO();
    private static final StudentDAO STUDENT_DAO = new StudentDAO();
    private static final VaccineDAO VACCINE_DAO = new VaccineDAO();
    private static final CountryDAO COUNTRY_DAO = new CountryDAO();

    public static void main(String[] args) {
        showMenu();
    }

    private static void showMenu() {
        int choice = 0;
        while (true) {
            System.out.println("\n");
            System.out.println("==== COVID-19 VACCINE MANAGEMENT ====");
            System.out.println("1. Add new injection");
            System.out.println("2. Update injection information");
            System.out.println("3. Delete injection");
            System.out.println("4. Search injection information.");
            System.out.println("5. Search country name for id.");
            System.out.println("6. Display vaccine information");
            System.out.println("7. Display student information");
            System.out.println("8. Display injection information");
            System.out.println("9. Search injection by vaccine id.");
            System.out.println("10. Search injection by vaccine name.");
            System.out.println("11. Search injection by student id.");
            System.out.println("12. Search injection by student name.");
            System.out.println("13. Delete injection by student id.");
            System.out.println("14. Exit program.");
            try {

                choice = Integer.parseInt(SCANNER.nextLine());
                if (choice < 1 || choice > 14) {
                    throw new InputMismatchException();
                }
            } catch (Exception e) {
                System.err.println("Only accept choice input from 1 to 14.");
            }
            switch (choice) {
                case 1:
                    addInjection();
                    break;
                case 2:
                    updateInjection();
                    break;
                case 3:
                    deleteInjection();
                    break;
                case 4:
                    searchInjectionById();
                    break;
                case 5:
                    searchCountry();
                    break;
                case 6:
                    displayVaccine();
                    break;
                case 7:
                    displayStudent();
                    break;
                case 8:
                    displayInjectionInfo(InjectionDAO.INJECTION_DATA);
                    break;
                case 9:
                    searchInjectionByVaccineId();
                    break;
                case 10:
                    searchInjectionByVaccineName();
                    break;
                case 11:
                    searchInjectionByStudentId();
                    break;
                case 12:
                    searchInjectionByStudentName();
                    break;
                case 13:
                    deleteInjectionByStudentId();
                    break;
                case 14:
                    exit();
                    break;
                default:
                    break;
            }

        }
    }

    private static void displayInjectionInfo(List<InjectionDTO> injections) {
        if (injections.isEmpty()) {
            System.err.println("The injection data is empty. Please try again!");
            return;
        }
        System.out.println("\033[35m=========================================================================================================================================================================\033[0m");
        int size = injections.size();
        System.out.println("\033[34m|   INJECTION ID   |     STUDENT ID     |   STUDENT NAME   |   VACCINEE ID   | VACCINE NAME  |    FIRST PLACE   |    FIRST DATE   |    SECOND PLACE   |    SECOND DATE   |\033[0m");
        for (int i = 0; i < size; i++) {
            InjectionDTO dto = injections.get(i);
            System.out.printf("%10d", dto.getInjectionId());
            StudentDTO student = STUDENT_DAO.findOne(dto.getStudentId());
            // System.err.println(student);
            System.out.printf("%24s", student.getStudentId());
            System.out.printf("%24s", student.getFullname());
            VaccineDTO vaccine = VACCINE_DAO.findOne(dto.getVaccineId());
            System.out.printf("%10d", vaccine.getVaccineId());
            System.out.printf("%21s", vaccine.getVaccineName());

            if (dto.getFirstInjectionDate() == null || dto.getFirstInjectionPlace() == null) {
                System.out.printf("\033[31m%s\033[0m", "No data");
            } else {
                System.out.printf("%18s", dto.getFirstInjectionPlace());
                System.out.printf("%19s", CommonUtility.parseDateToStringDate(dto.getFirstInjectionDate()));
            }
            if (dto.getSecondInjectionDate() == null || dto.getSecondInjectionPlace() == null) {
                System.out.printf("\033[31m%18s\033[0m", "No data");
                System.out.printf("\033[31m%19s\033[0m", "No data");
            } else {
                System.out.printf("%19s", dto.getSecondInjectionPlace());
                System.out.printf("%20s", CommonUtility.parseDateToStringDate(dto.getSecondInjectionDate()));

            }

            if (i != (size - 1)) {
                System.out.println("\033[35m\n-------------------------------------------------------------------------------------------------------------------------------------------------------------------------\033[0m");
            }

        }
        System.out.println("\n");
        System.out.println("\033[35m=========================================================================================================================================================================\033[0m");
    }

    private static void displayVaccine() {
        if (VaccineDAO.VACCINE_DATA.isEmpty()) {
            System.err.println("The vaccine data is empty. Please try again!");
            return;
        }
        System.out.println("==== VACCINE INFORMATION ====");
        System.out.println("Id  Name");
        int size = VaccineDAO.VACCINE_DATA.size();
        for (int i = 0; i < size; i++) {
            VaccineDTO dto = VaccineDAO.VACCINE_DATA.get(i);
            System.out.println(dto.getVaccineId() + "   " + dto.getVaccineName());
        }
    }

    private static void displayStudent() {
        if (VaccineDAO.VACCINE_DATA.isEmpty()) {
            System.err.println("The vaccine data is empty. Please try again!");
            return;
        }
        System.out.println("==== VACCINE INFORMATION ====");
        System.out.println("Id      Name");
        int size = StudentDAO.STUDENT_DATA.size();
        for (int i = 0; i < size; i++) {
            StudentDTO dto = StudentDAO.STUDENT_DATA.get(i);
            System.out.println(dto.getStudentId() + "   " + dto.getFullname());
        }
    }

    private static void searchCountry() {
        System.out.println("Please input country name to search for country ID");
        List<CountryDTO> result = new ArrayList<>();
        String search = new Scanner(System.in).nextLine();
        int size = CountryDAO.COUNTRY_DATA.size();
        for (int i = 0; i < size; i++) {
            if (search.trim().isEmpty()) {
                System.err.println("Your input is Empty!");
                break;
            } else if (CountryDAO.COUNTRY_DATA.get(i).getName().toLowerCase().trim().contains(search.toLowerCase())) {
                result.add(CountryDAO.COUNTRY_DATA.get(i));
            }
        }
        if (result.size() < 1) {
            System.err.println("No matching country found with the provided name! Try again!");
            return;
        }
        System.out.println("The IDs with the country name you searched for: ");
        result.forEach(country -> System.out.println(country));
    }

    private static void addInjection() {
        InjectionDTO injectionDTO = new InjectionDTO();
        try {
            INJECTION_HANDLER.inputInjectionID(injectionDTO);
            InjectionDTO dto = INJECTION_DAO.findOne(injectionDTO.getInjectionId());
            if (dto == null) {
                while (true) {
                    try {
                        INJECTION_HANDLER.inputStudentId(injectionDTO);
                        for (int i = 0; i < InjectionDAO.INJECTION_DATA.size(); i++) {
                            if (InjectionDAO.INJECTION_DATA.get(i).getStudentId().equals(injectionDTO.getStudentId())) {
                                throw new InputMismatchException("This student already have existed!");
                            }
                        }
                        break;

                    } catch (Exception e) {
                        if (e.getMessage().equals("No student found with the associated Id.")) {
                            System.err.println(e.getMessage());
                            continue;
                        }

                        System.err.println(e.getMessage());
                    }
                }
                while (true) {
                    try {
                        displayVaccine();

                        INJECTION_HANDLER.inputVaccineId(injectionDTO);
                        break;
                    } catch (Exception e) {
                        System.err.println(e.getMessage());
                    }

                }
                System.err.println("This student haven't injected first injection.");
                System.out.println("Do you want to continue? (Y/N): ");
                boolean injectFirstShot = CommonUtility.getYesNoInput();
                if (!injectFirstShot) {
                    System.out.println("You chose not to injection the first injection.");

                    return;
                }
                INJECTION_HANDLER.inputFirstInjectionDate(injectionDTO);
                while (true) {
                    searchCountry();
                    System.out.println("Do you want to search again?");
                    boolean choice = CommonUtility.getYesNoInput();
                    if (choice) {
                        continue;
                    } else {
                        break;
                    }

                }
                INJECTION_HANDLER.inputFirstInjectionPlace(injectionDTO);
                InjectionDAO.INJECTION_DATA.add(injectionDTO);
                System.out.println("\033[32mSuccessfully added new injection information with first dose.\033[0m");
                CommonUtility.writeInjectionToFile();
                System.out.println("\033[32mSuccessfully added a new injection\033[0m");
                return;
            } else {
                System.err.println("The injection information is already existed! Do you want to continue? (Y/N): ");
                boolean choice = CommonUtility.getYesNoInput();
                if (choice) {
                    if (INJECTION_DAO.checkIfStudentInjectedFirstInjection(dto.getInjectionId())
                            && INJECTION_DAO.checkIfStudentInjectedSecondInjection(dto.getInjectionId())) {
                        System.out.println("\033[32mThis student is already injected the first and the second injection!\033[0m");
                        return;
                    }

                    if (INJECTION_DAO.checkIfStudentInjectedFirstInjection(dto.getInjectionId())) {
                        if (!INJECTION_DAO.isAllowToInjectSecondInjection(dto.getFirstInjectionDate())) {
                            System.err.println("This student is not eligible to take the second injection.");
                            System.err.println("Must be in between 4-12 weeks after the first injection.");
                            return;
                        }

                        System.out.println("This student is already injected first injection. Do you want to inject the second injection ? (Y/N): ");
                        boolean firstInjectionChoice = CommonUtility.getYesNoInput();
                        if (!firstInjectionChoice) {
                            System.out.println("You chose not to inject the second injection");
                            return;
                        } else {

                            INJECTION_HANDLER.inputSecondInjectionDate(injectionDTO);
                            while (true) {
                                searchCountry();
                                System.out.println("Do you want to search again?");
                                choice = CommonUtility.getYesNoInput();
                                if (choice) {
                                    continue;
                                } else {
                                    break;
                                }

                            }
                            INJECTION_HANDLER.inputSecondInjectionPlace(injectionDTO);
                            int size = InjectionDAO.INJECTION_DATA.size();
                            for (int i = 0; i < size; i++) {
                                if (InjectionDAO.INJECTION_DATA.get(i).getInjectionId() == injectionDTO.getInjectionId()) {
                                    InjectionDAO.INJECTION_DATA.get(i).setSecondInjectionDate(injectionDTO.getSecondInjectionDate());
                                    InjectionDAO.INJECTION_DATA.get(i).setSecondInjectionPlace(injectionDTO.getSecondInjectionPlace());
                                }
                            }
                            System.out.println("\033[32mSuccessfully updated injection information for second dose.\033[0m");
                            writeInjectionToFile();
                            //return;
                        }
                    } else {
                        System.err.println("This student haven't injected first injection.");
                        System.out.println("Do you want to continue? (Y/N): ");
                        boolean injectFirstShot = CommonUtility.getYesNoInput();
                        if (!injectFirstShot) {
                            System.out.println("You chose not to injection the first injection.");
                            return;
                        }
                        INJECTION_HANDLER.inputFirstInjectionDate(injectionDTO);
                        while (true) {
                            searchCountry();
                            System.out.println("Do you want to search again?");
                            choice = CommonUtility.getYesNoInput();
                            if (choice) {
                                continue;
                            } else {
                                break;
                            }

                        }
                        INJECTION_HANDLER.inputFirstInjectionPlace(injectionDTO);
                        InjectionDAO.INJECTION_DATA.add(injectionDTO);
                        writeInjectionToFile();
                        System.out.println("\033[32mSuccessfully added new injection information with first dose.\033[0m");
                        return;
                    }
                } else {
                    return;
                }
            }

        } catch (IllegalArgumentException e) {
            System.err.println(e.getMessage());
        }
    }

    private static void updateInjection() {
        try {
            System.out.println("Please input injection id: ");
            int id = CommonUtility.getInputIntID();
            if (id < 1) {
                System.err.println("Id must be a positive integer. Please try again");
            } else {
                InjectionDTO dto = INJECTION_DAO.findOne(id);
                if (dto == null) {
                    System.err.println("The injection information isn't found with the provided id. Please try again.");
                    return;
                }
                System.out.println("Do you want to update the first injection date? (Y/N)");
                boolean choiceFirstInject = CommonUtility.getYesNoInput();
                if (choiceFirstInject) {
                    while (true) {
                        System.out.println("Please input the first injection date (dd/MM/yyyy): ");
                        SCANNER.nextLine();
                        Date date = CommonUtility.parseStringToDate(SCANNER.nextLine());
                        if (date == null) {
                            System.err.println("The provided date is invalid. Please try again.");
                        }
                        dto.setFirstInjectionDate(date);
                        break;
                    }
                }

                System.out.println("Do you want to update the first injection place? (Y/N)");
                boolean choiceFirstInjectPlace = CommonUtility.getYesNoInput();
                if (choiceFirstInjectPlace) {
                    while (true) {
                        searchCountry();
                        System.out.println("Do you want to search again?");
                        boolean choice = CommonUtility.getYesNoInput();
                        if (choice) {
                            continue;
                        } else {
                            break;
                        }

                    }
                    while (true) {
                        CountryDTO country;
                        System.out.println("Please input the first injection place by place id: ");
                        int placeId = CommonUtility.getInputIntID();
                        if (placeId < 1) {
                            System.err.println("The provided place Id is invalid. Please try again.");
                            return;
                        } else {
                            country = COUNTRY_DAO.findOne(placeId);
                            if (country == null) {
                                System.err.println("The country isn't found with the provided id. Please try again.");
                                return;
                            }
                        }
                        while (true) {
                            System.out.println("Does this place correct? (Y/N): ");
                            System.out.println(country.getId() + " | " + country.getName());
                            boolean countryChoice = CommonUtility.getYesNoInput();
                            if (countryChoice) {
                                break;
                            } else {
                                System.out.println("You chose to quit updating the injection place.");
                            }
                        }
                        dto.setFirstInjectionPlace(country.getName());
                        break;
                    }
                }

                System.out.println("Do you want to update the second injection date? (Y/N)");
                boolean choiceSecondInject = CommonUtility.getYesNoInput();
                if (choiceSecondInject) {
                    while (true) {
                        System.out.println("Please input the second injection date (dd/MM/yyyy): ");
                        Date date = CommonUtility.parseStringToDate(SCANNER.nextLine());
                        if (date == null) {
                            System.err.println("The provided date is invalid. Please try again.");
                        }
                        dto.setSecondInjectionDate(date);
                        break;
                    }
                }

                System.out.println("Do you want to update the second injection place? (Y/N)");
                boolean choiceSecondInjectPlace = CommonUtility.getYesNoInput();
                if (choiceSecondInjectPlace) {
                    while (true) {
                        searchCountry();
                        System.out.println("Do you want to search again?");
                        boolean choice = CommonUtility.getYesNoInput();
                        if (choice) {
                            continue;
                        } else {
                            break;
                        }

                    }
                    while (true) {
                        CountryDTO country;
                        System.out.println("Please input the second injection place by place id: ");
                        int placeId = CommonUtility.getInputIntID();
                        if (placeId < 1) {
                            System.err.println("The provided place Id is invalid. Please try again.");
                            return;
                        } else {
                            country = COUNTRY_DAO.findOne(placeId);
                            if (country == null) {
                                System.err.println("The country isn't found with the provided id. Please try again.");
                                return;
                            }
                        }
                        while (true) {
                            System.out.println("Does this place correct? (Y/N): ");
                            System.out.println(country.getId() + " | " + country.getName());
                            boolean countryChoice = CommonUtility.getYesNoInput();
                            if (countryChoice) {
                                break;
                            } else {
                                System.out.println("You chose to quit updating the injection place.");
                            }
                        }
                        dto.setSecondInjectionPlace(country.getName());
                        break;
                    }
                    int size = InjectionDAO.INJECTION_DATA.size();
                    for (int i = 0; i < size; i++) {
                        if (InjectionDAO.INJECTION_DATA.get(i).getInjectionId() == id) {
                            InjectionDAO.INJECTION_DATA.set(i, dto);
                            break;
                        }
                    }
                    System.out.println("\033[32mSuccessfully updated injection information with id\033[0m " + id);
                }
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    private static void deleteInjection() {
        while (true) {
            try {
                System.out.println("Please input injection id: ");
                int id = CommonUtility.getInputIntID();
                if (id < 1) {
                    System.err.println("Injection ID must be a positive integer. Please try again.");
                } else {
                    System.out.println("Do you want to delete this injection information?");
                    boolean choice = CommonUtility.getYesNoInput();
                    if (!choice) {
                        System.out.println("You chose not to delete this injection information.");
                        return;
                    }
                    if (INJECTION_DAO.delete(id)) {
                        writeInjectionToFile();
                        System.out.println("\033[32mSuccessfully deleted the injection information with id:\033[0m " + id);
                        return;
                    } else {
                        System.err.println("Failed to delete the injection information with id: " + id);
                        return;
                    }
                }
            } catch (Exception e) {
                System.err.println(e.getMessage());
            }
        }
    }

    private static void deleteInjectionByStudentId() {
        while (true) {
            try {
                System.out.println("Please input student id to delete: ");
                String id = CommonUtility.getInputStringID(null);
                for (int i = 0; i < InjectionDAO.INJECTION_DATA.size(); i++) {
                    if (INJECTION_DAO.getInjectionByStudentId(id) != null) {
                        System.out.println("Do you want to delete this injection information?");
                        boolean choice = CommonUtility.getYesNoInput();
                        if (!choice) {
                            System.out.println("You chose not to delete this injection information.");
                            return;
                        }
                        if (INJECTION_DAO.delete(INJECTION_DAO.getInjectionByStudentId(id).getInjectionId())) {
                            writeInjectionToFile();
                            System.out.println("\033[32mSuccessfully deleted the injection information with id:\033[0m " + id);
                            return;
                        } else {
                            System.err.println("Failed to delete the injection information with id: " + id);
                            return;
                        }

                    }
                }
                break;

            } catch (Exception e) {
                if (e.getMessage().equals("No student found with the associated Id.")) {
                    System.err.println(e.getMessage());
                    continue;
                }

                System.err.println(e.getMessage());
            }
        }
    }

    private static void searchInjectionById() {
        while (true) {
            System.out.println("Please input id injection: ");
            int id = CommonUtility.getInputIntID();
            InjectionDTO dto = INJECTION_DAO.findOne(id);
            if (dto == null) {
                System.err.println("No result found!");
                return;
            } else {
                System.out.println("\033[35m=========================================================================================================================================================================\033[0m");

                System.out.println("\033[34m|   INJECTION ID   |     STUDENT ID     |   STUDENT NAME   |   VACCINEE ID   | VACCINE NAME  |    FIRST PLACE   |    FIRST DATE   |    SECOND PLACE   |    SECOND DATE   |\033[0m");

                System.out.printf("%10d", dto.getInjectionId());
                StudentDTO student = STUDENT_DAO.findOne(dto.getStudentId());
                // System.err.println(student);
                System.out.printf("%24s", student.getStudentId());
                System.out.printf("%24s", student.getFullname());
                VaccineDTO vaccine = VACCINE_DAO.findOne(dto.getVaccineId());
                System.out.printf("%10d", vaccine.getVaccineId());
                System.out.printf("%21s", vaccine.getVaccineName());

                if (dto.getFirstInjectionDate() == null || dto.getFirstInjectionPlace() == null) {
                    System.out.printf("\033[31m%s\033[0m", "No data");
                } else {
                    System.out.printf("%18s", dto.getFirstInjectionPlace());
                    System.out.printf("%19s", CommonUtility.parseDateToStringDate(dto.getFirstInjectionDate()));
                }
                if (dto.getSecondInjectionDate() == null || dto.getSecondInjectionPlace() == null) {
                    System.out.printf("\033[31m%18s\033[0m", "No data");
                    System.out.printf("\033[31m%19s\033[0m", "No data");
                } else {
                    System.out.printf("%19s", dto.getSecondInjectionPlace());
                    System.out.printf("%20s", CommonUtility.parseDateToStringDate(dto.getSecondInjectionDate()));

                }

                System.out.println("\n");
                System.out.println("\033[35m=========================================================================================================================================================================\033[0m");
            }
            while (true) {
                System.out.println("Do you want to search again?");
                boolean choice = CommonUtility.getYesNoInput();
                if (choice) {
                    break;
                } else {
                    return;
                }
            }

        }

    }

    private static void searchInjectionByVaccineId() {
        while (true) {
            System.out.println("Please input vaccine id to search injection : ");
            int id = CommonUtility.getInputIntID();
            List<InjectionDTO> listInjection = INJECTION_DAO.getInjectionByVaccineId(id);
            if (listInjection == null) {
                System.err.println("No result found!");
                return;
            } else {
                displayInjectionInfo(listInjection);

            }
            while (true) {
                System.out.println("Do you want to search again?");
                boolean choice = CommonUtility.getYesNoInput();
                if (choice) {
                    break;
                } else {
                    return;
                }
            }

        }

    }

    public static void searchInjectionByVaccineName() {
        displayVaccine();
        while (true) {
            System.out.println("Input vaccine name to search injection:");
            String name = new Scanner(System.in).nextLine();
            List<InjectionDTO> injections = INJECTION_DAO.getInjectionByVaccineName(name);
            displayInjectionInfo(injections);
            if (injections.isEmpty()) {
                System.out.println("No result found!");
                return;
            }
            if (injections.size() == 1) {
                break;
            }
        }
    }

    private static void searchInjectionByStudentId() {
        while (true) {
            try {
                String id = CommonUtility.getInputStringID(null);
                for (int i = 0; i < InjectionDAO.INJECTION_DATA.size(); i++) {
                    if (InjectionDAO.INJECTION_DATA.get(i).getStudentId().trim().toLowerCase().equals((id.trim().toLowerCase()))) {
                        InjectionDTO dto = InjectionDAO.INJECTION_DATA.get(i);
                        System.out.println("\033[35m=========================================================================================================================================================================\033[0m");

                        System.out.println("\033[34m|   INJECTION ID   |     STUDENT ID     |   STUDENT NAME   |   VACCINEE ID   | VACCINE NAME  |    FIRST PLACE   |    FIRST DATE   |    SECOND PLACE   |    SECOND DATE   |\033[0m");

                        System.out.printf("%10d", dto.getInjectionId());
                        StudentDTO student = STUDENT_DAO.findOne(dto.getStudentId());
                        // System.err.println(student);
                        System.out.printf("%24s", student.getStudentId());
                        System.out.printf("%24s", student.getFullname());
                        VaccineDTO vaccine = VACCINE_DAO.findOne(dto.getVaccineId());
                        System.out.printf("%10d", vaccine.getVaccineId());
                        System.out.printf("%21s", vaccine.getVaccineName());

                        if (dto.getFirstInjectionDate() == null || dto.getFirstInjectionPlace() == null) {
                            System.out.printf("\033[31m%s\033[0m", "No data");
                        } else {
                            System.out.printf("%18s", dto.getFirstInjectionPlace());
                            System.out.printf("%19s", CommonUtility.parseDateToStringDate(dto.getFirstInjectionDate()));
                        }
                        if (dto.getSecondInjectionDate() == null || dto.getSecondInjectionPlace() == null) {
                            System.out.printf("\033[31m%18s\033[0m", "No data");
                            System.out.printf("\033[31m%19s\033[0m", "No data");
                        } else {
                            System.out.printf("%19s", dto.getSecondInjectionPlace());
                            System.out.printf("%20s", CommonUtility.parseDateToStringDate(dto.getSecondInjectionDate()));

                        }

                        System.out.println("\n");
                        System.out.println("\033[35m=========================================================================================================================================================================\033[0m");

                    }
                }
                break;

            } catch (Exception e) {
                if (e.getMessage().equals("No student found with the associated Id.")) {
                    System.err.println(e.getMessage());
                    continue;
                }

                System.err.println(e.getMessage());
            }
        }
    }
    public static void searchInjectionByStudentName(){
          while (true) {
            System.out.println("Input student name to search injection:");
            String name = new Scanner(System.in).nextLine();
            List<InjectionDTO> injections = INJECTION_DAO.getInjectionByStudentName(name.trim().toLowerCase());
            displayInjectionInfo(injections);
            if (injections.isEmpty()) {
                System.out.println("No result found!");
                return;
            }
            if (injections.size() == 1) {
                break;
            }
        }
    }

    private static void exit() {
        System.out.println("Thanks for using my program.");
        System.exit(0);
    }

}
