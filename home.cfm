<html>
    <head>
        <title>home page</title>
        <script src="js/validation.js"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <script src="js/bootstrap.bundle.min.js"></script>
        <link href="css/style.css" rel="stylesheet">
        <script src="js/jquery.min.js"></script>
        <script src="js/ajax.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"/>       
    </head>
    <body>
        <cfoutput>
            <div class="container" id="container">
                <div class="header d-flex">
                    <img src="assets/icon.JPG" alt="img" class="icon">
                    <div class="headerText">ADDRESS BOOK</div>
                    <button type="button" class="btn1" onClick="logoutUser()">
                        <div class="signUp d-flex">
                            <i class="fa-solid fa-right-from-bracket mb-1 mt-1" style="color:##fff"></i><div class="text-white ms-2">SignOut</div>
                        </div>
                    </button>
                </div>
                <div class="topSection mt-4 d-flex mb-4">
                    <form method="post"><button type="submit" class="btn2 mb-1" name = "createPDF"><img src="assets/pdf.JPG" class="hImg" alt="img"></button></form>
                    <button type="button" class="btn3" onClick="excelCreate()"><img src="assets/xml.JPG" class="hImg" alt="img"></button>
                    <button type="button" class="btn3" onClick="window.print();return false;"><img src="assets/draft.JPG" class="hImg" alt="img"></button>
                </div>
                <div class="d-flex secondSection">
                    <div class="leftSide mb-2 d-flex-column">
                        <img src="assets/#session.profile#" class="userImg mt-3 ">
                        <div class="userText ms-5 mt-2">#session.userName#</div>
                        <button type="button" class="btn4 ms-3 mt-2" id="createb" onClick="createContact()">CREATE</button>
                    </div>
                    <div class="rightSide ms-5 mb-1 d-flex-column">
                        <div class="headCreate d-flex mt-3">
                            <p class="textCreate">Name</p>
                            <p class="textCreate1">Email Id</p>
                            <p class="textCreate2">Phone Number</p>
                        </div>
                        <hr class="horizontalLine">
                        <cfset local.objCreate=createObject("component", "components.logic")>
                        <cfset local.result1=local.objCreate.viewContact()>
                        <cfloop query="#local.result1#">
                            <div class="d-flex">
                                <img src="assets/#local.result1.img#" class="dataImg mt-1 mb-1">
                                <div class="dataText">#local.result1.text1#</div>
                                <div class="dataText1">#local.result1.mail#</div>
                                <div class="dataText">#local.result1.phone#</div>
                                <button type="submit" class="btn5 ms-4 mt-2" data-bs-toggle="modal" data-bs-target="##editContact" 
                                id="editb" value="#local.result1.userId#" onClick="editOne(event)">Edit</button>
                                <button type="submit" class="btn5 ms-4 mt-2" id="deleteb" value="#local.result1.userId#" 
                                onClick="deletePage(event)">DELETE</button>
                               <button type="submit" class="btn5 ms-4 mt-2" data-bs-toggle="modal" data-bs-target="##viewContact" 
                                id="viewb" value="#local.result1.userId#" onClick="readOne(event)">VIEW</button>
                            </div>
                            <hr class="horizontalLine">
                        </cfloop>
                        <div class="modal fade" id="editContact" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body d-flex">
                                        <div class="mainSection ms-3">
                                            <form method="post" name="form" enctype="multipart/form-data" id="createData">
                                                <div class="headEdit mt-1 ">
                                                    <div class="headEditText" id="heading"></div>
                                                </div>
                                                <div class="textHead1">
                                                    PERSONAL CONTACT
                                                </div><hr class="horizontalLine1 mt-1">                                                
                                                <div class="d-flex ">
                                                    <div class="d-flex-column">
                                                        <div class="textHead">Title</div>
                                                        <select name="title" class="editBtn ms-3 mt-1" id="title">
                                                            <option></option>
                                                            <option>Mr.</option>
                                                            <option>Miss.</option>
                                                        </select>
                                                        <div class="error text-danger" id="titleError"></div>
                                                    </div>
                                                    <div class="d-flex-column">
                                                        <div class="textHead">FIRST NAME</div>
                                                        <input type="text" name="text1" class="editBtn2 ms-3" id="text1">
                                                        <div class="error text-danger" id="firstnError"></div>
                                                    </div>
                                                    <div class="d-flex-column">
                                                        <div class="textHead">LAST NAME</div>
                                                        <input type="text" name="text2" class="editBtn2 ms-3" id="text2">
                                                        <div class="error text-danger" id="lastnError"></div>
                                                    </div>
                                                </div>
                                                <div class="d-flex">
                                                    <div class="d-flex-column">
                                                        <div class="textHead">GENDER</div>
                                                        <select class="editBtn2 me-5 ms-3" name="gender" id="gender1">
                                                            <option></option>
                                                            <option>Male</option>
                                                            <option>Female</option>
                                                            <option>Others</option>
                                                        </select>
                                                        <div class="error text-danger" id="genderError"></div>
                                                    </div>
                                                    <div class="d-flex-column">
                                                        <div class="textHead">DOB</div>
                                                        <input type="date" name="dob" class="editBtn2 ms-3" id="dob1">
                                                        <div class="error text-danger" id="dobError"></div>
                                                    </div>
                                                </div>
                                                <div class="d-flex ">
                                                    <div class="d-flex-column">
                                                        <div class="textHead">UPLOAD PHOTO</div>
                                                        <input type="file" class="editBtn1 ms-3 " name="img" id="img1">
                                                        <div class="error text-danger" id="imgError"></div>
                                                    </div>
                                                </div>
                                                
                                                <div class="textHead1">
                                                    CONTACT DEAILS
                                                </div>
                                                <hr class="horizontalLine1 mt-1">
                                                <div class="d-flex ">
                                                    <div class="d-flex-column">
                                                        <div class="textHead ">ADDRESS</div>
                                                        <input type="textarea" name="address" class="editBtn2 ms-3" id="address1">
                                                        <div class="error text-danger" id="addressError"></div>
                                                    </div>
                                                    <div class="d-flex-column">
                                                        <div class="textHead ms-5">STREET</div>
                                                        <input type="text" name="street" class="editBtn2 ms-5" id="street1">
                                                        <div class="error text-danger" id="streetError"></div>
                                                    </div>
                                                </div>
                                                <div class="d-flex ">
                                                    <div class="d-flex-column">
                                                        <div class="textHead ">PINCODE</div>
                                                        <input type="text" name="pin" class="editBtn2 ms-3" id="pin">
                                                        <div class="error text-danger" id="pinError"></div>
                                                    </div>
                                                    <div class="d-flex-column">
                                                        <div class="textHead ms-5">DISTRICT</div>
                                                        <input type="text" name="district" class="editBtn2 ms-5" id="district1">
                                                        <div class="error text-danger" id="districtError"></div>
                                                    </div>
                                                </div>
                                                <div class="d-flex ">
                                                    <div class="d-flex-column">
                                                        <div class="textHead ">STATE</div>
                                                        <input type="text" name="state" class="editBtn2 ms-3" id="state1">
                                                        <div class="error text-danger" id="stateError"></div>
                                                    </div>
                                                    <div class="d-flex-column">
                                                        <div class="textHead ms-5">COUNTRY</div>
                                                        <input type="text" name="country" class="editBtn2 ms-5" id="country1">
                                                        <div class="error text-danger" id="countryError"></div>
                                                    </div>
                                                </div>
                                                <div class="d-flex ">
                                                    <div class="d-flex-column">
                                                        <div class="textHead ">EMAIL</div>
                                                        <input type="mail" name="mail" class="editBtn2 ms-3" id="mail">
                                                        <div class="error text-danger" id="mailError"></div>
                                                    </div>
                                                    <div class="d-flex-column">
                                                        <div class="textHead ms-5">PHONE NUMBER</div>
                                                        <input type="text" name="phone" class="editBtn2 ms-5" id="phone1">
                                                        <div class="error text-danger" id="phoneError"></div>
                                                    </div>
                                                </div>
                                                <div id="errorcontact"></div>
                                                <button type="submit" value="submit" class="btn mt-3 mb-5 ms-5" name="submit" onClick="return validation()">SUBMIT</button>
                                            </form>
                                        </div>
                                        <div class="newUser"><img src="assets/newUser.JPG" alt="img" class="newUser" id="img2"></div>
                                    </div>                                        
                                </div>
                            </div>
                        </div>
                        
                        <cfif structKeyExists(form,"submit") AND NOT structKeyExists(session,"contactId")>
                            <cfset local.editObj=createObject("component","components.logic")>
                            <cfset local.resultEdit=local.editObj.createContact(form.title,form.text1,form.text2,form.gender,form.dob,form.img,form.address,form.street,form.pin,form.district,form.state,form.country,form.mail,form.phone)>
                            #local.resultEdit#
                        </cfif>
                        <cfif structKeyExists(form,"submit") AND structKeyExists(session,"contactId")>
                            <cfset local.editObj=createObject("component","components.logic")>
                            <cfset local.resultEdit=local.editObj.editContact(form.title,form.text1,form.text2,form.gender,form.dob,form.img,form.address,form.street,form.pin,form.district,form.state,form.country,form.mail,form.phone,session.contactId)>
                            #local.resultEdit#
                        </cfif>
                        
                        <div class="modal fade" id="viewContact" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body d-flex">
                                        <div class="mainSection ms-3">
                                            <form method="post" name="form">
                                                <div class="headEdit mt-1 ">
                                                        <div class="headEditText" >CONTACT DETAILS</div>
                                                </div>
                                                <div class="d-flex">
                                                    <div class="textHead">NAME  :   </div>                                            
                                                    <div class = "data" id="name"></div>                                                       
                                                </div>
                                                <div class="d-flex">
                                                    <div class="textHead">GENDER  :</div>
                                                    <div class = "data" id="gender"></div>
                                                </div>
                                                <div class="d-flex">
                                                    <div class="textHead">DOB  :</div>
                                                    <div class = "data" id="dob"></div>
                                                </div>
                                                <div class="d-flex">
                                                    <div class="textHead">ADDRESS  :</div>
                                                    <div class = "data" id="address"></div>
                                                </div>
                                                <div class="d-flex">
                                                    <div class="textHead">PINCODE  :</div>
                                                    <div class = "data" id="pincode"></div>
                                                </div>
                                                <div class="d-flex">
                                                    <div class="textHead">EMAIL  :</div>
                                                    <div class = "data" id="email"></div>
                                                </div>
                                                <div class="d-flex">
                                                    <div class="textHead">PHONE  :</div>
                                                    <div class = "data" id="phone"></div>
                                                </div>
                                                <button type="submit" name="closeBtn" class="closeBtn" >CLOSE</button>
                                            </form>
                                            <cfif structKeyExists(form, "submit")>
                                                <cfset local.viewObj = createObject("component","components.logic")>
                                                <cfset local.result2 = local.viewObj.viewOne()>
                                            </cfif>
                                        </div>
                                        <div class="newUser"><img src="assets/newUser.JPG" alt="img" class="newUser" id="img1"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <cfif structKeyExists(form, "createPDF")>
                <cfset local.objPdf = createObject("component", "components.logic")>
                <cfset local.result = local.objPdf.viewContact()> 
                <cfdocument  format="PDF" overwrite="yes" filename = "./assets/createdPdf.pdf" >
                    <table border = "1">
                        <thead>
                            <tr>
                                <th>TITLE</th>
                                <th>FIRST NAME</th>
                                <th>SECOND NAME</th>
                                <th>GENDER</th>
                                <th>DOB</th>
                                <th>IMAGE NAME</th>
                                <th>ADDRESS</th>
                                <th>STREET</th>
                                <th>PIN</th>
                                <th>DISTRICT</th>
                                <th>STATE</th>
                                <th>COUNTRY</th>
                                <th>EMAIL</th>
                                <th>PHONE</th>
                            </tr>
                        </thead>
                        <tbody>
                            <cfloop query = "#local.result#">
                                <tr>
                                    <td>#local.result.title#</td>
                                    <td>#local.result.text1#</td>
                                    <td>#local.result.text2#</td>
                                    <td>#local.result.gender#</td>
                                    <td>#local.result.dob#</td>
                                    <td>#local.result.img#</td>
                                    <td>#local.result.address#</td>
                                    <td>#local.result.street#</td>
                                    <td>#local.result.pin#</td>
                                    <td>#local.result.district#</td>
                                    <td>#local.result.state#</td>
                                    <td>#local.result.country#</td>
                                    <td>#local.result.mail#</td>
                                    <td>#local.result.phone#</td>                                   
                                </tr>
                            </cfloop>
                        </tbody>
                    <table>  
                </cfdocument>
            </cfif>
        </cfoutput>   
    </body>
</html>