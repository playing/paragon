<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Paragon 轻松短租网</title>
<%@ include file="layout.jsp"%>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300'
	rel='stylesheet' type='text/css'>
	<script type="text/javascript">
	function init() {
		check_cookie();
	}
</script>
</head>

<body onload="init()">
	<%@ include file="navbar.jsp"%>
	<div class="center-block"
		style="height: 600px; background-image: url(src/image/back_index.jpg); background-repeat: no-repeat; background-size: cover">

		<div class="container">

			<div>
				<h1
					style="font-family: 'Open Sans', sans-serif; font-size: 160px; color: #FF6600">Paragon</h1>
				<br />
				<h1 style="font-size: 130px; font-family: '微软雅黑'; color: #0099CC"
					class="text-right">带来多彩生活</h1>
			</div>

		</div>
	</div>
	<div class="center-block"
		style="background-color: #6db33f; background-position: center; padding-bottom: 90px">

		<div class="container">

			<div class="row">
				<div class="col-md-4">

					<h1 class="text-center" style="margin-top: 30px">我要租房</h1>
					<p style="margin-top: 20px">

						轻松短租网提供方便快捷的租房信息和服务,一站式服务让您足不出户,就能找到自己喜欢的房子.基于地理位置的租房信息,让你的租房过程不再艰难!</p>
					<button class="btn btn-default" style="margin-top: 15px" 	onclick="{location.href='house_info.jsp'}">
						查看更多 <span class="glyphicon glyphicon-chevron-right"></span>
					</button>
				</div>


				<div class="col-md-4">

					<h1 class="text-center" style="margin-top: 25px">我要出租</h1>
					<p style="margin-top: 20px">
						在轻松短租网,你可以快速的发布自己想要出租房屋的详细信息和具体位置,人们将可以快速的检索到你的房屋信息,你只需要等候我们联系你.即可完成租房的过程.
					</p>
					<button class="btn btn-default" style="margin-top: 15px" 	onclick="{location.href='house_release.jsp'}">
						查看更多 <span class="glyphicon glyphicon-chevron-right"></span>
					</button>
				</div>


				<div class="col-md-4">

					<h1 class="text-center" style="margin-top: 25px">选择我们</h1>
					<p style="margin-top: 20px">

						Paragon团队致力于建设可靠便捷的网站,我们提供高校优质的服务,为您的生活提供保障.</p>
					<button class="btn btn-default" style="margin-top: 15px" 	onclick="{location.href='about_us.jsp'}">
						查看更多 <span class="glyphicon glyphicon-chevron-right"></span>
					</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="foot.jsp"%>
</body>
</html>

