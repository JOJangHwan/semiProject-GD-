<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>semi</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/subMain.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Jua&family=Kirang+Haerang&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
        
        <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Jua&family=Kirang+Haerang&display=swap" rel="stylesheet">
        <link
              href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
              rel="stylesheet">
    </head>
    <body>
        <header>
            <div id="header">
                <nav>
                    <div class="logo">
                        <i class="bx bx-menu menu-icon"></i>
                            <span class="logo-name">여행가자고</span>
                    </div>
                    
                        <div class="sidebar">
                            <div class="logo">
                                <i class="bx bx-menu menu-icon"></i>
                                <span class="logo-name">여행가자고</span>
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
                                    <li class="list">
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
                                    </li>
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
                <div>
                    <a id="login"><img src="./images/로그인.png" alt="마이페이지"></a>
                </div>
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
    
        <section id="mainSection">
            <div>
            	<form id="loginFrm" action="" method="post">
                    <table>
                        <tr>
                            <td>
                                아이디 <input type="text" name="loginId">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                비밀번호 <input type="password" name="password">
                            </td>
                            <td>
                                <input type="button" value="로그인">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox">아이디저장
                            </td>
                            
                        </tr>

                    </table>
                    <div>
                        <input type="button" value="아이디찾기">
                        <input type="button" value="비밀번호찾기">
                        <input type="button" value="회원가입" onclick="location.assign('<%=request.getContextPath()%>/member/enrollMember.do');">

                    </div>
            	
            	</form>
                
                

                


            </div>
            
        </section>
    
        <footer>
            <div  id="footer">  
                <p>JJHcompany : 010-1234-5678</p><br>
                <p>서울시 금천구 구디아카데미 / 이 페이지는....</p>
            </div>
        </footer>
    </body>
    </html>