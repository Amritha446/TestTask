<html>
    <head>
        <title>Login page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
        <link href="style.css" rel="stylesheet">
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
                    <div class="leftSection">
                        <img src="assets/icon.JPG" alt="img" class="sectionImg">
                    </div>
                    <div class="rightSection ">
                        <h5 class="text-secondary heading">Login Here</h5>
                        <form method="post" class="ms-5">
                            <div class="input d-flex-column">
                               <div> Username</div>
                                <input type="text" name="userName" class="inputs">
                            </div>
                            <div class="input">
                               <div> Password </div>
                                <input type="password" name="userPassword" class="inputs">
                            </div>
                            <button type="submit" class="btn">LogIn Here!</button>
                            <div class="text">Or SignIn using</div>
                            <div class="images d-flex">
                                <img src="assets/fb.JPG" alt="img" class="img">
                                <img src="assets/google.JPG" alt="img" class="img">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <cfif structKeyExists(form,"submit")>
                <cfset local.loginObj=createObject("component","component.logic.cfc")>
                <cfset local.result=local.loginObj.validation()>
            </cfif>
            </cfoutput>
    </body>
</html>