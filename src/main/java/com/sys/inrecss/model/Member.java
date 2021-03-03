package com.sys.inrecss.model;

import javax.persistence.*;

@Entity
@Table(name ="members_events")
public class Member {


    @Id
    @GeneratedValue
    @Column(name="id_person")
    private Integer id_person;

    @Column(name="id_event")
    private Integer id_event;

    @Column(name="name")
    private String name;

    @Column(name="surname")
    private String surname;

    @Column(name="email")
    private String email;


    public Member() {
    }

    public Member(Integer id_event, String name, String surname, String email) {
        this.id_event = id_event;
        this.name = name;
        this.surname = surname;
        this.email = email;
    }

    public Integer getId_person() {
        return id_person;
    }

    public void setId_person(Integer id_person) {
        this.id_person = id_person;
    }

    public Integer getId_event() {
        return id_event;
    }

    public void setId_event(Integer id_event) {
        this.id_event = id_event;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
