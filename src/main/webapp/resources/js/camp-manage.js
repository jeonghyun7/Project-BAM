$(document).ready(function(){
    start_camp_manage(true, true, true, 1);
})

function start_camp_manage(isAsync, isMore, isSearch, currentPage){
    let sendData = {
        currentPage: currentPage,
        isMore: isMore,
        isSearch: true,
        category: document.getElementById("category").value,
        keyword: document.getElementById("keyword").value
    }
    $.ajax({
        url: "../owner/camp_manage",
        type: "POST",
        async: isAsync,
        data: sendData,
        dataType: "HTML",
        success: function(responseData){
            console.log("call - get_table : success");
            $('#camp-manage-box').html(responseData);
        }
    });
}

function change_using_state(imp_uid, action, currentPage){
	console.log("action : "+action);
	let sendData = {
		"imp_uid": imp_uid,
		"action": action
	};
    $.ajax({
        url: "../owner/change_using_state",
        type: "POST",
        data: JSON.stringify(sendData),
        contentType: "application/json",
        dataType: "JSON",
        success: function(responseData){
            console.log("success : "+responseData);
            if(responseData){
            	//alert("success");
            }else{
            	alert("fail");
            }
            start_camp_manage(true, true, true, currentPage);
        }
    });
}

