<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<%@ include file="layout.jsp"%>
		<title>Paragon 轻松短租网--房屋信息</title>
		<script type="text/javascript">
	function init() {
		$("#index_nav").removeClass("active");
		$("#house_nav").removeClass("active");
		$("#about_nav").addClass("active");
		check_cookie();
	var search_key_c=getCookie('search_key');
	$("#search_key").val(search_key_c);
	$("#search_page").val(search_key_c);
		var search_data = $("#search_form").serializeArray();
    $.ajax({
        type: "post",
        url: "search.do",
        data: search_data,
        success: function(data) {
    data=JSON.parse(data);
           for(i=0;i<=data.houselist.length;i++)
           {  
             var house_id=data.houselist[i].houseId;
             var house_address=data.houselist[i].houseaddress;
             var house_intro=data.houselist[i].houseIntro;
             var house_price=data.houselist[i].housePrice;
             var house_area=data.houselist[i].houseArea;
             var house_check_out_time=data.houselist[i].checkOutTime;
             var house_check_in_time=data.houselist[i].checkInTime;
             var house_renttype=data.houselist[i].rentType;
             var house_type=data.houselist[i].houseType;
             var house_livenum=data.houselist[i].liveNum;
             var house_bedroomnum=data.houselist[i].bedroomNum;
             var house_picture=data.houselist[i].housePicture;
             var house_type_str="";
             if(house_type==0){
              house_type_str="旅馆";
             }else{
              if(house_type==3){
              house_type_str="别墅";}
              else{
              house_type_str="公寓";}
             }
             
             $("#search_result").append("<div class=\"panel panel-default\"><div class=\"panel-body\"><div class=\"row\"><div class=\"col-md-3\"><a href=\"house_detail.jsp\"class=\"thumbnail\"><img src=\""+house_picture+"\"></a></div><div class=\"col-md-3\"><a href=\"\"><h2>"+house_intro+"</h2></a><div class=\"form-group\"><label class=\" control-label\">详细地址:</label><div><p class=\"form-control-static\">"+house_address+"</p></div></div><div class=\"form-group\"><label class=\" control-label\">房屋类型:</label><div><p class=\"form-control-static\">"+house_type_str+"</p></div></div><div class=\"form-group\"><label class=\" control-label\">价格:</label><div><p class=\"form-control-static\">"+house_price+"</p></div></div></div><div class=\"col-md-4\"style=\"margin-top: 63px\"><div class=\"form-group\"><label class=\" control-label\">房屋面积:</label><div><p class=\"form-control-static\">"+house_area+"</p></div></div><div class=\"form-group\"><label class=\" control-label\">入住时间:</label><div><p class=\"form-control-static\">"+house_check_in_time+"</p></div></div></div><div class=\"col-md-2\"><button class=\"btn btn-lg btn-success\"style=\"margin-top: 110px\" type=\"button\" onclick=\"detail("+ house_id+")\">查看详情</button></div></div></div></div>");
                         
           }
        }
    });
	}
	function search_page(){
var key=$("#search_page").val();
	var search_data = "search_key="+key;
    $.ajax({
        type: "post",
        url: "search.do",
        data: search_data,
        success: function(data) {
    data=JSON.parse(data);
    if(data.houselist.length==0){
    $("#search_result").html("");
    alert("查询不到相应数据");
    }
    else
    {
           for(i=0;i<=data.houselist.length;i++)
           {  
             var house_id=data.houselist[i].houseId;
             var house_address=data.houselist[i].houseaddress;
             var house_intro=data.houselist[i].houseIntro;
             var house_price=data.houselist[i].housePrice;
             var house_area=data.houselist[i].houseArea;
             var house_check_out_time=data.houselist[i].checkOutTime;
             var house_check_in_time=data.houselist[i].checkInTime;
             var house_renttype=data.houselist[i].rentType;
             var house_type=data.houselist[i].houseType;
             var house_livenum=data.houselist[i].liveNum;
             var house_bedroomnum=data.houselist[i].bedroomNum;
             var house_picture=data.houselist[i].housePicture;
             var house_type_str="";
             if(house_type==0){
              house_type_str="旅馆";
             }else{
              if(house_type==3){
              house_type_str="别墅";}
              else{
              house_type_str="公寓";}
             }
             $("#search_result").append("<div class=\"panel panel-default\"><div class=\"panel-body\"><div class=\"row\"><div class=\"col-md-3\"><a href=\"house_detail.jsp\"class=\"thumbnail\"><img src=\""+house_picture+"\"></a></div><div class=\"col-md-3\"><a href=\"\"><h2>"+house_intro+"</h2></a><div class=\"form-group\"><label class=\" control-label\">详细地址:</label><div><p class=\"form-control-static\">"+house_address+"</p></div></div><div class=\"form-group\"><label class=\" control-label\">房屋类型:</label><div><p class=\"form-control-static\">"+house_type_str+"</p></div></div><div class=\"form-group\"><label class=\" control-label\">价格:</label><div><p class=\"form-control-static\">"+house_price+"</p></div></div></div><div class=\"col-md-4\"style=\"margin-top: 63px\"><div class=\"form-group\"><label class=\" control-label\">房屋面积:</label><div><p class=\"form-control-static\">"+house_area+"</p></div></div><div class=\"form-group\"><label class=\" control-label\">入住时间:</label><div><p class=\"form-control-static\">"+house_check_in_time+"</p></div></div></div><div class=\"col-md-2\"><button class=\"btn btn-lg btn-success\"style=\"margin-top: 110px\" type=\"button\" onclick=\"detail("+ house_id+")\">查看详情</button></div></div></div></div>");
                           
           }
           }
        }
    });
	}
	function detail(data_id){
	 setCookie("house_id",data_id,7);
	location.href='house_detail.jsp';
	}
</script>
	</head>
	<body onload="init()">
		<%@ include file="navbar.jsp"%>
		<div class="container">
			<div class="page-header">
				<h1>
					搜索房屋
				</h1>
			</div>
			<div class="form-group">
				<label for="search"></label>
				<form id="form_search_page">
					<input type="text" class="form-control" id="search_page"
						placeholder="请输入搜索关键词" name="search_key">
				</form>
			</div>
			<button class="btn btn-lg btn-info" type="button"
				onclick="search_page()">
				<span class="glyphicon glyphicon-search"></span> 搜索
			</button>
			<hr />
			<div id="search_result">

			</div>
		</div>
		<%@ include file="foot.jsp"%>
	</body>
</html>