/**
 * 
 */
//해결 방법 - 1: my_page.jsp 로딩시 사업자 캠핑장 데이터도 같이 model로 넘겨받아 my_page.jsp에 EL 적용 (= 동기 처리 방식)
//해결 방법 - 2: ajax 비동기 처리시 jquery 함수 재호출
//해결 방법 - 3: 모든 문제는 비동기 + jquery 를 썼기 때문에 일부 자바스크립트 동적 처리가 적용되지 않음에 있는 듯! (어쩌면 당연한 결과...ㅠㅠ)
//						그렇기 때문에 올빼미-회전목마(owl-Carousel) 기능을 쓰는 것 대신에 dom을 제어해서 바닐라 자바스크립트로 직접 정의하는 수 밖에 없음


//해결 방법 -2 사용 : 효과 => 오류 해결 / 단점 : jquery의 html 함수를 먼저 호출 후 다시 동적처리 함수를 적용 하는 것이기
//								때문에 딜레이(오류가 적용된 이미지가 자바스크립트 적용되는 작업이 육안으로 확인 가능...)가 생김.. ㅡㅡ;;
//사업자 캠핑장 데이터 ajax 비동기 통신
function test_css(){
	alert("call : test_css function - ajax");
	$.ajax({
		url: "test.json",
		method: "GET",
		data: {},
		dataType: "HTML",
		success: function(responseData){
			console.log("ajax communication - success");
			
			//응답받은 jsp(responseData)를 html형식으로 원하는 태그에 적용 
			$('#test-area').html(responseData);
			
			//ajax를 통해 생성된 태그들(class: gallery-carousel)은 자바스크립트가 적용되지 않기때문에
			//다시 jquery를 통해 원했던 동적 처리 재적용
			owlCarousel();
		}
	});
}

//올빼미 회전목마(owl-carousel) 기능 재정의 함수
function owlCarousel(){
    $('.gallery-carousel').owlCarousel({
        loop: true,
        items: 1,
        nav: true,
        dots: true,
        smartSpeed: 700,
        autoplay: false,
        dotsData: true,
        navText: ["<span class=\"la la-chevron-left\"></span>", "<span class=\"la la-chevron-right\"></span>"]
    });
}