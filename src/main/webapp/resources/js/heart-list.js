function call_heart_list(){
    let load_btn_heart = document.getElementById('load-btn-heart');

    load_btn_heart.disabled = false;
    load_btn_heart.innerHTML = "<span class='la la-refresh'></span> 더보기";
	
	if($('#heart-box').prop('class') == ""){
		$('#heart-box').html('');
		$('#heart-box').addClass('row');
		$('#heart-box').removeAttr('style');
	}
    $.ajax({
        url : "/member/heart_list.json",
        type : "GET",
        data : {email : $('#member-email').val()
        },
        dataType : "HTML",
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success : function(responseData){
            document.getElementById('next-page').value = 2;
            $('#heart-box').html(responseData);
            if($('#heart_check_result').val() == "false") {
            	let msg = "<br/><br/><br/><h2>찜 내역이 없습니다.</h2><br/><br/><br/><br/><br/>";
            	$('#heart-box').html(msg);
            	$('#heart-box').removeClass('row');
            	$('#load-btn-heart').hide();
            	$('#heart-box').attr('style', 'text-align:center');
            }else{
            	$('#load-btn-heart').show();
            }
        }
    });
}

function heart_paging(){
    let page_count_heart = document.getElementById('page-count').value;
    $.ajax({
        url : "/member/heart_list.json",
        type : "GET",
        data : {email : $('#member-email').val(),
                nextPage : $('#next-page').val()
               },
               dataType : "HTML",
        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        success : function(responseData){
            $('#next-page').val(Number($('#next-page').val())+1);
            $('#heart-box').append(responseData);

            if($('#next-page').val() > page_count_heart) {
                $('#load-btn-heart').attr("disabled", "disabled");
                $('#load-btn-heart').text("END");
                return false;
            }
        }
    });

}