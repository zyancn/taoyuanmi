<%
'****************************************************
'��������IsSelfRefer
'��  �ã��ж��Ƿ�վ��ֵ
'��  ������
'****************************************************
Function IsSelfRefer()
	Dim sHttp_Referer,sServer_Name
	sHttp_Referer=CStr(Request.ServerVariables("HTTP_REFERER"))
	sServer_Name=CStr(Request.ServerVariables("SERVER_NAME"))
	If Mid(sHttp_Referer,8,Len(sServer_Name))=sServer_Name Then
		IsSelfRefer=True
	Else
		IsSelfRefer=False
	End If
End Function
'****************************************************
Function RequestStr(sTemp)  
	dim m_sTemp
	m_sTemp =  Request.QueryString(sTemp)
	if trim(m_sTemp) ="" then
		RequestStr=""
	else
	    RequestStr = replace(trim(lcase(m_sTemp)),"'","''")
		'RequestStr = replace(trim(m_sTemp),"'","''")
	end if 
End function
'****************************************************
Function RequestFormStr(sTemp)  
	dim m_sTemp
	m_sTemp =  Request.form(sTemp)
	if trim(m_sTemp) ="" then
		RequestFormStr=""
	else
	    RequestFormStr = replace(trim(lcase(m_sTemp)),"'","''")
		'RequestFormStr = replace(trim(m_sTemp),"'","''")
	end if 
End function
'****************************************************
Function ChkObjInstalled(strClassString)
		On Error Resume Next
		ChkObjInstalled = False
		Err = 0
		Dim xTestObj
		Set xTestObj = Server.CreateObject(strClassString)
		If 0 = Err Then ChkObjInstalled = True
		Set xTestObj = Nothing
		Err = 0
End Function
'****************************************************
sub MessageBox(str,url)
	Response.write "<script language=""JavaScript"">alert("""& str &""");"
	if url="" then 
		Response.write "history.go(-1);"
	else
		'Response.write "window.open("""& url &""",""_self"")"
		Response.write "window.location="""& url &""";"
	end if 
	Response.write "</script>"
End Sub
'//===============================��ҳ
sub SoYePage(a1,a2,ms,muen)
dim ii,p,n 
if totalrec mod perpage=0 then 
n= totalrec \ perpage 
else 
n= totalrec \ perpage+1 
end if 
if currentpage-1 mod 10=0 then 
p=(currentpage-1) \ 10 
else 
p=(currentpage-1) \ 10 
end if
if ms="True" then 
response.write "��<b>"&currentPage&"</b>ҳ/��<b>"&n&"</b>ҳ, ÿҳ<b>"&rs.PageSize&"</b>��, ��<b>"&totalrec&"</b>��&nbsp;" 
else
if currentPage=1 then 
response.write "<span "&a1&">Home</span>" 
else 
response.write "<a href='?"&muen&"&page=1' title=��ҳ>Home</a>" 
end if 
if p*10>0 then response.write "<a href='?"&muen&"&page="&Cstr(p*10)&"' title=��ʮҳ><<</a>" 
for ii=p*10+1 to P*10+10 
if ii=currentPage then 
response.Write "<span "&a2&">"+Cstr(ii)+"</span>"
else 
response.write "<a href='?"&muen&"&page="&Cstr(ii)&"'>"+Cstr(ii)+"</a>" 
end if 
if ii=n then exit for 
next 
if ii<n then response.write "<a href='?"&muen&"&page="&Cstr(ii)&"' title=��ʮҳ>>></a>" 
if currentPage=n then 
response.write "<span "&a1&">page</span>" 
else 
response.write "<a href='?"&muen&"&page="&Cstr(n)&"' title=βҳ>page</a>" 
end if 
end if
end sub


'//===============================����һ����ʾ===============================
sub IndexSoYePage(a1,a2)
dim ii,p,n 
if totalrec mod perpage=0 then 
n= totalrec \ perpage 
else 
n= totalrec \ perpage+1 
end if 
if currentpage-1 mod 10=0 then 
p=(currentpage-1) \ 10 
else 
p=(currentpage-1) \ 10 
end if
response.write "��<b>"&currentPage&"</b>ҳ/��<b>"&n&"</b>ҳ, ÿҳ<b>"&rs.PageSize&"</b>��, ��<b>"&totalrec&"</b>��&nbsp;" 
if currentPage=1 then 
response.write "<span "&a1&">Home</span>" 
else 
response.write "<a href='?page=1' title=��ҳ>Home</a>" 
end if 
if p*10>0 then response.write "<a href='?page="&Cstr(p*10)&"' title=��ʮҳ><<</a>" 
for ii=p*10+1 to P*10+10 
if ii=currentPage then 
response.Write "<span "&a2&">"+Cstr(ii)+"</span>"
else 
response.write "<a href='?page="&Cstr(ii)&"'>"+Cstr(ii)+"</a>" 
end if 
if ii=n then exit for 
next 
if ii<n then response.write "<a href='?page="&Cstr(ii)&"' title=��ʮҳ>>></a>" 
if currentPage=n then 
response.write "<span "&a1&">page</span>" 
else 
response.write "<a href='?page="&Cstr(n)&"' title=βҳ>page</a>" 
end if 
end sub
'***************
'���ؿͻ�IP��ַ
'***************
'Function GetIP()
    ' Dim IP
    ' IP = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
   ' If IP = "" Then IP = Request.ServerVariables("REMOTE_ADDR")
    'GetIP = IP
'End Function
'//��ȡ�����û�IP
Function GetIP()
	Dim Ip,Tmp
	Dim i,IsErr
	IsErr=False
	Ip=Request.ServerVariables("REMOTE_ADDR")
	If Len(Ip)<=0 Then Ip=Request.ServerVariables("HTTP_X_ForWARDED_For")		
	If Len(Ip)>15 Then 
		IsErr=True
	Else
		Tmp=Split(Ip,".")
		If Ubound(Tmp)=3 Then 
			For i=0 To Ubound(Tmp)
				If Len(Tmp(i))>3 Then IsErr=True
			Next
		Else
			IsErr=True
		End If
	End If
	If IsErr Then 
		GetIP="1.1.1.1"
	Else
		GetIP=Ip
	End If
End Function
%>