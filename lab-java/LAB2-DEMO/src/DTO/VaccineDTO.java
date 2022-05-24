/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.io.Serializable;

/**
 *
 * @author bangmaple
 */
public class VaccineDTO implements Serializable {
    private int vaccineId;
    private String vaccineName;

    public VaccineDTO() {
    }

    public VaccineDTO(int vaccineId, String vaccineName) {
        this.vaccineId = vaccineId;
        this.vaccineName = vaccineName;
    }

    public int getVaccineId() {
        return vaccineId;
    }

    public void setVaccineId(int vaccineId) {
        this.vaccineId = vaccineId;
    }

    public String getVaccineName() {
        return vaccineName;
    }

    public void setVaccineName(String vaccineName) {
        this.vaccineName = vaccineName;
    }

    @Override
    public String toString() {
        return "VaccineDTO{" + "vaccineId=" + vaccineId + ", vaccineName=" + vaccineName + '}';
    }
    
}
