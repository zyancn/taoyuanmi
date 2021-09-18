<!--#include file="inc/sys_top.asp" -->
<%
if request.QueryString("id")="" or not isNumeric(request.QueryString("id")) then
response.Redirect("login.asp")
response.End()
end if
%>
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
  alert("对不起，请选择一级分类！")
  myform.prob_class.focus()
			return false;
}
if (myform.pros_class.value=='xxx'){
  alert("对不起，请选择二级分类！")
  myform.pros_class.focus()
			return false;
}
if (myform.Title.value==''){
  alert("对不起，请添加内容标题！")
  myform.Title.focus()
			return false;
}
if (document.getElementById("tr1").innerHTML=="0"){
  alert("对不起，请添加标题名称！")
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
	    Call MessageBox("请选择一级分类！","add.asp?muen=4")
		response.End()
	  end if
    pros_class=request.form("pros_class")
	  if pros_class="xxx" then
	    Call MessageBox("请选择二级分类！","add.asp?muen=4")
		response.End()
	  end if
    Title=request.form("Title")
	  if Title="" then
	    Call MessageBox("请输入标题名称！","add.asp?muen=4")
		response.End()
	  end if
    content=request.form("content")
	  if content="" then
	    Call MessageBox("请输入描述内容！","add.asp?muen=4")
		response.End()
	  end if
set rs=server.CreateObject("adodb.recordset")
sqlstr="select * from contentlist where nr_id="&request.QueryString("ID")
rs.open sqlstr,conn,3,3
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
response.write("<script language='javascript'>alert('修改成功！');location.href='"&request.QueryString("url")&"?muen=4&page="&request.QueryString("page")&"'</script>")
rs.close
set rs=nothing
end if
'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'
'/===================================================读取数据===================================================/'
'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'
set rs=server.CreateObject("adodb.recordset")
sqlstr="select * from contentlist where nr_id="&request.QueryString("ID")
rs.open sqlstr,conn,3,1
nr_title=rs("nr_title")
nr_t1=rs("nr_t1")
nr_t2=rs("nr_t2")
nr_t3=rs("nr_t3")
nr_t4=rs("nr_t4")
nr_content=rs("nr_content")
heibai=rs("nr_heibai")
caise=rs("nr_caise")
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
          <td height="43" class="admin_x_title">修改内容</td>
        </tr>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="admin_line">
          <tr>
            <td></td>
          </tr>
        </table>
<script language=JavaScript>
var selects=[];
selects['xxx']=new Array(new Option('请选择一级分类','xxx'));
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
sstr=sstr&"new Option('暂无分类','xxx') "
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
                <td width="40" height="50" align="right"><strong>分类：</strong></td>
                <td align="left"><select name="prob_class" class="select_ejld" onChange="chsel()">
          <%set LmOne=server.CreateObject("adodb.recordset")
  LmOne.open "select * from list_one where one_style="&request.QueryString("one"),conn,3,1
  if LmOne.eof and LmOne.bof then
    response.Write("<option value=""xxx"">==暂无一级分类==</option>")
  else%>
  <option value="<%=LmOne("one_style")%>" style="color:#F60"><%=LmOne("one_title")%></option>
          <%
  LmOne.close()
set LmOne=nothing
end if
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
			set rs=server.createobject("adodb.recordset")
            sqlstr="select * from list_one where one_style<>"&request.QueryString("one")
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
          <%set LmTow=server.CreateObject("adodb.recordset")
  LmTow.open "select * from list_two where two_style="&request.QueryString("tow"),conn,3,1
  if LmTow.eof and LmTow.bof then
    response.Write("<option value=""xxx"">==暂无二级分类==</option>")
  else%>
  <option value="<%=LmTow("two_style")%>" style="color:#F60"><%=LmTow("two_title")%></option>
          <%
  LmTow.close()
set LmTow=nothing
end if%> 
          
          </select></td>
                </tr>
              <tr>
                <td width="40" height="50" align="right"><strong>标题：</strong></td>
                <td><input name="Title" type="text" class="fl_text" id="Title" value="<%=nr_title%>" /></td>
              </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="35" align="left"><textarea name="content" id="content" style="width:99%;height:330px;"><%=nr_content%></textarea></td>
              </tr>
              <tr>
                <td height="55" align="left">您当前输入了 <span class="word_count1">0</span> 个文字。（字数统计包含HTML代码。）<br />
                  您当前输入了 <span class="word_count2" id="tr1">0</span> 个文字。（字数统计包含纯文本、IMG、EMBED，不包含换行符，IMG和EMBED算一个文字。）</td>
                </tr>
            </table></td>
            <td width="30%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="50" colspan="3" align="left">注：黑白图118*350</td>
                </tr>
              <tr>
                <td width="40" height="50" align="center"><img src="<%=heibai%>" height="40" /></td>
                <td height="50" align="left"><input name="heibai" type="text" class="tu_add" id="url5" value="<%=heibai%>" /></td>
                <td height="50" align="left"><img src="images/sc_img.gif" width="80" height="24" id="image5" /></td>
              </tr>
              <tr>
                <td width="40" height="50" align="center"><img src="<%=caise%>" height="40" /></td>
                <td height="50" align="left"><input name="caise" type="text" class="tu_add" id="url6" value="<%=caise%>" /></td>
                <td height="50" align="left"><img src="images/sc_img.gif" width="80" height="24" id="image6" /></td>
                </tr>
              <tr>
                <td height="50" colspan="3" align="left">注：展示图680*350</td>
                </tr>
              <tr>
                <td width="40" height="50" align="center"><img src="<%=nr_t1%>" width="30" /></td>
                <td height="50" align="left"><input name="tu1" type="text" class="tu_add" id="url1" value="<%=nr_t1%>" /></td>
                <td width="80" height="50" align="left"><img src="images/sc_img.gif" width="80" height="24" id="image1" /></td>
                </tr>
              <tr>
                <td width="40" height="50" align="center"><img src="<%=nr_t2%>" width="30" /></td>
                <td height="50" align="left"><input name="tu2" type="text" class="tu_add" id="url2" value="<%=nr_t2%>" /></td>
                <td height="50" align="left"><img src="images/sc_img.gif" width="80" height="24" id="image2" /></td>
              </tr>
              <tr>
                <td width="40" height="50" align="center"><img src="<%=nr_t3%>" width="30" /></td>
                <td height="50" align="left"><input name="tu3" type="text" class="tu_add" id="url3" value="<%=nr_t3%>" /></td>
                <td height="50" align="left"><img src="images/sc_img.gif" width="80" height="24" id="image3" /></td>
              </tr>
              <tr>
                <td width="40" height="50" align="center"><img src="<%=nr_t4%>" width="30" /></td>
                <td height="50" align="left"><input name="tu4" type="text" class="tu_add" id="url4" value="<%=nr_t4%>" /></td>
                <td height="50" align="left"><img src="images/sc_img.gif" width="80" height="24" id="image4" /></td>
              </tr>
              <tr>
                <td height="50" colspan="3" align="left"><input type="hidden" name="Action" value="content">                  <input type="submit" name="button" id="button" class="input_bottom" value="确认/提交" onClick="return FBcontent();"/></td>
                </tr>
              <tr>
                <td height="50" colspan="3" align="left"><input type="button" name="button2" id="button2" class="input_bottom" value="取消/返回" onclick="history.go(-1)" /></td>
              </tr>
            </table></td>
          </tr></form>
    </table></td>
    </tr>
  </table>
</div>
</body>
</html>
