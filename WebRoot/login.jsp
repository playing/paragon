<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<%@ include file="layout.jsp"%>
		<title>Paragon 轻松短租网--登录</title>
		<script type="text/javascript">
	function init() {
    $("#error_msg").hide();
    check_cookie();
}

function login() {
if($("#username").val()=="")
{
$("#error_msg").show();
}else
{
    var ajax_data = $("#loginform").serializeArray();
    $.ajax({
        type: "post",
        url: "login.do",
        data: ajax_data,
        success: function(date) {
            if (date>=1) {
               $('#myModal').modal('toggle');
               var t = setTimeout("{location.href='index.jsp'}", 2000);
               var user_name=$("#username").val();
               setCookie("username",user_name,7);
               setCookie("user_id",date,7);
            } else {
                $("#error_msg").show();
            }
        }
    });
}
}
</script>
	</head>
	<body onload="init()">
		<%@ include file="navbar.jsp"%>
		<div class="center-block"
			style="background-color: #348fd4; background-position: center; height: 700px">

			<div class="center-block"
				style="background-color: #6db33f; background-position: center; height: 400px">

			</div>
		</div>
		<div class=" well container"
			style="margin-bottom: -50px; z-index: 0; position: absolute; left: 15%; top: 200px">
			<div class="row">
				<div class="col-md-6">
					<form id="loginform">
						<h2 class="form-signin-heading text-center"
							style="margin-top: 40px">
							输入账号密码
						</h2>
						<input type="text" class="form-control" placeholder="用户名" required
							autofocus style="margin-top: 30px" name="user_regname"
							id="username" />
						<input type="password" class="form-control" placeholder="密码"
							required style="margin-top: 30px" name="user_password" />
						<br />
						<a href="regist.jsp" class="pull-right">没有账号?点击注册</a>
						<button class="btn btn-lg btn-success center-block" type="button"
							style="margin-top: 40px" onclick="login()">
							登 录
						</button>
					</form>
					<div class="alert alert-danger alert-dismissable " id="error_msg">
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">
							&times;
						</button>
						<strong>登录失败</strong>:用户名或者密码错误,请检查你的输入,尝试再次登陆.
					</div>
				</div>
				<div class="col-md-6">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<img src="src/image/login_3.jpg" alt="">
								<div class="carousel-caption">
									<h3>
										扫一扫 添加微信 关注更多内容
									</h3>
								</div>
							</div>
							<div class="item ">
								<img src="src/image/login_1.jpg" alt="">
								<div class="carousel-caption">
									<h3>
										马上注册,寻找适合你的房间.
									</h3>
								</div>
							</div>
							<div class="item ">
								<img src="src/image/login_2.jpg" alt="">
								<div class="carousel-caption">
									<h3>
										优秀租房体验,尽在轻松短租网
									</h3>
								</div>
							</div>
						</div>

						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> </a>
						<a class="right carousel-control" href="#carousel-example-generic"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> </a>
					</div>
				</div>
			</div>

		</div>

		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title">
							登录成功!
						</h4>
					</div>
					<div class="modal-body">
						<p>
							您已经登陆成功,五秒后返回主页.
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							关闭
						</button>

					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<%@ include file="foot.jsp"%>
	</body>
</html>