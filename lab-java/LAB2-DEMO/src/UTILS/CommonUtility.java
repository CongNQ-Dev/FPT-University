/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UTILS;

import DAO.CountryDAO;
import DAO.InjectionDAO;
import DAO.StudentDAO;
import DAO.VaccineDAO;
import DTO.CountryDTO;
import DTO.InjectionDTO;
import DTO.StudentDTO;
import DTO.VaccineDTO;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Scanner;

/**
 *
 * @author bangmaple
 */
public final class CommonUtility {

    private static final String COUNTRY_FILE_NAME = "tinh-thanh.txt";
    private static final String VACCINE_FILE_NAME = "vaccine.txt";
    private static final String STUDENT_FILE_NAME = "student.txt";
    private static final String INJECTION_FILE_NAME = "injection.txt";

    private static final String DELIMITER = ";";

    private static final Scanner SCANNER = new Scanner(System.in);
    private static final StudentDAO STUDENT = new StudentDAO();
    private static final VaccineDAO VACCINE = new VaccineDAO();
    private static final CountryDAO COUNTRY = new CountryDAO();
    private static final InjectionDAO INJECTION = new InjectionDAO();

    static {
        SCANNER.useDelimiter("\n");
    }
    private static FileReader fr;
    private static BufferedReader br;

    private static void closeReader() {
        try {
            if (Objects.nonNull(br)) {
                br.close();
            }
            if (Objects.nonNull(fr)) {
                fr.close();
            }
        } catch (IOException e) {
        }
    }

    public static int getInputIntID() {
        int id = 0;
        while (true) {
            try {
                id = SCANNER.nextInt();
                break;
            } catch (Exception e) {
                System.err.println("Invalid Id");
                SCANNER.nextLine();
            }
        }
        return id;
    }

    public static String getInputStringID(String pattern) {
        String id = null;
        while (true) {
            id = SCANNER.nextLine();
            if (pattern != null && !id.matches(pattern)) {
                throw new IllegalArgumentException("Only accept id with format " + pattern);
            }
            return id;
        }
    }

    public static Date parseStringToDate(String dateStr) {
        Date result = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            sdf.setLenient(false);
            result = sdf.parse(dateStr);
        } catch (ParseException e) {
            System.err.println("Invalid Date!");
            //System.out.println("May nhap tao lao roi");
        }
        return result;
    }

    public static String parseDateToStringDate(Date date) {
        return new SimpleDateFormat("dd/MM/yyyy").format(date);
    }

    public static boolean getYesNoInput() {
        boolean flag = false;
        while (true) {
            String choice = SCANNER.nextLine();
            if (choice.equalsIgnoreCase("y")) {
                flag = true;
                break;
            } else if (choice.equalsIgnoreCase("n")) {
                break;

            }

        }
        return flag;
    }

    public static void writeInjectionToFile() {
        List<InjectionDTO> injections = InjectionDAO.INJECTION_DATA;
        File f = null;
        FileWriter fw = null;
        BufferedWriter bw = null;
        try {
            f = new File(INJECTION_FILE_NAME);
            fw = new FileWriter(f, false);
            bw = new BufferedWriter(fw);
            int size = injections.size();
            for (int i = 0; i < size; i++) {
                InjectionDTO dto = injections.get(i);
                bw.append(dto.getInjectionId() + DELIMITER + dto.getStudentId()
                        + DELIMITER + dto.getVaccineId() + DELIMITER
                        + (dto.getFirstInjectionPlace() == null ? "null"
                        : dto.getFirstInjectionPlace()) + DELIMITER
                        + (dto.getSecondInjectionPlace() == null ? "null"
                        : dto.getSecondInjectionPlace()) + DELIMITER
                        + (dto.getFirstInjectionDate() == null ? "null"
                        : CommonUtility.parseDateToStringDate(dto.getFirstInjectionDate()))
                        + DELIMITER + (dto.getSecondInjectionDate() == null ? "null"
                        : CommonUtility.parseDateToStringDate(dto.getSecondInjectionDate())));
                if (i != size - 1) {
                    bw.newLine();
                }
            }
        } catch (FileNotFoundException e) {
            System.err.println("The file isn't found.");
        } catch (IOException e) {
            System.err.println("Error while writing data to file.");
        } finally {
            try {
                if (bw != null) {
                    bw.close();
                }
                if (fw != null) {
                    fw.close();
                }
            } catch (Exception e) {
                System.out.println("Error while closing file writer.");
            }
        }
    }

    public static StudentDTO readFileToObject(String fileName) {
        StudentDTO dto = null;
        try {
            File f = new File(fileName);
            fr = new FileReader(f);
            br = new BufferedReader(fr);
            String str;
            while ((str = br.readLine()) != null) {
                String[] strs = str.split(";");
                String id = strs[0];
                String name = strs[1];
                dto = new StudentDTO(id, name);
            }
        } catch (FileNotFoundException e) {

        } catch (IOException e) {

        } finally {
            closeReader();
        }
        return dto;
    }

    public static List<CountryDTO> getCountryData() {
        List<CountryDTO> result = null;
        try {
            File f = new File(COUNTRY_FILE_NAME);
            fr = new FileReader(f);
            br = new BufferedReader(fr);
            String str;
            result = new ArrayList<>();
            while ((str = br.readLine()) != null) {
                String[] strs = str.split("\\t");
                String id = strs[0];
                String name = strs[1];
                result.add(new CountryDTO(Integer.parseInt(id), name));
            }
        } catch (FileNotFoundException e) {
            System.out.println("Country data file not found. Exiting now!");
            System.exit(0);
        } catch (IOException e) {
            System.out.println("Error while reading country data. Exiting now!");
            System.exit(0);
        } finally {
            closeReader();
        }
        return result;
    }

    public static List<StudentDTO> getStudentData() {
        List<StudentDTO> result = null;
        try {
            File f = new File(STUDENT_FILE_NAME);
            fr = new FileReader(f);
            br = new BufferedReader(fr);
            String str;
            result = new ArrayList<>();
            while ((str = br.readLine()) != null) {
                String[] strs = str.split(";");
                result.add(new StudentDTO(strs[0], strs[1]));
            }
        } catch (FileNotFoundException e) {
            System.out.println("Vaccine data file not found. Exiting now!");
            System.exit(0);
        } catch (IOException e) {
            System.out.println("Error while reading vaccine data. Exiting now!");
            System.exit(0);
        } finally {
            closeReader();
        }
        return result;
    }

    public static int parseIntFromStr(String value) {
        try {
            return Integer.parseInt(value);
        } catch (Exception e) {
            throw new IllegalArgumentException("Cannot parse to int because the value is invalid!");
        }
    }

    public static List<InjectionDTO> getInjectionData() {
        List<InjectionDTO> result = null;
        try {
            File f = new File(INJECTION_FILE_NAME);
            fr = new FileReader(f);
            br = new BufferedReader(fr);
            String str;
            result = new ArrayList<>();
            while ((str = br.readLine()) != null) {
                String[] strs = str.split(";");

                int injectionId = parseIntFromStr(strs[0]);

                String studentId = strs[1];
                if (!STUDENT.isStudentExistedWithId(studentId)) {
                    throw new IllegalArgumentException("Student is not found with the provided Id. Please check the data");
                }
                if (!result.isEmpty()) {
                    for (int i = 0; i < result.size(); i++) {
                        if (result.get(i).getInjectionId() == injectionId) {
                            throw new IllegalArgumentException("Injection id is duplicated from the associated data. Please try again.");
                        }
                    }
                }

                int vaccineId = parseIntFromStr(strs[2]);
                if (!VACCINE.isVaccineExistedWithId(vaccineId)) {
                    throw new IllegalArgumentException("Vaccine is not found with the provided Id. Please check the data.");
                }

                String firstInjectionPlace = strs[3];
                if (!firstInjectionPlace.equals("null") && !COUNTRY.isCountryExistedWithName(firstInjectionPlace)) {
                    throw new IllegalArgumentException("Country is not found with the provided name. Please check the data.");
                }

                String secondInjectionPlace = strs[4];
                if (!secondInjectionPlace.equals("null") && !COUNTRY.isCountryExistedWithName(secondInjectionPlace)) {
                    throw new IllegalArgumentException("Country is not found with the provided name. Please check the data.");
                }

                Date firstInjectionDate = null;
                try {
                    String firstInjectionDateStr = strs[5];
                    if (!firstInjectionDateStr.equals("null")) {
                        firstInjectionDate = parseStringToDate(firstInjectionDateStr);
                        if (Objects.isNull(firstInjectionDate)) {
                            throw new IllegalArgumentException("Invalid first injection date. Please check the data.");
                        }
                    }
                } catch (NullPointerException e) {
                    e.printStackTrace();
                }

                Date secondInjectionDate = null;
                try {
                    String secondInjectionDateStr = strs[6];
                    if (!secondInjectionDateStr.equals("null")) {
                        secondInjectionDate = parseStringToDate(secondInjectionDateStr);
                        if (Objects.isNull(secondInjectionDate)) {
                            throw new IllegalArgumentException("Invalid second injection date. Please check the data.");
                        }
                    }
                } catch (NullPointerException e) {

                }

                result.add(new InjectionDTO(injectionId, studentId, vaccineId,
                        firstInjectionPlace, secondInjectionPlace,
                        firstInjectionDate, secondInjectionDate));
            }
        } catch (FileNotFoundException e) {
            System.out.println("Vaccine data file not found. Exiting now!");
            System.exit(0);
        } catch (IOException e) {
            System.out.println("Error while reading vaccine data. Exiting now!");
            System.exit(0);
        } finally {
            closeReader();
        }
        return result;
    }

    public static List<VaccineDTO> getVaccineData() {
        List<VaccineDTO> result = null;
        try {
            File f = new File(VACCINE_FILE_NAME);
            fr = new FileReader(f);
            br = new BufferedReader(fr);
            String str;
            result = new ArrayList<>();
            while ((str = br.readLine()) != null) {
                String[] strs = str.split(";");
                result.add(new VaccineDTO(Integer.parseInt(strs[0]), strs[1]));
            }
        } catch (FileNotFoundException e) {
            System.out.println("Vaccine data file not found. Exiting now!");
            System.exit(0);
        } catch (IOException e) {
            System.out.println("Error while reading vaccine data. Exiting now!");
            System.exit(0);
        } finally {
            closeReader();
        }
        return result;
    }

}
