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
          <td height="43" class="admin_x_title">�������</td>
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
            <td width="40" height="32" align="center" class="admin_title_13blod">����</td>
            <td width="40" align="center" class="admin_title_13blod">ID</td>
            <td align="center" class="admin_title_13blod">����</td>
            <td width="100" align="center" class="admin_title_13blod">һ������</td>
            <td width="100" align="center" class="admin_title_13blod">��������</td>
            <td width="80" align="center" class="admin_title_13blod">����</td>
            <td width="100" align="center" class="admin_title_13blod">��ҳ</td>
            <td width="200" align="center" class="admin_title_13blod">�༭</td>
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
'������������������������������������
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
'������������������������������������
set rs=server.CreateObject("adodb.recordset")
sql="select * from contentlist order by nr_PaiXu,nr_f01 desc" 
rs.open sql,conn,3,1 
if rs.eof and rs.bof then 
response.write "<tr><td style=""color:#f00;"" colspan=""8"" height=""35"">&nbsp;û���ҵ���ؼ�¼!</td></tr>" 
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
response.Write("����һ�����࣡")
else
response.Write(""&Rslist_one("one_title")&"")
one=Rslist_one("one_style")
end if
Rslist_one.close
set Rslist_one=nothing%></td>
            <td width="100" align="center"><%set Rslist_two=server.CreateObject("adodb.recordset")
Rslist_two.open "select * from list_two where two_style="&rs("nr_f02")&"",conn,3,1
if Rslist_two.eof and Rslist_two.bof then
response.Write("����һ�����࣡")
else
response.Write(""&Rslist_two("two_title")&"")
end if
Rslist_two.close
set Rslist_two=nothing%></td>
            <td width="80" align="center">
              <script>function PaiXu<%=rs("nr_id")%>(){var Zhi<%=rs("nr_id")%>=document.getElementById('Sum<%=rs("nr_id")%>');if(Zhi<%=rs("nr_id")%>.value==""){alert("���кŲ���Ϊ��");Zhi<%=rs("nr_id")%>.focus();return false;} else {location.href='list.asp?muen=4&act=s&id=<%=rs("nr_id")%>&Page=<%=currentPage%>&z='+Zhi<%=rs("nr_id")%>.value}}</script>
  <input name="Sum<%=rs("nr_id")%>" type="text" class="Fl_Paixu" id="Sum<%=rs("nr_id")%>" onblur="return PaiXu<%=rs("nr_id")%>();" size="5" value="<%=rs("nr_PaiXu")%>"/>
            </td>
            <td align="center">
              
              <%if rs("nr_shouye")="False" then%>
              <a href="?act=hy&id=<%=rs("nr_id")%>&Page=<%=currentPage%>"><img src="images/s01.gif" width="40" height="15" /></a>
              <%else%>
              <a href="?act=hy&q=x&id=<%=rs("nr_id")%>&Page=<%=currentPage%>"><img src="images/s02.gif" width="40" height="15" /></a>
              <%end if%>
              
            </td>
            <td align="center"><a href="add_xg.asp?muen=4&one=<%= rs("nr_f01") %>&tow=<%=rs("nr_f02")%>&id=<%=rs("nr_id")%>&page=<%=currentPage%>&url=list.asp" onClick="return confirm('��ȷ��Ҫ�޸ġ�<%=rs("nr_title")%>����')">[���ӱ༭]</a></td>
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
        <input class="qx" type="button" value="ȫѡ" onClick="checkAll(this.form);">
        <input class="qx" type="button" value="��ѡ" onClick="checkOthers(this.form);">
        <input class="sc" type="submit" name="Submit" value="������ѡ����" onClick="return confirm('�˲���������ɾ�����ݣ��Ҳ��ɻָ���')">
        &nbsp;<span style="color:#F00">[ע��NO������ҳ��ʾ/OFF��ȡ����ҳ��ʾ]</span></td>
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
//grid("����","�����б���","ż���б���","��꾭������","����󱳾�","����л�Ϊ�б�����������ɫ","����л�Ϊû������������ɫ");
tabshow("tabshow","#ededed","#fff","#ffffdd");
</script>
</body>
</html>
