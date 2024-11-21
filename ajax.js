function logoutUser(){
    if(confirm("Confirm Logout?")){
        $.ajax({
            type:"POST",
            url:"Components/logic.cfc?method=logout",
            success:function(result){
                if(result){
                    location.reload()
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
    
    $('#editContact').modal('show')

}

function readOne(event){
    console.log(event.target.value)
    $.ajax({
        type:"POST",
        url:"Components/logic.cfc?method=viewOne",
        data:{userId:event.target.value},
        success:function(result){
            
            let formattedResult=JSON.parse(result);
            console.log(formattedResult)
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
            
            document.getElementById('name').textContent = title +text1 + " " + text2;
            console.log(gender)
            document.getElementById('gender').textContent = gender;
            document.getElementById('dob').textContent = dob;
            document.getElementById('address').textContent = address + ","+street+ "," + district +","+state+ "," +country;
            document.getElementById('pincode').textContent = pin;
            document.getElementById('email').textContent = mail;
            document.getElementById('phone').textContent = phone;
            document.getElementById('img1').src = "assets/"+img;
            console.log(img)
        }
    })
}

function editOne(event){
    $.ajax({
        type:"POST",
        url:"Components/logic.cfc?method=viewOne",
        data:{userId:event.target.value},
        success:function(result){
        
            let formattedResult=JSON.parse(result);
            console.log(formattedResult)
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

            $.ajax({
                type:"POST",
                url:"Components/logic.cfc?method=setSessionId",
                data:{userId:event.target.value}
            })
        }
    })
}

function deletePage(event){
    if(confirm("Confirm delete?")){
        $.ajax({
            type:"POST",
            url:"Components/logic.cfc?method=delContact",
            data:{userId:event.target.value},
            success:function(result){
                location.reload()
            }
        })
    }
    else{
        event.preventDefault()
    }
}

