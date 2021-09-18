<!--#include file="inc/sys_top.asp" -->
<body>
<%
set rs=server.CreateObject("adodb.recordset")
      rs.open "select * from Admin_login where Yx_Username='"&session("sys_pass")&"'",conn,3,1
        if not(rs.eof and rs.bof) then
		  Yx_cishu=rs("Yx_cishu")
		  Sc_Time=rs("Yx_time")
		end if
      rs.close
set rs=nothing
%>
<!--#include file="inc/sys_muen_top.asp" -->
<div id="admin_head">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="150" valign="top" bgcolor="#EDEDED"><!--#include file="inc/sys_muen_left.asp" --></td>
      <td width="10"></td>
      <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="36" class="admin_x_title">信息摘要</td>
          </tr>
        <tr>
          <td height="10"></td>
        </tr>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd" class="admin_table" id="tabshow">
          <tr>
            <td height="35" colspan="4"><strong>站内统计摘要</strong> ( 最后更新 : <%=now()%> )</td>
          </tr>
          <tr>
            <td width="25%" height="35">当前用户</td>
            <td width="25%"><%=session("sys_admin_pass")%>(管理员) </td>
            <td width="25%">脚本解释引擎</td>
            <td width="25%"><%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
          </tr>
          <tr>
            <td height="35">  上次登陆</td>
            <td><%=Sc_Time%></td>
            <td>登陆次数</td>
            <td><%=Yx_cishu%>次 </td>
          </tr>
          <tr>
            <td height="35">服务器名称</td>
            <td><%=Request.ServerVariables("SERVER_NAME")%></td>
            <td>当前分辨率</td>
            <td><%=FenBianLV%></td>
          </tr>
          <tr>
            <td height="35">服务器IP</td>
            <td><%=Request.ServerVariables("LOCAL_ADDR")%></td>
            <td>FSO文件读写</td>
            <td><%
		If ChkObjInstalled("Scripting.FileSystemObject") Then
			Response.Write "<font color=green><b>√</b></font>"
		Else
			Response.Write "<font color=red><b>×</b></font>"
		End If%></td>
          </tr>
        </table>
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
