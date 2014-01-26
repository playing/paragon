<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="icon" href="src/image/favicon.png">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="src/css/doc_css.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript">
function getCookie(c_name)
{
if (document.cookie.length>0)
{ 
c_start=document.cookie.indexOf(c_name + "=")
if (c_start!=-1)
{ 
c_start=c_start + c_name.length+1 
c_end=document.cookie.indexOf(";",c_start)
if (c_end==-1) c_end=document.cookie.length
return unescape(document.cookie.substring(c_start,c_end))
} 
}
return ""
}
function check_cookie() {
    username = getCookie('username');
    if (username != null && username != "") {
        $("#cookie_button").css("display", "");
        $("#exit_button").css("display", "");
        $("#regist_button").css("display", "none");
        $("#login_button").css("display", "none");
        $("#cookie_button").text(username + " 欢迎你！");
    } else {

        $("#cookie_button").css("display", "none");
        $("#exit_button").css("display", "none");
        $("#regist_button").css("display", "");
        $("#login_button").css("display", "");
    }
}
function delCookie(name) //删除cookie
{
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
    location.href="index.jsp";
}
function setCookie(c_name,value,expiredays)
{
var exdate=new Date()
exdate.setDate(exdate.getDate()+expiredays)
document.cookie=c_name+ "=" +escape(value)+
((expiredays==null) ? "" : "; expires="+exdate.toGMTString())
}

function search() {
var search_key=$("#search_key").val();
  setCookie("search_key",search_key,7);
  location.href="house_info.jsp";
}
function exit(){
delCookie('username');
delCookie('search_key');
delCookie('user_id');
delCookie('house_id');
}
</script>