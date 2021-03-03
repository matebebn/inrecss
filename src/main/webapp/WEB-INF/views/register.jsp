<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="shortcut icon" href="<c:url value="/resources/img/icon.png"/>" type="image/x-icon" />
    <title>INRECSS - Power of Improvement</title>
    <style>
        .titleIncress {
            font-size: 30px;
            background: -webkit-repeating-radial-gradient(circle, rgba(176,0,30,1) 27%, rgba(0,0,0,1) 71%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        #loginStyle{
            -webkit-box-shadow: 5px 5px 50px 5px #000000;
            box-shadow: 5px 5px 50px 5px #000000;
            border-radius: 25px;
        }
        #divError{
            background: rgb(176,0,30);
            background: linear-gradient(90deg, rgba(176,0,30,1) 0%, rgba(0,0,0,1) 100%);
            border-radius: 25px;

        }
    </style>
</head>
<body style="background-color: #343a40;">
<nav style="background-color: #343a40" class="navbar navbar-dark bg-dark" >
    <div>
        <img style="width: 200px;height: 10%;background-color: #ffffff;border-radius: 20px" src="<c:url value="/resources/img/logo.png"/>" />
        <h4 style="color: white;text-align: center;font-family:Brush Script MT, Brush Script Std, cursive;">Power of Improvement</h4>
    </div>
    <nav style="float: right;" class="navbar navbar-light">
        <h3 style="color: white;text-align: center;font-family:Garamond;font-size: 43px">Conference Service System</h3>
        <form class="container-fluid justify-content-start">
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
                    <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
                </svg>
            </button>

        </form>
    </nav>
    <nav style="float: right;" class="navbar navbar-light">
        <form class="container-fluid justify-content-start">
            <a href="${pageContext.request.contextPath}" style="border: none;color: white" class="btn btn-outline-success me-2">

                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694L1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z"/>
                    <path d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z"/>
                </svg>
                Home
            </a>
        </form>

    </nav>

</nav>

<div id="loginStyle" style="background-color: white;width: 400px;margin-top: 5%" class="container">
    <a href="${pageContext.request.contextPath}" style="border: none;color: black" class="btn btn-outline-success me-2">

        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694L1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z"/>
            <path d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z"/>
        </svg>
        Home
    </a>
    <h3 style="text-align: center;color: white;margin-top: 10%" class="titleIncress">Sign Up into INRECSS</h3>
    <img style="margin-top: 5%;width: 200px;height: 10%;background-color: #ffffff;border-radius: 20px; margin-left: auto;margin-right: auto;display: block; " src="<c:url value="/resources/img/logo.png"/>" />
    <div style="margin-top: 5%" class="row align-items-start">

        <div  class="col">

            <form:form id="regForm" modelAttribute="user" action="registerProcess" class="form-horizontal" 	   method="post">
                <div class="form-group">
                    <c:if test="${message != null}">
                        <div id="divError" style="text-align: center;background-color: #d5dadd" class="alert alert-info col-xs-offset-1 col-xs-10">
                            <p style="color: white"> ${message}</p>
                        </div>
                    </c:if>

                </div>
                <div class="mb-3">

                    <input style="height: 50px;" type="text" id="login" name="username" placeholder="Username" onchange="checkData();" class="form-control">

                </div>
                <div class="mb-3">

                    <input style="height: 50px;margin-top: 10%" id="password" type="password" name="password" placeholder="Password" onchange="checkData();" class="form-control">

                </div>

                <div class="mb-3">

                    <input style="height: 50px;margin-top: 10%" type="email" path="email" name="email" id="email" placeholder="Email" onchange="checkData();" class="form-control"  >

                </div>
                <div class="mb-3">

                    <input style="height: 50px;margin-top: 10%" type="text"  path="phone" name="phone" id="phone" pattern="[0-9]{3}[0-9]{3}[0-9]{3}" name="phone" onchange="checkData();" placeholder="Phone" class="form-control"  >

                </div>
                <br>
                <div class="d-flex justify-content-center">
                    <button style="margin-top: 5%;margin-bottom:5%;width: 120px;height: 50px" type="button" onclick="registerData()" class="btn btn-success btn-block">Sign Up</button>
                </div>
            </form:form>

        </div>
        <div class="form-group">
            <div class="col-xs-12 col-sm-12 col-md-12 control">
                <div style="border-top: 2px solid#888; padding-top:10px; font-size:85%;" >
                    <p style="margin-bottom: 10%;margin-top: 5%;border: none;color: black" class="btn btn-outline me-2" >
                        You already have an account ?
                    </p>
                    <a href="${pageContext.request.contextPath}/loginMain" style="margin-bottom: 10%;margin-top: 5%;border: none;color: black" class="btn btn-outline-success me-2" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
                            <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                            <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
                        </svg>
                        Sign In
                    </a>

                </div>
            </div>
        </div>
    </div>
</div>








<script type="text/babel">

    function checkData() {
    if (document.getElementById("login").value != "") {document.getElementById("login").style.border="";}
    if (document.getElementById("password").value != "") {document.getElementById("password").style.border="";}
    if (document.getElementById("email").value != "") {document.getElementById("email").style.border="";}
    if (document.getElementById("phone").value != "") {document.getElementById("phone").style.border="";}


    }


    function registerData() {
        let username = document.getElementById("login").value;
        let password = document.getElementById("password").value;
        let email = document.getElementById("email").value;
        let phone = document.getElementById("phone").value;

        if(username != ""){}else
            {
             document.getElementById("login").style.border="1px solid red";
        }
        if(password != ""){}else
            {
                document.getElementById("password").style.border="1px solid red";
            }

        if(email != ""){}else
            {
                document.getElementById("email").style.border="1px solid red";

            }

        if(phone != ""){}else
            {
                document.getElementById("phone").style.border="1px solid red";

            }

        if(username != "" && password != "" && email != ""   && phone != "" ){document.getElementById("regForm").submit();}

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

<footer style="background-color: #343a40;margin-top: 12%"   id="footer">
    <div class="container">
        <div style="color: white" class="row text-center text-xs-center text-sm-left text-md-left">
            <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">

                <ul class="list-unstyled quick-links">
                    <li>

                    </li>
                    <li>

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
                                <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
                            </svg>
                        </button>

                    </li>

                    <li class="list-inline-item">			<button style="border: none;color: white" class="btn btn-outline-success me-2" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
                            <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
                        </svg>

                    </button>
                    </li>
                    <li class="list-inline-item">
                        <button style="border: none;color: white" class="btn btn-outline-success me-2" type="button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-twitter" viewBox="0 0 16 16">
                                <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"/>
                            </svg>
                        </button>
                    </li>

                </ul>
            </div>
            <hr>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">

                <p class="h6">� All right Reversed.</p>
            </div>
            <hr>
        </div>
    </div>
</footer>
<!-- ./Footer -->


</html>