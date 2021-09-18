<!--#include file="inc/sys_top.asp" -->
<body>
<%
if request.Form("act")="Xgmm" then
Yx_Username=request.Form("admin")
if len(Yx_Username)=0 then
Call MessageBox("对不起，请输入您要修改的新用户名！","")
response.End()
end if
Yx_Password=request.Form("pass")
if len(Yx_Password)=0 then
Call MessageBox("对不起，请输入您要修改的新密码！","")
response.End()
end if
    Set rss=server.CreateObject("adodb.recordset")
      rss.open "select * from Admin_login",conn,3,3
        rss("Yx_Username")=Yx_Username
		rss("Yx_Password")=Yx_Password
        rss.update
		Call MessageBox("修改成功!为了系统安全，请重新登录！","login.asp")
          session("sys_name")=""
          session("sys_pass")=""
          session.Abandon()
      rss.close
    set rss=nothing
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
          <td height="43" class="admin_x_title">密码管理</td>
        </tr>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="admin_line">
          <tr>
            <td></td>
          </tr>
        </table>
        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
<form id="mypass" name="mypass" method="post" action="">
  <tr>
    <td height="30" colspan="3" align="center" bgcolor="#f2f2f2"><span style="font-size:14px">[密码修改]</span></td>
  </tr>
  <tr>
    <td width="29%" height="40" align="right" bgcolor="#FFFFFF">用户名：</td>
    <td width="71%" height="40" colspan="2" bgcolor="#FFFFFF">&nbsp;<input name="admin" type="text" class="fl_add" id="admin" value="<%=session("sys_pass")%>" /></td>
  </tr>
  <tr>
    <td height="40" align="right" bgcolor="#FFFFFF">新密码：</td>
    <td height="40" colspan="2" bgcolor="#FFFFFF">&nbsp;<input type="password" name="pass" id="pass" class="fl_add" /></td>
  </tr>
  <tr>
    <td height="40" bgcolor="#FFFFFF">&nbsp;</td>
    <td height="40" colspan="2" bgcolor="#FFFFFF">&nbsp;<input type="submit" name="button" id="button" class="input_bottom" value="确认/提交"/>
      <input type="button" name="button2" id="button2" class="input_bottom" value="取消/返回" onclick="history.go(-1)" />
      <input type="hidden" name="Act" value="Xgmm"></td>
  </tr>
 </form> 
</table></td>
    </tr>
  </table>
</div>
</body>
</html>
