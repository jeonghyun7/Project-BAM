<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>관리자 로그인</title>

<!-- Favicon -->
<link rel="icon" href="/images/asdad.png" type="image/x-icon">

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style>
body, html { 
    margin: 0;
    padding: 0;
    height: 100%;
}
.bgimg {
    border: 0;
    padding: 0; 
    background-color: black;
    min-height: 100%;
    background-position: center;
    background-size: cover;
}
</style>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<body>
    <div class="bgimg">
    <!-- Button trigger modal -->
    <div class="invisible">
    <button id="login-form-open" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop"></button>
    </div>
    
    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <p id="staticBackdropLabel" class=“font-weight-medium” style="font-size:2em"> 
                    <a href="/" class="logo"><img src="/admin/images/asdad.png"></a>
                    &nbsp;관리자 로그인
                </p>
            <a href="/">
            <button type="button" class="close" aria-label="Close">
                <span aria-hidden="true">Home</span>
            </button>
            </a>
            </div>
            <form action="login.bam" method="post">
            <div class="modal-body" style="text-align:center">
                아이디:
                <br/><input id="admin-id" name="name" type="text" value="" placeholder="아이디"><br/>
                비밀번호:
                <br/><input id="admin-pwd" name="pwd" type="password" value="" placeholder="비밀번호"><br/>
            </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">로그인</button>
                </div>
            </form> 
        </div>
        </div>
    </div>  
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script>
        window.onload = function(){
            document.getElementById("login-form-open").click();
        }
    </script>
</body>
</html>