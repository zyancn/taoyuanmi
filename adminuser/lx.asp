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
		});
	</script>
<script language="javascript">
function FBcontent(){
if (myform.content.value==''){
  alert("左侧内容不能为空！")
			return false;
}
if (myform.content1.value==''){
  alert("右侧内容不能为空！")
			return false;
}
return true
}
</script>
<%
if request.Form("Action")="content" then
    content=request.form("content")
	  if content="" then
	    Call MessageBox("左侧内容不能为空！","lx.asp?muen=5")
		response.End()
	  end if
    content1=request.form("content1")
	  if content1="" then
	    Call MessageBox("右侧内容不能为空！","lx.asp?muen=5")
		response.End()
	  end if
set rs=server.CreateObject("adodb.recordset")
sqlstr="select * from lianxi"
rs.open sqlstr,conn,3,3
rs("content")=request.form("content")
rs("content1")=request.form("content1")
rs.update
response.write("<script language='javascript'>alert('修改成功！');location.href='lx.asp?muen=5'</script>")
rs.close
set rs=nothing
end if
'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'
'/===================================================读取数据===================================================/'
'////////////////////////////////////////////////////////////////////////////////////////////////////////////////'
set rs=server.CreateObject("adodb.recordset")
sqlstr="select * from lianxi"
rs.open sqlstr,conn,3,1
content=rs("content")
content1=rs("content1")
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
          <td height="43" class="admin_x_title">联系我们</td>
        </tr>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="admin_line">
          <tr>
            <td></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <form id="myform" name="myform" method="post" action="">
          <tr>
            <td width="70%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="40" height="50" align="right"><strong>左侧：</strong></td>
                <td>注：图片建议尺寸720*390</td>
              </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="35" align="left"><textarea name="content" id="content" style="width:96%;height:330px;"><%=content%></textarea></td>
              </tr>
              <tr>
                <td height="55" align="left">您当前输入了 <span class="word_count1">0</span> 个文字。（字数统计包含HTML代码。）<br />
                  您当前输入了 <span class="word_count2" id="tr1">0</span> 个文字。（字数统计包含纯文本、IMG、EMBED，不包含换行符，IMG和EMBED算一个文字。）</td>
                </tr>
            </table></td>
            <td width="30%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="50" align="left"><strong>右侧：</strong></td>
                </tr>
              <tr>
                <td height="50" align="left"><textarea name="content1" id="content1" cols="45" rows="20" class="logintext"><%=content1%></textarea></td>
                </tr>
              <tr>
                <td height="50" align="left"><input type="hidden" name="Action" value="content">                  <input type="submit" name="button" id="button" class="input_bottom" value="确认/提交" onClick="return FBcontent();"/></td>
              </tr>
            </table></td>
          </tr></form>
    </table></td>
    </tr>
  </table>
</div>
</body>
</html>
