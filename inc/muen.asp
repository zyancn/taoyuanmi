<div id="muen">
    <div id="muen_01"><ul>
<%
set one_list=server.CreateObject("adodb.recordset")
sqlstr="select * from list_one order by one_id asc"
one_list.open sqlstr,conn,3,1
while not one_list.eof
if one_list("Links")<>"" then
dim Url,FileName
Url=split(request.servervariables("script_name"),"/")
FileName=Url(ubound(Url))
if one_list("Links")=FileName then%> 
      <li><a href="<%=Webmuen&one_list("Links")%>" style="color:#333;"><%=one_list("one_title")%></a></li>
<%else%>
      <li><a href="<%=Webmuen&one_list("Links")%>"><%=one_list("one_title")%></a></li>
<%end if
else
if one_list("one_style")=cint(request.QueryString("s")) then%>
      <li><a href="<%=Webmuen%>show.asp?d=d&s=<%=one_list("one_style")%>" style="color:#333;"><%=one_list("one_title")%></a></li>
<%else%>
      <li><a href="<%=Webmuen%>show.asp?d=d&s=<%=one_list("one_style")%>"><%=one_list("one_title")%></a></li>
<%end if
end if
one_list.movenext
wend
one_list.close
set one_list=nothing
%>
    </ul></div>
<%
if request.QueryString("d")="d" then
IF request.QueryString("s")="" or not isNumeric(request.QueryString("s")) Then '判断一级分类接受的值
response.Redirect("index.asp")
response.End()
else
'//=========================================================================
set tow_list=server.CreateObject("adodb.recordset")
sqlstr="select * from list_two where one_style="&request.QueryString("s")
tow_list.open sqlstr,conn,3,1
if not(tow_list.eof and tow_list.bof) then
%>    
    <div id="muen_02"><ul>
<%while not tow_list.eof
if tow_list("two_style")=cint(request.QueryString("m")) then%>
      <li><a href="<%=Webmuen%>list.asp?d=d&s=<%=request.QueryString("s")%>&x=x&m=<%=tow_list("two_style")%>" style="color:#333;"><%=tow_list("two_title")%></a></li>
<%else%>
      <li><a href="<%=Webmuen%>list.asp?d=d&s=<%=request.QueryString("s")%>&x=x&m=<%=tow_list("two_style")%>"><%=tow_list("two_title")%></a></li>
<%end if
tow_list.movenext
wend%>
    </ul></div>
<%
end if
tow_list.close
set tow_list=nothing
'//=========================================================================
End IF'判断一级分类接受值结束
'//=========================================================================
IF request.QueryString("x")="x" Then
IF request.QueryString("m")="" or not isNumeric(request.QueryString("m")) Then '判断二级分类接受的值
response.Redirect("index.asp")
response.End()
else%>  
    <div id="muen_03"><ul>
<%set rss=server.CreateObject("adodb.recordset")
rss.open "select top 6 * from contentlist where nr_f01="&request.QueryString("s")&" and nr_f02="&request.QueryString("m")&"",conn,3,1
if rss.eof and rss.bof then
response.Write("<li style=""color:#666"">[暂无信息]</li>")
else
i=0
while not rss.eof
i=i+1
if rss("nr_id")=cint(request.QueryString("id")) then%> 
      <li><span><%=i%>.</span><a href="<%=Webmuen%>content.asp?d=d&s=<%=request.QueryString("s")%>&x=x&m=<%=request.QueryString("m")%>&id=<%=rss("nr_id")%>" title="<%=rss("nr_title")%>" style="color:#333;"><%=left(rss("nr_title"),20)&".."%></a></li>
<%else%>
      <li><span><%=i%>.</span><a href="<%=Webmuen%>content.asp?d=d&s=<%=request.QueryString("s")%>&x=x&m=<%=request.QueryString("m")%>&id=<%=rss("nr_id")%>" title="<%=rss("nr_title")%>"><%=left(rss("nr_title"),20)&".."%></a></li>
<%end if
rss.movenext
wend
rss.close()
set rss=nothing
end if%>
    </ul></div>
    <div id="muen_04"><a href="#">More.</a></div>
<%
End IF'判断二级分类接受值结束
End IF
'//=========================================================================
end if%>    
</div>
<div id="foot"><%=banquan%></div>