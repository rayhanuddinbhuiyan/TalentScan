package com.example.demo;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller

public class patientController {

    @GetMapping("/patient.jsp")

    public String patientData(HttpServletRequest request){

        List <patient> Patient = new ArrayList<>();
        Patient.add(new patient("UTT101","Rayhan","Male"));
        Patient.add(new patient("UTT102","Rayan","Male"));
        Patient.add(new patient("UTT103","Raihan","Male"));

        request.setAttribute("Patient", Patient);  // ✅ THIS LINE WAS MISSING
        return "patient.jsp";
    }
}
