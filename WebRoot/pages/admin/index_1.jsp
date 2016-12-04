<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  System.out.println(basePath);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>库存管理系统</title>
</head>
<script type="text/javascript">
	function resetValue() {
		document.getElementById("userName").value = "";
		document.getElementById("password").value = "";
	}
	
	function loadimage(){
		document.getElementById("randImage").src = "${pageContext.request.contextPath}/pages/admin/image.jsp?"+Math.random();
	} 
</script>
<style>
	body{	
		font:Verdana, Geneva, sans-serif;
		font-size:12px;
	}
</style>
<body>
<div style="background:url('${pageContext.request.contextPath}/images/login.jpg')">
		<form action="stockManageSystem/login!login" method="post">
			<table border="0px" width="1321" height="585" >
				<tr height="85">
					<td height="325" colspan="4"></td>
			  </tr>
				<tr height="10">
					<td width="35%" height="23"></td>
					<td width="5%">&nbsp;用户名：</td>
					<td width="10%"><input type="text" value="${user.userName }" name="user.userName" id="userName" size="17" height="10"/></td>
					<td width="50%"><font color="red">${error }</font></td>
				</tr>
				<tr>
			  <tr height="10">
                    <td width="35%" height="23"></td>
                    <td width="5%">&nbsp;密  码：</td>
					<td><input type="password" value="${user.password }" name="user.password" id="password"  size="17"  height="10"/></td>
					<td width="50%">&nbsp;&nbsp;<input type="submit" value="登录" />
                    				&nbsp;<input type="button" value="重置" onclick="resetValue()" /></td>
			  </tr>
				<tr height="10">
                    <td width="35%" height="26"></td>
                    <td width="5%">&nbsp;验证码：</td>
                    <td><input type="text" value="${imageCode }" name="imageCode" id="imageCode" size="5" />&nbsp;<img onclick="javascript:loadimage();"  title="换一张试试" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle"></td>
                    <td width="50%"></td>
			  </tr>
                <tr>
               	  <td width="35%" height="20"></td>
					<td colspan="3"></td>
              	</tr>
                <tr>
                	<td height="150" colspan="4"></td>
              	</tr>
			</table>
		</form>
	</div>
</body>
</html>