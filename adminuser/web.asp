<!--#include file="inc/sys_top.asp" -->
<body>
<%if request.Form("Action")="TiJiao" then
    Set rss=server.CreateObject("adodb.recordset")
      rss.open "select * from Config",conn,3,3
        rss("biaoti")=request.Form("biaoti")
		rss("guanjianci")=request.Form("guanjianci")
		rss("miaoshu")=request.Form("miaoshu")
		rss("banquan")=request.Form("banquan")
        rss.update
		response.write("<script language='javascript'>alert('�޸ĳɹ���');location.href='web.asp'</script>")
      rss.close
    set rss=nothing
end if
'��ȡ����
set rs=server.CreateObject("adodb.recordset")
sqlstr="select * from config"
rs.open sqlstr,conn,3,1
biaoti=rs("biaoti")
guanjianci=rs("guanjianci")
miaoshu=rs("miaoshu")
banquan=rs("banquan")
rs.close()
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
          <td height="43" class="admin_x_title">��վ����</td>
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
    <td height="30" colspan="3" align="center" bgcolor="#f2f2f2">[�޸�����]</td>
  </tr>
  <tr>
    <td width="29%" height="40" align="right" bgcolor="#FFFFFF">��ҳ���⣺</td>
    <td width="71%" height="40" colspan="2" bgcolor="#FFFFFF">&nbsp;<input name="biaoti" type="text" class="fl_text1" id="biaoti" value="<%=biaoti%>" /></td>
  </tr>
  <tr>
    <td height="40" align="right" bgcolor="#FFFFFF">��վ�ؼ��ʣ�</td>
    <td height="40" colspan="2" bgcolor="#FFFFFF">&nbsp;<input name="guanjianci" type="text" class="fl_text1" id="guanjianci" value="<%=guanjianci%>" /></td>
  </tr>
  <tr>
    <td height="40" align="right" bgcolor="#FFFFFF">��վ������</td>
    <td height="40" colspan="2" bgcolor="#FFFFFF"><textarea name="miaoshu" cols="71" rows="5" class="logintext1" id="miaoshu"><%=miaoshu%></textarea></td>
  </tr>
  <tr>
    <td height="40" align="right" bgcolor="#FFFFFF">��վ��Ȩ��</td>
    <td height="40" colspan="2" bgcolor="#FFFFFF"><textarea name="banquan" cols="71" rows="5" class="logintext1" id="banquan"><%=banquan%></textarea></td>
  </tr>
  <tr>
    <td height="40" bgcolor="#FFFFFF">&nbsp;</td>
    <td height="40" colspan="2" bgcolor="#FFFFFF">&nbsp;<input type="submit" name="button" id="button" class="input_bottom" value="ȷ��/�ύ"/>
      <input type="hidden" name="Action" value="TiJiao"></td>
  </tr>
 </form> 
</table></td>
    </tr>
  </table>
</div>
</body>
</html>
