
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="v-on" uri="http://www.springframework.org/tags/form" %>

<%--
  Created by IntelliJ IDEA.
  User: Mateusz
  Date: 12.05.2020
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <link rel="shortcut icon" href="<c:url value="/resources/img/icon.png"/>" type="image/x-icon" />


    <title>INRECSS - Power of Improvement</title>

    <!-- Bootstrap CSS -->


    <link href=" https://cdn.datatables.net/1.10.23/css/dataTables.bootstrap5.min.css" rel="stylesheet"/>
    <script src="https://www.chartjs.org/samples/latest/utils.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/dataTables.bootstrap5.min.js"></script>
    <link rel="shortcut icon" href="<c:url value="/resources/img/icon.png"/>" type="image/x-icon" />

<style>
    .steps{
        margin-left: 150px;
        text-align: center;
        background-color: #198754;
        color:white;
        font-size: 30px;
        border-radius: 100%;
        width:50px

    }
    .stepsText{
        color: #198754;
        font-size: 30px;
        text-align: center;
    }
    .normalSteps{
        margin-left: 150px;
        text-align: center;
        color:white;
        font-size: 30px;
        background-color: #a6a6a6;
        border-radius: 100%;
        width:50px
    }
    .normalStepsText{
        text-align: center;
        color:#a6a6a6;
    }
</style>
</head>
<body>


<nav style="background-color: #343a40;" class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow" >
    <div>
        <img style="width: 200px;height: 100px;background-color: white;border-radius: 20px" alt="logo" src="<c:url value="/resources/img/logo.png"/>" />
        <h4 style="color: white;text-align: center;font-family:Brush Script MT, Brush Script Std, cursive;">Power of Improvement</h4>
    </div>
    <nav style="float: right;" class="navbar navbar-light">
        <h3 style="color: white;text-align: center;font-family:Garamond,serif;font-size: 43px">Conference Service System</h3>
        <form class="container-fluid justify-content-start">
            <button style="border: none;color: white" class="btn btn-outline-success me-2" type="button">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                    <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"></path>
                </svg>
            </button>
            <button style="border: none;color: white" class="btn btn-outline-success me-2" type="button">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-twitter" viewBox="0 0 16 16">
                    <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"></path>
                </svg>
            </button>

            <button style="border: none;color: white" class="btn btn-outline-success me-2" type="button">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
                    <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"></path>
                </svg>
            </button>

        </form>
    </nav>
    <nav style="float: right;" class="navbar navbar-light">
        <form class="container-fluid justify-content-start">
            <a href="${pageContext.request.contextPath}" style="border: none;color: white" class="btn btn-outline-success me-2">

                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694L1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z"></path>
                    <path d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z"></path>
                </svg>
                Home
            </a>
            <c:if test="${type == '1'}">
                <a href="panel_admin" style="border: none;color: white" class="btn btn-outline-success me-2" type="button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-shield-lock" viewBox="0 0 16 16">
                        <path d="M5.338 1.59a61.44 61.44 0 0 0-2.837.856.481.481 0 0 0-.328.39c-.554 4.157.726 7.19 2.253 9.188a10.725 10.725 0 0 0 2.287 2.233c.346.244.652.42.893.533.12.057.218.095.293.118a.55.55 0 0 0 .101.025.615.615 0 0 0 .1-.025c.076-.023.174-.061.294-.118.24-.113.547-.29.893-.533a10.726 10.726 0 0 0 2.287-2.233c1.527-1.997 2.807-5.031 2.253-9.188a.48.48 0 0 0-.328-.39c-.651-.213-1.75-.56-2.837-.855C9.552 1.29 8.531 1.067 8 1.067c-.53 0-1.552.223-2.662.524zM5.072.56C6.157.265 7.31 0 8 0s1.843.265 2.928.56c1.11.3 2.229.655 2.887.87a1.54 1.54 0 0 1 1.044 1.262c.596 4.477-.787 7.795-2.465 9.99a11.775 11.775 0 0 1-2.517 2.453 7.159 7.159 0 0 1-1.048.625c-.28.132-.581.24-.829.24s-.548-.108-.829-.24a7.158 7.158 0 0 1-1.048-.625 11.777 11.777 0 0 1-2.517-2.453C1.928 10.487.545 7.169 1.141 2.692A1.54 1.54 0 0 1 2.185 1.43 62.456 62.456 0 0 1 5.072.56z"></path>
                        <path d="M9.5 6.5a1.5 1.5 0 0 1-1 1.415l.385 1.99a.5.5 0 0 1-.491.595h-.788a.5.5 0 0 1-.49-.595l.384-1.99a1.5 1.5 0 1 1 2-1.415z"></path>
                    </svg>
                    Admin Panel
                </a>
                <a  href="login_pass" style="border: none;color: white" class="btn btn-outline-success me-2" type="button"><i class="bi bi-facebook">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"></path>
                    </svg>
                </i>User Panel
                </a>
                <a href="logout" style="border: none;color: white" class="btn btn-outline-success me-2" type="button">
                    <p style=";color: white">Welcome, <span class="badge bg-danger"><c:out value="${username}"/></span></p>
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-box-arrow-in-left" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M10 3.5a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 1 1 0v2A1.5 1.5 0 0 1 9.5 14h-8A1.5 1.5 0 0 1 0 12.5v-9A1.5 1.5 0 0 1 1.5 2h8A1.5 1.5 0 0 1 11 3.5v2a.5.5 0 0 1-1 0v-2z"/>
                        <path fill-rule="evenodd" d="M4.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H14.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
                    </svg>
                    Log Out
                </a>
            </c:if>
            <c:if test="${type == '0'}">
                <a href="logout" style="border: none;color: white" class="btn btn-outline-success me-2" type="button">
                    <p style=";color: white">Welcome, <span class="badge bg-primary"><c:out value="${username}"/></span></p>
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-box-arrow-in-left" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M10 3.5a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 1 1 0v2A1.5 1.5 0 0 1 9.5 14h-8A1.5 1.5 0 0 1 0 12.5v-9A1.5 1.5 0 0 1 1.5 2h8A1.5 1.5 0 0 1 11 3.5v2a.5.5 0 0 1-1 0v-2z"/>
                        <path fill-rule="evenodd" d="M4.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H14.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
                    </svg>
                    Log Out
                </a>

            </c:if>

        </form>

    </nav>

</nav>


<div style="margin-bottom: 40%" class="container-fluid">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="position-sticky pt-3">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a href="login_pass" style="border: none;color: black;margin-bottom: 5%" class="btn btn-outline-success me-2" @click="login" type="button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"></path>
                                <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"></path>
                            </svg>
                            Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="profil_user" style="border: none;color: black;margin-bottom: 5%" class="btn btn-outline-success me-2" type="button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                                <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"></path>
                            </svg>
                            My account
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="create_event" style="border: none;color: black;margin-bottom: 5%" class="btn btn-outline-success me-2" type="button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-calendar-plus" viewBox="0 0 16 16">
                                <path d="M8 7a.5.5 0 0 1 .5.5V9H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V10H6a.5.5 0 0 1 0-1h1.5V7.5A.5.5 0 0 1 8 7z"></path>
                                <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"></path>
                            </svg>
                            Add event
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="my_events" style="border: none;color: black;margin-bottom: 5%" class="btn btn-outline-success me-2"  type="button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-calendar-check" viewBox="0 0 16 16">
                                <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"></path>
                                <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"></path>
                            </svg>
                            Events
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="person_event" style="border: none;color: black;margin-bottom: 5%" class="btn btn-outline-success me-2"  type="button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
                                <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816zM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275zM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"></path>
                            </svg>
                            Members
                        </a>
                    <li class="nav-item">
                        <a href="payments" style="border: none;color: black;margin-bottom: 5%" class="btn btn-outline-success" @click="login" type="button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-credit-card-2-back" viewBox="0 0 16 16">
                                <path d="M11 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z"/>
                                <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2zm13 2v5H1V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1zm-1 9H2a1 1 0 0 1-1-1v-1h14v1a1 1 0 0 1-1 1z"/>
                            </svg>
                            Payments
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="invoice" style="border: none;color: black;margin-bottom: 5%" class="btn btn-outline-success" @click="login" type="button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-file-earmark" viewBox="0 0 16 16">
                                <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
                            </svg>
                            Invoices
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h2 class="h2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="46" height="46" fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
                        <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816zM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275zM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"></path>
                    </svg>
                    Creating a new event
                </h2>

            </div>


            <div>
                <div class="row">
                    <div class="col"><p id="stepOneP"    class="steps">1</p></div>
                    <div class="col"><p id="stepTwoP"    class="normalSteps">2</p></div>
                    <div class="col"><p id="stepThreeP"  class="normalSteps">3</p></div>
                    <div class="col"><p id="stepFourP"   class="normalSteps">4</p></div>
                    <div class="w-100"></div>
                    <div class="col"><p id="stepOneText"   class="stepsText">Type event</p></div>
                    <div class="col"><p id="stepTwoText"   class="normalStepsText">Basic information</p></div>
                    <div class="col"><p id="stepThreeText" class="normalStepsText">Contact and description</p></div>
                    <div class="col"><p id="stepFourText"  class="normalStepsText">Finally results</p></div>
                </div>
            </div>





            <div id="app">
                <template id="step1" v-if="currentStep == 1">
                    <div class="progress">

                        <div class="progress-bar progress-bar-striped bg-success progress-bar-animated" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%"></div>
                    </div>
                    <div class="mb-3">
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h5 class="h5">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal" viewBox="0 0 16 16">
                                    <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"></path>
                                    <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"></path>
                                </svg>
                                Choose event type
                            </h5>

                        </div>
                    </div>
            <div class="jumbotron">
                <h1 class="display-4">Welcome !</h1>
                <p class="lead">Let's start creating events</p>
                <hr class="my-4">
                <p>Two options :</p>

                <button style="width: 450px;height: 50px"  v-on:click="typeEvent('Free')" type="button" id="free"      @click.prevent="goToStep(2)" class="btn btn-success">Free</button>
                <button style="width: 450px;height: 50px"  v-on:click="typeEvent('Paid')" type="button"  id="paid"     @click.prevent="goToStep(2)" class="btn btn-primary">Paid</button>
            </div>
                </template>

                <template id="step2" v-if="currentStep == 2">
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped bg-success progress-bar-animated" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%"></div>
                    </div>
                    <div class="mb-3">
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h5 class="h5">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal" viewBox="0 0 16 16">
                                    <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"></path>
                                    <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"></path>
                                </svg>
                                Complete basic information
                            </h5>

                        </div>
                        <label for="nEvent" class="form-label">Name event</label>
                        <input  type="text"   maxlength="200"  v-on:input="emptyInput('nEvent');" class="form-control" id="nEvent" v-model="step2.nameEvent"  placeholder=""   aria-describedby="emailHelp">

                    </div>
                    <div class="mb-3">
                        <label for="pEvent" class="form-label">Person limit</label>
                        <input type="number" min="1" v-on:input="emptyInput('pEvent');" id="pEvent" class="form-control" v-model="step2.personLimit"   placeholder=""  >
                    </div>
                    <div class="mb-3" v-if="typeEventInput == 'Paid'">
                        <label for="prEvent" class="form-label">Price event</label>
                        <input type="text" v-on:v-on:input="emptyInput('prEvent');" id="prEvent" class="form-control" v-model="step2.priceEvent"  placeholder="" >
                    </div>
                    <div class="mb-3">
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h5 class="h5">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                                    <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"></path>
                                </svg>
                                Date / Time
                            </h5>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="dEvent"  class="form-label">Date event</label>
                                <input type="date"  onkeydown="return false"  onclick="setMinTime()"   min="2018-01-01" id="dEvent"  v-on:input="emptyInput('dEvent');" v-model="step2.dateEvent" class="form-control" placeholder="">

                            </div>
                            <div class="col">
                                <label for="tsEvent" class="form-label">Time event</label>
                                <input type="time" v-on:input="emptyInput('tsEvent');" id="tsEvent" v-model="step2.timeEvent"  class="form-control">
                            </div>
                            <div class="col">
                                <label for="teEvent" class="form-label">End time event</label>
                                <input type="time" v-on:input="emptyInput('teEvent');" id="teEvent" v-model="step2.endtimeEvent"  class="form-control">
                            </div>


                            <div class="mb-3" v-if="typeEventInput == 'Paid'">
                                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                                    <h5 class="h5">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                                            <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"></path>
                                        </svg>
                                        Payment method
                                    </h5>
                                </div>
                        </div>
                            <div class="row" v-if="typeEventInput == 'Paid'">
                               <div class="col">
                                <div class="form-check form-switch">
                                    <input  @click="payments(1)"  v-model="step2.bankTransferOn" name="payment" class="form-check-input" id="pbEvent" type="checkbox">
                                    <label class="form-check-label" for="pbEvent">Transfer bank</label>
                                </div>
                               </div>
                                <div class="col">
                                    <div class="form-check form-switch">
                                        <input @click="payments(2)"  v-model="step2.paymentOnlineOn" name="payment" class="form-check-input" id="poEvent" type="checkbox">
                                        <label class="form-check-label" for="poEvent">Online payments</label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-check form-switch">

                                    </div>
                                </div>


                            </div>
                            <div class="row" v-if="typeEventInput == 'Paid' && step2.bankTransferOn == '1' ">
                                <div class="col">
                                    <label for="numAccount" class="form-label">Enter number account event</label>
                                    <input  type="text"   maxlength="30"  v-on:input="emptyInput('numAccount');" class="form-control" id="numAccount" v-model="step2.numberAccount"  placeholder=""  >
                                    <label for="tittleTransfer" class="form-label">Enter tittle bank transfer event</label>
                                    <textarea  type="text"   maxlength="100"  v-on:input="emptyInput('tittleTransfer');" class="form-control" id="tittleTransfer" v-model="step2.tittleTransfer"  placeholder=""></textarea>

                                </div>
                                <div class="col"></div>
                                <div class="col"></div>


                            </div>
                        </div>
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h5 class="h5">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                                    <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"></path>
                                </svg>
                               Shedule
                            </h5>

                        </div>
                        <div style="margin-bottom: 10px;" class="form-check form-switch">
                            <input  name="event" @click="sheduleEvent()"  v-model="step2.eventSheduleYes"   class="form-check-input" id="eventPlan" type="checkbox">
                            <label class="form-check-label" for="pbEvent">Add</label>
                        </div>
                        <div id="planEv" v-if="eventSheduleYes == 'yes'" class="mb-3">
                            <label for="desEvent" class="form-label">Plan description</label>
                            <textarea type="text"  v-on:input="emptyInput('eventShedule');"  v-model="step2.eventShedule" class="form-control" id="eventShedule" rows="3"></textarea>
                        </div>
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h4 class="h5">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal" viewBox="0 0 16 16">
                                    <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"></path>
                                    <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"></path>
                                </svg>
                                Options
                            </h4>
                        </div>
                            <button style="margin-top: 20px;width: 450px;height: 50px"   @click.prevent="goToStep(3)" type="button" class="btn btn-primary">Next</button>
                            <button  style="margin-top: 20px;width: 450px;height: 50px"  @click.prevent="goToStep(1)" type="submit" class="btn btn-secondary">Back</button>
                            <button  style="margin-top: 20px;width: 450px;height: 50px"  @click.prevent="cancel()"    type="submit" class="btn btn-danger">Cancel</button>
                    </div>
                </template>
                <template id="step3" v-if="currentStep == 3">
                    <div class="progress">

                        <div class="progress-bar progress-bar-striped bg-success progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
                    </div>
                    <div class="mb-3">
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h5 class="h5">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal" viewBox="0 0 16 16">
                                    <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"></path>
                                    <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"></path>
                                </svg>
                                Complete contact and description
                            </h5>

                        </div>
                        <label for="emEvent" class="form-label">Email event</label>
                        <input type="email" style=""  v-on:input="emptyInput('emEvent');" class="form-control" v-model="step3.emailEvent"  placeholder="" id="emEvent"  aria-describedby="emailHelp">

                    </div>
                    <div class="mb-3">
                        <label for="phEvent" class="form-label">Phone event</label>
                        <input type="tel" style=""  v-on:input="emptyInput('phEvent');" class="form-control" v-model="step3.phoneEvent"  placeholder=""  id="phEvent">
                    </div>
                    <div class="row">
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h5 class="h5">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                                    <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"></path>
                                </svg>
                               Online event
                            </h5>

                        </div>
                        <div style="margin-bottom: 5px" class="col">
                            <div class="form-check form-switch">
                                <input  name="event"  @click="onlineEvent()"  v-model="step2.whereEvent" class="form-check-input" id="eventOnline" type="checkbox">
                                <label class="form-check-label" for="pbEvent">Yes / No</label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-check form-switch">

                            </div>
                        </div>
                        <div class="col">
                            <div class="form-check form-switch">

                            </div>
                        </div>


                    </div>
                    <div class="mb-3"  >
                        <div  v-if="step3.whereEvent != 'online'" >
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h5 class="h5">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                                    <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"></path>
                                </svg>
                                Address / Place event
                            </h5>

                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="adrEvent" class="form-label">Address event</label>
                                <input type="text" v-on:input="emptyInput('adrEvent');" v-model="step3.addressEvent" class="form-control" placeholder="" id="adrEvent">
                            </div>
                            <div class="col">
                                <label for="plEvent" class="form-label">Place event</label>
                                <input type="text" v-on:input="emptyInput('plEvent');"  v-model="step3.placeEvent" class="form-control"  id="plEvent">
                            </div>

                        </div>
                        </div>
                        <div v-if="step3.whereEvent != 'online'" class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h5 class="h5">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                                    <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"></path>
                                </svg>
                                Description about event
                            </h5>

                        </div>
                        <div v-if="step3.whereEvent == 'online'" class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h5 class="h5">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                                    <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"></path>
                                </svg>
                                Description / Instructions about online event
                            </h5>

                        </div>

                        <label for="desEvent" class="form-label">Description</label>
                        <textarea type="text"  v-on:input="emptyInput('desEvent');" v-model="step3.eventDescription" class="form-control" id="desEvent" rows="3"></textarea>
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h4 class="h5">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal" viewBox="0 0 16 16">
                                    <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"></path>
                                    <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"></path>
                                </svg>
                                Options
                            </h4>
                        </div>

                        <button style="margin-top: 20px;width: 450px;height: 50px"    @click.prevent="goToStep(4)" type="button"  class="btn btn-primary">Next</button>
                        <button  style="margin-top: 20px;width: 450px;height: 50px"   @click.prevent="goToStep(2)" type="submit" class="btn btn-secondary">Back</button>
                        <button  style="margin-top: 20px;width: 450px;height: 50px"   @click.prevent="cancel()"    type="submit" class="btn btn-danger">Cancel</button>
                    </div>
                </template>
                <template id="step4" v-if="currentStep == 4">
                    <div class="progress">

                        <div class="progress-bar progress-bar-striped bg-success progress-bar-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
                    </div>
                    <div class="mb-3">
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h5 class="h5">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal" viewBox="0 0 16 16">
                                    <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"></path>
                                    <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"></path>
                                </svg>
                                Confirm finally results
                            </h5>

                        </div>
                    </div>
                    <div class="jumbotron">
                        <h1 class="display-4">Finally results!</h1>
                        <p class="lead">Check all informations about planning event.</p>
                        <hr class="my-4">
                    </div>
                    <div style="text-align: center;line-height: 50px;background-color: #212529;color: white;border-radius: 15px" v-if="step3.whereEvent == 'online'">
                        <h4><p style="padding-top: 20px"> Online event!</p></h4>
                        <hr class="my-4">
                    </div>
                    <form:form id="createEv" name="createEv" action="makeEvent"  class="form-horizontal" method="POST">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="nameEvent" class="form-label">Name event</label>
                            <input type="email"  v-model="step2.nameEvent"  class="form-control"  name="nameEvent" id="nameEvent" readonly />
                        </div>
                        <div  class="col-md-6">
                            <label for="personLimit" class="form-label">Person limit</label>
                            <input type="text"  v-model="step2.personLimit" class="form-control"  name="personLimit" id="personLimit"  readonly>
                        </div>
                        <div  v-if="step3.whereEvent == 'notonline'" class="col-6">
                            <label for="addressEvent" class="form-label">Address event</label>
                            <input type="text"  v-model="step3.addressEvent" class="form-control"  name="addressEvent" id="addressEvent" placeholder="" readonly>
                        </div>
                        <div  v-if="step3.whereEvent == 'notonline'" class="col-6">
                            <label for="eventCity" class="form-label">City event</label>
                            <input type="text"  v-model="step3.placeEvent" class="form-control"  name="eventCity" id="eventCity" placeholder="" readonly>
                        </div>
                        <div class="col-6">
                            <label for="dateEvent" class="form-label">Date</label>
                            <input type="text"  v-model="step2.dateEvent" class="form-control"  name="dateEvent" id="dateEvent" readonly>
                        </div>
                        <div class="col-6"  v-if="typeEventInput == 'Paid'">
                            <label for="priceEvent" class="form-label">Price event</label>
                            <input type="text"  v-model="step2.priceEvent" class="form-control"  name="priceEvent" id="priceEvent" readonly>
                        </div>
                        <div class="col-6"   v-if="typeEventInput == 'Paid' && step2.bankTransferOn == 1 " >
                            <label for="bankPayment" class="form-label">Bank transfer</label>
                            <input type="text" value="Enabled" class="form-control"  name="bankPayment" id="bankPayment" readonly>
                        </div>
                        <div class="col-6"   v-if="typeEventInput == 'Paid' && step2.bankTransferOn == 1 " >
                            <label for="numberAccountTransfer" class="form-label">Account number event</label>
                            <input type="text" v-model="step2.numberAccount"  class="form-control"  name="numberAccountTransfer" id="numberAccountTransfer" readonly>
                        </div>
                        <div class="col-6"   v-if="typeEventInput == 'Paid' && step2.bankTransferOn == 1 " >
                            <label for="tittleTransferBank" class="form-label">Tiitle bank transfer</label>
                            <textarea type="text" v-model="step2.tittleTransfer"  class="form-control"  name="tittleTransferBank" id="tittleTransferBank" readonly></textarea>
                        </div>
                        <div class="col-6"   v-if="typeEventInput == 'Paid' && step2.paymentOnlineOn == 1 " >
                            <label for="onlinePayment" class="form-label">Online payments</label>
                            <input type="text"  value="Enabled"   class="form-control"  name="onlinePayment" id="onlinePayment" readonly>
                        </div>
                        <div class="col-6">
                            <label for="phoneEvent" class="form-label">Phone event</label>
                            <input type="text"  v-model="step3.phoneEvent" class="form-control"  name="phoneEvent" id="phoneEvent" readonly>
                        </div>
                        <div class="col-6">
                            <label for="startTimeEvent" class="form-label">Start time</label>
                            <input type="text"  v-model="step2.timeEvent" class="form-control"  name="startTimeEvent" id="startTimeEvent" readonly>
                        </div>
                        <div class="col-6">
                            <label for="emailEvent" class="form-label">Email</label>
                            <input type="text"  v-model="step3.emailEvent" class="form-control"  name="emailEvent" id="emailEvent" readonly>
                        </div>
                        <div class="col-6">
                            <label for="endTimeEvent" class="form-label">End Time</label>
                            <input type="text"  v-model="step2.endtimeEvent" class="form-control"  name="endTimeEvent" id="endTimeEvent" readonly>
                            <label for="typeEvent" class="form-label">Type event</label>
                            <input style="width: 100%" type="text"  v-model="typeEventInput" class="btn btn-success"  name="typeEvent" id="typeEvent" readonly>
                        </div>
                        <div class="col-md-6">
                            <label for="eventDescription" class="form-label">Description</label>
                            <textarea type="text"  v-model="step3.eventDescription" class="form-control"  name="eventDescription" id="eventDescription" rows="3" readonly></textarea>
                        </div>
                        <div v-if="eventSheduleYes == 'yes'" class="col-md-6">
                            <label for="eventSheduleDescription" class="form-label">Plan description</label>
                            <textarea type="text"  v-model="step2.eventShedule" class="form-control"  name="eventSheduleDescription" id="eventSheduleDescription" rows="3" readonly></textarea>
                        </div>
                        <div class="col-12">
                            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                                <h5 class="h5">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal" viewBox="0 0 16 16">
                                        <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"></path>
                                        <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"></path>
                                    </svg>
                                    Options
                                </h5>
                            </div>
                            <input  type="hidden"  value="${id_user}" class="btn btn-success" name="userID" id="userID">
                            <input  type="hidden"  v-model="eventSheduleYes" class="btn btn-success" name="eventSheduleYes" id="eventSheduleYes">
                            <input  type="hidden"  v-model="step3.whereEvent"  class="btn btn-success" name="whereEvent"  id="whereEvent">
                            <button style="width: 300px;height: 50px"   type="submit"  class="btn btn-primary">Confirm</button>
                            <button style="width: 300px;height: 50px"   @click.prevent="goToStep(3)" type="button" class="btn btn-secondary">Back</button>
                            <button style="width: 450px;height: 50px"  @click.prevent="cancel()" type="button" class="btn btn-danger">Cancel</button>

                        </div>

                    </div>
                    </form:form>
                </template>
            </div>

        </main>
    </div>
</div>

<c:if test="${createdEvent == 'success'}">
    <script type="text/babel">
        Swal.fire({
            icon: 'success',
            title: 'Created event was succesfull !',
            backdrop: `rgba(56, 50, 50, 0.8)`,
        })

    </script>
</c:if>
<c:if test="${createdEvent == 'failed'}">
    <script type="text/babel">
        Swal.fire({
            icon: 'error',
            title: 'Created event was failed !',
            backdrop: `rgba(56, 50, 50, 0.8)`,
        })

    </script>
</c:if>
<%
    session.setAttribute("createdEvent","");
%>


<script type="text/babel">
    var pID=["stepOneP", "stepTwoP", "stepThreeP","stepFourP"];
    var classID=["stepOneText", "stepTwoText", "stepThreeText","stepFourText"];
    var i=0;
    Vue.component('step1', {
        template: '#step1',
        props: [
            'currentStep',
            'step1',

        ]
    });

    Vue.component('step2', {
        template: '#step2',
        props: [
            'currentStep',
            'step2'
        ]
    });

    Vue.component('step3', {
        template: '#step3',
        props: [
            'currentStep',
            'step3'

        ]
    });
    Vue.component('step4', {
        template: '#step4',
        props: [
            'currentStep',
            'step1',
            'step2',
            'step3'
        ]
    });



    var app = new Vue({
        el: '#app',
        data: {
            emptyData:0,
            currentStep: 1,
            eventSheduleYes:'no',
            typeEventInput: '',
            step1: {

            },
            step2: {
                nameEvent: '',
                priceEvent:'',
                personLimit: '',
                numberAccount:'',
                tiitleTransfer:'',
                dateEvent: '',
                timeEvent: '',
                bankTransferOn:0,
                paymentOnlineOn:0,
                eventShedule:'',
                endtimeEvent: '',


            },
            step3: {
                emailEvent: '',
                whereEvent:'notonline',
                phoneEvent: '',
                addressEvent: '',
                placeEvent: '',
                eventDescription: '',
            }
        },
        ready: function() {
            console.log('ready');
        },
        methods: {
            onlineEvent(){
                if (document.getElementById('eventOnline').checked)
                {
                    this.step3.whereEvent="online";

                } else {
                    this.step3.whereEvent="notonline";

                }





            },
            typeEvent(name){
                this.typeEventInput=name;
            },
            payments(numb){
                if (numb==1) {
                    if(this.step2.bankTransferOn==0) {this.step2.bankTransferOn = 1;}else{ this.step2.bankTransferOn = 0;}}
                    if (numb==2) { if(this.step2.paymentOnlineOn==0) {this.step2.paymentOnlineOn = 1;}else{ this.step2.paymentOnlineOn = 0;}}
                document.getElementById("pbEvent").style.border = "";
                document.getElementById("poEvent").style.border = "";

            },
            sheduleEvent(){
                if (document.getElementById('eventPlan').checked)
                {
                    this.eventSheduleYes="yes";
                }
                else {
                    this.eventSheduleYes="no";

                }
            },
            emptyInput(name){

                    document.getElementById(name).style.border = "";

            },
            cancel(){
                Swal.fire({
                    title: 'Are you sure?', text: "You won't be able to revert this!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#198754',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes!',
                    cancelButtonText: 'No, cancel!',
                    closeOnConfirm: false,
                        preConfirm: () => {
                            window.location.href = 'login_pass';
                }}
                );
            },
            goToStep: function(step) {
            if(this.currentStep>step)
            {
                this.currentStep=step;

                checkCurrentStep(this.currentStep );
            }else {


                if (step == 1) {

                    this.currentStep = step;
                    checkCurrentStep(this.currentStep );
                }

                if (step == 2) {


                    this.currentStep = step;
                    checkCurrentStep(this.currentStep );


                }
                if (step == 3){
                    this.emptyData = 0

                    if (this.step2.nameEvent == "") {
                        document.getElementById("nEvent").style.border = "1px solid red";
                        errorSwal("Please enter all required informations!");
                        this.emptyData = 1;
                    }
                    else
                        {
                            if(this.step2.nameEvent.match(/^[A-Za-z]+$/)==null)
                            {
                                this.emptyData = 1;
                                errorSwal("Wrong name, only letters[max200]!");

                            }
                        }
                    if (this.step2.personLimit == "") {
                        document.getElementById("pEvent").style.border = "1px solid red";
                        errorSwal("Please enter all required informations!");
                        this.emptyData = 1;
                    }
                    if (this.step2.dateEvent == "") {
                        document.getElementById("dEvent").style.border = "1px solid red";
                        errorSwal("Please enter all required informations!");
                        this.emptyData = 1;
                    }
                    if (this.step2.timeEvent == "") {
                        document.getElementById("tsEvent").style.border = "1px solid red";
                        errorSwal("Please enter all required informations!");
                        this.emptyData = 1;
                    }
                    if (this.step2.endtimeEvent == "") {
                        document.getElementById("teEvent").style.border = "1px solid red";
                        errorSwal("Please enter all required informations!");
                        this.emptyData = 1;
                    }
                    if (this.step2.eventShedule == "" && this.eventSheduleYes == "yes") {
                        document.getElementById("eventShedule").style.border = "1px solid red";
                        errorSwal("Please enter all required informations!");
                        this.emptyData = 1;
                    }
                    if (this.step2.priceEvent == "" && this.typeEventInput == "Paid") {
                        document.getElementById("prEvent").style.border = "1px solid red";
                        errorSwal("Please enter all required informations!");
                        this.emptyData = 1;

                    }else{

                        if(this.step2.priceEvent.match((/^[0-9]{0,10}.?[0-9]{1,2}$/))==null && this.typeEventInput == "Paid")
                        {
                            this.emptyData = 1;
                            errorSwal("Wrong price, only numbers with[ , or . ]!");

                        }
                    }
                    if (this.step2.bankTransferOn == 0 && this.step2.paymentOnlineOn == 0  && this.typeEventInput == "Paid") {
                        document.getElementById("poEvent").style.border = "1px solid red";
                        document.getElementById("pbEvent").style.border = "1px solid red";
                        errorSwal("Please enter all required informations!");
                        this.emptyData = 1;
                    }

                    if(this.emptyData==1) {
                        this.currentStep = 2;

                    }


                }


                if (step == 4) {
                    this.emptyData = 0
                    if (this.step3.emailEvent == "") {
                        document.getElementById('emEvent').style.border = "1px solid red";
                        this.emptyData = 1;
                    }

                    if (this.step3.phoneEvent == "") {
                        document.getElementById("phEvent").style.border = "1px solid red";
                        this.emptyData = 1;
                    }

                    if (this.step3.addressEvent == "" && this.step3.whereEvent == "notonline") {
                        document.getElementById("adrEvent").style.border = "1px solid red";
                        this.emptyData = 1;
                    }

                    if (this.step3.placeEvent == "" && this.step3.whereEvent == "notonline") {
                        document.getElementById("plEvent").style.border = "1px solid red";
                        this.emptyData = 1;
                    }

                    if (this.step3.eventDescription == "") {
                        document.getElementById("desEvent").style.border = "1px solid red";
                        this.emptyData = 1;
                    }

                    if(this.emptyData==1){
                        this.currentStep = 3;
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Please enter all required informations!',
                            backdrop: `rgba(56, 50, 50, 0.8)`,
                        })}

                }

                if (this.emptyData == 0) {
                    this.currentStep = step;
                    checkCurrentStep(this.currentStep );
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

                function checkCurrentStep(numb){
                    for (i = 0; i < pID.length; i++) {
                        if(i+1==numb){
                            document.getElementById(pID[i]).className = "steps";
                            document.getElementById(classID[i]).className = "stepsText";
                        }
                        else{
                            document.getElementById(pID[i]).className = "normalSteps";
                            document.getElementById(classID[i]).className = "normalStepsText";
                        }
                            }


                }



            },


        }
    });


</script>

<script>
    function setMinTime() {

        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1; //January is 0!
        var yyyy = today.getFullYear();
        if(dd<10){
            dd='0'+dd
        }
        if(mm<10){
            mm='0'+mm
        }

        today = yyyy+'-'+mm+'-'+dd;

        document.getElementById("dEvent").setAttribute("min", today);

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

<section style="background-color: #212529"   id="footer">
    <div class="container">
        <div style="color: white" class="row text-center text-xs-center text-sm-left text-md-left">
            <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
                <h5>Quick links</h5>
                <ul class="list-unstyled quick-links">
                    <li>
                        Home
                    </li>
                    <li>
                        Sign In
                    </li>
                    <li>

                    </li>
                    <li>

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
