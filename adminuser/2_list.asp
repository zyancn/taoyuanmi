<!--#include file="inc/sys_top.asp" -->
<script language="javascript">
function Gg_TiJiao(){
if (myform.one_select.value==0){
  alert("�Բ�����ѡ��һ�����࣡")
  myform.one_select.focus()
  return false;
}	
if (myform.Title.value==0){
  alert("�Բ�������������ӵ����ݣ�")
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
response.Write "<script language=javascript>alert('��ѡ��һ�����࣡');history.go(-1)</script>"
response.end
end if
Title=request.form("Title")
if Title="" then
response.Write "<script language=javascript>alert('���ݲ���Ϊ�գ�');history.go(-1)</script>"
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
		response.Write "<script language='javascript'>alert('��ӳɹ���');location.href='2_list.asp?muen=2'</script>"
		response.End()
      one_tj.close
    set one_tj=nothing
end if
'�޸ķ���
if request.form("action")="list_xiugai" then
tow_text=request.form("tow_text")
if tow_text="" then  
response.Write "<script language=javascript>alert('���ݲ���Ϊ�գ�');history.go(-1)</script>"
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
'ɾ������
if request.querystring("action")="tow_del" then
sql="delete from list_two where two_id="&request.querystring("ID")
conn.execute sql
response.write("<script language='javascript'>window.alert('ɾ���ɹ�!');location.href='2_list.asp?muen=2'</script>") 
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
          <td height="43" class="admin_x_title">�����������</td>
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
            <td width="35%" height="45"><strong>��Ӷ�����������:</strong><span style="color:#F00">(*)</span></td>
            <td width="65%">&nbsp;</td>
          </tr>
          <tr>
            <td height="35"><select name="one_select" id="one_select" class="select_xz">
        <option value=0 selected="selected">��ѡ������</option>
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
            <td><input type="submit" name="button" id="button" class="input_bottom" value="ȷ��/�ύ" onclick="return Gg_TiJiao();"/>
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
response.Write("<tr><td height=""30"" colspan=""3"" align=""left"" bgcolor=""#FFFFFF"">&nbsp;<span style=""color:#F30"">������Ϣ��</span></td></tr>")
else
while not tow_list.eof
%> 
          <tr>
            <td width="100" height="35" align="center"><%=tow_list("two_id")%></td>
            <td height="35" align="left"><form id="form1" name="form1" method="post" action="">
	  &nbsp;&nbsp;&nbsp;&nbsp;
	  <input name="tow_text" type="text" id="tow_text" class="fl_add" value="<%=tow_list("two_title")%>" />
<input type="hidden" name="action" value="list_xiugai"><input name="List_ID" type="hidden" id="List_ID" value="<%=tow_list("two_id")%>">
      <input type="submit" name="button" id="button" value="�� ��" class="tjbottom" />
      </form></td>
            <td width="150" height="35" align="center"><a href="?ID=<%= tow_list("two_id") %>&action=tow_del" onclick="return confirm('��ȷ��Ҫɾ���˷�����')">ɾ��</a></td>
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
//grid("����","�����б���","ż���б���","��꾭������","����󱳾�","����л�Ϊ�б�����������ɫ","����л�Ϊû������������ɫ");
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
