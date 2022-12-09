<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp"%>
	<section id="mainSection">
		<!-- 캘린더 -->
        <div id="dateBox_psh" class="input-container input-container-md">
            <div id="dateInput_psh" class="input-group">
                <input type="text" placeholder="yyyy.mm.dd" class="input-box" id="date-rage-picker">
                <div class="input-group-tools">
                    <button class="clear on">
                        <i class="cancel-sh">취소</i>
                    </button>
                </div>
            </div>
            <p class="status-message"></p>
        </div>
        <script>
            $('#date-rage-picker').daterangepicker({
                format : 'YYYY.MM.DD hh:mm A',
                applyButtonClasses : 'btn btn-container btn-secondary btn-sm wth-80',
                cancelClass : 'btn btn-container btn-gray btn-sm wth-80',
                // locale: moment.locale('ko'),
                locale : {
                    daysOfWeek : moment.locale('ko').daysOfWeek,
                    monthNames : moment.locale('ko').monthNames,
                        'applyLabel' : '적용',
                        'cancelLabel' : '취소'
                },
                // timePicker: true
             });
             $(".input-box").change(e=>{
                const duration=$(".input-box").val().split("-")
                const durDate=duration[0].split(".");
                const durDate2=duration[1].split(".");
                
                const strDate=new Date(durDate[0], durDate[1], durDate[2]);
                const endDate=new Date(durDate2[0], durDate2[1], durDate2[2])
                
                const minous = endDate.getTime() - strDate.getTime() ;
                const total = minous / (1000*60*60*24) ;//일차
				console.log(total);
            });  
        </script>
        <!-- 캘린더 끝 -->

        <!-- 지도 -->
	</section>
<%@include file="/views/common/footer.jsp"%>