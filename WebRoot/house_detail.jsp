<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<%@ include file="layout.jsp"%>
		<title>Paragon 轻松短租网--房屋详情</title>
		<script type="text/javascript">
	function init() {
		check_cookie();
		var house_id=getCookie('house_id');
		  $.ajax({
        type: "post",
        url: "house_exInfo.do",
        data: "house_id="+house_id,
        success: function(data) {
       data=JSON.parse(data);
        var user_tname=data.House_ExtraInfo[0].user[0].user_tname;
        var user_phone=data.House_ExtraInfo[0].user[0].user_phone;
        var user_address=data.House_ExtraInfo[0].user[0].user_address;
        var user_gender=data.House_ExtraInfo[0].user[0].user_gender;
        var room_describe=data.House_ExtraInfo[0].house[0].room_describe;
        var bed_num=data.House_ExtraInfo[0].house[0].bed_num;
        var toilet_num=data.House_ExtraInfo[0].house[0].toilet_num;
        var facilities=data.House_ExtraInfo[0].house[0].facilities;
        var house_address=data.House_ExtraInfo[0].house_info[0].address;
        var house_intro=data.House_ExtraInfo[0].house_info[0].houseaddress;
        var house_price=data.House_ExtraInfo[0].house_info[0].price;
        var house_area=data.House_ExtraInfo[0].house_info[0].houseArea;
        var house_check_out_time=data.House_ExtraInfo[0].house_info[0].checkOutTime;
        var house_check_in_time=data.House_ExtraInfo[0].house_info[0].checkInTime;
        var house_renttype=data.House_ExtraInfo[0].house_info[0].rentType;
        var house_type=data.House_ExtraInfo[0].house_info[0].houseType;
        var house_livenum=data.House_ExtraInfo[0].house_info[0].livenum;
        var house_bedroomnum=data.House_ExtraInfo[0].house_info[0].bedroomNum;
        var house_picture=data.House_ExtraInfo[0].house_info[0].picture;
        var house_type_str="";
        var rent_type_str="";
             if(house_type==0){
              house_type_str="旅馆";
             }else{
              if(house_type==3){
              house_type_str="别墅";}
              else{
              house_type_str="公寓";}
             }
        
           if(rent_type==0){
              rent_type_str="单间出租";
             }else{
              if(rent_type==3){
              rent_type_str="整套出租";}
              else{
              rent_type_str="床位出租";}
             }
             $("#house_picture").attr("src", house_picture);
             $("#house_address").text(house_address);
             $("#house_type").text(house_type_str);
             $("#rent_type").text(rent_type_str);
             $("#house_area").text(house_area);
             $("#house_price").text(house_price);
             $("#check_in_time").text(house_check_in_time);
             $("#check_out_time").text(house_check_out_time);
             $("#bedroom_num").text(house_bedroomnum);
             $("#live_num").text(house_livenum);
             $("#bed_num").text(bed_num);
             $("#toilet_num").text(toilet_num);
             $("#user_tname").text(user_tname);
             $("#user_address").text(user_address);
             $("#user_phone").text(user_phone);
             var facilitiesArray =facilities.split("#");
              for(i=0;i<=8;i++){
              if(facilitiesArray[i]!=""){
               $("#detail_table tr:odd td:eq("+i+")").html("<span class=\"glyphicon glyphicon-ok\"></span>"); 
               
              }
              else{
               $("#detail_table tr:odd td:eq("+i+")").html("<span class=\"glyphicon glyphicon-remove\"></span>"); 
              }
              }

        }
        });
	}
</script>
	</head>
	<body onload="init()">
		<%@ include file="navbar.jsp"%>
		<div class="container">
			<div class="page-header">
				<h1 id="team_introduce">
					房屋介绍
				</h1>
			</div>
			<div class="row">
				<div class="col-md-6">

					<img src="" class="img-rounded img-responsive" id="house_picture">
				</div>
				<div class="col-md-3" style="margin-top: 40px">
					<div class="form-group">
						<label class=" control-label">
							详细地址:
						</label>
						<div>
							<p class="form-control-static" id="house_address">
								
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							房屋类型:
						</label>
						<div>
							<p class="form-control-static" id="house_type">
								
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							出租类型:
						</label>
						<div>
							<p class="form-control-static" id="rent_type">
								
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							房屋面积:
						</label>
						<div>
							<p class="form-control-static" id="house_area">
								
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							房屋价格:
						</label>
						<div>
							<p class="form-control-static" id="house_price">
								
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							入住时间:
						</label>
						<div>
							<p class="form-control-static" id="check_in_time">
								
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							退房时间:
						</label>
						<div>
							<p class="form-control-static" id="check_out_time">
								
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-3" style="margin-top: 40px">
					<div class="form-group">
						<label class=" control-label">
							卧室数量:
						</label>
						<div>
							<p class="form-control-static" id="bedroom_num">
								
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label" >
							可住人数:
						</label>
						<div>
							<p class="form-control-static" id="live_num">
								
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							床铺数量:
						</label>
						<div>
							<p class="form-control-static" id="bed_num">
								
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							卫生间数量:
						</label>
						<div>
							<p class="form-control-static" id="toilet_num">
								
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table table-bordered">
					<tbody id="detail_table">
						<tr>
							<td>
								电视
							</td>
							<td>
								空调
							</td>
							<td>
								冰箱
							</td>
							<td>
								洗衣机
							</td>
						</tr>
						<tr>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
						</tr>
						<tr>
							<td>
								电脑
							</td>
							<td>
								厨房
							</td>
							<td>
								淋浴
							</td>
							<td>
								暖气
							</td>
						</tr>
						<tr>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
							<td>
								
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="page-header">
				<h1 id="team_introduce">
					联系信息
				</h1>
			</div>
			<div class="row">
			<div class="col-md-4">
					<div class="form-group">
						<label class=" control-label">
							出租人姓名:
						</label>
						<div>
							<p class="form-control-static" id="user_tname">
								
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class=" control-label">
							出租人电话:
						</label>
						<div>
							<p class="form-control-static" id="user_phone">
								
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class=" control-label">
							出租人地址:
						</label>
						<div>
							<p class="form-control-static" id="user_address">
								
							</p>
						</div>
					</div>
				</div>
				
			</div>
			<button class="btn btn-lg btn-danger center-block"
				onclick="{location.href='house_info.jsp'}">
				返回
			</button>
		</div>
		<%@ include file="foot.jsp"%>
	</body>
</html>