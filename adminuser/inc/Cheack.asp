<%IF session("sys_name")<>"sys_admin_denglu" then
    response.write "<script language='javascript'>this.top.location.href='login.asp'</script>"
    response.End()
end if%>