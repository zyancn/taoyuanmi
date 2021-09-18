<%Response.Buffer = True 
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache"

on error resume next
if ZHUANGHUANGGONGSI=TRUE then
dim conn,connstr
Date_Base=server.MapPath(""&Date_Tell&"")
set conn=server.createobject("adodb.connection")
connstr="provider=microsoft.jet.oledb.4.0;data source="&Date_Base
if err.number<>0 then 
	err.clear
	set conn=nothing
	response.write "<br><p align=center><font color='red'>文件出现错误！</font></p>"
	Response.End
else
	conn.open connstr
	if err then 
		err.clear
		set conn=nothing
		response.write "<br><p align=center><font color='red'>链接出现错误！</font></p>"
		Response.End 
	end if
end if
else
response.write "<br><p align=center><font color='red'>网站出现错误请检查连接文件！</font></p>"
response.end()
end if%>
<!--#include file="const.asp" -->