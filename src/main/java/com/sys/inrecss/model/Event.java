package com.sys.inrecss.model;

import javax.persistence.*;


@Entity
@Table(name ="event")
public class Event {



    @Id
    @GeneratedValue
    @Column(name="id_event")
    private Integer id_event;

    @Column(name="createdUserId")
    private Integer createdUserId;

    @Column(name="nameEvent")
    private String nameEvent;

    @Column(name="personLimit")
    private Integer personLimit;

    @Column(name="eventType")
    private Integer eventType;

    @Column(name="eventDate")
    private String eventDate;

    @Column(name="startTimeEvent")
    private String startTimeEvent;

    @Column(name="endTimeEvent")
    private String endTimeEvent;

    @Column(name="adressEvent")
    private String adressEvent;

    @Column(name="cityEvent")
    private String cityEvent;

    @Column(name="eventDescription")
    private String eventDescription;

    @Column(name="emailEvent")
    private String emailEvent;

    @Column(name="phoneEvent")
    private String phoneEvent;

    @Column(name="priceEvent")
    private double priceEvent;

    @Column(name="activeBankTransfer")
    private Integer activeBankTransfer;

    @Column(name="accountNumber")
    private String accountNumber;

    @Column(name="titlePayment")
    private String titlePayment;

    @Column(name="activeOnlinePayments")
    private Integer activeOnlinePayments;


    public Event() {
    }

    public Event(Integer createdUserId, String nameEvent, Integer personLimit, Integer eventType, String eventDate, String startTimeEvent, String endTimeEvent, String adressEvent, String cityEvent, String eventDescription, String emailEvent, String phoneEvent, double priceEvent, Integer activeBankTransfer, String accountNumber, String titlePayment, Integer activeOnlinePayments) {
        this.createdUserId = createdUserId;
        this.nameEvent = nameEvent;
        this.personLimit = personLimit;
        this.eventType = eventType;
        this.eventDate = eventDate;
        this.startTimeEvent = startTimeEvent;
        this.endTimeEvent = endTimeEvent;
        this.adressEvent = adressEvent;
        this.cityEvent = cityEvent;
        this.eventDescription = eventDescription;
        this.emailEvent = emailEvent;
        this.phoneEvent = phoneEvent;
        this.priceEvent = priceEvent;
        this.activeBankTransfer = activeBankTransfer;
        this.accountNumber = accountNumber;
        this.titlePayment = titlePayment;
        this.activeOnlinePayments = activeOnlinePayments;
    }


    public Integer getId_event() {
        return id_event;
    }

    public void setId_event(Integer id_event) {
        this.id_event = id_event;
    }

    public Integer getCreatedUserId() {
        return createdUserId;
    }

    public void setCreatedUserId(Integer createdUserId) {
        this.createdUserId = createdUserId;
    }

    public String getNameEvent() {
        return nameEvent;
    }

    public void setNameEvent(String nameEvent) {
        this.nameEvent = nameEvent;
    }

    public Integer getPersonLimit() {
        return personLimit;
    }

    public void setPersonLimit(Integer personLimit) {
        this.personLimit = personLimit;
    }

    public Integer getEventType() {
        return eventType;
    }

    public void setEventType(Integer eventType) {
        this.eventType = eventType;
    }

    public String getEventDate() {
        return eventDate;
    }

    public void setEventDate(String eventDate) {
        this.eventDate = eventDate;
    }

    public String getStartTimeEvent() {
        return startTimeEvent;
    }

    public void setStartTimeEvent(String startTimeEvent) {
        this.startTimeEvent = startTimeEvent;
    }

    public String getEndTimeEvent() {
        return endTimeEvent;
    }

    public void setEndTimeEvent(String endTimeEvent) {
        this.endTimeEvent = endTimeEvent;
    }

    public String getAdressEvent() {
        return adressEvent;
    }

    public void setAdressEvent(String adressEvent) {
        this.adressEvent = adressEvent;
    }

    public String getCityEvent() {
        return cityEvent;
    }

    public void setCityEvent(String cityEvent) {
        this.cityEvent = cityEvent;
    }

    public String getEventDescription() {
        return eventDescription;
    }

    public void setEventDescription(String eventDescription) {
        this.eventDescription = eventDescription;
    }

    public String getEmailEvent() {
        return emailEvent;
    }

    public void setEmailEvent(String emailEvent) {
        this.emailEvent = emailEvent;
    }

    public String getPhoneEvent() {
        return phoneEvent;
    }

    public void setPhoneEvent(String phoneEvent) {
        this.phoneEvent = phoneEvent;
    }

    public double getPriceEvent() {
        return priceEvent;
    }

    public void setPriceEvent(double priceEvent) {
        this.priceEvent = priceEvent;
    }

    public Integer getActiveBankTransfer() {
        return activeBankTransfer;
    }

    public void setActiveBankTransfer(Integer activeBankTransfer) {
        this.activeBankTransfer = activeBankTransfer;
    }

    public Integer getActiveOnlinePayments() {
        return activeOnlinePayments;
    }

    public void setActiveOnlinePayments(Integer activeOnlinePayments) {
        this.activeOnlinePayments = activeOnlinePayments;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getTitlePayment() {
        return titlePayment;
    }

    public void setTitlePayment(String titlePayment) {
        this.titlePayment = titlePayment;
    }
}
