<!--#include file="inc/sys_top.asp" -->

<body>
<script language="javascript">
function DLHT(){
if (myform.admin.value==0){
  alert("�Բ��������������˻���Ϣ��")
  myform.admin.focus()
  return false;
}
if (myform.pass.value==0){
  alert("�Բ�������������������Ϣ��")
  myform.pass.focus()
  return false;
}
return true
}
</script>
<%
'ϵͳ�˳�״̬
if request.QueryString("Action")="Exit" then
session("sys_name")=""
session("sys_pass")=""
session.Abandon()
Call MessageBox("�˳�ϵͳ�ɹ�!","login.asp")
response.End()
end if
'��½��֤����
IF request.Form("Accepted")="Judge" and IsSelfRefer()=True Then
	 If request.Form("admin")="" Then
	     Call MessageBox("�û�������Ϊ�գ�����ȷ�����û�����","")
		 Response.End
	 End If
	 If request.Form("pass")="" Then
	     Call MessageBox("���벻��Ϊ�գ�����ȷ�������룡","")
		 Response.End
	 End If
'****************************************************
     Yx_admin=RequestFormStr("admin")
	 Yx_pass=RequestFormStr("pass")
'****************************************************
set Yh=server.createobject("adodb.recordset")
Yh.open "select * from Admin_login where Yx_Username='"&Yx_admin&"'",conn,3,1
	If Yh.eof And Yh.bof Then
		Call MessageBox("�Բ����û������������������д!","")
		Response.End
	Else
        set Pa=server.createobject("adodb.recordset")
        Pa.open "select * from Admin_login where Yx_Password='"&Yx_pass&"'",conn,3,3
	    	If Pa.eof And Pa.bof Then
				Call MessageBox("�Բ����������������������д!","")
		        Response.End
				    Else
                        session("sys_name")="sys_admin_denglu"
						session("sys_pass")=pa("Yx_username")
		                session.timeOut=60
						Pa("Yx_time")=now()
						Pa("Yx_cishu")=Pa("Yx_cishu")+1
						Pa.update
						Call MessageBox("��ϲ�㣬��½�ɹ�����������̨����ϵͳ��","admin.asp")
		                'Response.Redirect("Yx.Admin.asp")
		    Pa.close()
		    Set Pa=nothing
            End If
      Yh.close()
      Set Yh=nothing
      End If
'Else
'Call MessageBox("�Բ�������Ƿ�����!","adminuser.asp")
'response.End()
End IF
%>
<div id="log_top"></div>
<div id="log_head">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="log_table">
  <form id="myform" name="myform" method="post" action="">
    <tr>
      <td height="45"></td>
      <td width="60" align="right">�û�����</td>
      <td width="200" align="left"><input name="admin" type="text" class="log_text" id="admin" maxlength="20" /></td>
      <td width="80" align="right">���룺</td>
      <td width="200" align="left"><input name="pass" type="password" class="log_text" id="pass" maxlength="20" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="45">&nbsp;</td>
      <td align="right">&nbsp;</td>
      <td align="left">&nbsp;</td>
      <td align="right">&nbsp;</td>
      <td align="right"><input type="hidden" name="Accepted" value="Judge"><input type="submit" name="button" id="button" class="log_dl" value="��¼" onClick="return DLHT();"></td>
      <td>&nbsp;</td>
    </tr>
    </form>
  </table>
</div>
</body>
</html>
