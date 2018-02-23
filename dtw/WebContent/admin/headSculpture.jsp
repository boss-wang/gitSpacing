<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
	<table>
		<c:forEach  var="headsc"  items="${list }" varStatus="n" step="3" >
		<tr>
		<c:if test="${n.index==0 }">
		<c:forEach  var="headsc"  items="${list }" varStatus="m"  >
			
				<c:if test="${m.index==0 }">
					<td><img alt="" src="${headsc.picturePath }"></td>
					</c:if>
				<c:if test="${m.index==1}">
					<td><img alt="" src="${headsc.picturePath }"></td>
					</c:if>
					<c:if test="${m.index==2}">
					<td><img alt="" src="${headsc.picturePath }"></td>
					</c:if>
			
		</c:forEach>
		</c:if>
		<c:if test="${n.index==3 }">
		<c:forEach  var="headsc"  items="${list }" varStatus="m"  >
			
				<c:if test="${m.index==3 }">
					<td><img alt="" src="${headsc.picturePath }"></td>
					</c:if>
				<c:if test="${m.index==4}">
					<td><img alt="" src="${headsc.picturePath }"></td>
					</c:if>
					<c:if test="${m.index==5}">
					<td><img alt="" src="${headsc.picturePath }"></td>
					</c:if>
			
		</c:forEach>
		</c:if>
		<c:if test="${n.index==6 }">
		<c:forEach  var="headsc"  items="${list }" varStatus="m"  >
			
				<c:if test="${m.index==6 }">
					<td><img alt="" src="${headsc.picturePath }"></td>
					</c:if>
				<c:if test="${m.index==7}">
					<td><img alt="" src="${headsc.picturePath }"></td>
					</c:if>
					<c:if test="${m.index==8}">
					<td><img alt="" src="${headsc.picturePath }"></td>
					</c:if>
			
		</c:forEach>
		</c:if>
		
		</tr>
		</c:forEach>
		<tr>
			<td colspan="3">
			<input type="button" value="上传头像">
			<input type="button" value="返回">
			</td>
			
		</tr>

	</table>
</body>