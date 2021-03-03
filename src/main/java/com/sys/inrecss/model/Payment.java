package com.sys.inrecss.model;

import javax.persistence.*;


@Entity
@Table(name ="payments")
public class Payment {



    @Id
    @GeneratedValue
    @Column(name="id_payment")
    private Integer id_payment;

    @Column(name="id_person")
    private Integer id_person;

    @Column(name="id_event")
    private Integer id_event;

    @Column(name="invoice")
    private Integer invoice;

    @Column(name="invoiceSend")
    private Integer invoiceSend;

    @Column(name="status_payment")
    private Integer status_payment;

    @Column(name="backCash")
    private Integer backCash;








    public Payment(){

    }

    public Payment(Integer id_person, Integer id_event, Integer invoice, Integer invoiceSend, Integer status_payment, Integer backCash) {
        this.id_person = id_person;
        this.id_event = id_event;
        this.invoice = invoice;
        this.invoiceSend = invoiceSend;
        this.status_payment = status_payment;
        this.backCash = backCash;
    }


    public Integer getId_payment() {
        return id_payment;
    }

    public void setId_payment(Integer id_payment) {
        this.id_payment = id_payment;
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

    public Integer getInvoice() {
        return invoice;
    }

    public void setInvoice(Integer invoice) {
        this.invoice = invoice;
    }

    public Integer getStatus_payment() {
        return status_payment;
    }

    public void setStatus_payment(Integer status_payment) {
        this.status_payment = status_payment;
    }

    public Integer getBackCash() {
        return backCash;
    }

    public void setBackCash(Integer backCash) {
        this.backCash = backCash;
    }

    public Integer getInvoiceSend() {
        return invoiceSend;
    }

    public void setInvoiceSend(Integer invoiceSend) {
        this.invoiceSend = invoiceSend;
    }
}
