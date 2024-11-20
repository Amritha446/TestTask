<html>
    <head>
        <title>home page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/style.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="ajax.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js">
    </script>
    </head>
    <body>
        <cfoutput>
            <div class="container" id="container">
                <div class="header d-flex">
                    <img src="assets/icon.JPG" alt="img" class="icon">
                    <div class="headerText">ADDRESS BOOK</div>
                    <button type="button" class="btn1" onClick="logoutUser()"><img src="assets/logout.JPG" class="signUp" alt="img"></button>
                </div>
                <div class="topSection mt-4 d-flex mb-4">
                    <button type="button" class="btn2 mb-1" id="pdf"><img src="assets/pdf.JPG" class="hImg" alt="img"></button>
                    <button type="button" class="btn3" ><img src="assets/xml.JPG" class="hImg" alt="img"></button>
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
                            <p class="textCreate1">Phone Number</p>
                        </div>
                        <hr class="horizontalLine">
                        <cfset local.objCreate=createObject("component", "components.logic")>
                        <cfset local.result1=local.objCreate.viewContact()>
                        <cfloop query="#local.result1#">
                            <div class="dataCreate d-flex">
                                <img src="assets/#local.result1.img#" class="dataImg mt-1 mb-1">
                                <div class="dataText">#local.result1.text1#</div>
                                <div class="dataText">#local.result1.mail#</div>
                                <div class="dataText">#local.result1.phone#</div>
                                <button type="submit" class="btn5 ms-5 mt-2" data-bs-toggle="modal" data-bs-target="##editContact" id="editb">Edit</button>
                                <button type="submit" class="btn5 ms-5 mt-2" ID="deleteb" value="#local.result1.userId#" onClick="deletePage(event)">DELETE</button>
                                <button type="submit" class="btn5 ms-5 mt-2" data-bs-toggle="modal" data-bs-target="##viewContact" id="viewb" value="#local.result1.userId#" onClick="readOne(event)">VIEW</button>
                                <hr class="horizontalLine">
                            </div>
                        </cfloop>
                            <div class="modal fade" id="editContact" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-body d-flex">
                                            <div class="mainSection ms-3">
                                                <form method="post" name="form" enctype="multipart/form-data">
                                                    <div class="headEdit mt-1 ">
                                                            <div class="headEditText">EDIT CONTACT</div>
                                                    </div>
                                                    <div class="textHead1">
                                                        PERSONAL CONTACT
                                                    </div><hr class="horizontalLine1 mt-1">                                                
                                                    <div class="d-flex ">
                                                        <div class="d-flex-column">
                                                            <div class="textHead">Title*</div>
                                                            <select name="title" class="editBtn ms-3 mt-1">
                                                                <option>Mr.</option>
                                                                <option>Miss.</option>
                                                            </select>
                                                        </div>
                                                        <div class="d-flex-column">
                                                            <div class="textHead">FIRST NAME*</div>
                                                            <input type="text" name="text1" class="editBtn2 ms-3">
                                                        </div>
                                                        <div class="d-flex-column">
                                                            <div class="textHead">LAST NAME*</div>
                                                            <input type="text" name="text2" class="editBtn2 ms-3">
                                                        </div>
                                                    </div>
                                                    <div class="d-flex ">
                                                        <div class="d-flex-column">
                                                            <div class="textHead">GENDER*</div>
                                                            <select class="editBtn2 me-5 ms-3" name="gender">
                                                                <option>male</option>
                                                                <option>female</option>
                                                                <option>others</option>
                                                            </select>
                                                        </div>
                                                        <div class="d-flex-column">
                                                            <div class="textHead">DOB*</div>
                                                            <input type="date" name="dob" class="editBtn2 ms-3" >
                                                        </div>
                                                    </div>
                                                    <div class="d-flex ">
                                                        <div class="d-flex-column">
                                                            <div class="textHead">UPLOAD PHOTO*</div>
                                                            <input type="file" class="editBtn1 ms-3 " name="img">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="textHead1">
                                                        CONTACT DEAILS
                                                    </div>
                                                    <hr class="horizontalLine1 mt-1">
                                                    <div class="d-flex ">
                                                        <div class="d-flex-column">
                                                            <div class="textHead ">ADDRESS*</div>
                                                            <input type="textarea" name="address" class="editBtn2 ms-3 ">
                                                        </div>
                                                        <div class="d-flex-column">
                                                            <div class="textHead ms-5">STREET*</div>
                                                            <input type="text" name="street" class="editBtn2 ms-5">
                                                        </div>
                                                    </div>
                                                    <div class="d-flex ">
                                                        <div class="d-flex-column">
                                                            <div class="textHead ">PINCODE*</div>
                                                            <input type="text" name="pin" class="editBtn2 ms-3 ">
                                                        </div>
                                                        <div class="d-flex-column">
                                                            <div class="textHead ms-5">DISTRICT*</div>
                                                            <input type="text" name="district" class="editBtn2 ms-5">
                                                        </div>
                                                    </div>
                                                    <div class="d-flex ">
                                                        <div class="d-flex-column">
                                                            <div class="textHead ">STATE*</div>
                                                            <input type="text" name="state" class="editBtn2 ms-3 ">
                                                        </div>
                                                        <div class="d-flex-column">
                                                            <div class="textHead ms-5">COUNTRY*</div>
                                                            <input type="text" name="country" class="editBtn2 ms-5">
                                                        </div>
                                                    </div>
                                                    <div class="d-flex ">
                                                        <div class="d-flex-column">
                                                            <div class="textHead ">EMAIL*</div>
                                                            <input type="mail" name="mail" class="editBtn2 ms-3 ">
                                                        </div>
                                                        <div class="d-flex-column">
                                                            <div class="textHead ms-5">PHONE NUMBER*</div>
                                                            <input type="text" name="phone" class="editBtn2 ms-5">
                                                        </div>
                                                    </div>
                                                    <button type="submit" value="submit" class="btn mt-3 mb-5 ms-5" name="submit" onClick="return validation()">SUBMIT</button>
                                                </form>
                                            </div>
                                            <div class="newUser"><img src="assets/newUser.JPG" alt="img" class="newUser"></div>
                                        </div>                                        
                                    </div>
                                </div>
                            </div>
                            <cfif structKeyExists(form,"submit")>
                                <cfset local.editObj=createObject("component","components.logic")>
                                <cfset local.resultEdit=local.editObj.createContact(form.title,form.text1,form.text2,form.gender,form.dob,form.img,form.address,form.street,form.pin,form.district,form.state,form.country,form.mail,form.phone)>
                                #local.resultEdit#
                            </cfif>
                            <cfif structKeyExists(form,"submit")>
                                <cfset local.editObj=createObject("component","components.logic")>
                                <cfset local.resultEdit=local.editObj.editContact(form.title,form.text1,form.text2,form.gender,form.dob,form.img,form.address,form.street,form.pin,form.district,form.state,form.country,form.mail,form.phone,url.id)>
                                #local.resultEdit#
                            </cfif>
                            
                            <div class="modal fade" id="viewContact" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-body d-flex">
                                            <div class="mainSection ms-3">
                                                <form method="post" name="form">
                                                    <div class="headEdit mt-1 ">
                                                            <div class="headEditText">CONTACT DETAILS</div>
                                                    </div>
                                                    <div class="d-flex">
                                                        <div class="textHead">NAME*  :
                                                            document.getElementById('').textContent = ;
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="d-flex">
                                                        <div class="textHead">GENDER*</div>
                                                        
                                                    </div>
                                                    <div class="d-flex">
                                                        <div class="textHead">DOB*</div>
                                                        
                                                    </div>
                                                    <div class="d-flex">
                                                        <div class="textHead">ADDRESS*</div>
                                                        
                                                    </div>
                                                    <div class="d-flex">
                                                        <div class="textHead">PINCODE*</div>
                                                        
                                                    </div>
                                                    <div class="d-flex">
                                                        <div class="textHead">EMAIL*</div>
                                                        
                                                    </div>
                                                    <div class="d-flex">
                                                        <div class="textHead">PHONE*</div>
                                                        
                                                    </div>
                                                    <button type="submit" name="closeBtn" class="closeBtn" >CLOSE</button>
                                                </form>
                                                <cfif structKeyExists(form, "submit")>
                                                    <cfset local.viewObj = createObject("component","components.logic")>
                                                    <cfset local.result2 = local.viewObj.viewOne()>
                                                </cfif>
                                            </div>
                                            <div class="newUser"><img src="assets/newUser.JPG" alt="img" class="newUser"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                    </div>
                </div>
            </div>
        </cfoutput>
        <script>
        const download_button =
            document.getElementById('pdf');
        const content =
            document.getElementById('container');

        download_button.addEventListener
            ('click', async function () {
                const filename = 'table_data.pdf';

                try {
                    const opt = {
                        margin: 1,
                        filename: filename,
                        image: { type: 'jpeg', quality: 0.98 },
                        html2canvas: { scale: 2 },
                        jsPDF: {
                            unit: 'in', format: 'letter',
                            orientation: 'portrait'
                        }
                    };
                    await html2pdf().set(opt).
                        from(content).save();
                } catch (error) {
                    console.error('Error:', error.message);
                }
            });
    </script>
    </body>
</html>