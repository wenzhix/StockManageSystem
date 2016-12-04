<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gbk">
  <title>页眉</title>
</head>
<body>
    <center>
       <table border="0" width="100%" height="160" cellspacing="0" cellpadding="0">
            <!-- 顶部菜单 -->
            <tr height="20">
                <td height="25" valign="bottom" style="text-indent:10">
                    
                    <a href="admin/login!isLogin" style="color:gray">[进入后台]</a>
                </td>
                <td align="right" valign="bottom">
                    <a href="#" style="color:gray" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://localhost:8080/StockManageSystem');">设为主页 -</a>
                    <a href="javascript:window.external.AddFavorite('http://localhost:8080/StockManageSystem','存储系统')" style="color:gray">收藏本页 -</a>
                    <a href="mailto:javajcw@126.com.cn" style="color:gray">联系我们</a>
                    &nbsp;
                </td>
          </tr>
	            <!-- 导航菜单 -->
            <tr height="56">
                <td width="220" height="150" colspan="2" background="images/back.png" heigth="200"></td>
            </tr>
        </table>
    </center>
</body>
</html>