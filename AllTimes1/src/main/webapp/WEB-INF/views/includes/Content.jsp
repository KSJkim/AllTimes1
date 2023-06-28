<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	
	
	<!-- 전체 기사중 조회수 가장 높은 기사 5개 -->
	<div class="sub-footer">
        <div class="container">
    <h3><div class="heading-large">TODAY'S HOT</div></h3>
    
    <div id="myCarousel" class="carousel slide" data-ride="carousel"> 
            
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
            <c:forEach items="${ArticleHits }" var="hits" varStatus="st">
            <c:choose>
            	<c:when test="${st.index == 0 }">
            		<div class="carousel-item active"> <a href="ArticleInfo?ar_no=${hits.ar_no }"><img class="img-fluid" src="resources/img/${hits.ar_img }" style="height:380px; width:800px;"></a>
                <div class="carousel-caption">
            <div class="news-title">
                    <h2 class=" title-large"><a href="ArticleInfo?ar_no=${hits.ar_no }">${hits.ar_title }</a></h2>
                  </div>
          </div>
              </div>
            	</c:when>
            	<c:otherwise>
            	<div class="carousel-item"> <a href="ArticleInfo?ar_no=${hits.ar_no }"><img class="img-fluid" src="resources/img/${hits.ar_img }" style="height:380px; width:800px;"></a>
                <div class="carousel-caption">
            <div class="news-title">
                    <h2 class=" title-large"><a href="ArticleInfo?ar_no=${hits.ar_no }">${hits.ar_title }</a></h2>
                  </div>
          </div>
              </div>
            	</c:otherwise>
            </c:choose>
        
        <!-- End Item -->
        
      
		</c:forEach>
      </div>
            <!-- End Carousel Inner -->
           
            <ul class="list-group col-sm-4">
		<c:forEach items="${ArticleHits }" var="hits" varStatus="st">
		<c:choose>
            	<c:when test="${st.index == 0 }">			 
        <li data-target="#myCarousel" data-slide-to="0" class="list-group-item active">
                <h4>${hits.ar_title }</h4>
              </li>
             	</c:when>
             	<c:otherwise>
             	<c:choose>
             	<c:when test="${st.index == 1 }">
        <li data-target="#myCarousel" data-slide-to="1" class="list-group-item">
                <h4>${hits.ar_title }</h4>
		</li>
				</c:when>
				<c:when test="${st.index == 2 }">
        <li data-target="#myCarousel" data-slide-to="2" class="list-group-item">
                <h4>${hits.ar_title }</h4>
		</li>
				</c:when>
				<c:when test="${st.index == 3 }">
        <li data-target="#myCarousel" data-slide-to="3" class="list-group-item">
                <h4>${hits.ar_title }</h4>
		</li>
				</c:when>
				<c:when test="${st.index == 4 }">
        <li data-target="#myCarousel" data-slide-to="4" class="list-group-item">
                <h4>${hits.ar_title }</h4>
		</li>
				</c:when>
				</c:choose>
				</c:otherwise>
				
		</c:choose>
		</c:forEach>
      </ul>
            
            <!-- Controls -->
            <div class="carousel-controls"> <a class="left carousel-control" href="#myCarousel" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> </a> <a class="right carousel-control" href="#myCarousel" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> </a> </div>
          </div>
    <!-- End Carousel --> 
  </div>
      </div>

	<!-- 기사 종류별 조회수 높은순 -->
    <section class="banner-sec">
        <div class="container">
     <h3><div class="heading-large">TODAY'S MOST VIEW</div></h3>   
    <div class="row">
            <div class="col-md-3">
            <!-- 코로나 조회수 상위 1개 기사 -->
            <c:forEach items="${ArticleCovid }" var="covid">
        <div class="card"> <a href="ArticleInfo?ar_no=${covid.ar_no }"><img class="img-fluid" src="resources/img/${covid.ar_img }" style="height:225px; width:255px;" alt=""></a>
                <div class="card-img-overlay"> <span class="tag tag-pill tag-danger">covid-19</span> </div>
                <div class="card-block">
            <div class="news-title">
                    <h2 class=" title-small"><a href="ArticleInfo?ar_no=${covid.ar_no }">${covid.ar_title }</a></h2>
                  </div>

          </div>
              </div>
              </c:forEach>
              
              <!-- 사회 조회수 상위 1개 기사 -->
              <c:forEach items="${ArticleSociety }" var="society">
        <div class="card"> <a href="ArticleInfo?ar_no=${society.ar_no }"><img class="img-fluid" src="resources/img/${society.ar_img }" style="height:225px; width:255px;" alt=""></a>
                <div class="card-img-overlay"> <span class="tag tag-pill tag-primary">사회</span> </div>
                <div class="card-block">
            <div class="news-title">
                    <h2 class=" title-small"><a href="ArticleInfo?ar_no=${society.ar_no }">${society.ar_title }</a></h2>
                  </div>

          </div>
              </div>
              </c:forEach>
      </div>
     
      		<!-- 정치 조회수 상위 1개 기사 -->
            <div class="col-md-3">
            <c:forEach items="${ArticlePolitics }" var="politics">
        <div class="card"> <a href="ArticleInfo?ar_no=${politics.ar_no }"><img class="img-fluid" src="resources/img/${politics.ar_img }" style="height:225px; width:255px;" alt=""></a>
                <div class="card-img-overlay"> <span class="tag tag-pill tag-success">정치</span> </div>
                <div class="card-block">
            <div class="news-title">
                    <h2 class=" title-small"><a href="ArticleInfo?ar_no=${politics.ar_no }">${politics.ar_title }</a></h2>
                  </div>

          </div>
              </div>
              </c:forEach>
              
             <!-- 문화 조회수 상위 1개 기사 -->
             <c:forEach items="${ArticleCulture }" var="culture">
        <div class="card"> <a href="ArticleInfo?ar_no=${culture.ar_no }"><img class="img-fluid" src="resources/img/${culture.ar_img }" style="height:225px; width:255px;" alt=""></a>
                <div class="card-img-overlay"> <span class="tag tag-pill tag-info">문화</span> </div>
                <div class="card-block">
            <div class="news-title">
                    <h2 class=" title-small"><a href="ArticleInfo?ar_no=${culture.ar_no }">${culture.ar_title }</a></h2>
                  </div>

          </div>
              </div>
              </c:forEach>
      </div>
      	<!-- 경제,스포츠,국제 조회수 1위 기사  -->
            <div class="col-md-6 top-slider">
            
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
          </ol>
                
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
                    <div class="news-block">
                    <c:forEach items="${ArticleEconomy}" var="economy">
                <div class="news-media"> <a href="ArticleInfo?ar_no=${economy.ar_no }"><img class="img-fluid" src="resources/img/${economy.ar_img }" style="height:480px; width:525px;" alt=""></a></div>
                 <div class="card-img-overlay"> <span class="tag tag-pill tag-success">경제</span> </div>
                <div class="news-title">
                        <h2 class=" title-large"><a href="ArticleInfo?ar_no=${economy.ar_no }">${economy.ar_title }</a></h2>
                      </div>
                      <c:choose>
                      <c:when test="${fn:length(economy.ar_detail) gt 150}">
                      <c:out value="${fn:substring(economy.ar_detail, 0, 149)}"></c:out>...
                	  </c:when>
                	  <c:otherwise>
       				  <c:out value="${economy.ar_detail}">
        			  </c:out></c:otherwise>
                	  </c:choose>
                </c:forEach>

 
                
              </div>
                  </div>
            <div class="carousel-item">
                    <div class="news-block">
                    <c:forEach items="${ArticleSports}" var="sports">
                <div class="news-media"><a href="ArticleInfo?ar_no=${sports.ar_no }"><img class="img-fluid" src="resources/img/${sports.ar_img }" style="height:480px; width:525px;" alt=""></a></div>
                <div class="card-img-overlay"> <span class="tag tag-pill tag-primary">스포츠</span> </div>
                <div class="news-title">
                        <h2 class=" title-large"><a href="ArticleInfo?ar_no=${sports.ar_no }">${sports.ar_title }</a></h2>
                      </div>
                	 <c:choose>
                      <c:when test="${fn:length(sports.ar_detail) gt 150}">
                      <c:out value="${fn:substring(sports.ar_detail, 0, 149)}"></c:out>...
                	  </c:when>
                	  <c:otherwise>
       				  <c:out value="${sports.ar_detail}">
        			  </c:out></c:otherwise>
                	  </c:choose>
                	</c:forEach>
              </div>
                  </div>
                  
                  
            <div class="carousel-item">
                    <div class="news-block">
                    <c:forEach items="${ArticleInternational}" var="international">
                <div class="news-media"><a href="ArticleInfo?ar_no=${international.ar_no }"><img class="img-fluid" src="resources/img/${international.ar_img }" style="height:480px; width:525px;" alt=""></a></div>
                <div class="card-img-overlay"> <span class="tag tag-pill tag-info">국제</span> </div>
                <div class="news-title">
                        <h2 class=" title-large"><a href="ArticleInfo?ar_no=${international.ar_no }">${international.ar_title }</a></h2>
                      </div>
               		 <c:choose>
                      <c:when test="${fn:length(international.ar_detail) gt 150}">
                      <c:out value="${fn:substring(international.ar_detail, 0, 149)}"></c:out>...
                	  </c:when>
                	  <c:otherwise>
       				  <c:out value="${international.ar_detail}">
        			  </c:out></c:otherwise>
                	  </c:choose>
                </c:forEach>
              </div>
                  </div>
          </div>
              </div>
      </div>
          </div>
  </div>
      </section>
      
      <!-- 연령별 추천 뉴스 -->
<section class="section-01">
        <div class="container">
    <div class="row">
            <div class="col-lg-8 col-md-12">
        <h3 class="heading-large">언론사별 HOT'S</h3>
        <div class="row">
                <div class="col-lg-6">
                <c:forEach items="${CrListJ }" var="Jarticle">
            <div class="card"> <a href="${Jarticle.cr_url }" target="_blank"><img class="img-fluid" src="${Jarticle.cr_img}" alt="" style="height:220px; width:450px;"></a>
                    <div class="card-block">
                    
                <div class="news-title">
                <a href="${Jarticle.cr_url }" target="_blank">
                  <h2 class=" title-small">
                  	<strong>
                  		(중앙일보)
                  		<c:choose>
                      		<c:when test="${fn:length(Jarticle.cr_title) gt 21}">
                      			<c:out value="${fn:substring(Jarticle.cr_title, 0, 20)}"></c:out>...
                	  		</c:when>
                	  		<c:otherwise>
                	  			<a href="${Jarticle.cr_url }" style="color:black;" target="_blank">
       				  			<c:out value="${Jarticle.cr_title}"></c:out>
        			  			</a>
        			  		</c:otherwise>
                		</c:choose>
                  	</strong>
                  </h2>
                 </a>
                </div>
                  
                   </div>
                  </div>
               </c:forEach>
          </div>

                 <div class="col-lg-6">
                <c:forEach items="${CrListD }" var="Darticle">
            <div class="card"> <a href="${Darticle.cr_url }" target="_blank"><img class="img-fluid" src="${Darticle.cr_img}" alt="" style="height:220px; width:450px;"></a>
                    <div class="card-block">
                    
                <div class="news-title">
                	<a href="${Darticle.cr_url }" target="_blank">
                  		<h2 class=" title-small">
                  			<strong>
                  			(동아일보)
                 				<c:choose>
                      		<c:when test="${fn:length(Darticle.cr_title) gt 21}">
                      			<c:out value="${fn:substring(Darticle.cr_title, 0, 20)}"></c:out>...
                	  		</c:when>
                	  		<c:otherwise>
                	  			<a href="${Darticle.cr_url }" style="color:black;" target="_blank">
       				  			<c:out value="${Darticle.cr_title}"></c:out>
        			  			</a>
        			  		</c:otherwise>
                				</c:choose>
                  			</strong>
                  		</h2>
                  </a>
                 </div>
                  

              </div>
                  </div>
               </c:forEach>
          </div> 
          
                <div class="col-lg-6">
                <c:forEach items="${CrListHankuk }" var="Hankukarticle">
            <div class="card"> <a href="${Hankukarticle.cr_url }" target="_blank"><img class="img-fluid" src="${Hankukarticle.cr_img}" alt="" style="height:220px; width:450px;"></a>
                    <div class="card-block">
                    
                <div class="news-title">
                	<a href="${Hankukarticle.cr_url }" target="_blank">
                  		<h2 class=" title-small">
                  			<strong>
                  			(한국일보)
                  		<c:choose>
                      		<c:when test="${fn:length(Hankukarticle.cr_title) gt 21}">
                      			<c:out value="${fn:substring(Hankukarticle.cr_title, 0, 20)}"></c:out>...
                	  		</c:when>
                	  		<c:otherwise>
                	  			<a href="${Hankukarticle.cr_url }" style="color:black;" target="_blank">
       				  			<c:out value="${Hankukarticle.cr_title}"></c:out>
        			  			</a>
        			  		</c:otherwise>
                		</c:choose>
                  			</strong>
                  		</h2>
                  	</a>
                  </div>
                  

              </div>
                  </div>
               </c:forEach>
          </div> 
          
          		
          
                <div class="col-lg-6">
                <c:forEach items="${CrListHan }" var="Hanarticle">
            <div class="card"> <a href="${Hanarticle.cr_url }" target="_blank"> <img class="img-fluid" src="${Hanarticle.cr_img }" alt="" style="height:220px; width:450px;"></a>
                    <div class="card-block">
                    
                <div class="news-title">
                	<a href="${Hanarticle.cr_url }" target="_blank">
                  		<h2 class=" title-small">
                  			<strong>
                  			(한겨레)
                  		<c:choose>
                      		<c:when test="${fn:length(Hanarticle.cr_title) gt 21}">
                      			<c:out value="${fn:substring(Hanarticle.cr_title, 0, 20)}"></c:out>...
                	  		</c:when>
                	  		<c:otherwise>
                	  			<a href="${Hanarticle.cr_url }" style="color:black;" target="_blank">
       				  			<c:out value="${Hanarticle.cr_title}"></c:out>
        			  			</a>
        			  		</c:otherwise>
                		</c:choose>
                  			</strong>
                  		</h2>
                  	</a>
                </div>
                  

              </div>
                  </div>
                </c:forEach>  
          </div>
              </div> 
       <h3 class="heading-large">SNACK CULTURE</h3>
        <div class="row">
        
        	<div class="col-lg-6">
                <c:forEach items="${SnackList }" var="snack">
            <div class="card"> <a href="${snack.sn_url }" target="_blank"><img class="img-fluid" src="${snack.sn_img}" alt="" style="height:150px; width:450px;"></a>
                    <div class="card-block">
                <div class="news-title"><a href="${snack.sn_url }" target="_blank">
                  <h2 class=" title-small"><strong>${snack.sn_title}</strong></h2>
                  </a></div>
                   </div>
                  </div>
               </c:forEach>
          </div>

                 <div class="col-lg-6">
                <c:forEach items="${SnackList2 }" var="snack">
            <div class="card"> <a href="${snack.sn_url }" target="_blank"><img class="img-fluid" src="${snack.sn_img}" alt="" style="height:150px; width:450px;"></a>
                    <div class="card-block">
                <div class="news-title"><a href="${snack.sn_url }" target="_blank">
                  <h2 class=" title-small"><strong>${snack.sn_title}</strong></h2>
                  </a></div>
                   </div>
                  </div>
               </c:forEach>
          </div>
        
        </div>     
              
      </div>
      	  
      
            <aside class="col-lg-4 side-bar col-md-12">
        <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home" role="tab">최신순</a> </li>
                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile" role="tab">조회순</a> </li>
                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages" role="tab">추천순</a> </li>
              </ul>
        
        <!-- Tab panes -->
        <div class="tab-content sidebar-tabing">

                <div class="tab-pane active" id="home" role="tabpanel">
                <c:forEach items="${ArticleLatest }" var="latest">
            <div class="media"> <a class="media-left" href="ArticleInfo?ar_no=${latest.ar_no }"> <img class="media-object" src="resources/img/${latest.ar_img }" alt=""> </a>
                    <div class="media-body">
                <div class="news-title">
                        <h2 class="title-small"><a href="ArticleInfo?ar_no=${latest.ar_no }">${latest.ar_title }</a></h2>
                      </div>
              </div>
                  </div>
                  </c:forEach>
                  
          </div>
          
          
                <div class="tab-pane" id="profile" role="tabpanel">
                <c:forEach items="${ArticleLatestHits }" var="latesthits">
            <div class="media"> <a class="media-left" href="ArticleInfo?ar_no=${latesthits.ar_no }"> <img class="media-object" src="resources/img/${latesthits.ar_img }" alt=""> </a>
                    <div class="media-body">
                <div class="news-title">
                        <h2 class="title-small"><a href="ArticleInfo?ar_no=${latesthits.ar_no }">${latesthits.ar_title }</a></h2>
                      </div>
              </div>
                  </div>
            	</c:forEach>
          </div>
          
          
                <div class="tab-pane" id="messages" role="tabpanel">
                <c:forEach items="${ArticleLatestThumbsup }" var="latestThumbsup">
            <div class="media"> <a class="media-left" href="ArticleInfo?ar_no=${latestThumbsup.ar_no }"> <img class="media-object" src="resources/img/${latestThumbsup.ar_img }" alt=""> </a>
                    <div class="media-body">
                <div class="news-title">
                        <h2 class="title-small"><a href="ArticleInfo?ar_no=${latestThumbsup.ar_no }">${latestThumbsup.ar_title }</a></h2>
                      </div>
              </div>
                  </div>
				</c:forEach>
          </div>
              </div>
              
         <!-- 날씨 api div -->     
        <div class="video-sec">
                <h4 class="heading-small"><strong>오늘의 날씨</strong></h4>
                <div class="video-block" id="weather">
                <a href="home_WeatherPage">
                    <div class="CurrIcon" style="color:black;"></div>
					<div class="CurrTemp"></div>
					<div class="City"></div></a>
				
              </div>
        </div> 
        
        <!-- 주식 크롤링 -->
        <!-- 코스피 -->
        <div class="video-sec">
                <h4 class="heading-small"><strong>오늘의 증시</strong></h4>
                <div class="video-block">
				<c:forEach items="${Kospi }" var="kospi">
					<div>
							<strong>
								<a href="${kospi.st_url }" style="color:black;" target="_blank">
									${kospi.st_name } (${kospi.st_index })
								</a>
							</strong>

					</div>
					
					<div style="height:20px;">
						<a href="${kospi.st_url }" style="color:black;" target="_blank">
							 ${kospi.st_updown } ${kospi.st_percent }
						</a>
					</div>
					
					<div>
						<a href="${kospi.st_url }"  target="_blank">
							<img src="${kospi.st_img } ">
						</a>
					</div>
				</c:forEach>
				<div></div>
				<div></div>
				
								
				<!-- 코스닥 -->
				<c:forEach items="${Kosdaq }" var="kosdaq">
					<div>
						<strong>
							<a href="${kosdaq.st_url }" style="color:black;" target="_blank">
								${kosdaq.st_name } (${kosdaq.st_index })
							</a>
						</strong>
					</div>
					
					<div>
						<a href="${kosdaq.st_url }" style="color:black;" target="_blank">
							 ${kosdaq.st_updown } ${kosdaq.st_percent }
						</a>
					</div>
					
					<div>
						<a href="${kosdaq.st_url }"  target="_blank">
							<img src="${kosdaq.st_img } ">
						</a>
					</div>
				</c:forEach>
				</div>
              </div>
        </div>             
      </aside> 
  </div>
      </section>
      
 
      <!-- openweather이용하여 jquery와 json으로 날씨 api사용 -->
 <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script type="text/javascript">
 
	$(document).ready(function() {
		let weatherIcon = {
			'01' : 'fas fa-sun',
			'02' : 'fas fa-cloud-sun',
			'03' : 'fas fa-cloud',
			'04' : 'fas fa-cloud-meatball',
			'09' : 'fas fa-cloud-sun-rain',
			'10' : 'fas fa-cloud-showers-heavy',
			'11' : 'fas fa-poo-storm',
			'13' : 'far fa-snowflake',
			'50' : 'fas fa-smog'
			};
		
	$.ajax({
		url:'http://api.openweathermap.org/data/2.5/weather?q=incheon&APPID=efba65a4d8d8c06fd2d7fd8183c40f27&units=metric',

				dataType:'json',
				type:'GET',
				success:function(data){
					var $Icon = (data.weather[0].icon).substr(0,2);
					var $Temp = Math.floor(data.main.temp) + 'º';
					var $city = data.name;
					
					$('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
					$('.CurrTemp').prepend($Temp);
					$('.City').append($city);
					}
					})
					});
	
</script>
	<style>
		#weather a:hover{text-decoration: none;}
	</style>



