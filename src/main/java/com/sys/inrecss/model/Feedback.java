package com.sys.inrecss.model;


import javax.persistence.*;

@Entity
@Table(name ="feedback")
public class Feedback {



    @Id
    @GeneratedValue
    @Column(name="id_feedback")
    private Integer id_feedback;

    @Column(name="id_event")
    private Integer id_event;

    @Column(name="name")
    private String name;

    @Column(name="description")
    private String description;

    @Column(name="rating")
    private Integer rating;

    public Feedback() {
    }

    public Feedback(Integer id_event, String name, String description, Integer rating) {
        this.id_event = id_event;
        this.name = name;
        this.description = description;
        this.rating = rating;
    }


    public Integer getId_feedback() {
        return id_feedback;
    }

    public void setId_feedback(Integer id_feedback) {
        this.id_feedback = id_feedback;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }
}
