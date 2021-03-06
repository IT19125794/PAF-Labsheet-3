<%@ page import="com.Item" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%
//Insert item---------------------------------
if (request.getParameter("itemCode") != null)
 {
 Item itemObj = new Item();
 String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
 request.getParameter("itemName"),
 request.getParameter("itemPrice"),
 request.getParameter("itemDesc"));
 session.setAttribute("statusMsg", stsMsg);
 }

//Update item----------------------------------
if (request.getParameter("itemID") != null)
 {
 Item itemObj = new Item();
 String stsMsg2 = itemObj.updateItem(request.getParameter("itemCode"),
request.getParameter("itemName"),
request.getParameter("itemPrice"),
request.getParameter("itemDesc"));
 session.setAttribute("statusMsg", stsMsg2);
 }

//Delete item----------------------------------
if (request.getParameter("itemID") != null)
 {
 Item itemObj = new Item();
 String stsMsg3 = itemObj.deleteItem(request.getParameter("itemID"));
 session.setAttribute("statusMsg", stsMsg3);
 }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>
<h1>Items Management</h1>
	<form method="post" action="Item.jsp">
 		Item code: <input name="itemCode" type="text"><br>
 		Item name: <input name="itemName" type="text"><br>
 		Item price: <input name="itemPrice" type="text"><br>
 		Item description: <input name="itemDesc" type="text"><br>
 		<input name="btnSubmit" type="submit" value="Save">
	</form>
<%
 out.print(session.getAttribute("statusMsg"));
%>
<br>
<%
 Item itemObj = new Item();
 out.print(itemObj.readItems());
%>
</body>
</html>
