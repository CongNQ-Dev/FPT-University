/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.io.Serializable;


public class StudentDTO implements Serializable {
    private String studentId;
    private String fullname;

    public StudentDTO() {
    }

    public StudentDTO(String studentId, String fullname) {
        this.studentId = studentId;
        this.fullname = fullname;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    @Override
    public String toString() {
        return "StudentDTO{" + "studentId=" + studentId + ", fullname=" + fullname + '}';
    }
    
}
