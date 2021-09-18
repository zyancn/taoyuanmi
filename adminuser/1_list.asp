<!--#include file="inc/sys_top.asp" -->
<script language="javascript">
function Gg_TiJiao(){
if (myform.Title.value==0){
  alert("对不起，一级分类名称不能为空！")
  myform.Title.focus()
  return false;
}
return true
}
</script>

<body>
<%
if request.form("Action")="Tjyjfl" then
Title=request.form("Title")
if Title="" then
response.Write "<script language=javascript>alert('内容不能为空！');history.go(-1)</script>"
response.end
end if
    Set one_tj=server.CreateObject("adodb.recordset")
      one_tj.open "select * from list_one",conn,3,3
	    one_tj.addnew
        one_tj("one_title")=Title
		  if one_tj.bof and one_tj.eof then
		    one_tj("one_style")=0
		  else
		    one_tj("one_style")=one_tj("one_id")+1
		  end if	
        one_tj.update
		response.Write "<script language=javascript>alert('添加成功！');location.href='1_list.asp?muen=1'</script>"
		response.End()
      one_tj.close
    set one_tj=nothing
end if
'修改分类
if request.form("action")="list_xiugai" then
one_text=request.form("one_text")
if one_text="" then  
response.Write "<script language=javascript>alert('内容不能为空！');history.go(-1)</script>"
response.end
end if
LianJie=request.form("Links")
set one_xg=server.CreateObject("adodb.recordset")
sqlstr="select * from list_one where one_id="&request.Form("List_ID")
one_xg.open sqlstr,conn,3,3
one_xg("one_title")=one_text
one_xg("Links")=LianJie
one_xg.update
response.write("<script language='javascript'>location.href='1_list.asp?muen=1'</script>")
one_xg.close
set one_xg=nothing
end if
'删除分类
if request.querystring("action")="one_del" then
sql="delete from list_one where one_id="&request.querystring("ID")
conn.execute sql
response.write("<script language='javascript'>window.alert('删除成功!');location.href='1_list.asp?muen=1'</script>") 
end if
%>
<!--#include file="inc/sys_muen_top.asp" -->
<div id="admin_head">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="150" valign="top" bgcolor="#EDEDED"><!--#include file="inc/sys_muen_left.asp" --></td>
      <td width="10"></td>
      <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="43" class="admin_x_title">一级分类管理</td>
        </tr>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="admin_line">
          <tr>
            <td height="0"></td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <form id="myform" name="myform" method="post" action="">
          <tr>
            <td width="35%" height="45"><strong>添加一级分类名称:</strong><span style="color:#F00">(*)</span></td>
            <td width="65%">&nbsp;</td>
          </tr>
          <tr>
            <td height="45"><input type="text" name="Title" id="Title" class="fl_text" /></td>
            <td><input type="submit" name="button" id="button" class="input_bottom" value="确认/提交" onclick="return Gg_TiJiao();"/>
              <input name="Action" type="hidden" id="Action" value="Tjyjfl" /></td>
          </tr>
          </form>
      </table>
      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd" class="admin_table" id="tabshow">
          <tr>
            <td height="35" colspan="3" align="center"><strong>管理一级分类</strong></td>
          </tr>
          <tr>
            <td width="100" height="35" align="center"><strong>编号</strong></td>
            <td align="center">&nbsp;</td>
            <td width="150" align="center"><strong>操作</strong></td>
          </tr>
<%
set one_list=server.CreateObject("adodb.recordset")
sqlstr="select * from list_one order by one_id asc"
one_list.open sqlstr,conn,3,1
while not one_list.eof
%>  
          <tr>
            <td height="35" align="center"><%= one_list("one_id") %></td>
            <td align="left"><form id="form1" name="form1" method="post" action="">
	  &nbsp;&nbsp;&nbsp;&nbsp;<input name="one_text" type="text" id="one_text" class="fl_add" value="<%= one_list("one_title") %>" />
      <input name="Links" type="text" id="Links" class="fl_add" value="<%= one_list("Links") %>" />
	  <input type="hidden" name="action" value="list_xiugai"><input name="List_ID" type="hidden" id="List_ID" value="<%= one_list("one_id") %>">
      <input type="submit" name="button" id="button" value="修 改" class="tjbottom" />
      </form></td>
            <td align="center"><a href="?ID=<%= one_list("one_id") %>&action=one_del" onclick="return confirm('您确定要删除此分类吗？')">删除</a></td>
          </tr>
  <%
  one_list.movenext
  wend
  one_list.close
  set one_list=nothing
  %>
        </table></td>
    </tr>
  </table>
</div>
<script type="text/javascript">
//grid("名称","奇数行背景","偶数行背景","鼠标经过背景","点击后背景","点击切换为有背景后文字颜色","点击切换为没背景后文字颜色");
tabshow("tabshow","#ededed","#fff","#ffffdd");
</script>
</body>
</html>
