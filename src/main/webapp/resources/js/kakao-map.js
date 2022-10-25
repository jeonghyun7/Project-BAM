/**
 * 
 */
var address;
var campName;

function setLocation(){
	address = document.getElementById("address").value;
	campName = document.getElementById("campName").value;
}
window.onload = setLocation();

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();


var x;
var y;
// 주소로 좌표를 검색합니다
geocoder.addressSearch(address, function(result, status) {
	x = parseFloat(result[0].x);
    y = parseFloat(result[0].y);
    console.log(">>>x : "+typeof x+", y : "+typeof y);
    $("#x").val(x);
    $("#y").val(y);

    //========================openweathermap 날씨API==================================
$.getJSON('https://api.openweathermap.org/data/2.5/forecast?lat='+y+'&lon='+x+'&APPID=[날씨APPID입력]&units=metric',
	function(data){
	console.log(data);
	var date = new Array();
	var icon = new Array();
	var j=0;
	for(var i=0;i<=data.list.length;i++){
		//"2020-08-16 18:00:00"->"8/16"
		temp = data.list[i].dt_txt;
		month = temp.substring(5,7);
		day = temp.substring(8,10);
		hour = temp.substring(11,13);//"2020-08-16 18:00:00"->"18"
		dateTemp = month.concat("/", day);
		//"04n"->"04d"(밤->하루)
				
  		temp2 = data.list[i].weather[0].icon;
		tempIcon = temp2.substring(0,2);
	
		if(hour>=12){
			date[j]=dateTemp;
			$("#date"+j).append(date[j]);//날짜 
			$("#hour"+j).prepend(hour);//시간
			if(hour>=21){//오후 9시 이후일 때 night아이콘 셋팅
				icon[j] = tempIcon.concat("n");
				$("#cicon"+j).append("<img src='http://openweathermap.org/img/wn/"+icon[j]+"@2x.png'/>");//아이콘
			}
			else{//아니면 day아이콘 셋팅
				icon[j] = tempIcon.concat("d");
				$("#cicon"+j).append("<img src='http://openweathermap.org/img/wn/"+icon[j]+"@2x.png'/>");//아이콘
			}
			$("#ctemp"+j).prepend(data.list[i].main.temp);//현재온도
			$("#pop"+j).prepend(Math.round(data.list[i].pop*100));//강수확률
			j++
		}
	}
		
});
    //========================openweathermap 날씨API==================================
    
    
    //=========================위치기반 공공API=========================================
    // 주변관광지 띄우기위한 좌표 x,y값을 세팅하는 메소드 
    // 카카오 map 에서 받은 x,y좌표를 이용해 위치기반API에서 주변 축제/박람회 정보를 뽑아뽑아
    // 결론은 카카오 map 뻑나면 위치기반API도 안된다는 말씀
    getTourist();
    //=========================위치기반 공공API=========================================
    
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+campName+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    }
});    
