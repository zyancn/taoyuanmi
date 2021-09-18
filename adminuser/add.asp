<!--#include file="inc/sys_top.asp" -->
<body>
    <link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="../kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
	<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="../kindeditor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor = K.create('textarea[name="content"]', {
				cssPath : '../kindeditor/plugins/code/prettify.css',
				uploadJson : '../kindeditor/asp/upload_json.asp',
				fileManagerJson : '../kindeditor/asp/file_manager_json.asp',
				allowFileManager : true,
				afterChange : function() {
						K('.word_count1').html(this.count());
						K('.word_count2').html(this.count('text'));
					},afterBlur: function(){this.sync();}
			});
			prettyPrint();
			
K('#image1').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							showRemote : false,
							imageUrl : K('#url1').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#url1').val(url);
								editor.hideDialog();
							}
						});
					});
				});
K('#image2').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							showRemote : false,
							imageUrl : K('#url2').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#url2').val(url);
								editor.hideDialog();
							}
						});
					});
				});	
K('#image3').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							showRemote : false,
							imageUrl : K('#url3').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#url3').val(url);
								editor.hideDialog();
							}
						});
					});
				});	
K('#image4').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							showRemote : false,
							imageUrl : K('#url4').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#url4').val(url);
								editor.hideDialog();
							}
						});
					});
				});	
K('#image5').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							showRemote : false,
							imageUrl : K('#url5').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#url5').val(url);
								editor.hideDialog();
							}
						});
					});
				});	
K('#image6').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							showRemote : false,
							imageUrl : K('#url6').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#url6').val(url);
								editor.hideDialog();
							}
						});
					});
				});		
		});
	</script>
<script language="javascript">
function FBcontent(){
if (myform.prob_class.value=='xxx'){
  alert("�Բ�����ѡ��һ�����࣡")
  myform.prob_class.focus()
			return false;
}
if (myform.pros_class.value=='xxx'){
  alert("�Բ�����ѡ��������࣡")
  myform.pros_class.focus()
			return false;
}
if (myform.Title.value==''){
  alert("�Բ�����������ݱ��⣡")
  myform.Title.focus()
			return false;
}
if (document.getElementById("tr1").innerHTML=="0"){
  alert("�Բ�������ӱ������ƣ�")
  myform.content.focus()
			return false;
}
return true
}
</script>
<%
if request.Form("Action")="content" then
    prob_class=request.form("prob_class")
	  if prob_class="xxx" then
	    Call MessageBox("��ѡ��һ�����࣡","add.asp?muen=3")
		response.End()
	  end if
    pros_class=request.form("pros_class")
	  if pros_class="xxx" then
	    Call MessageBox("��ѡ��������࣡","add.asp?muen=3")
		response.End()
	  end if
    Title=request.form("Title")
	  if Title="" then
	    Call MessageBox("������������ƣ�","add.asp?muen=3")
		response.End()
	  end if
    content=request.form("content")
	  if content="" then
	    Call MessageBox("�������������ݣ�","add.asp?muen=3")
		response.End()
	  end if
set rs=server.CreateObject("adodb.recordset")
sqlstr="select * from contentlist"
rs.open sqlstr,conn,3,3
rs.addnew
rs("nr_f01")=request.form("prob_class")
rs("nr_f02")=request.form("pros_class")
rs("nr_t1")=request.form("tu1")
rs("nr_t2")=request.form("tu2")
rs("nr_t3")=request.form("tu3")
rs("nr_t4")=request.form("tu4")
rs("nr_content")=request.form("content")
rs("nr_title")=request.form("Title")
rs("nr_heibai")=request.form("heibai")
rs("nr_caise")=request.form("caise")
rs.update
response.write("<script language='javascript'>alert('��ӳɹ���');location.href='add.asp?muen=3'</script>")
rs.close
set rs=nothing
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
          <td height="43" class="admin_x_title">��������</td>
        </tr>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="admin_line">
          <tr>
            <td></td>
          </tr>
        </table>
<script language=JavaScript>
var selects=[];
selects['xxx']=new Array(new Option('��ѡ��һ������','xxx'));
<% 
set rs=server.createobject("adodb.recordset")
sqlstr="select * from list_one"
rs.open sqlstr,conn,3,1
while not rs.eof
set rss=server.createobject("adodb.recordset")
sqlstr="select * from list_two where one_style="&rs("one_style")
rss.open sqlstr,conn,3,1
sstr=""
if rss.bof and rss.eof then
sstr=sstr&"new Option('���޷���','xxx') "
else
while not rss.eof
sstr=sstr&"new Option('"&rss("two_title")&"','"&rss("two_style")&"') ,"
rss.movenext
wend
sstr=left(sstr,cint(len(sstr)-1))
rss.close
set rss=nothing
end if
response.write "selects['"&rs("one_style")&"']=new Array("&sstr&");"&vbcrlf
rs.movenext
wend
rs.close
set rs=nothing
%>
function chsel(){
with (document.myform){
if(prob_class.value) {
pros_class.options.length=0;
for(var i=0;i<selects[prob_class.value].length;i++){
pros_class.add(selects[prob_class.value][i]);}
			}
		}
	}
</script>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <form id="myform" name="myform" method="post" action="">
          <tr>
            <td width="70%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="40" height="50" align="right"><strong>���ࣺ</strong></td>
                <td align="left"><select name="prob_class" class="select_ejld" onChange="chsel()">
            <option value="xxx" selected>��ѡ��һ������</option>
            <%
			set rs=server.createobject("adodb.recordset")
            sqlstr="select * from list_one"
            rs.open sqlstr,conn,3,1
            while not rs.eof
            response.write "<option value='"&rs("one_style")&"'>"&rs("one_title")&"</option> "
            rs.movenext
            wend
            rs.close
            set rs=nothing
            %>
            </select>
            <select name="pros_class" class="select_ejld">
            <option value="xxx">��ѡ���������</option>
            </select></td>
                </tr>
              <tr>
                <td width="40" height="50" align="right"><strong>���⣺</strong></td>
                <td><input type="text" name="Title" id="Title" class="fl_text" /></td>
              </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="35" align="left"><textarea name="content" id="content" style="width:96%;height:330px;"></textarea></td>
              </tr>
              <tr>
                <td height="55" align="left">����ǰ������ <span class="word_count1">0</span> �����֡�������ͳ�ư���HTML���롣��<br />
                  ����ǰ������ <span class="word_count2" id="tr1">0</span> �����֡�������ͳ�ư������ı���IMG��EMBED�����������з���IMG��EMBED��һ�����֡���</td>
                </tr>
            </table></td>
            <td width="30%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="50" colspan="3" align="left">ע���ڰ�ͼ118*350</td>
                </tr>
              <tr>
                <td width="40" height="50" align="left">�ڰף�</td>
                <td height="50" align="left"><input name="heibai" type="text" class="tu_add" id="url5" value="" /></td>
                <td height="50" align="left"><img src="images/sc_img.gif" width="80" height="24" id="image5" /></td>
              </tr>
              <tr>
                <td width="40" height="50" align="left">��ɫ��</td>
                <td height="50" align="left"><input name="caise" type="text" class="tu_add" id="url6" value="" /></td>
                <td height="50" align="left"><img src="images/sc_img.gif" width="80" height="24" id="image6" /></td>
                </tr>
              <tr>
                <td height="50" colspan="3" align="left">ע��չʾͼ680*350</td>
                </tr>
              <tr>
                <td width="40" height="50" align="left">ͼ1��</td>
                <td height="50" align="left"><input name="tu1" type="text" class="tu_add" id="url1" value="" /></td>
                <td width="80" height="50" align="left"><img src="images/sc_img.gif" width="80" height="24" id="image1" /></td>
                </tr>
              <tr>
                <td width="40" height="50" align="left">ͼ2��</td>
                <td height="50" align="left"><input name="tu2" type="text" class="tu_add" id="url2" value="" /></td>
                <td height="50" align="left"><img src="images/sc_img.gif" width="80" height="24" id="image2" /></td>
              </tr>
              <tr>
                <td width="40" height="50" align="left">ͼ3��</td>
                <td height="50" align="left"><input name="tu3" type="text" class="tu_add" id="url3" value="" /></td>
                <td height="50" align="left"><img src="images/sc_img.gif" width="80" height="24" id="image3" /></td>
              </tr>
              <tr>
                <td width="40" height="50" align="left">ͼ4��</td>
                <td height="50" align="left"><input name="tu4" type="text" class="tu_add" id="url4" value="" /></td>
                <td height="50" align="left"><img src="images/sc_img.gif" width="80" height="24" id="image4" /></td>
              </tr>
              <tr>
                <td height="50" colspan="3" align="left"><input type="hidden" name="Action" value="content">                  <input type="submit" name="button" id="button" class="input_bottom" value="ȷ��/�ύ" onClick="return FBcontent();"/></td>
                </tr>
            </table></td>
          </tr></form>
    </table></td>
    </tr>
  </table>
</div>
</body>
</html>
