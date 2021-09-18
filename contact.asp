<!--#include file="inc/top.asp" -->
</head>

<body>
<%
set rs=server.CreateObject("adodb.recordset")
sqlstr="select * from lianxi"
rs.open sqlstr,conn,3,1
content=rs("content")
content1=rs("content1")
rs.close()
set rs=nothing
%>
<div class="centerDiv">
  <!--#include file="inc/logo.asp" -->
  <div id="head">
    <div id="head_left"><%=content%></div>
    <div id="head_right"><%=content1%></div>
  </div>
  <!--#include file="inc/muen.asp" -->
</div>
  <div class="hiddenDiv"></div>
</body>
</html>
