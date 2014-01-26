<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<html>
<head>
<%@ include file="layout.jsp"%>
<title>Paragon 轻松短租网--关于我们</title>
<script type="text/javascript">
	function init() {
		$("#index_nav").removeClass("active");
		$("#house_nav").removeClass("active");
		$("#about_nav").addClass("active");
		check_cookie();
	}
</script>
</head>
<body onload="init()">
	<%@ include file="navbar.jsp"%>

	<div class="bs-header" id="content">
		<div class="container">
				<div class="page-header"><h1>关于Paragon</h1></div>
			<p>介绍Paragon团队。以及轻松短租网的相关信息.</p>
		</div>
	</div>
	<div class="container ">
		<div class="row">
			<div class="col-md-3">
				<div class="bs-sidebar " data-spy="affix" data-offset-top="200"
					role="complementary">
					<ul class="nav bs-sidenav ">
						<li><a href="#team_introduce">团队介绍</a></li>
						<li><a href="#team_member">团队成员</a></li>
						<li><a href="#project">项目介绍</a></li>
						<li><a href="#contact">联系我们</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-9" role="main">		
				<div class="bs-docs-section">
					<div class="page-header">
						<h1 id="team_introduce">团队介绍</h1>
					</div>
					<p class="lead">Paragon:天选之人,这个名字来源于我们的不懈追求,为了更完美更优秀的作品.</p>
					<p>我们是来自华中科技大学软件学院的团队,很高兴能和每一位成员聚集在一起,组成这个团队,</p>
				</div>
				<div class="bs-docs-section">
					<div class="page-header">
						<h1 id="team_member">团队成员</h1>
					</div>
					<p class="lead">感谢Paragon团队的每一位成员,他们都为项目做出了巨大的贡献,提供了巨大的帮助和支持。</p>
					<ul>
						<li>队长:姜昊良</li>
						<li>黄杰</li>
						<li>黄威</li>
						<li>黄凯</li>
						<li>王一桐</li>
					</ul>
				</div>
				<div class="bs-docs-section">
					<div class="page-header">
						<h1 id="project">项目介绍</h1>
					</div>
					<p class="lead">轻松短租网,意在为用户提供方便快捷的一站式租房服务,让您高效的找到自己想找打房间.</p>
				
				</div>
				<div class="bs-docs-section">
					<div class="page-header">
						<h1 id="contact">联系我们</h1>
					</div>
					<p class="lead">如果你有任何意见或者建议,以及自己的看法,请联系我们!</p>
					<address>
						<strong>Paragon</strong><br>武汉市华中科技大学<br> 中国湖北省<br>
						<abbr title="Phone">P:</abbr> 181-0935-2189
					</address>
					<address>
						<strong>playing</strong><br> <a href="mailto:#">deadplaying@gmail.com</a>
					</address>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="foot.jsp"%>
</body>
</html>