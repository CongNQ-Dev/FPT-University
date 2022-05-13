package GUI;

import DAO.Refrigerator;
import DTO.Food;
import UTIL.CommonUtility;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Objects;
import java.util.Scanner;

/**
 *
 * @author cong.nguyen
 */
public class Main {

    private static final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

    public static String FILE_NAME = "";

    public static Refrigerator refrigerator = new Refrigerator();

    public static void main(String[] args) {
        readData();
        System.out.println("Available food: " + refrigerator.getSize());
        int choice = 0;
        while (true) {
            System.out.println("=====FOOD MANAGEMENT=====");
            System.out.println("1. Add a food to the list.");
            System.out.println("2. Search a food by name.");
            System.out.println("3. Remove the food by ID.");
            System.out.println("4. Print the food list in the descending order of expired date.");
            System.out.println("5. Export to file.");
            System.out.println("6. Remove a food by Expired Day.");
            System.out.println("7. Print the food list in the ascending order of weight.");
            System.out.println("8. Print the food list in the ascending order of name.");
            System.out.println("9 .Print the food list in the ascending order of ID..");
            System.out.println("10.Search Food By Id.");
            System.out.println("11 Search food By Place.");
            System.out.println("12. Search food in range.");
            System.out.println("0. Quit");
            try {
                System.out.println("Please input your choice (0-10): ");
                System.out.println("first choice: " + choice);
                choice = new Scanner(System.in).nextInt();
                System.out.println("choice: " + choice);
                if (choice < 0 || choice > 13) {
                    if (choice == 0) {
                        continue;
                    }
                    throw new InputMismatchException();

                }
                switch (choice) {
                    case 1:
                        addFood();
                        break;
                    case 2:
                        searchFoodByName();
                        break;
                    case 3:
                        removeFoodById();
                        break;
                    case 4:
                        printFood();
                        break;
                    case 5:
                        exportToFile();
                        break;
                    case 6:
                        removeFoodByED();
                        break;
                    case 7:
                        printFoodAscendingWeight();
                        break;
                    case 8:
                        printFoodAscendingName();
                        break;
                    case 9:
                        printFoodAscendingID();
                        break;
                    case 10:
                        searchFoodByID();
                        break;
                    case 11:
                        searchFoodByPlace();
                        break;
                    case 12:
                        searchFoodInRange();
                        break;
                    case 13:
                        searchFoodByED();
                        break;
                    case 0:
                        System.out.println("Thank you!");
                        System.exit(0);

                }
            } catch (Exception e) {
                System.err.println("Only accept from 1 to 12!");
            }
        }
    }

    private static void readData() {
        boolean flag = false;
        while (true) {

            try {
                File f = new File(FILE_NAME);
                if (!FILE_NAME.isEmpty()) {
                    f.createNewFile();
                }
                if (!f.exists()) {
                    defineFileName();
                    flag = true;
                    continue;
                }
                FileInputStream fis = new FileInputStream(f);
                ObjectInputStream ois = new ObjectInputStream(fis);
                List<Food> list = (List<Food>) ois.readObject();
                for (Food food : list) {
                    refrigerator.addFood(food);
                }
                break;
            } catch (FileNotFoundException e) {
                System.err.println("Cannot specify file name! Please input yourself.");
            } catch (IOException e) {
                System.err.println("File data is empty or error while reading file!");
                break;
            } catch (ClassNotFoundException e) {
                System.err.println("Error while reading class.");
                break;
            }
        }
    }

    private static void defineFileName() {
        while (!FILE_NAME.matches("^[a-zA-Z0-9]{3,100}$")) {
            System.out.println("Please input file name (from 3-100 characters in valid alphabet): ");
            FILE_NAME = new Scanner(System.in).nextLine();
        }
        FILE_NAME += ".dat";
    }

    public static void exportToFile() {
        if (FILE_NAME.trim().isEmpty()) {
            defineFileName();
        }
        File f = new File(FILE_NAME);
        FileOutputStream fos = null;
        ObjectOutputStream oos = null;
        try {
            fos = new FileOutputStream(f);
            oos = new ObjectOutputStream(fos);
            oos.writeObject(refrigerator.getFoods());
            System.out.println("\033[32mSuccessfully wrote to file!\033[0m");

        } catch (FileNotFoundException e) {
            System.out.println("File not found!");
        } catch (IOException e) {
            System.out.println("Error while writing to file!");
        } finally {
            try {
                if (Objects.nonNull(oos)) {
                    oos.close();
                }
                if (Objects.nonNull(fos)) {
                    fos.close();
                }
            } catch (IOException e) {
                System.out.println("Error while closing file!");
            }
        }

    }

    public static void addFood() {
        while (true) {
            Food food = new Food();
            while (true) {
                System.out.println("Please input Food ID (Integer): ");
                try {
                    int id = CommonUtility.getInputID();
                    if (id != -1) {
                        //   System.out.println(id);
                        if (Objects.nonNull(refrigerator.findFoodById(id))) {
                            throw new IllegalArgumentException();
                        } else {
                            food.setId(id);
                            break;
                        }
                    } else {
                        return;
                    }
                } catch (InputMismatchException e) {
                    System.err.println("Your input must be a positive integer.");
                } catch (IllegalArgumentException e) {
                    System.err.println("This food ID is duplicated! Please input another ID!");
                } catch (Exception e) {
                    System.err.println("Your input is invalid!");
                }
            }

            while (true) {
                System.out.println("Please input Food Name: ");
                String name = new Scanner(System.in).nextLine();
                if (name.trim().isEmpty()) {
                    System.err.println("Your input is blank!");
                } else if (!name.matches("^[A-Za-z\\s]{1,20}$")) {
                    System.err.println("Please input Food Name from 1 to 20 characters and must be in alphabet!");
                } else {
                    food.setName(name);
                    break;
                }
            }

            while (true) {
                System.out.println("Please input Food Weight (kg): ");
                float weight = new Scanner(System.in).nextFloat();
                try {
                    if (weight <= 0 || weight > 6) {
                        throw new InputMismatchException();
                    } else {
                        food.setWeight(weight);
                        break;
                    }
                } catch (InputMismatchException e) {
                    System.err.println("Your input must be a float number and in the range(0;6] (kg)");
                } catch (Exception e) {
                    System.err.println("Invalid Input");
                }
            }

            while (true) {
                System.out.println("Example for type of food: Fruit, Canned Food, ...");
                System.out.println("Please input Type of Food: ");
                String type = new Scanner(System.in).nextLine();
                if (type.trim().isEmpty()) {
                    System.err.println("Your input is Blank!");
                } else if (!type.matches("^[A-Za-z\\s]{1,100}$")) {
                    System.err.println("Please input Type of Food from 1 to 100 characters and must be in alphabet!");
                } else {
                    food.setType(type);
                    break;
                }
            }

            while (true) {
                System.out.println("Please input Place of Food: ");
                System.out.println("1. Freezer Compartment");
                System.out.println("2. Cool Compartment");
                int choice = new Scanner(System.in).nextInt();
                try {
                    if (choice < 1 || choice > 2) {
                        throw new InputMismatchException();
                    }
                    if (choice == 1) {
                        food.setPlace("Freezer Compartment");
                        break;
                    } else {
                        food.setPlace("Cool Compartment");
                        break;
                    }
                } catch (InputMismatchException e) {
                    System.err.println("Your input must be a integer number and in the range[1;2]!");
                } catch (Exception e) {
                    System.err.println("Invalid Input");
                }
            }

            while (true) {
                System.out.println("Please input Expired Date (dd/MM/yyyy): ");
                String expiredDate = new Scanner(System.in).nextLine();
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                sdf.setLenient(false);
                try {
                    Date parsedExpiredDate = sdf.parse(expiredDate);
                    Date currentDateWithoutCurrentTime = sdf.parse(sdf.format(new Date()));
                    if (parsedExpiredDate.before(currentDateWithoutCurrentTime)) {
                        throw new IllegalArgumentException();
                    }
                    food.setExpiredDate(parsedExpiredDate);
                    break;
                } catch (ParseException e) {
                    System.err.println("Invalid Date!");
                } catch (IllegalArgumentException e) {
                    System.err.println("The expired date must not be before the current date.");
                }
            }
            if (refrigerator.addFood(food)) {
                System.out.println("\033[32mSuccesfully to add a Food with id " + food.getId() + "\033[0m");
                exportToFile();

            } else {
                System.err.println("Failed to add a Food");
            }
            while (true) {
                System.out.println("Do you want to add more food? (y/n) ");
                boolean choice = CommonUtility.getYesNoInput();
                if (choice) {
                    break;
                } else {
                    return;
                }
            }
        }
    }

    private static void displayFood(List<Food> foods) {
        System.out.println("\033[35m======================================================================================================================\033[0m");
        int size = foods.size();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        System.out.println("\033[31m|   ID   |          NAME          |   WEIGHT(kg)   |     TYPE OF FOOD     |       PLACE TO PUT       |    EXP-DATE   |\033[0m");
        for (int i = 0; i < size; i++) {
            Food food = foods.get(i);
//            System.out.printf("%5d%19s%20.2f%23s%30s%18s\n",
//                    food.getId(), food.getName(), food.getWeight(), food.getType(), food.getPlace(), sdf.format(food.getExpiredDate()));
            System.out.printf("\033[34m%5d\033[0m" + "\033[32m%19s\033[0m" + "%20.2f%23s" + "\033[36m%30s\033[0m" + "\033[33m%18s\n\033[0m", food.getId(), food.getName(), food.getWeight(), food.getType(), food.getPlace(), sdf.format(food.getExpiredDate()));

            if (i != (size - 1)) {
                System.out.println("\033[35m----------------------------------------------------------------------------------------------------------------------\033[0m");
            }
        }

        System.out.println("\033[35m======================================================================================================================\033[0m");
    }

    public static void searchFoodByName() {
        System.out.println("Please input food name: ");
        String name = CommonUtility.getInputString();
        List<Food> result = refrigerator.searchFoodsByLikeName(name);
        if (result.isEmpty()) {
            System.out.println("No result found!");
            return;
        }
        displayFood(result);
    }
     public static void searchFoodByED() {
         while(true){
         System.out.println("Please input Food Expired Day to search: ");
        Date parsedExpiredDate = getInputDate();
        List<Food> foods=refrigerator.findFoodByED(parsedExpiredDate);
            if (foods.size()<1) {
                System.err.println("The Food with the provided Id doesn't exist.");
                continue;
            }
            else{
                displayFood(foods);
            }
            
        
            while (true) {
                System.out.println("Do you want to search more food? (y/n) ");
                boolean choice = CommonUtility.getYesNoInput();
                if (choice) {
                    break;
                } else {
                    return;
                }
            }
        }
        
        
    }

    public static void removeFoodById() {
        System.out.println("Please input Food ID to remove: ");
        int id = CommonUtility.getInputID();
        Food food = refrigerator.findFoodById(id);

        if (food == null) {
            System.err.println("The food you want to remove doesn't exist!");
            return;
        }

        while (true) {
            System.out.println("Do you want to remove this food with id " + id + " (y/n)");
            boolean choice = CommonUtility.getYesNoInput();
            if (choice) {
                break;
            } else {
                return;
            }
        }

        if (refrigerator.removeFood(food)) {
            System.out.println("\033[35mYou deleted successfully Food with ID " + id + "\033[0m");
        } else {
            System.err.println("Failed to delete this food!");
        }
    }

    public static void printFood() {
        if (refrigerator.getSize() < 1) {
            System.out.println("No record found!");
            return;
        }
        List<Food> foods = refrigerator.getFoods();
        Collections.sort(foods);
        displayFood(foods);
    }

    private static boolean checkIfFoodExistedByED(Date parsedExpiredDate) {
        List<Food> food = refrigerator.findFoodByED(parsedExpiredDate);
        return food.size() >= 1;
    }

    private static Date getInputDate() {
        Date date = null;
        while (true) {
            System.out.println("Please input Expired Date (dd/MM/yyyy): ");
            String expiredDate = new Scanner(System.in).nextLine();
            sdf.setLenient(false);
            try {
                date = sdf.parse(expiredDate);
                break;
            } catch (ParseException e) {
                System.err.println("Invalid Date!");
            }
        }
        return date;
    }

    public static void removeFoodByED() {
        System.out.println("Please input Food Expired Day to remove: ");
        Date parsedExpiredDate = getInputDate();
        System.out.println("Input Date: " + parsedExpiredDate);
        if (!checkIfFoodExistedByED(parsedExpiredDate)) {
            System.err.println("The food you want to find doesn't exist.");
            return;
        }
        System.out.println("Do you want to remove this food with Expired Day " + sdf.format(parsedExpiredDate) + " (y/n)");
        boolean choice = CommonUtility.getYesNoInput();
        if (choice) {
            refrigerator.removeFoodByED(parsedExpiredDate);
            System.out.println("\033[32mYou deleted successfully Food with Expired Day " + sdf.format(parsedExpiredDate) + "\033[0m");
        }

    }

    public static void printFoodDesED() {
        if (refrigerator.getSize() < 1) {
            System.out.println("No record found!");
            return;
        }
        List<Food> foods = refrigerator.getFoods();
        Collections.sort(foods);
        displayFood(foods);
    }

    public static void printFoodAscendingWeight() {
        if (refrigerator.getSize() < 1) {
            System.out.println("No record found!");
            return;
        }
        List<Food> foods = refrigerator.getFoods();
        Collections.sort(foods, new Comparator<Food>() {
            @Override
            public int compare(Food t1, Food t2) {
                if (t1.getWeight() > t2.getWeight()) {
                    return 1;
                } else if (t1.getWeight() < t2.getWeight()) {
                    return -1;
                } else {
                    return 0;
                }
            }
        });

        displayFood(foods);
    }

    public static void printFoodAscendingName() {
        if (refrigerator.getSize() < 1) {
            System.out.println("No record found!");
            return;
        }

        List<Food> foods = refrigerator.getFoods();
        Collections.sort(foods, new Comparator<Food>() {
            @Override
            public int compare(Food t1, Food t2) {

                return t1.getName().compareTo(t2.getName());
            }
        });

        displayFood(foods);
    }

    public static void printFoodAscendingID() {
        if (refrigerator.getSize() < 1) {
            System.out.println("No record found!");
            return;
        }
        List<Food> foods = refrigerator.getFoods();
        Collections.sort(foods, new Comparator<Food>() {
            @Override
            public int compare(Food t1, Food t2) {
                if (t1.getId() > t2.getId()) {
                    return 1;
                } else if (t1.getId() < t2.getId()) {
                    return -1;
                } else {
                    return 0;
                }
            }
        });

        displayFood(foods);
    }

    public static void searchFoodByID() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        while (true) {
            System.out.println("Please input Food ID: ");
            int id = new Scanner(System.in).nextInt();
            Food food = refrigerator.findFoodById(id);
            if (food == null) {
                System.out.println("The Food with the provided Id doesn't exist.");
                return;
            }
            System.out.println("==========");
            System.out.println("The Food you want to find: ");
            System.out.println("Id: " + food.getId());
            System.out.println("Name: " + food.getName());
            System.out.println("Weight: " + food.getWeight());
            System.out.println("Type: " + food.getType());
            System.out.println("Place: " + food.getPlace());
            System.out.println("Expired Day: " + sdf.format(food.getExpiredDate()));
            System.out.println("==========");
            while (true) {
                System.out.println("Do you want to add more food? (y/n) ");
                boolean choice = CommonUtility.getYesNoInput();
                if (choice) {
                    break;
                } else {
                    return;
                }
            }
        }
    }

    public static void searchFoodByPlace() {
        String place = null;
        while (true) {
            System.out.println("Please input Place of Food to search: ");
            System.out.println("1. Freezer Compartment");
            System.out.println("2. Cool Compartment");
            int choice = new Scanner(System.in).nextInt();
            try {
                if (choice < 1 || choice > 2) {
                    throw new InputMismatchException();
                }
                if (choice == 1) {
                    place = "Freezer Compartment";
                    break;
                } else {
                    place = "Cool Compartment";
                    break;
                }
            } catch (InputMismatchException e) {
                System.err.println("Your input must be a integer number and in the range[1;2]!");
            } catch (Exception e) {
                System.err.println("Invalid Input");
            }
        }

        List<Food> result = refrigerator.searchFoodsByPlace(place);
        if (result.isEmpty()) {
            System.out.println("No result found!");
            return;
        }
        displayFood(result);
    }

    public static void searchFoodInRange() {
        while (true) {
            System.out.println("Please input Food Expired Day: ");
            Date parsedExpiredDate = getInputDate();
            System.out.println("Input Date: " + parsedExpiredDate);
            if (!checkIfFoodExistedByED(parsedExpiredDate)) {
                System.err.println("The food you want to find doesn't exist.");
                return;
            }
            List<Food> result = refrigerator.findFoodByEDInRange(parsedExpiredDate);
            if (result.isEmpty()) {
                System.err.println("No record found!");
            }
            else{
                displayFood(result);
            }
            while (true) {
                System.out.println("Do you want to search again? (y/n) ");
                boolean choice = CommonUtility.getYesNoInput();
                if (choice) {
                    break;
                } else {
                    return;
                }
            }

            
        }
    }

}
