<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>semi</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Jua&family=Kirang+Haerang&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet">
   	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/subMain.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
	<%@ page import="com.jjh.member.model.vo.Member" %>
	<% Member loginMember=(Member)session.getAttribute("loginMember"); %>

</head>
   <body>
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
                                 <li class="list">
                                    <a href="<%=request.getContextPath()%>/travelboard/travelboardmain.do" class="nav-link">
                                        <i class="bx bx-message-rounded icon"></i>
                                        <span class="link">여행지</span>
                                    </a>
                                </li>
                                <li class="list">
                                    <a href="<%=request.getContextPath() %>/admin/memberManage.do" class="nav-link">
                                        <i class="bx bx-pie-chart-alt-2 icon"></i>
                                        <span class="link">회원관리</span>
                                    </a>
                                </li>
                                <!--<li class="list">
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
        
        <div id="mainHeaderDiv">
            <div class="logo">
                <!-- <i class="bx bx-menu menu-icon"></i> -->
                <i class="bx bx-menu menu-icon"></i>
                <span class="logo-name"><a href="<%=request.getContextPath()%>">여행가자고</a></span>
            </div>
            <!-- <div id="blank"></div> -->
            <div id="logo"><a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/images/mainlogo.gif" alt="로고" height="70px"></a></div>
            <%if(loginMember==null){ %>
            <div id="login"><a href="<%=request.getContextPath()%>/login/loginView.do"><img id="loginlogo" src="<%=request.getContextPath()%>/images/로그인.png" alt="마이페이지"></a></div>
            <%}else{ %>
            <div id="login"><a href="<%=request.getContextPath()%>/login/memberinfoview.do"><img id="loginlogo" src="<%=request.getContextPath()%>/images/로그인.png" alt="마이페이지"></a></div>
            <%} %>
        </div>

    <header id="subHeader">
        <div id="subHeaderDiv">
            <div id="subHeaderFrm">
                <div id="sub_menu1"><a href="<%=request.getContextPath()%>/travelboard/travelboardmain.do">여행지</a></div>
                <div id="sub_menu2"><a href="<%=request.getContextPath()%>/moveLine/movelineList.do">내동선</a></div>
                <div id="sub_menu3"><a href="<%=request.getContextPath()%>/moveLineBoard/boardlist.do">추천동선</a></div>
                <div id="sub_menu4"><a href="<%=request.getContextPath()%>/mypick/mypicklist.do">찜페이지</a></div>
            </div>
        </div>
    </header>