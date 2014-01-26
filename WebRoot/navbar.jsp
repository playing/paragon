<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-default navbar-inverse navbar-fixed-top"
	role="navigation">

<!-- Brand and toggle get grouped for better mobile display -->
<div class="container">

	<div class="navbar-header">

		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="../paragon">Paragon</a>

	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="">
		<ul class="nav navbar-nav">
			<li class="active" id="index_nav">
				<a href="../paragon"><span class="glyphicon glyphicon-home"></span>
					主页</a>
			</li>
			<li class="" id="house_nav">
				<a href="house_release.jsp"><span
					class="glyphicon glyphicon-pencil"></span> 发布房屋</a>
			</li>
			<li class="" id="about_nav">
				<a href="about_us.jsp"><span class="glyphicon glyphicon-font"></span>
					关于我们</a>
			</li>
		</ul>
		<form class="navbar-form navbar-left" role="search" id="search_form">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="搜索房屋信息" id="search_key" name="search_key">
			</div>
			<button type="button" class="btn btn-primary" onclick="search()">
				<span class="glyphicon glyphicon-search"></span> 快速搜索
			</button>
		</form>
		<ul class="nav navbar-nav navbar-right" style="padding-right: 40px">
		<li >
				<button class="btn btn-sm btn-default" style="display:none;margin-right:40px;margin-top:10px"
					 id="cookie_button" >
					欢迎你!
				</button>
			</li>
				<li >
				<button class="btn btn-sm btn-danger" style="display:none;margin-top: 10px"
					 id="exit_button" onclick="exit();" >
					退出
				</button>
			</li>
			<li >
				<button class="btn btn-sm btn-success"
					onclick="{location.href='login.jsp'}" id="login_button" style="margin-right: 40px; margin-top: 10px">
					登录
				</button>
			</li>
			<li >
				<button class="btn btn-sm btn-primary"
					onclick="{location.href='regist.jsp'}" id="regist_button" style="margin-top: 10px">
					注册
				</button>
			</li>
		</ul>
	</div>

	<!-- /.navbar-collapse -->
</div>

</nav>