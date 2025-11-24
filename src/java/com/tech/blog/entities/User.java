//for storing the user data from registration page
package com.tech.blog.entities;

import java.util.*;
import java.sql.*;
public class User {
    
    private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private String about;
    private Timestamp rdate;
    private String profile;
    
    //constructor with shortcut alt+insert

    
    
//    constructor for calling all data
    public User(int id, String name, String email, String password,String gender, String about, Timestamp rdate) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password=password;
        this.gender = gender;
        this.about = about;
        this.rdate = rdate;
    }
    
    //default constructor

    public User() {
    }
    
    //constructor without id variable

    public User(String name, String email,String password, String gender, String about) {
        this.name = name;
        this.email = email;
        this.password=password;
        this.gender = gender;
        this.about = about;
    }
    
    
//    getters and setters

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public void setRdate(Timestamp rdate) {
        this.rdate = rdate;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getGender() {
        return gender;
    }

    public String getAbout() {
        return about;
    }

    public Timestamp getRdate() {
        return rdate;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
    
    
    
    
}
