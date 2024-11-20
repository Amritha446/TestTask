<html>
    <head>
        <title>signUp page</title>
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
                        <p class=" heading fs-3 mt-2 ">SIGN UP</p>
                        <form method="post" class="ms-5" enctype="multipart/form-data">
                            <div class="input d-flex-column">
                               <div class="text-secondary mt-3 ms-2"> Full Name</div>
                                <input type="text" name="fullName" class="inputs">
                            </div>
                            <div class="input d-flex-column">
                               <div class="text-secondary mt-3 ms-2"> Email Id</div>
                                <input type="text" name="mail" class="inputs">
                            </div>
                            <div class="input d-flex-column">
                               <div class="text-secondary mt-3 ms-2"> Username</div>
                                <input type="text" name="userName" class="inputs">
                            </div>
                            <div class="input">
                               <div class="text-secondary mt-3 ms-2"> Password </div>
                                <input type="password" name="userPassword1" class="inputs">
                            </div>
                            <div class="input d-flex-column">
                               <div class="text-secondary mt-3 ms-2"> Confirm Password</div>
                                <input type="password" name="userPassword2" class="inputs">
                            </div>
                            <div class="input d-flex-column">
                               <div class="text-secondary mt-3 ms-2"> Choose Profile pic</div>
                                <input type="file" name="profile" class="inputs">
                            </div>
                            <input type="submit" name="submit" value="Register" class="btn mt-3" onClick="return validation()">
                            <div class="lastSec mt-3 ms-1">Already have an Account? <a href="login.cfm" class="link">LogIn Here!</a></div>
                        </form>
                    </div>
                </div>
            </div>
            <cfif structKeyExists(form,"submit")>
                <cfset local.loginObj=createObject("component","components.logic")>
                <cfset local.result=local.loginObj.signIn(form.fullName,form.mail,form.userName,form.userPassword1,form.userPassword2,form.profile)>
                <cfif local.result == "true">
                    <cflocation url="login.cfm" addToken="no">
                <cfelse>
                    <div class="text-danger">Try with another Username, Username should not contain any spaces.</div>
                </cfif>
            </cfif>
            </cfoutput>
            
    </body>
</html>