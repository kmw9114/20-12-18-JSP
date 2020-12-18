<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

   <title>MuView!</title>
   
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
          <a class="dropdown-item" href="./Register/logout.mb">로그아웃</a>
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
  <header class="masthead" style="background-image: url('img/home-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h1>MuView!</h1>
            <span class="subheading">좋아하는 노래를 공유하세요!</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <div class="post-preview">
       
          
            <h2 class="post-title">
								-추천 음악-
            </h2>
            <div>
            	<iframe width="750" height="480" src="https://www.youtube.com/embed/BV2FdDmGiW0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
          
          <p class="post-meta"></p>
           
        </div>
        
        <hr>
        <div class="post-preview">
          <a href="about.jsp">
             <h2 class="post-title">
              	좋아하는 음악을 추천해 주세요!
            </h2>
         
          <h3 class="post-subtitle">
              	회원님의 최애♡ 음악을 추천하고 모두와 함께 들어요!
          </h3>
           </a>
         </div>
         
        <hr>
        
        <div class="post-preview">
          <a href="post.jsp">
            <h2 class="post-title">
              	자유롭게 대화하세요!
            </h2>
            <h3 class="post-subtitle">
              	이 게시판은 주제가 없습니다!<br>자유롭게 이용하세요!!
              	
            </h3>
          </a>
          <p class="post-meta">심한 욕설 및 음담패설은 제제의 사유가 될 수 있습니다 !</p>
        </div>
        <hr>
        <div class="post-preview">
          <a href="https://www.youtube.com/results?search_query=%EC%9D%8C%EC%95%85">
            <h2 class="post-title">
            	마음에 드는 노래가 없으신가요? 
            </h2>
            <h3 class="post-subtitle">
              	YouTube에서 찾아봅시다!
            </h3>
          </a>
          <p class="post-meta">마음에 드는 노래를 찾으신다면 포스팅 해보세요!</p>
        </div>
        <hr>
        <!-- Pager -->
        <div class="clearfix">
          <a class="btn btn-primary float-right" href="#">Older Posts &rarr;</a>
        </div>
      </div>
    </div>
  </div>

  <hr>

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
