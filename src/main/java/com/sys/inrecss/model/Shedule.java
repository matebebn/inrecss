package com.sys.inrecss.model;

import javax.persistence.*;




@Entity
@Table(name ="event_shedule")
public class Shedule {


        @Id
        @GeneratedValue
        @Column(name="id_shedule")
        private Integer id_shedule;

        @Column(name="id_event")
        private Integer id_event;


        @Column(name="description_shedule")
        private String description_shedule;

    public Shedule() {
    }

    public Shedule(Integer id_event, String description_shedule) {
        this.id_event = id_event;
        this.description_shedule = description_shedule;
    }

    public Integer getId_shedule() {
        return id_shedule;
    }

    public void setId_shedule(Integer id_shedule) {
        this.id_shedule = id_shedule;
    }

    public Integer getId_event() {
        return id_event;
    }

    public void setId_event(Integer id_event) {
        this.id_event = id_event;
    }

    public String getDescription_shedule() {
        return description_shedule;
    }

    public void setDescription_shedule(String description_shedule) {
        this.description_shedule = description_shedule;
    }
}


