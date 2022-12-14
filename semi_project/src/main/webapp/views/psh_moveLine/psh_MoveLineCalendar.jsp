<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_style.css">
<%@ include file="/views/common/header.jsp" %>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
                <!-- 캘린더 -->
                <div id="psh_calBox">
                    <form id="psh_calForm">
                        <input class="input-box" type="text" name="daterange"/>
                        <input type="reset" value="취소">
                    </form>
                </div>

                <script>
                    $(function() {
                        $('input[name="daterange"]').daterangepicker({
                            opens: 'left'
                            }, function(start, end, label) {
                                //console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                            });
                    });
                    $(".input-box").change(e=>{
                        const duration=$(".input-box").val().split("-");
                    
                        const durDate=duration[0].trim().split("/");
                        const durDate2=duration[1].trim().split("/");
                        
                        const strDate=new Date(durDate[2], durDate[0], durDate[1]);
                        const endDate=new Date(durDate2[2], durDate2[0], durDate2[1])

                        const minous = endDate.getTime() - strDate.getTime();
                        const total = minous / (1000*60*60*24) ;//일차
                        console.log(total);
                    });  
                </script>
                <!-- 캘린더 끝 -->

                <!-- 지도 -->
		    </div>
	    <div id="rightMarginMain"></div>
    </section>
<%@ include file="/views/common/footer.jsp" %>