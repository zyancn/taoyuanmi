<%
'//////////////////////字段说明//////////////////////'
'Digital=selectdel   | 接收要删除的ID号码            '
'Table=TuDiZhiFa     | 要执行删除的数据表            '
'ID=Tdzf_ID          | 要执行删除的数据表ID编号      '
'PhotoUrl=Tdzf_Photo | 要删除的图片路径              '
'TzUrl=GlTdzf.asp    | 执行后要跳转的页面            '
'////////////////////修改数据函数////////////////////'
Sub DelNum(Digital,Table,ID,TzUrl)
'if request("Action")="Del" then
Num=request.form(""&Digital&"").count 
IF Num=0 then 
Response.Write ("<script language='javascript'>window.alert('请选择要删除的内容!');history.go(-1)</script>")  
Response.End 
End IF 
'删除数据库数据的记录
For i=1 to Num 
Set rs=Server.CreateObject("adodb.Recordset") 
sql="Select * from "&Table&" where "&ID&"="&request.form(""&Digital&"")(i) 
rs.open sql,conn,1,1 
If not rs.eof then 
conn.execute("Delete From "&Table&" Where "&ID&"="&request.form(""&Digital&"")(i)) 
else 
Response.Write ("<script language='javascript'>window.alert('内容删除失败!');history.go(-1)</script>")  
Response.End 
End IF
rs.close 
Set rs=nothing 
Next 
Response.Write ("<script language='javascript'>location.href='"&TzUrl&"'</script>") 
Response.End 
'End IF
End Sub
%>