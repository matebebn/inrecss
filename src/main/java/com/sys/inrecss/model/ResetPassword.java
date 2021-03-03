package com.sys.inrecss.model;


import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name ="reset_password")
public class ResetPassword {



    @Id
    @GeneratedValue
    @Column(name="id_reset")
    private Integer id_reset;

    @Column(name="id_user")
    private Integer id_user;

    @Column(name="hash_code")
    String  hash_code;

    @Column(name="expTime")
    private Timestamp expTime;

    @Column(name="inTime")
    private Timestamp inTime;

    public ResetPassword() {
    }

    public ResetPassword(Integer id_user, String hash_code, Timestamp expTime, Timestamp inTime) {
        this.id_user = id_user;
        this.hash_code = hash_code;
        this.expTime = expTime;
        this.inTime = inTime;
    }

    public Integer getId_reset() {
        return id_reset;
    }

    public void setId_reset(Integer id_reset) {
        this.id_reset = id_reset;
    }

    public Integer getId_user() {
        return id_user;
    }

    public void setId_user(Integer id_user) {
        this.id_user = id_user;
    }

    public String getHash_code() {
        return hash_code;
    }

    public void setHash_code(String hash_code) {
        this.hash_code = hash_code;
    }

    public Timestamp getExpTime() {
        return expTime;
    }

    public void setExpTime(Timestamp expTime) {
        this.expTime = expTime;
    }

    public Timestamp getInTime() {
        return inTime;
    }

    public void setInTime(Timestamp inTime) {
        this.inTime = inTime;
    }
}
