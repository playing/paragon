<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<%@ include file="layout.jsp"%>
		<title>Paragon 轻松短租网--发布房屋</title>
		<script type="text/javascript">
                    function init1() {
                        $("#index_nav").removeClass("active");
                        $("#about_nav").removeClass("active");
                        $("#house_nav").addClass("active");
                        check_cookie();
                        $("#progress").popover("toggle");
                    }
                    function next_step(step) {
                        switch (step) {
                        case 0:
                            $("#progress").popover("toggle");
                            $("#progress").width("10%");
                            $("#tab_nav a:eq(0)").tab("show");
                            $("#progress").attr("data-original-title", "第一步");
                            $("#progress").attr("data-content", "请在地图中选择你想要出租的房间的地理位置，你可以通过滚轮和鼠标拖动地图，使用右键菜单来添加位置坐标。");
                            break;
                        case 1:
                            $("#progress").popover("toggle");
                            $("#tab_nav a:eq(1)").tab("show");
                            $("#progress").width("40%");
                            $("#progress").attr("data-original-title", "第二步");
                            $("#progress").attr("data-content", "请填写基本的房屋信息，确认之后点击下一步.");
                            break;
                        case 2:
                            $("#progress").popover("toggle");
                            $("#tab_nav a:eq(2)").tab("show");
                            $("#progress").width("75%");
                            $("#progress").attr("data-original-title", "第三步");
                            $("#progress").attr("data-content", "请填写更详细的房屋信息，确认之后点击提交.");
                            break;
                        case 3:
                            $("#progress").popover("toggle");
                            $("#tab_nav a:eq(3)").tab("show");
                            $("#progress").width("100%");
                            $("#progress").attr("data-original-title", "完成");
                            $("#progress").attr("data-content", "您的房屋信息已经成功发布");
                            break;
                        default:
                        }
                        var t = setTimeout(" $('#progress').popover('toggle');", 1000);
                    }
                    function release() {
                        $("#address").val($("#address1").text()+$("#address2").val());
                  
                        var facil = "";
                        $("[type='checkbox']").each(function() {
                            facil = facil + $(this).serialize() + "#";
                        });
                        $("#facilities").val(facil);
                        var ajax_data = $("#release_form").serializeArray();
                        $.ajax({
                            type: "post",
                            url: "publish.do",
                            data: ajax_data,
                            success: function(date) {
                                if (date == 1) {
                                    next_step(3);
                                } else {
                                    alert("发布失败");
                                }
                            }
                        });
                    }
                    function show_picture() {
                        var img_url = $("#picture").val();
                        $("#house_img").attr("src", img_url);
                    }
                </script>
		<script type="text/javascript"
			src="http://api.map.baidu.com/api?v=2.0&ak=7m1srQPybrruRzCRMghgXQjk">
                </script>
		<style type="text/css">
#allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
}
</style>
	</head>
	<body onload="init1()">
		<%@ include file="navbar.jsp"%>
		<div class="container">
			<form id="release_form">
				<div class="page-header">
					<h1>
						发布房屋
					</h1>
				</div>
				<p>
					请按照指示填写你想发布的房屋的相关信息，点击下一步来继续。
				</p>
				<div class="progress progress-striped active"
					style="margin-top: 55px; margin-bottom: 55px">
					<div id="progress" class="progress-bar" role="progressbar"
						style="width: 10%" data-toggle="popover" data-placement="right"
						title="第一步"
						data-content="请在地图中选择你想要出租的房间的地理位置，你可以通过滚轮和鼠标拖动地图，使用右键菜单来添加位置坐标。">
						<span class="sr-only"> 5% 第一步 </span>
					</div>
				</div>
				<ul class="nav nav-tabs" id="tab_nav" style="display: none">
					<li>
						<a href="#step_1" data-toggle="tab"> 1 </a>
					</li>
					<li>
						<a href="#step_2" data-toggle="tab"> 2 </a>
					</li>
					<li>
						<a href="#step_3" data-toggle="tab"> 3 </a>
					</li>
					<li>
						<a href="#step_4" data-toggle="tab"> 4 </a>
					</li>
				</ul>
				<div class="tab-content">
					<div id="step_1" class="tab-pane active">
						<div id="allmap" style="width: 600px; height: 400px">
						</div>
						<div class="form-group">
							<label class="control-label">
								房屋地址：
							</label>
							<p class="form-control" id="address1">武汉市</p>
						</div>
						<div class="form-group">
							<label for="address2">
								详细地址：
							</label>
							<input type="text" class="form-control" id="address2"
								placeholder="小区名-楼栋-房间号">
							<input type="text" class="form-control" id="user_id"
								name="user_id" value="1" style="display: none">
							<input type="text" class="form-control" id="address"
								name="house_address" style="display: none">
						</div>
						<div style="padding-left: 40%">
							<button type="button" class="btn btn-success btn-lg"
								onclick="next_step(1)">
								下一步
							</button>
						</div>
					</div>
					<div class="tab-pane" id="step_2">
						<div class="form-group">
							<label for="picture">
								房屋图片：
							</label>
							<input type="text" class="form-control" id="picture"
								placeholder="输入图片的http链接." name="house_picture">
						</div>
						<div>
							<img id="house_img" src="" class="img-rounded img-responsive">
						</div>
						<button class="btn btn-info btn-sm" onclick="show_picture()"
							style="margin-top: 20px" type="button">
							预览图片
						</button>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="houe_intro">
										房屋简介:
									</label>
									<input type="text" class="form-control" id="houe_intro"
										placeholder="请输入房屋简介" name="house_intro">
								</div>
								<div class="form-group">
									<label for="house_price">
										房间价格:
									</label>
									<input type="text" class="form-control" id="house_price"
										placeholder="请输入房间价格，单位为元/月" name="house_price">
								</div>
								<div class="form-group">
									<label for="live_num">
										可住人数:
									</label>
									<input type="text" class="form-control" id="live_num"
										placeholder="请输入可提供的居住人数" name="live_num">
								</div>
								<div class="form-group">
									<label for="house_area">
										房屋面积:
									</label>
									<input type="text" class="form-control" id="house_area"
										placeholder="请输入房屋居住面积，单位平方米" name="house_area">
								</div>
								<div class="form-group">
									<label for="bedroom_num">
										卧室数量:
									</label>
									<input type="text" class="form-control" id="bedroom_num"
										placeholder="请输入可提供的卧室数量" name="bedroom_num">
								</div>
							</div>
							<div class="col-md-6 ">
								<div class="form-group">
									<label for="house_type">
										房屋类型:
									</label>
									<select class="form-control" id="house_type" name="house_type">
										<option value="0">
											旅馆
										</option>
										<option value="1">
											公寓
										</option>
										<option value="2">
											别墅
										</option>
									</select>
								</div>
								<div class="form-group">
									<label for="rent_type">
										出租类型:
									</label>
									<select class="form-control" id="rent_type" name="rent_type">
										<option value="0">
											单间出租
										</option>
										<option value="1">
											整套出租
										</option>
										<option value="2">
											床位出租
										</option>
									</select>
								</div>
								<div class="form-group">
									<label for="check_in_time">
										入住时间:
									</label>
									<input type="text" class="form-control" id="check_in_time"
										placeholder="请输入可以提供的入住时间，格式2013-01-01" name="check_in_time">
								</div>
								<div class="form-group">
									<label for="check_out_time">
										退房时间:
									</label>
									<input type="text" class="form-control" id="check_out_time"
										placeholder="请输入允许的退房时间，格式2013-01-01" name="check_out_time">
								</div>
							</div>
						</div>
						<div style="padding-left: 40%">
							<button type="button" class="btn btn-warning btn-lg"
								onclick="next_step(0)">
								上一步
							</button>
							<button type="button" class="btn btn-success btn-lg"
								onclick="next_step(2)">
								下一步
							</button>
						</div>
					</div>
					<div class="tab-pane" id="step_3">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="room_describe">
										房间描述:
									</label>
									<textarea rows="8" class="form-control" id="room_describe"
										name="room_describe">输入房间的详细描述信息.</textarea>
								</div>
								<div class="form-group">
									<label for="bed_num">
										床位数目:
									</label>
									<input type="text" class="form-control" id="bed_num"
										placeholder="请输入提供的床位数目" name="bed_num">
								</div>
								<div class="form-group">
									<label for="toilet_num">
										卫生间数目:
									</label>
									<input type="text" class="form-control" id="toilet_num"
										name="toilet_num" placeholder="请输入房间的卫生间数目">
								</div>
							</div>
						</div>
						<input type="text" class="form-control" id="facilities"
							name="facilities" style="display: none">
						<div class="table-responsive">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td>
											<label>
												<input type="checkbox" value="1" name="tv">
												电视
											</label>
										</td>
										<td>
											<label>
												<input type="checkbox" value="1" name="air">
												空调
											</label>
										</td>
										<td>
											<label>
												<input type="checkbox" value="1" name="ice">
												冰箱
											</label>
										</td>
										<td>
											<label>
												<input type="checkbox" value="1" name="wash">
												洗衣机
											</label>
										</td>
									</tr>
									<tr>
										<td>
											<label>
												<input type="checkbox" value="1" name="computer">
												电脑
											</label>
										</td>
										<td>
											<label>
												<input type="checkbox" value="1" name="kitchen">
												厨房
											</label>
										</td>
										<td>
											<label>
												<input type="checkbox" value="1" name="bath">
												淋浴
											</label>
										</td>
										<td>
											<label>
												<input type="checkbox" value="1" name="warm">
												暖气
											</label>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div style="padding-left: 40%">
							<button type="button" class="btn btn-warning btn-lg"
								onclick="next_step(1)">
								上一步
							</button>
							<button type="button" class="btn btn-success btn-lg"
								onclick="release()">
								提交
							</button>
						</div>
					</div>
					<div class="tab-pane" id="step_4">
						<div class="jumbotron">
							<h1>
								房屋信息发布成功！
							</h1>
							<p class="lead">
								您已经成功发布了您的房屋信息。点击按钮来查看.
							</p>
							
								<button class="btn btn-lg btn-success" type="button" onclick="{location.href='house_info.jsp'}" >
									查看发布的信息 </button>
							
						</div>
					</div>
				</div>
			</form>
		</div>
		<%@ include file="foot.jsp"%>
		<script type="text/javascript">
        // 百度地图API功能
        var point = new BMap.Point(116.404, 39.915);
        navigator.geolocation.getCurrentPosition(userPosition);
        function userPosition(position) {
         var user_latitude = position.coords.latitude;
        var  user_longitude = position.coords.longitude;
            var map = new BMap.Map("allmap"); // 创建Map实例
            point = new BMap.Point(user_longitude, user_latitude); // 创建点坐标
            map.centerAndZoom(point, 13); // 初始化地图,设置中心点坐标和地图级别。
            map.enableScrollWheelZoom(); //启用滚轮放大缩小
            var gc = new BMap.Geocoder();
            var contextMenu = new BMap.ContextMenu();
            var txtMenuItem = [{
                text: '放大',
                callback: function() {
                    map.zoomIn();
                }
            },
            {
                text: '缩小',
                callback: function() {
                    map.zoomOut();
                }
            },
            {
                text: '放置到最大级',
                callback: function() {
                    map.setZoom(18);
                }
            },
            {
                text: '查看全国',
                callback: function() {
                    map.setZoom(4);
                }
            },
            {
                text: '添加您的房屋标记',
                callback: function(p) {
                    var marker = new BMap.Marker(p),
                    px = map.pointToPixel(p);
                    map.addOverlay(marker);
                    var pt = marker.getPosition();
                    gc.getLocation(pt,
                    function(rs) {
                        var add_user = rs.address;
                        $("#address1").text(add_user);
                    });
                }
            }];
            for (var i = 0; i < txtMenuItem.length; i++) {
                contextMenu.addItem(new BMap.MenuItem(txtMenuItem[i].text, txtMenuItem[i].callback, 100));
                if (i == 1 || i == 3) {
                    contextMenu.addSeparator();
                }
            }
            map.addContextMenu(contextMenu);
        }
    </script>
	</body>
	
</html>
