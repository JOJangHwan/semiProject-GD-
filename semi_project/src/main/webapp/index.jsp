<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
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
                <a id="map"><img src="<%=request.getContextPath()%>/images/여행지.png" alt=""><br>여행지</a>
                <a id="route"><img src="<%=request.getContextPath()%>/images/동선저장.png" alt=""><br>내 동선</a>
                <a id="rec"><img src="<%=request.getContextPath()%>/images/추천 동선.png" alt=""><br>추천 동선</a>
                <a id="like"><img src="<%=request.getContextPath()%>/images/찜.png" alt=""><br>찜</a>
            </div>
    </div>
</section> 
<div class="blank3"></div>
<%@ include file="/views/common/footer.jsp" %>		