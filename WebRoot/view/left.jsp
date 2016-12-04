<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <title>侧栏</title>
</head>

<body>
    <center>
        <table border="0" width="225" height="100%" cellspacing="0" cellpadding="0">
        	<tr height="35"><td style="text-indent:5" valign="bottom"><font color="#004790"><b>■商品展示</b></font></td></tr>
        	 <%-- <c:choose>
                 	<c:when test="${goodsList==null || goodsList.size()==0 }">
                 		<tr height="30"><td align="center" style="border:1 solid">没有可展示的商品</td></tr>
                 	</c:when>
                 	<c:otherwise>
                 		<c:forEach var="goods" items="${goodsList }" varStatus="status">
                 				<c:if test="${status.index<=2 }">
	                 				<tr height="23">                    				
	                 					<td width="50%">『<b>${goods.goodsName }</b>』</td>
	                 				</tr>
	                 				<tr height="200">
	        							<td align="center"><a href="stockManageSystem/barChart!show"><img src="images/pic.png" width="160" heigth="200" /></a></td>
	        						</tr>

                 				</c:if>
        						<c:if test="${status.index==2 }">
        							</a><tr  height="20" bgcolor="#FAFCF5"><td align="right"><a href="">更多...&nbsp;&nbsp;<a href=""></td></tr>
        						</c:if>
                 		</c:forEach>
                 	</c:otherwise>
            </c:choose>   --%>
        </table>                        
    </center>
   
</body>
</html>