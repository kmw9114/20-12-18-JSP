<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page import = "cs.board.dao.*, cs.board.dto.*, java.util.List, java.sql.Date" %>

<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <title>Clean Blog - Start Bootstrap Theme</title>
	<style type="text/css">
		textarea{ resize:none;'}
	</style>
	
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
           <h2 align="center"></h2>
          </div>
        </div>
      </div>
    </div>
  </header>
		
  <!-- Main Content -->
  <div class="container">
	   <form  method="post" class="form-horizobtal"> 
			<div class="form-group" align="" >
				<div class="col-sm-4" >
				
				<input type="hidden" name="no" value="${dto.no}">
				<input type="hidden" name="regdate" value="${dto.regdate}">
				
				글 번호 : ${dto.no}<br>
				작성날짜 : ${dto.regdate}<br><br>
				
        		<input type="hidden" name="title" value="${dto.title}"/>
        		${dto.title}
        	 	</div>
			</div>
			<hr>
        	<br>
        	<div class="inputarea">
        	
        	${dto.content}
        	
			</div><br>
			<div class="form-group" align="">
				<div class="col-sm-4" >
					<input type="hidden"  name="writer" value="${dto.writer}" onfocus=""   class="form-control"/>
					<hr>
					${dto.writer}
					<hr>
					
					<table>
					<td rowspan="2">
						<textarea name="comment" cols="70" rows="3" onclick="if(this.value=='댓글을 남겨주세요!'){this.value=''}">댓글을 남겨주세요!</textarea>
						
					</td>
					<td >
						<input class="btn btn-primary" type="submit" value="댓글작성" formaction="comment.cmt" onClick="window.location.reload()">
					</td>
					
					</table>
					<table class="table table-striped table-hover">

		
		<table class="table table-striped table-hover" style="width:250%">
	<c:forEach var="dtoss" items="${dtoss}">
		<tr>
			<td style="width:20%">${dtoss.no}</td>
			<td style="width:50%">${dtoss.comment}</td>
			<td style="width:30%"><fmt:formatDate value="${dtoss.cmtDate}"/></td>
			
			
		</tr>
	</c:forEach>
	</table>
					
					
        		</div>
			</div>
			
        	<br>
        
       </div>			
	
  <hr>
  <center>
  	
  	<br>
  		<div class="clearfix">
  			<input class="btn btn-primary" type="submit" value ="글수정" formaction="useUpdate.do" >
			<input class="btn btn-primary" type="button" value ="글삭제" onclick ="location.href='delete2.do?no=${dto.no}'">
			<input class="btn btn-primary" type="button" value ="글목록" onclick ="location.href='list2.do'">
			<input class="btn btn-primary" type="button" value ="글쓰기" onclick ="location.href='aboutForm.do'">
				
  	 	  
        </div>
        
</center>
   </form> 

 <br><br><br><br><br><br>

  <!-- Bootstrap core JavaScript -->
  <script src="./Resources/vendor/jquery/jquery.min.js"></script>
  <script src="./Resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="./Resources/js/clean-blog.min.js"></script>
  

</body>

</html>
