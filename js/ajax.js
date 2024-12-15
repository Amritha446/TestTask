function logoutUser(){
    if(confirm("Confirm Logout?")){
        $.ajax({
            type:"POST",
            url:"Components/contactDetails.cfc?method=logout",
            success:function(result){
                if(result){
                    return true;
                }
            }
        })
    }
    else{
        event.preventDefault()
    }
}

function createContact(){
    document.getElementById('heading').textContent = "CREATE CONTACT";
    document.getElementById('createData').reset();
    $('.error').text("");
    $('#editContact').modal('show')
    $.ajax({
        type:"POST",
        url:"Components/contactDetails.cfc?method=removeSessionId"
    })
}

function editOne(event){

    document.getElementById('heading').textContent = "EDIT CONTACT";
    document.getElementById('createData').reset();
    //document.getElementById('img2').value = "";
    $('.error').text("");
    $.ajax({
        
        type:"POST",
        url:"Components/contactDetails.cfc?method=getOneContactById", /* getOneContact */ 
        data:{contactId:event.target.value},
        success:function(result){
            console.log(result)
            let formattedResult=JSON.parse(result);
            let title = formattedResult.DATA[0][0];
            let text1 = formattedResult.DATA[0][1];
            let text2 = formattedResult.DATA[0][2];
            let gender = formattedResult.DATA[0][3];
            let dob = formattedResult.DATA[0][4];
            let address = formattedResult.DATA[0][5];
            let street = formattedResult.DATA[0][6];
            let pin = formattedResult.DATA[0][7];
            let district = formattedResult.DATA[0][8];
            let state = formattedResult.DATA[0][9];
            let country = formattedResult.DATA[0][10];
            let mail = formattedResult.DATA[0][11];
            let phone = formattedResult.DATA[0][12];
            let img = formattedResult.DATA[0][13];
            
            if(event.target.id == 'editb'){
            document.getElementById('title').value = title;
            document.getElementById('text1').value = text1;
            document.getElementById('text2').value = text2;
            document.getElementById('gender1').value = gender;
            document.getElementById('dob1').value = dob;
            document.getElementById('address1').value = address;
            document.getElementById('street1').value = street;
            document.getElementById('district1').value = district;
            document.getElementById('state1').value = state;
            document.getElementById('country1').value = country;
            document.getElementById('pin').value = pin;
            document.getElementById('mail').value = mail;
            document.getElementById('phone1').value = phone;
            document.getElementById('img2').src = "assets/"+img;
            document.getElementById('contactId').value = event.target.value; 
            console.log(formattedResult.DATA[0][16])
            let roleIds = formattedResult.DATA[0][16].split(",");
            $('#multiSel').val(roleIds)
            }else{
            document.getElementById('name').textContent = title +text1 + " " + text2;
            document.getElementById('gender').textContent = gender;
            document.getElementById('dob').textContent = dob;
            document.getElementById('address').textContent = address + ","+street+ "," + district + "," +state+ "," +country;
            document.getElementById('pincode').textContent = pin;
            document.getElementById('email').textContent = mail;
            document.getElementById('phone').textContent = phone;
            document.getElementById('img1').src = "assets/"+img;
            let roleNames = formattedResult.DATA[0][15];
            $('#roles').text(roleNames);
           
            }

           /*  $.ajax({
                type:"POST",
                url:"Components/contactDetails.cfc?method=setSessionId",
                data:{userId:event.target.value}
            }) 
            $.ajax({
                type:"POST",
                url:"Components/contactDetails.cfc?method=getOneContactById",/* getRolesById 
                data:{contactId:event.target.value},
                success:function(result){
                    let formattedResult=JSON.parse(result);
                    if(event.target.id == 'editb'){
                        let roleIds = [];
                        formattedResult.DATA.forEach(element => {
                            roleIds.push(element[0])
                        });
                        $('#multiSel').val(roleIds)
                    }else{
                        let roleNames = [];
                        formattedResult.DATA.forEach(element => {
                            roleNames.push(element[1])
                            console.log(roleNames)
                        });
                        $('#roles').text(roleNames)
                    }
                }
            })*/

        }
    })
}

function deletePage(event){
    if(confirm("Confirm delete?")){
        $.ajax({
            type:"POST",
            url:"Components/contactDetails.cfc?method=delContact",
            data:{contactId:event.target.value},
            success:function(result){
                event.target.parentNode.remove()
            }
        })
    }
    else{
        event.preventDefault()
    }
}

function excelCreate(){
    $.ajax({
        type:"POST",
        url:"components/contactDetails.cfc?method=createExcel",
        success:function(result){ 
            var formattedResult = JSON.parse(result);
            var filePath = "./assets/spreadsheet/" + formattedResult;
            console.log(filePath)
            fileDownload(filePath,"contactDetails.xlsx")
        }
    })
}

function fileDownload(url,file){
    var anch = document.createElement("a");
    anch.download = file;
    anch.href = url;
    anch.click();
    anch.remove();
}

function scheduler(){
    $.ajax({
        type:"POST",
        url:"components/schedule.cfc?method=scheduleDate"  
    })
}

function multiSelect(){
    $.ajax({
        type:"POST",
        url:"Components/contactDetails.cfc?method=multiSelection"
        
    })
}

