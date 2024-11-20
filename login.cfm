<html>
    <head>
        <title>Login page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"  />
    </head>
    <body>
        <cfoutput>
            <div class="container ">
                <div class="header d-flex">
                    <img src="assets/icon.JPG" alt="img" class="icon">
                    <div class="headerText">ADDRESS BOOK</div>
                    <img src="assets/signup.JPG" class="signUp" alt="img">
                    <img src="assets/login.JPG" class="logIn" alt="img">
                </div>
                <div class="main d-flex">
                    <div class="leftSection mb-5">
                        <img src="assets/contactbook.JPG" alt="img" class="sectionImg">
                    </div>
                    <div class="rightSection mb-5">
                        <h5 class=" heading fs-3 mt-2">LOGIN</h5>
                        <form method="post" class="ms-5">
                            <div class="input d-flex-column">
                               <div class="text-secondary mt-2 ms-4"> Username</div>
                                <input type="text" name="userName" class="inputs">
                            </div>
                            <div class="input">
                               <div class="text-secondary mt-2 ms-4"> Password </div>
                                <input type="password" name="userPassword1" class="inputs">
                            </div>
                            <input type="submit" name="submit" value="LogIn" class="btn mt-5" onClick="return validation()">
                            <div class="text text-secondary mt-3">Or SignIn using</div>
                            <div class="images d-flex mt-1">
                                <img src="assets/fb.JPG" alt="img" class="img ">
                                <img src="assets/google.JPG" alt="img" class="img1">
                            </div>
                            <div class="lastSec mt-3 ms-1 ">Dont't have an Account? <a href="signUp.cfm" class="link">SignUp Here!</a></div>
                        </form>
                    </div>
                </div>
            </div>
            <cfif structKeyExists(form,"submit")>
                <cfset local.loginObj=createObject("component","components.logic")>
                <cfset local.result=local.loginObj.validateLogin(form.userName,form.userPassword1)>
                <cfif  local.result == "true">
                    <cflocation  url="home.cfm">
                <cfelse>
                    <cfreturn "invalid login attempt">
                </cfif>
            </cfif>
            </cfoutput>
    </body>
</html>