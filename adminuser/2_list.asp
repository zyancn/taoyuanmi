<!--#include file="inc/sys_top.asp" -->
<script language="javascript">
function Gg_TiJiao(){
if (myform.one_select.value==0){
  alert("对不起，请选择一级分类！")
  myform.one_select.focus()
  return false;
}	
if (myform.Title.value==0){
  alert("对不起，请输入需添加的内容！")
  myform.Title.focus()
  return false;
}
return true
}
</script>

<body>
<%
if request.form("Action")="Tjyjfl" then
one_select=request.Form("one_select")
if one_select=0 then
response.Write "<script language=javascript>alert('请选择一级分类！');history.go(-1)</script>"
response.end
end if
Title=request.form("Title")
if Title="" then
response.Write "<script language=javascript>alert('内容不能为空！');history.go(-1)</script>"
response.end
end if
    Set one_tj=server.CreateObject("adodb.recordset")
      one_tj.open "select * from list_two",conn,3,3
	    one_tj.addnew
        one_tj("two_title")=Title
		one_tj("one_style")=one_select
		  if one_tj.bof and one_tj.eof then
		    one_tj("two_style")=0
		  else
		    one_tj("two_style")=one_tj("two_id")+1
		  end if		
        one_tj.update
		response.Write "<script language='javascript'>alert('添加成功！');location.href='2_list.asp?muen=2'</script>"
		response.End()
      one_tj.close
    set one_tj=nothing
end if
'修改分类
if request.form("action")="list_xiugai" then
tow_text=request.form("tow_text")
if tow_text="" then  
response.Write "<script language=javascript>alert('内容不能为空！');history.go(-1)</script>"
response.end
end if
set tow_xg=server.CreateObject("adodb.recordset")
sqlstr="select * from list_two where two_id="&request.Form("List_ID")
tow_xg.open sqlstr,conn,3,3
tow_xg("two_title")=tow_text
tow_xg.update
response.write("<script language='javascript'>location.href='2_list.asp?muen=2'</script>")
tow_xg.close
set tow_xg=nothing
end if
'删除分类
if request.querystring("action")="tow_del" then
sql="delete from list_two where two_id="&request.querystring("ID")
conn.execute sql
response.write("<script language='javascript'>window.alert('删除成功!');location.href='2_list.asp?muen=2'</script>") 
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
          <td height="43" class="admin_x_title">二级分类管理</td>
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
            <td width="35%" height="45"><strong>添加二级分类名称:</strong><span style="color:#F00">(*)</span></td>
            <td width="65%">&nbsp;</td>
          </tr>
          <tr>
            <td height="35"><select name="one_select" id="one_select" class="select_xz">
        <option value=0 selected="selected">请选择大类别</option>
		<% 
		set rs_list=server.CreateObject("adodb.recordset")
	    sqlstr="select * from list_one"
	    rs_list.open sqlstr,conn,3,1
	    while not rs_list.eof
		response.write "<option value="""&rs_list("one_style")&""">"&rs_list("one_title")&"</option>"&vbcrlf
		rs_list.movenext
		wend
		rs_list.close
		set rs_list=nothing
		%>
        </select></td>
            <td height="35">&nbsp;</td>
          </tr>
          <tr>
            <td height="45"><input type="text" name="Title" id="Title" class="fl_text" /></td>
            <td><input type="submit" name="button" id="button" class="input_bottom" value="确认/提交" onclick="return Gg_TiJiao();"/>
              <input name="Action" type="hidden" id="Action" value="Tjyjfl" /></td>
          </tr>
          </form>
      </table>
<%
set one_list=server.CreateObject("adodb.recordset")
sqlstr="select * from list_one order by one_id asc"
one_list.open sqlstr,conn,3,1
while not one_list.eof
%> 
      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd" class="admin_table" id="tabshow<%=one_list("one_id")%>">
          <tr>
            <td height="35" colspan="3" align="center"><span style="font-size:16px; color:#F30">[ <%=one_list("one_title")%> ]</span></td>
          </tr>
<%
set tow_list=server.CreateObject("adodb.recordset")
sqlstr="select * from list_two where one_style="&one_list("one_style")
tow_list.open sqlstr,conn,3,1
if tow_list.eof and tow_list.bof then
response.Write("<tr><td height=""30"" colspan=""3"" align=""left"" bgcolor=""#FFFFFF"">&nbsp;<span style=""color:#F30"">暂无信息！</span></td></tr>")
else
while not tow_list.eof
%> 
          <tr>
            <td width="100" height="35" align="center"><%=tow_list("two_id")%></td>
            <td height="35" align="left"><form id="form1" name="form1" method="post" action="">
	  &nbsp;&nbsp;&nbsp;&nbsp;
	  <input name="tow_text" type="text" id="tow_text" class="fl_add" value="<%=tow_list("two_title")%>" />
<input type="hidden" name="action" value="list_xiugai"><input name="List_ID" type="hidden" id="List_ID" value="<%=tow_list("two_id")%>">
      <input type="submit" name="button" id="button" value="修 改" class="tjbottom" />
      </form></td>
            <td width="150" height="35" align="center"><a href="?ID=<%= tow_list("two_id") %>&action=tow_del" onclick="return confirm('您确定要删除此分类吗？')">删除</a></td>
          </tr>
  <%
  tow_list.movenext
  wend
  tow_list.close
  set tow_list=nothing
  end if
  %>
        </table>
<script type="text/javascript">
//grid("名称","奇数行背景","偶数行背景","鼠标经过背景","点击后背景","点击切换为有背景后文字颜色","点击切换为没背景后文字颜色");
tabshow("tabshow<%=one_list("one_id")%>","#ededed","#fff","#ffffdd");
</script>
  <%
  one_list.movenext
  wend
  one_list.close
  set one_list=nothing
  %>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
