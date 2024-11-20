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
    console.log('hi')
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
            let title = formattedResult.array[0];
            let text1 = formattedResult.array[1];
            let text2 = formattedResult.array[2];
            let gender = formattedResult.array[3];
            let dob = formattedResult.array[4];
            let img = formattedResult.array[5];
            let address = formattedResult.array[6];
            let street = formattedResult.array[7];
            let pin = formattedResult.array[8];
            let district = formattedResult.array[9];
            let state = formattedResult.array[10];
            let country = formattedResult.array[11];
            let mail = formattedResult.array[12];
            let phone = formattedResult.array[13];
            console.log(formattedResult)
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
                return true;
            }
        })
    }
    else{
        event.preventDefault()
    }
}
