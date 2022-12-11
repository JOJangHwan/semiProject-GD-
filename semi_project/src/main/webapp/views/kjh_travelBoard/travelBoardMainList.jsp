<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_css/kjh_style.css">
<%@ include file="/views/common/header.jsp" %>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
		    	<div id="listContainer">
		    		<div id="boardTitleArea" name="boardTitleArea">
		    			<label style="font-size:40px; font-family: 'Do Hyeon', sans-serif;">
		    				추천 여행지
		    			</label>
		    			<div class="lineGray"></div>
		    			
		    		<div id="boardTagArea">
		    			<%for(int i=0; i<10; i++){ %>
			    			<button></button>
		    			<%}%>
		    		</div>
		    		</div>
		    		<div class="slideCon">
                        <div class="contentCon pic1">
                            <div class="postTitleArea">
                                <p>서울 근교 자전거 코스 아는 사람만 아는 그곳</p>
                            </div>
                        </div>
                    </div>
		    	</div>
		    </div>
	    <div id="rightMarginMain"></div>
    </section>
<%@ include file="/views/common/footer.jsp" %>