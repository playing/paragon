<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<%@ include file="layout.jsp"%>
		<title>Paragon 轻松短租网--新用户注册</title>
		<script type="text/javascript">
	function init() {
		$("#error_msg").hide();
check_cookie();
	}
function regist(){
	var ajax_data=$("#registerform").serializeArray();
  $.ajax({
	   type:"post",
	   url:"regist.do",
	   data:ajax_data,
	  success:function(date){
	 if(date==1)
	 {
	  $('#myModal').modal('toggle');
     var t = setTimeout("{location.href='login.jsp'}", 2000);
	 }
	 else
	 {
	  $("#error_msg").show();
	 }
	   }
	   });
  }
	function formReset() {
		document.getElementById("RegisterForm").reset();
	}
</script>
	</head>
	<body onload="init()">
		<%@ include file="navbar.jsp"%>
		<div style="background-color: #FF9933; height: 600px">
			<div class="well container">
				<h1>
					注册新账号
				</h1>
				<p>
					请按照要求填写注册所需的信息,其中带
					<span class="glyphicon glyphicon-asterisk"></span> 号为必填项
				</p>
				<div class="alert alert-danger alert-dismissable " id="error_msg">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">
						&times;
					</button>
					<strong>注册失败</strong>:您填写的部分信息有误,请检查后再提交.
				</div>
				<div class="row center-block">
					<form role="form" id="registerform">
						<div class="col-md-5">

							<div class="form-group">
								<label for="Email">
									<span class="glyphicon glyphicon-asterisk"></span> 邮箱地址:
								</label>
								<input type="email" class="form-control" id="Email"
									placeholder="请输入邮箱地址" name="email">
							</div>
							<div class="form-group">
								<label for="Username">
									<span class="glyphicon glyphicon-asterisk"></span> 用户名:
								</label>
								<input type="text" class="form-control" id="Username"
									placeholder="请输入用户名" name="user_regname">
							</div>
							<div class="form-group">
								<label for="Password1">
									<span class="glyphicon glyphicon-asterisk"></span>密码:
								</label>
								<input type="password" class="form-control" id="Password1"
									placeholder="请输入密码" name="password">
							</div>
							<div class="form-group">
								<label for="Password2">
									<span class="glyphicon glyphicon-asterisk"></span>再次输入密码:
								</label>
								<input type="password" class="form-control" id="Password2"
									placeholder="请输入密码">
							</div>


						</div>
						<div class="col-md-5 ">

							<div class="form-group">
								<label for="Name">
									姓名:
								</label>
								<input type="text" class="form-control" id="Name"
									placeholder="请输入姓名" name="user_tname">
							</div>
							<div class="form-group">
								<label for="Gender">
									性别:
								</label>
								<select class="form-control" id="Gender" name="sex">
									<option value="男">
										男
									</option>
									<option value="女">
										女
									</option>
								</select>
							</div>
							<div class="form-group">
								<label for="Phone">
									联系电话:
								</label>
								<input type="text" class="form-control" id="Phone"
									placeholder="请输入联系电话" name="user_phone">
							</div>
							<div class="form-group">
								<label for="Address">
									地址:
								</label>
								<input type="text" class="form-control" id="Address"
									placeholder="请输入地址" name="user_address">
							</div>
						</div>
					</form>


				</div>
				<div class="row center-block">
					<div class=col-md-5>
						<button type="submit" class="btn btn-lg btn-default center-block"
							onclick="regist()">
							注册
						</button>
					</div>
					<div class="col-md-5">
						<button class="btn btn-danger btn-lg center-block"
							onclick="formReset()">
							重置信息
						</button>
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
							账号注册成功!
						</h4>
					</div>
					<div class="modal-body">
						<p>
							您已经注册成功,五秒后返回登录页面.
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