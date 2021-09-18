<!--#include file="inc/top.asp" -->
<script type="text/javascript" src="<%=Webmuen%>Scripts/slide.js"></script>
</head>

<body>
<%
if request.QueryString("id")="" or not isNumeric(request.QueryString("id")) then
response.Redirect("index.asp")
response.End()
end if
'//=========================================================================
set rs=server.CreateObject("adodb.recordset")
sqlstr="select * from contentlist where nr_id="&request.QueryString("id")
rs.open sqlstr,conn,3,1
if rs.bof and rs.eof then
response.Redirect("index.asp")
response.End()
else
nr_t1=rs("nr_t1")
nr_t2=rs("nr_t2")
nr_t3=rs("nr_t3")
nr_t4=rs("nr_t4")
nr_content=rs("nr_content")
rs.close()
set rs=nothing
end if
%>
<div class="centerDiv">
  <!--#include file="inc/logo.asp" -->
  <div id="head">
<!--product_content strat-->
<div class="product_content">
	<div class="Pro_BigImage"></div><!--Pro_BigImage end-->
	<div class="Pro_Images">
		<img src="<%=nr_t1%>" name="0||<%=Mid(nr_t1, InStrRev(nr_t1, "/") + 1, Len(nr_t1) - InStrRev(nr_t1, "/") + 1)%>" alt="" />
		<img src="<%=nr_t2%>" name="1||<%=Mid(nr_t2, InStrRev(nr_t2, "/") + 1, Len(nr_t2) - InStrRev(nr_t2, "/") + 1)%>" alt="" />
		<img src="<%=nr_t3%>" name="2||<%=Mid(nr_t3, InStrRev(nr_t3, "/") + 1, Len(nr_t3) - InStrRev(nr_t3, "/") + 1)%>" alt="" />
		<img src="<%=nr_t4%>" name="3||<%=Mid(nr_t4, InStrRev(nr_t4, "/") + 1, Len(nr_t4) - InStrRev(nr_t4, "/") + 1)%>" alt="" />
	</div>
    <div id="Pro_title"><%=left(nr_content,140)&".."%></div>
    <!--Pro_Images end-->
	<div class="pro_btn">
		<a class="prev" href="javascript:getNum('prev')" title="上一张"></a><a class="next" href="javascript:getNum('next')" title="下一张"></a>
	</div><!--pro_btn end-->
</div>
<!--product_content end-->
  </div>
  <!--#include file="inc/muen.asp" -->
</div>
  <div class="hiddenDiv"></div>
</body>
</html>
