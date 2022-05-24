package DTO;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Food implements Comparable<Food>, Serializable {

    private int id;
    private String name;
    private float weight;
    private String type;
    private String place;
    private Date expiredDate;

    public Food() {

    }

    public Food(int id, String name, float weight, String type, String place, Date expiredDate) {
        this.id = id;
        this.name = name;
        this.weight = weight;
        this.type = type;
        this.place = place;
        this.expiredDate = expiredDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public Date getExpiredDate() {
        return expiredDate;
    }

    public void setExpiredDate(Date expiredDate) {
        this.expiredDate = expiredDate;
    }

    @Override
    public int compareTo(Food that) {
       
            if (this.expiredDate.before(that.getExpiredDate())) {
                return 1;
            } else if (this.expiredDate.after(that.getExpiredDate())) {
                return -1;
            } else {
                return 0;
            }
    }
}
            
       
        
    
    

