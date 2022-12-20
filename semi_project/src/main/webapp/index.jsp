<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.jjh.member.model.vo.Member"%>
<% Member loginMember=(Member)session.getAttribute("loginMember"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>semi</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Jua&family=Kirang+Haerang&display=swap" rel="stylesheet">
    <link
          href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
          rel="stylesheet">
</head>
<body>
    <header id="mainHeader">
        <header>
            <div id="header">
                <nav>
                    <div class="sidebar">
                        <div class="logo">
                            <i class="bx bx-menu menu-icon"></i>
                            <span class="logo-name"><a href="<%=request.getContextPath()%>">여행가자고</a></span>
                        </div>
                                
                        <div class="sidebar-content">
                            <ul class="lists">
                                <li class="list">
                                    <a href="<%=request.getContextPath() %>/questions/questionsListView.do" class="nav-link">
                                        <i class="bx bx-home-alt icon"></i>
                                        <span class="link">문의사항</span>
                                        </a>
                                    </li>
                                <li class="list">
                                    <a href="<%=request.getContextPath()%>/notice/noticeListView.do" class="nav-link">
                                        <i class="bx bx-bar-chart-alt-2 icon"></i>
                                        <span class="link">공지사항</span>
                                    </a>
                                </li>
                                <li class="list">
                                    <a href="<%=request.getContextPath()%>/traffic/trafficView/do" class="nav-link">
                                        <i class="bx bx-bell icon"></i>
                                        <span class="link">교통</span>
                                    </a>
                                    </li>
                                <!-- <li class="list">
                                    <a href="#" class="nav-link">
                                        <i class="bx bx-message-rounded icon"></i>
                                        <span class="link">무언가</span>
                                    </a>
                                </li>
                                <li class="list">
                                    <a href="#" class="nav-link">
                                        <i class="bx bx-pie-chart-alt-2 icon"></i>
                                        <span class="link">무언가</span>
                                    </a>
                                </li>
                                <li class="list">
                                    <a href="#" class="nav-link">
                                        <i class="bx bx-heart icon"></i>
                                        <span class="link">무언가</span>
                                    </a>
                                </li>
                                <li class="list">
                                    <a href="#" class="nav-link">
                                        <i class="bx bx-folder-open icon"></i>
                                        <span class="link">무언가</span>
                                    </a>
                                </li> -->
                            </ul>
                            
                            <div class="bottom-cotent">
                                <li class="list">
                                    <a href="<%=request.getContextPath() %>/member/memberinfoview.do" class="nav-link">
                                    <i class="bx bx-cog icon"></i>
                                    <span class="link">마이페이지</span>
                                    </a>
                                </li>
                                <li class="list">
                                    <a href="<%=request.getContextPath()%>/logout.do" class="nav-link">
                                    <i class="bx bx-log-out icon"></i>
                                    <span class="link">로그아웃</span>
                                    </a>
                                </li>
                            </div>
                        </div>         
                    </div>
                </nav>
            <section class="overlay"></section>
            </div> 
        </header>
        <div id="mainHeaderDiv">
            <div class="logo">
                <!-- <i class="bx bx-menu menu-icon"></i> -->
                <i class="bx bx-menu menu-icon"></i>
                <span class="logo-name"><a href="">여행가자고</a></span>
            </div>
            <!-- <div id="blank"></div> -->
            <div id="logo"><a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/images/mainlogo.gif" alt="로고" height="70px"></a></div>
            <%if(loginMember==null) {%>
            <div id="login"><a href="<%=request.getContextPath()%>/login/loginView.do"><img id="loginlogo" src="<%=request.getContextPath()%>/images/로그인.png" alt="마이페이지"></a></div>
            <%}else{ %>
            <div id="login"><a href="<%=request.getContextPath()%>/login/memberinfoview.do"><img id="loginlogo" src="<%=request.getContextPath()%>/images/로그인.png" alt="마이페이지"></a></div>
            <%} %>
            
        </div>
    </header>
    <script>
          const navBar = document.querySelector("nav"),
               menuBtns = document.querySelectorAll(".menu-icon"),
                overlay = document.querySelector(".overlay");
                        
                   menuBtns.forEach((menuBtn) => {
                      menuBtn.addEventListener("click", () => {
                         navBar.classList.toggle("open");
                        });
                  });
                        
                    overlay.addEventListener("click", () => {
                       navBar.classList.remove("open");
           });
   </script>
   <div class="blank2"></div>
<section id="contentparent">
   
    <div id="content">
        <!-- 메인화면사진 -->
            <!-- https://cdn.pixabay.com/photo/2016/02/22/08/38/gyeongbok-palace-1214975_960_720.jpg -->
            <!-- https://cdn.pixabay.com/photo/2022/05/31/16/03/busan-7233823_960_720.jpg -->
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>

                <div class="carousel-inner">
                  
                    <div class="carousel-item active">
                        <img src="https://cdn.pixabay.com/photo/2016/02/22/08/38/gyeongbok-palace-1214975_960_720.jpg" class="d-block w-100" alt="...">
                    </div>
                  
                    <div class="carousel-item">
                      <img src="https://cdn.pixabay.com/photo/2018/08/21/17/26/korea-3621711_960_720.jpg" class="d-block w-100" alt="...">
                    </div>
                  
                    <div class="carousel-item">
                        <img src="https://cdn.pixabay.com/photo/2022/05/31/16/03/busan-7233823_960_720.jpg" class="d-block w-100" alt="...">
                    </div>
                
                </div>
                
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden" >Previous</span>
                </button>
                
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
            
            </div>
            <div class="blank"></div>
            <!-- 검색 -->
            <div id="search">
                    <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="Type to search...">
                        <datalist id="datalistOptions">
                            <option value="부산">
                            <option value="겨울 바다">
                            <option value="축제">
                            <option value="강릉">
                            <option value="광명동굴">
                        </datalist>
                    <button type="button" class="btn btn-outline-warning"><img src="<%=request.getContextPath()%>/images/검색.png" alt="" style="height: 25px;" style="width: 25px;"></button>
            </div>
            <div class="blank"></div>
            <!-- 메인 메뉴 -->
            <div id="snb">
                <a id="map" href="<%=request.getContextPath()%>/travelboard/travelboardmain.do"><img src="<%=request.getContextPath()%>/images/여행지.png" alt=""><br>여행지</a>
                <a id="route" href="<%=request.getContextPath()%>/moveline/checkmoveline.do"><img src="<%=request.getContextPath()%>/images/동선저장.png" alt=""><br>내 동선</a>
                <a id="rec"><img src="<%=request.getContextPath()%>/images/추천 동선.png" alt=""><br>추천 동선</a>
                <a id="like"><img src="<%=request.getContextPath()%>/images/찜.png" alt=""><br>찜</a>
            </div>
    </div>
</section> 
<div class="blank3"></div>
<%@ include file="/views/common/footer.jsp" %>      