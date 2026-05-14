package com.example.demo;

public class patient {

    private String healthID;
    private String Name;
    private String Gender;

    public patient(String healthID, String Name, String Gender){

        this.healthID = healthID;
        this.Name = Name;
        this.Gender = Gender;

    }

    public String getHealthID() {
        return healthID;
    }

    public void setHealthID(String healthID) {
        this.healthID = healthID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String gender) {
        Gender = gender;
    }
}
