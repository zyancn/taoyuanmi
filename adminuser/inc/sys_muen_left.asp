<!--#include file="Cheack.asp" -->
<ul class="admin_left_muen">

<%if request.QueryString("muen")="1" then%>
<li id="a_l_m" class="left1_m3"><a href="./1_list.asp?muen=1">一级分类</a></li>
<%else%>
<li id="a_l_m" class="left1_m1" onMouseOver="this.className='left1_m2'" onMouseOut="this.className='left1_m1'"><a href="./1_list.asp?muen=1">一级分类</a></li>
<%end if%>

<%if request.QueryString("muen")="2" then%>
<li id="a_l_m" class="left2_m3"><a href="./2_list.asp?muen=2">二级分类</a></li>
<%else%>
<li id="a_l_m" class="left2_m1" onMouseOver="this.className='left2_m2'" onMouseOut="this.className='left2_m1'"><a href="./2_list.asp?muen=2">二级分类</a></li>
<%end if%>

<%if request.QueryString("muen")="3" then%>
<li id="a_l_m" class="left3_m3"><a href="./add.asp?muen=3">添加内容</a></li>
<%else%>
<li id="a_l_m" class="left3_m1" onMouseOver="this.className='left3_m2'" onMouseOut="this.className='left3_m1'"><a href="./add.asp?muen=3">添加内容</a></li>
<%end if%>

<%if request.QueryString("muen")="4" then%>
<li id="a_l_m" class="left4_m3"><a href="./list.asp?muen=4">管理文章</a></li>
<%else%>
<li id="a_l_m" class="left4_m1" onMouseOver="this.className='left4_m2'" onMouseOut="this.className='left4_m1'"><a href="./list.asp?muen=4">管理文章</a></li>
<%end if%>

<%if request.QueryString("muen")="5" then%>
<li id="a_l_m" class="left5_m3"><a href="./lx.asp?muen=5">联系我们</a></li>
<%else%>
<li id="a_l_m" class="left5_m1" onMouseOver="this.className='left5_m2'" onMouseOut="this.className='left5_m1'"><a href="./lx.asp?muen=5">联系我们</a></li>
<%end if%>


      </ul>