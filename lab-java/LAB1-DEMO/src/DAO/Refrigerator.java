package DAO;

import DTO.Food;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Refrigerator {

    private final List<Food> foods = new ArrayList<>();

    public List<Food> getFoods() {
        return new ArrayList(this.foods);
    }

    public int getSize() {
        return foods.size();
    }

    public boolean addFood(Food f) {
        for (int i = 0; i < foods.size(); i++) {
            if (findFoodById(f.getId()) != null) {
                return false;
            }

        }
        return foods.add(f);
    }

    public Food findFoodById(int id) {
        int size = foods.size();
        for (int i = 0; i < size; i++) {
            if (foods.get(i).getId() == id) {
                return foods.get(i);
            }

        }
        return null;
    }

    public boolean removeFood(Food f) {
        return foods.remove(f);
    }

    public List<Food> searchFoodsByLikeName(String search) {
        List<Food> result = new ArrayList<>();
        for (Food food : foods) {
            if (food.getName().toLowerCase().trim().contains(search.toLowerCase().trim())) {
                result.add(food);
            }
        }
        return result;
    }

    public List<Food> findFoodByED(Date ed) {
        int size = foods.size();
        List<Food> result = new ArrayList<>();

        for (int i = 0; i < size; i++) {
            // System.out.println("Date: "+foods.get(i).getExpiredDate());
            if (foods.get(i).getExpiredDate().equals(ed)) {
                result.add(foods.get(i));

            }

        }
        return result;
    }

    public void removeFoodByED(Date ed) {
        for(Food food: getFoods()){
            if(food.getExpiredDate().equals(ed)){
                foods.remove(food);
                
        }
        }
//        int size = foods.size();
//
//        for (int i = 0; i < size; i++) {
//
//            if (foods.get(i).getExpiredDate().equals(ed)) {
//                foods.remove(foods.get(i));
//
//            }
//
//        }
    }
     public List<Food> findFoodByEDInRange(Date ed) {
        int size = foods.size();
        List<Food> result = new ArrayList<>();

        for (int i = 0; i < size; i++) {
            // System.out.println("Date: "+foods.get(i).getExpiredDate());
            if (foods.get(i).getExpiredDate().before(ed)) {
                result.add(foods.get(i));

            }

        }
        return result;
    }
     public List<Food> findFoodByPlace(String pl) {
        int size = foods.size();
        List<Food> result = new ArrayList<>();

        for (int i = 0; i < size; i++) {
            if (foods.get(i).getPlace().equals(pl)) {
                result.add(foods.get(i));

            }

        }
        return result;
    }
     
      public List<Food> searchFoodsByPlace(String place) {
        List<Food> result = new ArrayList<>();
        for (Food food : foods) {
            if (food.getPlace().toLowerCase().trim().contains(place.toLowerCase().trim())) {
                result.add(food);
            }
        }
        return result;
    }
    

}
