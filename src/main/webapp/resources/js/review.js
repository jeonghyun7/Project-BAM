function submit_review(index){
    console.log("prev:" + prev);
    console.log("index: " + index);
    document.getElementById('form' + index).submit();
   
}

function submit_delete(index){
    document.getElementById('form' + index).submit();
}
