package com.ray.jstl.models;

import javax.persistence.*;

@Entity
@Table(name="Users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="uid")
    private String uid;

    @Column(name="password")
    private String password;

    @Column(name="authLevel")
    private int authLevel;

    @Column(name="email")
    private String email;

    @Column(name="countryCode")
    private String countryCode;

    public User() { }

    public User(String uid, String password, int authLevel, String email, String countryCode) {
        this.uid = uid;
        this.password = password;
        this.authLevel = authLevel;
        this.email = email;
        this.countryCode = countryCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAuthLevel() {
        return authLevel;
    }

    public void setAuthLevel(int authLevel) {
        this.authLevel = authLevel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", uid='" + uid + '\'' +
                ", password='" + password + '\'' +
                ", authLevel=" + authLevel +
                ", email='" + email + '\'' +
                ", countryCode='" + countryCode + '\'' +
                '}';
    }
}
