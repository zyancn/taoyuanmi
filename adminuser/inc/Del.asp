<%
'//////////////////////�ֶ�˵��//////////////////////'
'Digital=selectdel   | ����Ҫɾ����ID����            '
'Table=TuDiZhiFa     | Ҫִ��ɾ�������ݱ�            '
'ID=Tdzf_ID          | Ҫִ��ɾ�������ݱ�ID���      '
'PhotoUrl=Tdzf_Photo | Ҫɾ����ͼƬ·��              '
'TzUrl=GlTdzf.asp    | ִ�к�Ҫ��ת��ҳ��            '
'////////////////////�޸����ݺ���////////////////////'
Sub DelNum(Digital,Table,ID,TzUrl)
'if request("Action")="Del" then
Num=request.form(""&Digital&"").count 
IF Num=0 then 
Response.Write ("<script language='javascript'>window.alert('��ѡ��Ҫɾ��������!');history.go(-1)</script>")  
Response.End 
End IF 
'ɾ�����ݿ����ݵļ�¼
For i=1 to Num 
Set rs=Server.CreateObject("adodb.Recordset") 
sql="Select * from "&Table&" where "&ID&"="&request.form(""&Digital&"")(i) 
rs.open sql,conn,1,1 
If not rs.eof then 
conn.execute("Delete From "&Table&" Where "&ID&"="&request.form(""&Digital&"")(i)) 
else 
Response.Write ("<script language='javascript'>window.alert('����ɾ��ʧ��!');history.go(-1)</script>")  
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