<!--#include file="inc/sys_top.asp" -->

<body>
<script language="javascript">
function DLHT(){
if (myform.admin.value==0){
  alert("对不起，请输入您的账户信息！")
  myform.admin.focus()
  return false;
}
if (myform.pass.value==0){
  alert("对不起，请输入您的密码信息！")
  myform.pass.focus()
  return false;
}
return true
}
</script>
<%
'系统退出状态
if request.QueryString("Action")="Exit" then
session("sys_name")=""
session("sys_pass")=""
session.Abandon()
Call MessageBox("退出系统成功!","login.asp")
response.End()
end if
'登陆验证部分
IF request.Form("Accepted")="Judge" and IsSelfRefer()=True Then
	 If request.Form("admin")="" Then
	     Call MessageBox("用户名不能为空，请正确输入用户名！","")
		 Response.End
	 End If
	 If request.Form("pass")="" Then
	     Call MessageBox("密码不能为空，请正确输入密码！","")
		 Response.End
	 End If
'****************************************************
     Yx_admin=RequestFormStr("admin")
	 Yx_pass=RequestFormStr("pass")
'****************************************************
set Yh=server.createobject("adodb.recordset")
Yh.open "select * from Admin_login where Yx_Username='"&Yx_admin&"'",conn,3,1
	If Yh.eof And Yh.bof Then
		Call MessageBox("对不起，用户名输入错误，请重新填写!","")
		Response.End
	Else
        set Pa=server.createobject("adodb.recordset")
        Pa.open "select * from Admin_login where Yx_Password='"&Yx_pass&"'",conn,3,3
	    	If Pa.eof And Pa.bof Then
				Call MessageBox("对不起，密码输入错误，请重新填写!","")
		        Response.End
				    Else
                        session("sys_name")="sys_admin_denglu"
						session("sys_pass")=pa("Yx_username")
		                session.timeOut=60
						Pa("Yx_time")=now()
						Pa("Yx_cishu")=Pa("Yx_cishu")+1
						Pa.update
						Call MessageBox("恭喜你，登陆成功！点击进入后台管理系统！","admin.asp")
		                'Response.Redirect("Yx.Admin.asp")
		    Pa.close()
		    Set Pa=nothing
            End If
      Yh.close()
      Set Yh=nothing
      End If
'Else
'Call MessageBox("对不起，请勿非法操作!","adminuser.asp")
'response.End()
End IF
%>
<div id="log_top"></div>
<div id="log_head">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="log_table">
  <form id="myform" name="myform" method="post" action="">
    <tr>
      <td height="45"></td>
      <td width="60" align="right">用户名：</td>
      <td width="200" align="left"><input name="admin" type="text" class="log_text" id="admin" maxlength="20" /></td>
      <td width="80" align="right">密码：</td>
      <td width="200" align="left"><input name="pass" type="password" class="log_text" id="pass" maxlength="20" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="45">&nbsp;</td>
      <td align="right">&nbsp;</td>
      <td align="left">&nbsp;</td>
      <td align="right">&nbsp;</td>
      <td align="right"><input type="hidden" name="Accepted" value="Judge"><input type="submit" name="button" id="button" class="log_dl" value="登录" onClick="return DLHT();"></td>
      <td>&nbsp;</td>
    </tr>
    </form>
  </table>
</div>
</body>
</html>
