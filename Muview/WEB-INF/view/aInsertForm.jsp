<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <title>Clean Blog - Start Bootstrap Theme</title>

  <!-- Bootstrap core CSS -->
  <link href="./Resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="./Resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="./Resources/css/clean-blog.min.css" rel="stylesheet">
  <script src="./ckeditor4/ckeditor/ckeditor.js"></script>
  
</head>

<body>

    
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="home.jsp">MuView!</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav lg-auto">
          <li class="nav-item">
             <a class="nav-link" href="home.jsp">홈</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="list2.do">추천게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">자유게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">내 정보</a>
          </li>
        </ul>
       
          <% if(session.getAttribute("id")!=null){ %>
         <ul class="navbar-nav ml-auto">
       <li class="nav-item dropdown">
       
       <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <%= session.getAttribute("id") %> 님, 반갑습니다!
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="logout.mb">로그아웃</a>
        </div>
      </li>
      </ul>
          <%}else if(session.getAttribute("id")==null) {%>
        <ul class="navbar-nav ml-auto">
  	  		<li>
        			<a class="nav-link" href="loginForm.jsp" style="color:white">로그인</a>
      		</li>
      
     			 <li>
       			 <a class="nav-link" href="RegisterForm.jsp" style="color:white">회원가입</a>
      		 </li> 
      		 </ul>
      		   <%} %> 
    		 
    		 
        
        
       
      
   
      </div>
    </div>
  </nav>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('img/about-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
           <h2 align="center">추천 게시글 작성</h2>
          </div>
        </div>
      </div>
    </div>
  </header>
		
  <!-- Main Content -->
  <div class="container">
	<form action="insert2.do" method="post" class="form-horizobtal">
			<div class="form-group" align="" >
				<div class="col-sm-4" >
        			<input type="text" name="title" placeholder="글 제목을 입력해 주세요!" onfocus="" class="form-control" style="width:800px"/>
        	 	</div>
			</div>
			
        	<br>
        	<div class="inputarea">
        	<textarea id="abouttext"  name="content"></textarea>
        		<script>
        			var ckeditor_config = {
        					
        					resize_enaleb : false,
        					enterMode : CKEDITOR.ENTER_BR,
        					shiftEnterMode : CKEDITOR.ENTER_P,
        					filebrowserUploadUrl : "/admin/goods/ckUpload"
        					
        			};
        			
        			CKEDITOR.replace("abouttext",{height : 400}, ckeditor_config);
        			
        		</script>
			</div><br>
			<div class="form-group" align="">
				<div class="col-sm-4" >
					<input type="text"  name="writer" placeholder="작성자 입력" value="<%=session.getAttribute("id") %>"class="form-control"/>
        		</div>
			</div>
			
        	<br>
        
        	
</div>
			
	
  <hr>
  <center>
  	
  	
  <div class="clearfix">
  <br>
  			   <button class="btn btn-primary " href="#" type="submit" >작성</button>   
          <button class="btn btn-primary " type="reset">다시작성 </button>
           <button class="btn btn-primary " href="about.jsp">홈으로 </button>
        </div>
        
</center>
 </form>
 

  <!-- Bootstrap core JavaScript -->
  <script src="./Resources/vendor/jquery/jquery.min.js"></script>
  <script src="./Resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="./Resources/js/clean-blog.min.js"></script>
  

</body>

</html>
