/**
 * 
 */

/* $(".list-grid-container").hover(function(){
	let markerId = "mark-"+ $(this).attr("name");
	$("#"+markerId).css('background-color','black');
	$("#"+markerId).css('color','white');
	
}, function(){
	let markerId = "mark-"+ $(this).attr("name");
	$("#"+markerId).css('background-color','white');
	$("#"+markerId).css('color','black');
	
}) */

let nodeList = document.querySelectorAll('.list-grid-container');

for (let i=0;i<nodeList.length;i++){
	let node = nodeList.item(i);
	node.addEventListener('mouseover', function(){
		let markerId = 'mark-' + this.getAttribute('name');
		const mark = document.querySelector('#'+markerId);
		if(mark){
			mark.style.background = 'black';
			mark.style.color = 'white';
		}
	})
	node.addEventListener('mouseout', function(){
		let markerId = 'mark-' + this.getAttribute('name');
		const mark = document.querySelector('#'+markerId);
		if(mark){
			mark.style.background = 'white';
			mark.style.color = 'black';
		}
	})
}