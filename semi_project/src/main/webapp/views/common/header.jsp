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

    <!--캘린더_psh_css  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css_psh/subMain.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css_psh/bootstrap-datetimepicer.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css_psh/daterangepicker.css">
  
  <!-- 캘린더_psh_js -->
  <script src="<%=request.getContextPath()%>/js_psh/jquery-3.6.1.min.js"></script>
  <script src="<%=request.getContextPath()%>/js_psh/plugins/moment/moment-with-locales.js"></script>
  <script src="<%=request.getContextPath()%>/js_psh/plugins/bootstrap/transition.js"></script>
  <script src="<%=request.getContextPath()%>/js_psh/plugins/bootstrap/collapse.js"></script>
  <script src="<%=request.getContextPath()%>/js_psh/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
  <script src="<%=request.getContextPath()%>/js_psh/plugins/date-rage-picker/daterangepicker.min.js"></script>
  <script src="<%=request.getContextPath()%>/js_psh/plugins/rangeslider/rangeslider.min.js"></script>
 

<script>
	function setTheme(theme) {
		$.Lithium.setTheme(theme);
	}

	var c_type = 'date';	// 1, 2, 3
	
	function setType(type) {
		c_type = type;
		setComponent();
	}
	
	function setComponent() {
		$("[id^=c_type_]").hide();
		$('#c_type_' + c_type).show();
		
		window.parent.setCode(c_type);
	}
</script>

</head>
<body>
    <header id="mainHeader">
        <header>
            <div id="header">
                <nav>
                    <div class="sidebar">
                        <div class="logo">
                            <i class="bx bx-menu menu-icon"></i>
                            <span class="logo-name"><a href="">여행가자고</a></span>
                        </div>
                                
                        <div class="sidebar-content">
                            <ul class="lists">
                                <li class="list">
                                    <a href="#" class="nav-link">
                                        <i class="bx bx-home-alt icon"></i>
                                        <span class="link">문의사항</span>
                                        </a>
                                    </li>
                                <li class="list">
                                    <a href="#" class="nav-link">
                                        <i class="bx bx-bar-chart-alt-2 icon"></i>
                                        <span class="link">공지사항</span>
                                    </a>
                                </li>
                                <li class="list">
                                    <a href="#" class="nav-link">
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
        </header>
        
        <div id="mainHeaderDiv">
            <div class="logo">
                <!-- <i class="bx bx-menu menu-icon"></i> -->
                <i class="bx bx-menu menu-icon"></i>
                <span class="logo-name"><a href="">여행가자고</a></span>
            </div>
            <!-- <div id="blank"></div> -->
            <div id="logo"><a href=""><img src="<%=request.getContextPath()%>/images/mainlogo.gif" alt="로고" height="70px"></a></div>
            <div id="login"><a href="<%=request.getContextPath()%>/login/loginView.do"><img id="loginlogo" src="<%=request.getContextPath()%>/images/로그인.png" alt="마이페이지"></a></div>
        </div>
    </header>

    <header id="subHeader">
        <div id="subHeaderDiv">
            <div id="subHeaderFrm">
                <div id="sub_menu1"><a href="">여행지</a></div>
                <div id="sub_menu2"><a href="">내동선</a></div>
                <div id="sub_menu3"><a href="">추천동선</a></div>
                <div id="sub_menu4"><a href="">찜페이지</a></div>
            </div>
        </div>
    </header>