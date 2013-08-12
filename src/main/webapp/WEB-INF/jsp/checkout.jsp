<%
String name = (String)request.getAttribute("name");
String phone = (String)request.getAttribute("phone");
String email = (String)request.getAttribute("email");
String amount = (String)request.getAttribute("amount");
%>
<!DOCTYPE html>
<html class="webstore-html">
  <head>
    <style type="text/css">@media print {  .gm-style .gmnoprint, .gmnoprint {    display:none  }}@media screen {  .gm-style .gmnoscreen, .gmnoscreen {    display:none  }}</style>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <meta name="description" content="We are doing rental van that known as &quot;Van Sewa di Kuala Lumpur&quot;">
    <title>Rental van in Kuala Lumpur - Payment</title>
    <link id="css" href="/css/main.css" rel="stylesheet">
    <link id="font" href="http://fonts.googleapis.com/css?family=Syncopate" rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="/js/jquery.validate.min.js"></script>
  </head>
  <body class="webstore-body">
  <form action="/abc" method="post">
    Name: <%=name%> <br/>
    Phone: <%=phone%><br/>
    Email: <%=email%><br/>
    Amount: <%=amount%><br/>
    <input type="submit" value="Submit" />
  </form>
    
  </body>
</html>