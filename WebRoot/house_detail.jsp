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

					<img src="http://img.ea3w.com/article/1/879/licYUXlN8R8ZM.jpg" class="img-rounded">
				</div>
				<div class="col-md-3" style="margin-top: 40px">
					<div class="form-group">
						<label class=" control-label">
							详细地址:
						</label>
						<div>
							<p class="form-control-static">
								武汉市华中科技大学
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							房屋类型:
						</label>
						<div>
							<p class="form-control-static">
								公寓
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							出租类型:
						</label>
						<div>
							<p class="form-control-static">
								单间出租
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							房屋面积:
						</label>
						<div>
							<p class="form-control-static">
								85
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							房屋价格:
						</label>
						<div>
							<p class="form-control-static">
								3000
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							入住时间:
						</label>
						<div>
							<p class="form-control-static">
								2014-1-17
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							退房时间:
						</label>
						<div>
							<p class="form-control-static">
								2014-1-20
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
							<p class="form-control-static">
								2
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							可住人数:
						</label>
						<div>
							<p class="form-control-static">
								3
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							床铺数量:
						</label>
						<div>
							<p class="form-control-static">
								1
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class=" control-label">
							卫生间数量:
						</label>
						<div>
							<p class="form-control-static">
								2
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table table-bordered">
					<tbody>
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
								<span class="glyphicon glyphicon-ok"></span>
							</td>
							<td>
								<span class="glyphicon glyphicon-ok"></span>
							</td>
							<td>
								<span class="glyphicon glyphicon-remove"></span>
							</td>
							<td>
								<span class="glyphicon glyphicon-ok"></span>
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
								<span class="glyphicon glyphicon-remove"></span>
							</td>
							<td>
								<span class="glyphicon glyphicon-ok"></span>
							</td>
							<td>
								<span class="glyphicon glyphicon-ok"></span>
							</td>
							<td>
								<span class="glyphicon glyphicon-remove"></span>
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
							出租人电话:
						</label>
						<div>
							<p class="form-control-static">
								18109352189
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
							<p class="form-control-static">
								武汉市华中科技大学
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