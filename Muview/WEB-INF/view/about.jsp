<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c_rt"%>
<%@ page import = "cs.board.dao.*, cs.board.dto.*, java.util.List, java.sql.Date" %>
<%
int numOfPages = 5;
int numOfRecords = 5;

BoardDTO dto = new BoardDTO();
BoardDAO dao = new BoardDAO();

String pages_ = request.getParameter("p");
int p = 1;
if(pages_ != null && !pages_.equals(""))
	p = Integer.parseInt(pages_);

ArrayList<BoardDTO> dtoss = dao.getListBoard(p, numOfRecords);
int count = dao.getCount(); 
int startNum = p-((p-1)% numOfPages);
int lastNum = (int) Math.ceil((double)count/numOfRecords);
	
session.setAttribute("lNum", lastNum);
%>
    
   
    
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Clean Blog - Start Bootstrap Theme</title>
 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <!-- Bootstrap core CSS -->
  <link href="./Resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="./Resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="./Resources/css/clean-blog.min.css" rel="stylesheet">

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
            <h1>추천 게시판</h1>
            <span class="subheading">음악이면 괜찮습니다!<br>자신이 좋아하는 음악을 포스팅 해 주세요!</span>
          </div>
        </div>
      </div>
    </div>
  </header>
		
  <!-- Main Content -->
<div class="container">
	<table class="table table-striped table-hover">
		<tr>
			<th>no</th>
			<th>writer</th>
			<th colspan='2'>title</th>
			<th></th>
			<th>regdate</th>
		</tr>
	
	<c:forEach var="dto" items="${dtos}">
	
		<tr>
			<td>${dto.no}</td>
			<td>${dto.writer}</td>
			<td colspan='2'><a href="view2.do?no=${dto.no}">${dto.title}</a></td>
			<td></td>
			
			<td><fmt:formatDate value="${dto.regdate}"/></td>
		</tr>
	
	</c:forEach>
	</table>
	
	  
	<c:set var="page" value="${(param.p == null)?1:param.p}"/>
	<c:set var ="startNum" value="${page-(page-1)%5}"/>
	
	  <div>
		<ul class="pagination justify-content-center" >
			<c:if test="${startNum>1}">
				<li class="page-item"><a class="page-link" href="?p=${startNum-1}">Prev</a></li>				
			</c:if>
			<c:if test="${startNum<=1 }">
				<li class="page-item"><a class="page-link" href="#" onclick="alert('이전페이지가 없습니다!')">Prev</a></li>
			</c:if>
			
			<c:forEach var="i" begin="0" end="4">
				<c:if test="${startNum+i <= lNum}">
				<li class="page-item"><a class="page-link" href="?p=${startNum+i}&t=&q="> ${startNum+i} </a></li>
				</c:if>
			</c:forEach>
			
			<c:if test="${startNum+5 <= lNum}">
				<li class="page-item"><a class="page-link" href="?p=${startNum+5}">Next</a></li>				
			</c:if>
			<c:if test="${startNum+5 > lNum }">
				<li class="page-item"><a class="page-link" href="#" onclick="alert('다음페이지가 없습니다!')">Next</a></li>
			</c:if>
			
		</ul>
	</div> 
	<div class="d-flex justify-content-center">
	

</div>
	<center>
  		  <a class="btn btn-primary " href="aboutSearch.jsp">검 색 </a> 
          <a class="btn btn-primary " href="aboutForm.do">글쓰기 </a>
        </div>
        
	</center>


  <!-- Footer -->
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <ul class="list-inline text-center">
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
          </ul>
          <p class="copyright text-muted">Copyright &copy; Your Website 2020</p>
        </div>
      </div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="./Resources/vendor/jquery/jquery.min.js"></script>
  <script src="./Resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="./Resources/js/clean-blog.min.js"></script>

</body>

</html>
