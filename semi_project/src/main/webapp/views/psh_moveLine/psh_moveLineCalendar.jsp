<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_style.css">
<%@ include file="/views/common/header.jsp" %>
<!--캘린더  -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
                <!-- 캘린더 -->
                <div id="psh_calBox">
                    <form id="psh_calForm" action="<%=request.getContextPath()%>/searchMoveLine/searchMoveLine.do" method="posst">
                        <input class="input-box" type="text" name="daterange"/>
                        <input id="mlDay" type=hidden readonly name="mlDay">
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
			                        $("#mlDay").val(total+1);
			                        console.log(total);
			                    });  
			             </script>
                        <input type="reset" value="취소">
                        <input type=submit value="저장">
                        
                    </form>
                </div>

               
                <!-- 캘린더 끝 -->

                <!-- 지도 -->
		    </div>
	    <div id="rightMarginMain"></div>
    </section>
<%@ include file="/views/common/footer.jsp" %>