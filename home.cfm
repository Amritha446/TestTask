<html>
    <head>
        <title>home page</title>
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
                    <button type="button" class="btn1"><img src="assets/logout.JPG" class="signUp" alt="img"></button>
                </div>
                <div class="topSection mt-4 d-flex mb-4">
                    <button type="button" class="btn2 mb-1"><img src="assets/pdf.JPG" class="hImg" alt="img"></button>
                    <button type="button" class="btn3"><img src="assets/xml.JPG" class="hImg" alt="img"></button>
                    <button type="button" class="btn3"><img src="assets/draft.JPG" class="hImg" alt="img"></button>
                </div>
                <div class="d-flex secondSection">
                    <div class="leftSide mb-2 d-flex-column">
                        <img src="assets/userImg.JPG" class="userImg mt-3 ">
                        <div class="userText ms-5 mt-2">Name</div>
                        <input type="submit" value="Create Contact" class="btn4 ms-3 mt-2">
                    </div>
                    <div class="rightSide ms-5 mb-1 d-flex-column">
                        <div class="headCreate d-flex mt-3">
                            <p class="textCreate">Name</p>
                            <p class="textCreate1">Email Id</p>
                            <p class="textCreate1">Phone Number</p>
                        </div>
                        <hr class="horizontalLine">

                        <div class="dataCreate d-flex">
                            <img src="assets/userImg.JPG" class="dataImg mt-1 mb-1">
                            <div class="dataText">Name</div>
                            <div class="dataText">Email Id</div>
                            <div class="dataText">Phone Number</div>
                            <button type="submit" class="btn5 ms-5 mt-2" data-bs-toggle="modal" data-bs-target="##createContact" id="editb">Edit</button>
                                <div class="modal fade" id="createContact" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-body d-flex">
                                                <div class="mainSection ms-3">
                                                    <form method="post" name="form">
                                                        .
                                                        <div class="headEdit mt-1 ">
                                                             <div class="headEditText">EDIT CONTACT</div>
                                                        </div>
                                                        <div class="textHead1">
                                                            PERSONAL CONTACT
                                                        </div><hr class="horizontalLine1 mt-1">                                                
                                                        <div class="d-flex ">
                                                            <div class="d-flex-column">
                                                                <div class="textHead">Title*</div>
                                                                <select name="select" name="title" class="editBtn ms-3 mt-1">
                                                                    <option></option>
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
                                                                <select name="select" class="editBtn2 me-5 ms-3" name="gender">
                                                                    <option></option>
                                                                </select>
                                                            </div>
                                                            <div class="d-flex-column">
                                                                <div class="textHead">DOB*</div>
                                                                <input type="date" name="text" class="editBtn2 ms-3" name="dob">
                                                            </div>
                                                        </div>
                                                        <div class="d-flex ">
                                                            <div class="d-flex-column">
                                                                <div class="textHead">Choose file*</div>
                                                                <input type="file" name="text" class="editBtn1 ms-3 " nmae="file">
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
                                                                <input type="text" name="text" class="editBtn2 ms-3 ">
                                                            </div>
                                                            <div class="d-flex-column">
                                                                <div class="textHead ms-5">DISTRICT*</div>
                                                                <input type="text" name="district" class="editBtn2 ms-5">
                                                            </div>
                                                        </div>
                                                        <div class="d-flex ">
                                                            <div class="d-flex-column">
                                                                <div class="textHead ">STATE*</div>
                                                                <input type="text" name="text" class="editBtn2 ms-3 ">
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
                                                        <button type="submit" value="submit" class="btn mt-3 mb-5 ms-5" name="submit">SUBMIT</button>
                                                    </form>
                                                </div>
                                                <div class="newUser"><img src="assets/newUser.JPG" alt="img" class="newUser"></div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            
                            <button type="submit" class="btn5 ms-5 mt-2" ID="deleteb">DELETE</button>

                            <button type="submit" class="btn5 ms-5 mt-2" data-bs-toggle="modal" data-bs-target="##viewContact" id="viewb">VIEW</button>
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
                                                            <div class="textHead">NAME*</div>
                                                            
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
                                                        <button type="submit" name="closeBtn" class="closeBtn">CLOSE</button>
                                                    </form>
                                                </div>
                                                <div class="newUser"><img src="assets/newUser.JPG" alt="img" class="newUser"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        <hr class="horizontalLine">

                    </div>
                </div>
                
            </div>
        </cfoutput>
    </body>
</html>