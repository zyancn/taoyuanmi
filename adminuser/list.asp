<!--#include file="inc/sys_top.asp" -->
<script language="javascript"> 
function checkOthers(form) {
 for ( var i = 0; i < form.elements.length; i++) {
  if (form.elements[i].checked == false) {
   form.elements[i].checked = true;
  } else {
   form.elements[i].checked = false;
  }
 }
}
function checkAll(form) {
 for ( var i = 0; i < form.elements.length; i++) {
  form.elements[i].checked = true;
 }
}
</script>
<body>
<%
if request("Action")="Del" then
Call DelNum("selectdel","contentlist","nr_id","list.asp?muen=4&page="&request.Form("page"))
End IF
%>
<!--#include file="inc/sys_muen_top.asp" -->
<div id="admin_head">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="150" valign="top" bgcolor="#EDEDED"><!--#include file="inc/sys_muen_left.asp" --></td>
      <td width="10"></td>
      <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="43" class="admin_x_title">分类管理</td>
        </tr>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="admin_line">
          <tr>
            <td></td>
          </tr>
        </table>
        <form id="form1" name="form1" method="post" action="">
        <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#dddddd" id="tabshow" class="admin_l_href">
          <tr>
            <td width="40" height="32" align="center" class="admin_title_13blod">批量</td>
            <td width="40" align="center" class="admin_title_13blod">ID</td>
            <td align="center" class="admin_title_13blod">名称</td>
            <td width="100" align="center" class="admin_title_13blod">一级分类</td>
            <td width="100" align="center" class="admin_title_13blod">二级分类</td>
            <td width="80" align="center" class="admin_title_13blod">排序</td>
            <td width="100" align="center" class="admin_title_13blod">首页</td>
            <td width="200" align="center" class="admin_title_13blod">编辑</td>
          </tr>
<%
if request.QueryString("act")="s" then
    Set Srss=server.CreateObject("adodb.recordset")
      Srss.open "select * from contentlist where nr_id="&request.QueryString("id"),conn,3,3
          Srss("nr_PaiXu")=request.QueryString("z")
          Srss.update
        response.Redirect("list.asp?muen=4&page="&request.QueryString("Page")&"")
      Srss.close
    set Srss=nothing	
end if
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
if request.QueryString("act")="hy" then
    Set Hrss=server.CreateObject("adodb.recordset")
      Hrss.open "select * from contentlist where nr_id="&request.QueryString("id"),conn,3,3
	  if request.QueryString("q")="x" then
        Hrss("nr_shouye")="False"
	  else    
	    Hrss("nr_shouye")="True"
	  end if	  
          Hrss.update
        response.Redirect("list.asp?muen=4&page="&request.QueryString("Page")&"")
      Hrss.close
    set Hrss=nothing	
end if
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
set rs=server.CreateObject("adodb.recordset")
sql="select * from contentlist order by nr_PaiXu,nr_f01 desc" 
rs.open sql,conn,3,1 
if rs.eof and rs.bof then 
response.write "<tr><td style=""color:#f00;"" colspan=""8"" height=""35"">&nbsp;没有找到相关记录!</td></tr>" 
else
dim currentpage,page_count,Pcount 
dim totalrec,endpage 
if request("page")="" or not isnumeric(request("page")) then 
currentPage=1 
else 
currentPage=cint(request("page")) 
end if 
perpage=HouTaism
rs.PageSize=perpage 
rs.AbsolutePage=currentpage 
page_count=0 
totalrec=rs.recordcount 
while (not rs.eof) and (not page_count=rs.PageSize)%>
          <tr>
            <td height="32" align="center"><input name="selectdel" type="checkbox" id="selectdel" value="<%=rs("nr_id")%>"></td>
            <td align="center"><%=rs("nr_id")%></td>
            <td>&nbsp;&nbsp;<a href="<%=Webmuen%>content.asp?id=<%=rs("nr_id")%>" target="_blank"><%=rs("nr_title")%></a></td>
            <td width="100" align="center"><%set Rslist_one=server.CreateObject("adodb.recordset")
Rslist_one.open "select * from list_one where one_style="&rs("nr_f01")&"",conn,3,1
if Rslist_one.eof and Rslist_one.bof then
response.Write("暂无一级分类！")
else
response.Write(""&Rslist_one("one_title")&"")
one=Rslist_one("one_style")
end if
Rslist_one.close
set Rslist_one=nothing%></td>
            <td width="100" align="center"><%set Rslist_two=server.CreateObject("adodb.recordset")
Rslist_two.open "select * from list_two where two_style="&rs("nr_f02")&"",conn,3,1
if Rslist_two.eof and Rslist_two.bof then
response.Write("暂无一级分类！")
else
response.Write(""&Rslist_two("two_title")&"")
end if
Rslist_two.close
set Rslist_two=nothing%></td>
            <td width="80" align="center">
              <script>function PaiXu<%=rs("nr_id")%>(){var Zhi<%=rs("nr_id")%>=document.getElementById('Sum<%=rs("nr_id")%>');if(Zhi<%=rs("nr_id")%>.value==""){alert("序列号不能为空");Zhi<%=rs("nr_id")%>.focus();return false;} else {location.href='list.asp?muen=4&act=s&id=<%=rs("nr_id")%>&Page=<%=currentPage%>&z='+Zhi<%=rs("nr_id")%>.value}}</script>
  <input name="Sum<%=rs("nr_id")%>" type="text" class="Fl_Paixu" id="Sum<%=rs("nr_id")%>" onblur="return PaiXu<%=rs("nr_id")%>();" size="5" value="<%=rs("nr_PaiXu")%>"/>
            </td>
            <td align="center">
              
              <%if rs("nr_shouye")="False" then%>
              <a href="?act=hy&id=<%=rs("nr_id")%>&Page=<%=currentPage%>"><img src="images/s01.gif" width="40" height="15" /></a>
              <%else%>
              <a href="?act=hy&q=x&id=<%=rs("nr_id")%>&Page=<%=currentPage%>"><img src="images/s02.gif" width="40" height="15" /></a>
              <%end if%>
              
            </td>
            <td align="center"><a href="add_xg.asp?muen=4&one=<%= rs("nr_f01") %>&tow=<%=rs("nr_f02")%>&id=<%=rs("nr_id")%>&page=<%=currentPage%>&url=list.asp" onClick="return confirm('您确定要修改【<%=rs("nr_title")%>】吗？')">[可视编辑]</a></td>
          </tr>
<%page_count=page_count+1 
rs.movenext 
wend%>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="50%" height="38">
        <input type="hidden" name="Action" value="Del">
        <input type="hidden" name="page" value="<%=currentPage%>">
        <input class="qx" type="button" value="全选" onClick="checkAll(this.form);">
        <input class="qx" type="button" value="反选" onClick="checkOthers(this.form);">
        <input class="sc" type="submit" name="Submit" value="彻底所选内容" onClick="return confirm('此操作将永久删除内容，且不可恢复！')">
        &nbsp;<span style="color:#F00">[注：NO：在首页显示/OFF：取消首页显示]</span></td>
            <td width="50%" height="38" align="right"><%Call SoYePage("class=""disabled""","class=""current""","True","muen=4")%></td>
          </tr>
          <tr>
            <td height="50" colspan="2" align="center" class="my_r_p_line">
              <div id="page" class="manu">
<%Call SoYePage("class=""disabled""","class=""current""","False","muen=4")
end if
rs.close 
set rs=nothing%>
  </div>
            </td>
          </tr>
        </table></form>
      </td>
    </tr>
  </table>
</div>
<script type="text/javascript">
//grid("名称","奇数行背景","偶数行背景","鼠标经过背景","点击后背景","点击切换为有背景后文字颜色","点击切换为没背景后文字颜色");
tabshow("tabshow","#ededed","#fff","#ffffdd");
</script>
</body>
</html>
