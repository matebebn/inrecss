<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="v-on" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="shortcut icon" href="<c:url value="/resources/img/icon.png"/>" type="image/x-icon" />
    <title>${contact.nameEvent} registration page </title>
    <style>
        .rating
        {
            transform: translate(-65%,-65%) rotateY(180deg);
            display: flex;

        }


        .rating input {
            display: none;
        }
       .rating label
       {
           display: block;
           cursor: pointer;
           width: 50px;


       }
       .rating input~label:before
       {
           color: #101010;
           display: block;
       }
        .rating input:hover~label,
        .rating input:checked~label
        {
            color: gold;

        }


        #payments label {
            text-align: center;
            display: inline-block;
            margin-bottom: 5%;
            width: 200px;
            color: black;
            margin-left: 10px;
            padding: 10px;
            border-radius: 10px;
            background-color:whitesmoke ;
            border: solid 2px #454d54;

        }

        #payments input[type="radio"] {
            display: none;
        }

        #payments input[type="radio"]:checked + label {


            border: solid 2px #198754 ;
            box-shadow: 5px 10px 18px gray;

        }
        #payments input[type="radio"]:not(:checked):hover + label {
            border: solid 2px #454d54;
            background-color:#f2f2f2 ;
            box-shadow: 5px 10px 18px #888888;

        }

    </style>


</head>
<body style="background-color:#f2f2f2">
<nav style="margin-bottom: 4%;background-color: #343a40" class="navbar navbar-dark bg-dark">
<div>


</div>
    <nav style="float: right;" class="navbar navbar-light">
        <h3 style="color: white;text-align: center;font-family:Garamond,serif;font-size: 43px"> ${contact.nameEvent}</h3>
        <div class="container-fluid justify-content-start">
            <button style="border: none;color: white" class="btn btn-outline-success me-2" type="button">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                    <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"></path>
                </svg>
            </button>
            <button style="border: none;color: white" class="btn btn-outline-success me-2" type="button">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-twitter" viewBox="0 0 16 16">
                    <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"></path>
                </svg>
            </button>

            <button style="border: none;color: white" class="btn btn-outline-success me-2" type="button">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
                    <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"></path>
                </svg>
            </button>

        </div>
    </nav>
    <nav style="float: right;" class="navbar navbar-light">


    </nav>

</nav>
<div style="text-align: center">
<img style="width: 70%;height: 300px;background-color: white;" alt="baner"  src="<c:url value="/resources/img/photo_baner_1.jpeg"/>" />
</div>
<div class="container" style="margin-top: 2%">
    <div class="row row-cols-2">
        <c:if test="${register != 'registered' && regProcess =='stop'  || contact.eventType=='0' ||  regProcess == null }">
              <div class="col">

            <div class="mb-3">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h5 class="h5">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal" viewBox="0 0 16 16">
                        <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"></path>
                        <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"></path>
                    </svg>
                    Registration
                </h5>

            </div>
                <form:form action="registerMembersProcessStart" method="post">
            <h5 >Price event:<c:if test="${contact.priceEvent ==0}"><span class="badge bg-success"> Free</span> </c:if><c:if test="${contact.priceEvent >0}"><span class="badge bg-primary"> ${contact.priceEvent} zl </span></c:if>
                <jsp:useBean id="now" class="java.util.Date" />
                <fmt:formatDate var="currentYear" value="${now}" pattern="yyyy" />
                <fmt:formatDate var="currentMonth" value="${now}" pattern="MM" />
                <fmt:formatDate var="currentDay" value="${now}" pattern="dd" />
                <fmt:parseDate value="${contact.eventDate}" var="parsedDate"  pattern="yyyy-MM-dd" />
                <fmt:formatDate var="eventDay" value="${parsedDate}" pattern="dd" />
                <fmt:formatDate var="eventMonth" value="${parsedDate}" pattern="MM" />
                <fmt:formatDate var="eventYear" value="${parsedDate}" pattern="yyyy" />

                    <input id="eventType" name="eventType" type="hidden" value="${contact.eventType}" />
                    <input id="id_event" name="id_event" type="hidden" value="${contact.id_event}" />
                <button style="margin-left: 25%;width: 150px;height: 50px" type="submit" <c:if test="${contact.personLimit == '0'}"> disabled </c:if> <c:if test="${eventYear == currentYear && eventMonth == currentMonth && eventDay-currentDay==1}"> disabled </c:if>   class="btn btn-success">Register</button>
                </form:form>
            </h5>
            <small class="text-muted">End registration : ${eventYear}-${eventMonth}-${eventDay-1} </small><br>
            <small class="text-muted">Available limit : <c:if test="${contact.personLimit >0}"><span class="badge bg-success"> ${contact.personLimit}</span> </c:if><c:if test="${contact.personLimit ==0}"><span class="badge bg-danger"> ${contact.personLimit}</span> </c:if> </small>
        </div>

            </div>
        </c:if>
                   <c:if test="${regProcess == 'start'}">
                       <script>window.onload = function() {
                           var hangoutButton = document.getElementById("startReg");hangoutButton.click();

                       }</script>

              <div id="app">
                  <form:form id="endTimer" action="registerMembersProcessCancell" method="post">
                      <input id="id_event" name="id_event" type="hidden" value="${contact.id_event}" />
                      <button  style="display: none;width: 150px;height: 50px" type="submit" class="btn btn-success">Yes</button>
                  </form:form>
                <div class="col">


                         <div class="mb-3">

                            <button id="startReg" style="display: none;" type="button" @click.prevent="goToStep(1)"></button>

                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h5 class="h5">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal" viewBox="0 0 16 16">
                            <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"></path>
                            <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"></path>
                        </svg>
                        Application form
                    </h5>
                </div>
                <div  style="margin-bottom: 5%;border-radius: 20px;text-align:center;background-color: #343a40;height: 100px;color: white"><h5 style="padding-top: 3%;margin-bottom: 2%">Registration closes in <span style="background-color: #198754" id="time" class="badge badge-success"></span> minutes!</h5>
                    <div style="margin: auto;width: 500px;text-align: center" class="progress">
                        <div class="progress-bar progress-bar-striped bg-success progress-bar-animated"  id="progressBar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 0"></div>
                    </div>
                </div>
                     <template id="step1" v-if="currentStep == 1">
                         <div>
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                </div>
                <label for="perName" class="form-label">Name</label>
                    <input type="text"  v-on:input="emptyInput('perName');"  class="form-control" v-model="step1.personName" id="perName" >
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                </div>
                <label for="surName" class="form-label">Surname</label>
                    <input type="text"   v-on:input="emptyInput('surName');"  class="form-control" v-model="step1.personSurname"  id="surName"  >
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                </div>
                <label for="emMail" class="form-label">Email</label>
                    <input type="text"   v-on:input="emptyInput('emMail');"  class="form-control" v-model="step1.personEmail"  id="emMail"  >
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">

                </div>
                       <c:if test="${eventType == '1'}">
                <div class="form-check">

                    <label class="form-check-label" for="invoice">
                        Issue an invoice
                        <input class="form-check-input"  @click="invoice()" id="invoice" type="checkbox" v-model="step1.personInvoice" value="1">
                    </label>
                </div>
                       </c:if>
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">

                </div>


                <div class="form-check">

                    <label class="form-check-label" for="rodo">
                        <input  @click="checkTermsRodo()" class="form-check-input" type="checkbox" value=""  id="rodo">
                      <p id="textRodo">  I agree to the processing of personal data provided in this document for realising the recruitment process pursuant to the Personal Data Protection Act of 10 May 2018 (Journal of Laws 2018, item 1000) and in agreement with Regulation (EU) 2016/679 of the European Parliament and of the Council of 27 April 2016 on the protection of natural persons with regard to the processing of personal data and on the free movement of such data, and repealing Directive 95/46/EC (General Data Protection Regulation).</p>
                    </label>
                </div>


                <div class="form-check">

                    <label class="form-check-label" for="terms">
                        <input  @click="checkTermsRodo()" class="form-check-input" type="checkbox" value="" id="terms">
                        <p id="textTerms">   I have read the terms and conditions and agree.</p>

                    </label>
                </div>

                <div class="form-check">

                    <label class="form-check-label" for="personData">
                        <input class="form-check-input" type="checkbox" value="" id="personData">
                        I also consent to processing of my personal data for the purposes of any future recruitment processes.

                    </label>
                </div>
                <div style="text-align: center">

                    <button style="width: 150px;height: 50px" type="submit"  @click.prevent="goToStep(2)"  class="btn btn-success">Next</button>
                    <button  style="width: 150px;height: 50px"  onclick="cancel();" type="button" class="btn btn-danger">Cancel</button>
                </div>
                         </div>
                </template>

            </div>
                    </div>
                  <template id="step2" v-if="currentStep == 2">
                <div class="col">

                         <div class="mb-3">

                                  <c:if test="${eventType == '0'}"><c:url var="freeRegister"  value="register_User_Event" /></c:if>
                                  <c:if test="${eventType == '1'}"><c:url var="freeRegister"  value="register_User_Event" /></c:if>
                        <form:form id="paymentProcess" name="paymentProcess"  action="${freeRegister}" class="form-horizontal" method="post">
                        <label for="nameMember" class="form-label">Name </label>

                        <input type="text"    v-model="step1.personName" value="" readonly class="form-control" name="nameMember" id="nameMember"  />

                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom"></div>


                        <label for="surnameMember" class="form-label">Surname </label>
                        <input type="text"   class="form-control"  v-model="step1.personSurname" value="" readonly  id="surnameMember" name="surnameMember" />

                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom"></div>

                        <label for="emailMember" class="form-label">Email </label>
                        <input type="text" class="form-control"  v-model="step1.personEmail" value="" readonly name="emailMember" id="emailMember"  />

                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom"></div>
                            <c:if test="${eventType == '1'}">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox"  v-model="step1.personInvoice" onclick="return false;" name="personInvoice" id="personInvoice">
                            <label class="form-check-label" for="personInvoice">
                                Issue an invoice
                            </label>
                        </div>
                            </c:if>

                            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">

                        </div>
                        <c:if test="${eventType == '1'}">
                        <div  class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h5 class="h5">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal" viewBox="0 0 16 16">
                                    <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"></path>
                                    <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"></path>
                                </svg>

                                Payment methods

                            </h5>

                        </div>
                        <div class="row justify-content-md" id="payments">
                            <input  type="radio" onclick="setPaymentMethod()" name="payment" value="1"  id="paypal"   >
                            <label  for="paypal">PayPal</label>
                            <input  type="radio"  onclick="setPaymentMethod()"  name="payment" value="0" id="bankTransfer">
                            <label  for="bankTransfer">Bank transfer</label>
                        </div>
                        </c:if>


                        <div>
                            <input id="eventPricePay" name="eventPricePay" type="hidden" value="${contact.priceEvent}" />
                            <input id="nameProduct" name="nameProduct" type="hidden" value="${contact.nameEvent}" />
                            <input id="eventAccountTran" name="eventAccount" type="hidden" value="${contact.accountNumber}" />
                            <input id="eventTittleTran" name="eventTittleTran" type="hidden" value="${contact.titlePayment}" />
                            <input id="eventT" name="eventT" type="hidden" value="${contact.eventType}" />
                            <input id="id_event_reg" name="id_event" type="hidden" value="${contact.id_event}" />
                            <button style="width: 150px;height: 50px"  @click.prevent="checkForm()"   class="btn btn-success">Register</button>
                            <button style="width: 150px;height: 50px"   @click.prevent="goToStep(1)" type="submit" class="btn btn-secondary">Back</button>
                            <button  style="width: 150px;height: 50px"   onclick="cancel();" type="button" class="btn btn-danger">Cancel</button>
                        </div>
                    </form:form>


                         </div>

                    </div>
                  </template>
              </div>
        </c:if>
        <c:if test="${register == 'registered' && contact.eventType=='1' && pay != 'online' }">
                <div class="col">

        <div class="mb-3">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h5 class="h5">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal" viewBox="0 0 16 16">
                    <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"></path>
                    <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"></path>
                </svg>
                Registration was successful
            </h5>

        </div>
        <div class="container">
            <div class="row row-cols-1">
                <div class="row g-3">
                    <div class="col">
                        <ul class="list-group mb-3">
                            <li class="list-group-item d-flex justify-content-between lh-sm">
                                <div>
                                    <h5  class="my-0">${contact.accountNumber} </h5>
                                    <small  class="text-muted">Number accoun</small>

                                </div>
                            </li>
                            <li class="list-group-item d-flex justify-content-between lh-sm">
                                <div>
                                    <h5 class="my-0">In the tittle enter : ${contact.titlePayment}</h5>
                                    <small class="text-muted">Tittle</small>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>
    </div>
        </c:if>
        <c:if test="${register == 'registeredFailed'}">
          <script type="text/babel">
              window.onload = function() {
                  Swal.fire({
                      title: 'Registration failed !',
                      text:'Error, we are sorry that you did not register',
                      icon: 'warning',
                      showCancelButton: false,
                      confirmButtonText: 'Close',
                      showConfirmButton: true,
                      backdrop: `rgba(56, 50, 50, 0.8)`,
                      showCloseButton: true,
                      closeButtonHtml: '<svg xmlns="http://www.w3.org/2000/svg" width="56" height="56" fill="#b3b3cc" class="bi bi-x-square-fill" viewBox="0 0 16 16">\n' +
                          '  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm3.354 4.646L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 1 1 .708-.708z"/>\n' +
                          '</svg>',
              })
              }
          </script>
        </c:if>
<c:if test="${eventShedule.description_shedule != 'Empty' && eventShedule.description_shedule !=null }">
        <div class="col">
            <div class="mb-3">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h5 class="h5">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal" viewBox="0 0 16 16">
                        <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"></path>
                        <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"></path>
                    </svg>
                    Shedule
                </h5>
            </div>
            <div class="container">
                <div class="row row-cols-1">
                    <div class="col">

                        <div class="row g-3">
                            <div class="col">
                                <ul class="list-group mb-3">

                                        <div id="a">

                                            <c:set var = "string1" value = "${eventShedule.description_shedule}"/>

                                            <c:set var = "string2" value = "${fn:replace(string1, '.', '<li class=list-group-item d-flex justify-content-between lh-sm><br></br>')}" />

                                            <h5 class="my-0" ><li class=list-group-item d-flex justify-content-between lh-sm>${string2}</h5>


                                        </div>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        </div>
</c:if>
                <div class="col">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h5 class="h5">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                        <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"></path>
                    </svg>
                    Description
                </h5>

            </div>
            <h5>
                <small class="text-muted">${contact.eventDescription}</small>
            </h5>
        </div>
                <div class="col">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h5 class="h5">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                        <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"></path>
                    </svg>
                    Basic information
                </h5>
            </div>
            <div class="container">
                <div class="row row-cols-1">
                    <div class="row g-3">
                        <div class="col">
                            <ul class="list-group mb-3">
                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                    <div>
                                        <h5  class="my-0">${contact.eventDate} , ${contact.startTimeEvent} - ${contact.endTimeEvent}  </h5>
                                        <small  class="text-muted">Date / Time</small>

                                    </div>
                                </li>
                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                    <div>
                                        <h5 class="my-0"><c:if test="${contact.adressEvent == 'online'}">Online Event </c:if><c:if test="${contact.adressEvent != 'online'}">${contact.adressEvent}, ${contact.cityEvent}</c:if></h5>
                                        <small class="text-muted">Address</small>

                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>

        </div>
                <div class="col">
                    <c:if test="${regProcess == null || regProcess == 'stop' }">
                    <form:form id="sendFeedback" name="sendFeedback"  action="sendFeedback" class="form-horizontal" method="post">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h5 class="h5">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                        <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"></path>
                    </svg>
                    Leave your opinion
                </h5>

            </div>
            <h5>

                <small class="text-muted">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" v-on:input="emptyActualPassword('addressEvent');" v-model="step3.addressEvent" class="form-control" name="name" placeholder="" id="name">
                    <label for="feedbackDescription" class="form-label">Description</label>
                    <textarea type="text"  v-on:input="emptyActualPassword('eventDescription');" v-model="step3.eventDescription" class="form-control" name="feedbackDescription" id="feedbackDescription" rows="3" cols="1"></textarea>
                    <h5 >Your rating:</h5>
                    <div style="margin-top: 5%; ">
                        <div class="rating">
                            <input id="star5" name="star"  type="radio" value="5"  class="xd" >
                            <label for="star5" ><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                            </svg></label>
                            <input id="star4" name="star" type="radio" value="4"  >
                            <label for="star4" ><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                            </svg></label>
                            <input id="star3" name="star"  type="radio" value="3"  >
                            <label for="star3" ><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                            </svg></label>
                            <input id="star2" name="star"  type="radio" value="2"  >
                            <label for="star2" ><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                            </svg></label>
                            <input id="star1" name="star"  type="radio" value="1"  >
                            <label for="star1" ><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                            </svg></label>
                        </div>
                        </div>

                </small>


            </h5>
            <div style="text-align: center">
                <input id="idEventFeedback" name="idEventFeedback" type="hidden" value="${contact.id_event}" />
            <button style="width: 150px;height: 50px" type="submit"  class="btn btn-success">Send</button>
            </div>
                    </form:form>
                    </c:if>
        </div>

                <div class="col">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h5 class="h5">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                        <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"></path>
                    </svg>
           Contact
                </h5>
            </div>
            <div class="container">
                <div class="row row-cols-1">
                    <div class="col">

                        <div class="row g-3">
                            <div class="col">
                                <ul class="list-group mb-3">
                                    <li class="list-group-item d-flex justify-content-between lh-sm">
                                        <div>
                                            <h5 class="my-0">${contact.emailEvent}</h5>
                                            <small class="text-muted">E-mail</small>
                                        </div>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between lh-sm">
                                        <div>
                                            <h5 class="my-0">+48 ${contact.phoneEvent}</h5>
                                            <small class="text-muted">Phone</small>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>

<c:if test="${register == 'registered'}">
    <script type="text/babel">
        Swal.fire({
            icon: 'success',
            title: 'Registration was succesfull !',
            backdrop: `rgba(56, 50, 50, 0.8)`,
        })

    </script>
</c:if>
<c:if test="${sendFeedback == 'success'}">
    <script type="text/babel">
        Swal.fire({
            icon: 'success',
            title: 'Thank you feedback was sent succesfully !',
            backdrop: `rgba(56, 50, 50, 0.8)`,
        })

    </script>
</c:if>


<%
    session.setAttribute("register","");
    session.setAttribute("sendFeedback","");
    session.setAttribute("pay","");
%>



<script type="text/babel">
    let timerGo = 0;
    let progresBar=0.0;
    if(sessionStorage.getItem("progresBar")>0){
        progresBar=parseFloat(sessionStorage.getItem("progresBar"));
    }

    let strWidth = "";
    Vue.component('step1', {
        template: '#step1',
        props: [
            'currentStep',
            'step1'
        ]
    });

    Vue.component('step2', {
        template: '#step2',
        props: [
            'currentStep',
            'step1',
            'step2'
        ]
    });

    var app = new Vue({
        el: '#app',
        data: {
            currentStep: 1,
            emptyData:0,
            step1: {
                personName: '',
                personSurname: '',
                personEmail: '',
                personInvoice: '',

            },
            step2: {


            },

        },
        ready: function() {
            console.log('ready');
        },
        methods: {
            checkForm(){

                if(document.getElementById("eventT").value=="0") {
                    document.getElementById("paymentProcess").submit();
                }
                else{

                    if( document.getElementById("paypal").checked==false &&  document.getElementById("bankTransfer").checked==false )
                    {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Choose payment method !',
                            backdrop: `rgba(56, 50, 50, 0.8)`,
                        })
                    }
                    if( document.getElementById("paypal").checked!=false ||  document.getElementById("bankTransfer").checked!=false ){document.getElementById("paymentProcess").submit();}


                }


            },
            invoice(){
               if(document.getElementById("invoice").checked)
                {
                    this.step1.personInvoice=1;
                }
               else
               {
                   this.step1.personInvoice=0;
               }

            },
            checkTermsRodo(){

                if(document.getElementById("terms").checked)
                {
                    document.getElementById("terms").style.border = "";
                    document.getElementById("textTerms").style.color ="black";

                }

                if(document.getElementById("rodo").checked)
                {
                    document.getElementById("textRodo").style.color ="black";
                    document.getElementById("rodo").style.border = "";
                }


            },
            emptyInput(name){

                document.getElementById(name).style.border = "";

            },
            goToStep: function(step) {
                if(this.currentStep>step)
                {
                    this.currentStep=step;

                }else {
                    this.emptyData = 0;

                    if (step == 2) {

                        if (this.step1.personName == "") {
                            document.getElementById("perName").style.border = "1px solid red";
                            errorSwal("Please enter all required informations!");
                            this.emptyData = 1;
                        } else {
                            if (this.step1.personName.match(/^[A-Za-z]+$/) == null) {
                                this.emptyData = 1;
                                errorSwal("Wrong name, only letters!");

                            }
                        }
                        if (this.step1.personSurname == "") {
                            document.getElementById("surName").style.border = "1px solid red";
                            errorSwal("Please enter all required informations!");
                            this.emptyData = 1;
                        } else {
                            if (this.step1.personSurname.match(/^[A-Za-z]+$/) == null) {
                                this.emptyData = 1;
                                errorSwal("Wrong surname, only letters!");

                            }
                        }
                        if (this.step1.personEmail == "") {
                            document.getElementById("emMail").style.border = "1px solid red";
                            errorSwal("Please enter all required informations!");
                            this.emptyData = 1;
                        }
                        if ( document.getElementById("rodo").checked==false) {
                            document.getElementById("rodo").style.border = "1px solid red";
                            document.getElementById("textRodo").style.color ="red";
                            errorSwal("Please acctept all required informations!");
                            this.emptyData = 1;
                        }
                        if (document.getElementById("terms").checked==false) {
                            document.getElementById("terms").style.border = "1px solid red";
                            document.getElementById("textTerms").style.color ="red";
                            errorSwal("Please acctept all required informations!");
                            this.emptyData = 1;
                        }


                        if (this.emptyData == 1) {
                            this.currentStep = 1;

                        }
                    }


                    if (this.emptyData == 0) {
                        this.currentStep = step;

                    }

                }

                function  errorSwal(info){
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: info,
                        backdrop: `rgba(56, 50, 50, 0.8)`,
                    })
                }


                function lestStartTimer() {
                    let fiveMinutes = 60 * 20;
                    let widthBar=0;
                    if(sessionStorage.getItem("key")>0)
                    {
                        fiveMinutes=sessionStorage.getItem("key");

                    }
                    else
                    {
                        fiveMinutes=1200;
                    }


                    startTimer(fiveMinutes,widthBar);
                    timerGo=1;

                }

                function startTimer(duration,) {

                    let timer = duration, minutes, seconds;


                    setInterval(function () {

                        let bar = document.querySelector('#progressBar');
                        let display = document.querySelector('#time');
                        minutes = parseInt(timer / 60, 10);
                        seconds = parseInt(timer % 60, 10);

                        minutes = minutes < 10 ? "0" + minutes : minutes;
                        seconds = seconds < 10 ? "0" + seconds : seconds;


                        progresBar=progresBar+0.083;
                        sessionStorage.setItem("progresBar",progresBar);
                        strWidth =progresBar+"%";
                        bar.style.width=strWidth;
                        sessionStorage.setItem("key",timer);
                        display.textContent = minutes + ":" + seconds;

                        if (--timer < 0) {
                            document.getElementById("endTimer").submit();
                            sessionStorage.setItem("key","");
                            sessionStorage.setItem("progresBar",0);

                        }
                    }, 1000);
                }

                if(timerGo===0) {
                    lestStartTimer();
                }

            }
        },

    });

</script>




<script type="text/babel">
   function cancel() {
       Swal.fire({

           title: 'Are you sure?',
           icon: 'warning',
           showCancelButton: true,
           confirmButtonText: 'Yes!',
           cancelButtonText: 'No, cancel!',
           showConfirmButton: true,
           backdrop: `rgba(56, 50, 50, 0.8)`,
           showCloseButton: true,
           closeButtonHtml: '<svg xmlns="http://www.w3.org/2000/svg" width="56" height="56" fill="#b3b3cc" class="bi bi-x-square-fill" viewBox="0 0 16 16">\n' +
               '  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm3.354 4.646L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 1 1 .708-.708z"/>\n' +
               '</svg>',
           preConfirm: () => {
               sessionStorage.setItem("key",0);
               sessionStorage.setItem("progresBar",0);
               document.getElementById("endTimer").submit();

           }
       })
   }






    function setPaymentMethod() {
        if(document.querySelector('input[name="payment"]:checked').value=="0"){
        document.querySelector('form[name="paymentProcess"]').setAttribute("action","register_User_Event");}
        else{
            document.querySelector('form[name="paymentProcess"]').setAttribute("action","authorize_payment");
        }
    }
</script>


<!-- Optional JavaScript; Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<!-- Optional JavaScript; Vue.js -->
<script
        src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js">
</script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.21.1/babel.min.js">
</script>

<!-- Optional JavaScript; Sweetalert -->

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</body>
<section style="margin-top: 10%;background-color: #212529"   id="footer">
    <div class="container">
        <div style="color: white" class="row text-center text-xs-center text-sm-left text-md-left">
            <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">

                <ul class="list-unstyled quick-links">
                    <li>
                        <h4 style="color: white;text-align: center;font-family:Brush Script MT, Brush Script Std, cursive;">Powered by </h4>
                        <img style="width: 200px;height: 10%;background-color: #ffffff;border-radius: 20px" alt="logo" src="<c:url value="/resources/img/logo.png"/>" />
                    </li>

                </ul>
            </div>
        </div>
        <div class="row">

            <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
                <ul class="list-unstyled list-inline social text-center">
                    <li class="list-inline-item">
                        <button style="border: none;color: white" class="btn btn-outline-success me-2" type="button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                                <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"></path>
                            </svg>
                        </button>

                    </li>

                    <li class="list-inline-item">			<button style="border: none;color: white" class="btn btn-outline-success me-2" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
                            <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"></path>
                        </svg>

                    </button>
                    </li>
                    <li class="list-inline-item">
                        <button style="border: none;color: white" class="btn btn-outline-success me-2" type="button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-twitter" viewBox="0 0 16 16">
                                <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"></path>
                            </svg>
                        </button>
                    </li>

                </ul>
            </div>
            <hr>
        </div>
        <div class="row">

            <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">

                <p class="h6">© All right Reversed.</p>
            </div>
            <hr>
        </div>
    </div>
</section>
<!-- ./Footer -->
</html>
