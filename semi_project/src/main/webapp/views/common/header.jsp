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
    <link
          href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
          rel="stylesheet">

    <!--캘린더  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/subMain.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>

     <!-- 에디터 -->
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- 에디터 css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <!-- 지도 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfdc04e10d578470d49a9fd29e8c0536"></script>
    <style>
        #mapwrap{position:relative;overflow:hidden;}
        .category, .category *{margin:0;padding:0;color:#000;}   
        .category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
        .category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
        .category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
        .category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;} 
        .category .ico_coffee {background-position:-10px 0;}  
        .category .ico_store {background-position:-10px -36px;}   
        .category .ico_carpark {background-position:-10px -72px;} 
	</style>

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
                                    <a href="<%=request.getContextPath() %>/matter/matterListView.do" class="nav-link">
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
                                    <a href="#" class="nav-link">
                                    <i class="bx bx-cog icon"></i>
                                    <span class="link">마이페이지</span>
                                    </a>
                                </li>
                                <li class="list">
                                    <a href="#" class="nav-link">
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
            <div id="login"><a href="<%=request.getContextPath()%>/login/loginView.do"><img id="loginlogo" src="<%=request.getContextPath()%>/images/로그인.png" alt="마이페이지"></a></div>
        </div>

    <header id="subHeader">
        <div id="subHeaderDiv">
            <div id="subHeaderFrm">
                <div id="sub_menu1"><a href="<%=request.getContextPath()%>/travelboard/travelboardmain.do">여행지</a></div>
                <div id="sub_menu2"><a href="">내동선</a></div>
                <div id="sub_menu3"><a href="">추천동선</a></div>
                <div id="sub_menu4"><a href="">찜페이지</a></div>
            </div>
        </div>
    </header>