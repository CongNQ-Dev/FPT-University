/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author bangmaple
 */
public class InjectionDTO {
    
    private int injectionId;
    private String studentId;
    private int vaccineId;
    private String firstInjectionPlace;
    private String secondInjectionPlace;
    private Date firstInjectionDate;
    private Date secondInjectionDate;

    public InjectionDTO() {
    }

    public InjectionDTO(int injectionId, String studentId, int vaccineId, String firstInjectionPlace, String secondInjectionPlace, Date firstInjectionDate, Date secondInjectionDate) {
        this.injectionId = injectionId;
        this.studentId = studentId;
        this.vaccineId = vaccineId;
        this.firstInjectionPlace = firstInjectionPlace;
        this.secondInjectionPlace = secondInjectionPlace;
        this.firstInjectionDate = firstInjectionDate;
        this.secondInjectionDate = secondInjectionDate;
    }

    public int getInjectionId() {
        return injectionId;
    }

    public void setInjectionId(int injectionId) {
        this.injectionId = injectionId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public int getVaccineId() {
        return vaccineId;
    }

    public void setVaccineId(int vaccineId) {
        this.vaccineId = vaccineId;
    }

    public String getFirstInjectionPlace() {
        return firstInjectionPlace;
    }

    public void setFirstInjectionPlace(String firstInjectionPlace) {
        this.firstInjectionPlace = firstInjectionPlace;
    }

    public String getSecondInjectionPlace() {
        return secondInjectionPlace;
    }

    public void setSecondInjectionPlace(String secondInjectionPlace) {
        this.secondInjectionPlace = secondInjectionPlace;
    }

    public Date getFirstInjectionDate() {
        return firstInjectionDate;
    }

    public void setFirstInjectionDate(Date firstInjectionDate) {
        this.firstInjectionDate = firstInjectionDate;
    }

    public Date getSecondInjectionDate() {
        return secondInjectionDate;
    }

    public void setSecondInjectionDate(Date secondInjectionDate) {
        this.secondInjectionDate = secondInjectionDate;
    }

    @Override
    public String toString() {
        return "InjectionDTO{" + "injectionId=" + injectionId + ", studentId=" + studentId + ", vaccineId=" + vaccineId + ", firstInjectionPlace=" + firstInjectionPlace + ", secondInjectionPlace=" + secondInjectionPlace + ", firstInjectionDate=" + firstInjectionDate + ", secondInjectionDate=" + secondInjectionDate + '}';
    }
    
    
}
