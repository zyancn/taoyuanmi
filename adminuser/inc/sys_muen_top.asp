<!--#include file="Cheack.asp" -->
<div id="admin_top">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="300" rowspan="2"><img src="images/logo.gif" height="85" /></td>
      <td height="55" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="20" align="right" class="admin_gl">����Ա��<strong><%=session("sys_pass")%></strong></td>
          <td width="40" height="50" rowspan="2" align="right" valign="middle"><img src="images/0.png" width="40" height="40" /></td>
          </tr>
        <tr>
          <td height="25" align="right"><div id="content_scjb">
            <div id="c_sc"><a href="../index.asp" target="_blank">������վ</a></div>
            <div id="c_sc"><a href="login.asp?Action=Exit" onClick="return confirm('���ã��Ƿ����Ҫ�˳�ϵͳ����ҳ��!')">�˳���¼</a></div>
          </div></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><ul class="admin_muen">
        <li class="menu2" onMouseOver="this.className='menu1'" onMouseOut="this.className='menu2'"><a href="./admin.asp"><strong>��̨��ҳ</strong></a></li>
        <li class="menu2" onMouseOver="this.className='menu1'" onMouseOut="this.className='menu2'"><a href="./web.asp">��վ����</a></li>
        <li class="menu2" onMouseOver="this.className='menu1'" onMouseOut="this.className='menu2'"><a href="./pass.asp">�޸�����</a></li>
      </ul></td>
    </tr>
  </table>
</div>