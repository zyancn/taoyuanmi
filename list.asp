<!--#include file="inc/top.asp" -->
</head>

<body>
  <div id="head_img">
<%set Rss=server.CreateObject("adodb.recordset")
sqlstr="select top 20 * from contentlist where nr_f02="&request.QueryString("m")&" order by nr_PaiXu desc" 
Rss.open sqlstr,conn,3,1
while not Rss.eof%>
<img src="<%=Webmuen&Rss("nr_caise")%>" width="118" height="350" >
<%Rss.movenext
wend
Rss.close
set Rss=nothing%>
  </div>
<div class="centerDiv">
  <!--#include file="inc/logo.asp" -->
  <div id="head">
<!---->
<div class="marquee">
    <ul>
<%set Rss=server.CreateObject("adodb.recordset")
sqlstr="select top 20 * from contentlist where nr_f02="&request.QueryString("m")&" order by nr_PaiXu desc" 
Rss.open sqlstr,conn,3,1
while not Rss.eof%>
<li><a href="<%=Webmuen%>content.asp?d=d&s=<%=Rss("nr_f01")%>&x=x&m=<%=Rss("nr_f02")%>&id=<%=Rss("nr_id")%>"><img src="<%=Webmuen&Rss("nr_heibai")%>" width="118" height="350" onmouseover="this.src='<%=Webmuen&Rss("nr_caise")%>';" onmouseout="this.src='<%=Webmuen&Rss("nr_heibai")%>';" ></a></li>
<%Rss.movenext
wend
Rss.close
set Rss=nothing%>
	</ul>
</div>
<!---->
  </div>
  <!--#include file="inc/muen.asp" -->
</div>
  <div class="hiddenDiv"></div>
</body>
</html>
