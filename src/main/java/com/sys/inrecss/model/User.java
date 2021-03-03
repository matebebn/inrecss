package com.sys.inrecss.model;

import javax.persistence.*;

@Entity
@Table(name ="users")

public class User {


  @Id
  @GeneratedValue
  @Column(name="id_user")
  private String idUser;

  @Column(name="username")
  private String userName;

  @Column(name="password")
  private String passwordUser;

  @Column(name="email")
  private String emailUser;

  @Column(name="phone")
  private String phoneNumberUser;

  @Column(name="type")
  private String typeAccountUser;

  @Column(name="deleted")
  private String deleted;


  public User(){

  }

  public User(String idUser, String userName, String passwordUser, String emailUser, String phoneNumberUser, String typeAccountUser) {
    this.idUser = idUser;
    this.userName = userName;
    this.passwordUser = passwordUser;
    this.emailUser = emailUser;
    this.phoneNumberUser = phoneNumberUser;
    this.typeAccountUser = typeAccountUser;
  }

  public String getIdUser() {
    return idUser;
  }

  public void setIdUser(String idUser) {
    this.idUser = idUser;
  }



  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getPasswordUser() {
    return passwordUser;
  }

  public void setPasswordUser(String passwordUser) {
    this.passwordUser = passwordUser;
  }

  public String getEmailUser() {
    return emailUser;
  }

  public void setEmailUser(String emailUser) {
    this.emailUser = emailUser;
  }

  public String getPhoneNumberUser() {
    return phoneNumberUser;
  }

  public void setPhoneNumberUser(String phoneNumberUser) {
    this.phoneNumberUser = phoneNumberUser;
  }

  public String getTypeAccountUser() {
    return typeAccountUser;
  }

  public void setTypeAccountUser(String typeAccountUser) {
    this.typeAccountUser = typeAccountUser;
  }


  public String getDeleted() {
    return deleted;
  }

  public void setDeleted(String deleted) {
    this.deleted = deleted;
  }


  @Override
  public String toString() {
    return "User [username=" + userName + ", password=" + passwordUser
            + ", emailUser=" + emailUser + ", phoneNumberUser=" + phoneNumberUser
            + ", typeAccountUser=" + typeAccountUser + "]";
  }


}



