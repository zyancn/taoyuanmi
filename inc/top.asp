<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%const ZHUANGHUANGGONGSI=TRUE%>
<!--#include file="ConnZH.asp" -->
<%
set rs=server.CreateObject("adodb.recordset")
sqlstr="select * from config"
rs.open sqlstr,conn,3,1
biaoti=rs("biaoti")
guanjianci=rs("guanjianci")
miaoshu=rs("miaoshu")
banquan=rs("banquan")
rs.close()
set rs=nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=biaoti%></title>
<meta name="keywords" content="<%=guanjianci%>" />
<meta name="description" content="<%=miaoshu%>" />
<link href="<%=Webmuen%>css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=Webmuen%>Scripts/jquery.min.js"></script>
<script type="text/javascript" src="<%=Webmuen%>Scripts/demomove.js"></script>
<script type="text/javascript">$(document).ready(function(){$('.marquee').kxbdMarquee({direction:'right',eventA:'mouseenter',eventB:'mouseleave'});});</script> 