<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.paypal.api.payments.PayerInfo,com.paypal.api.payments.Transaction"%>
    
    <%
    
    String paymentId = request.getParameter("paymentId");
    String payerId = request.getParameter("PayerID");
    
    PayerInfo payer = (PayerInfo) request.getSession().getAttribute("payer");
  /*
    if(payer == null) {
    	payer = null;
    }else {
    	payer = (PayerInfo) request.getSession().getAttribute("payer");
    }
    */
    Transaction transaction = (Transaction) request.getSession().getAttribute("transaction"); 
    /*
    if(transaction == null) {
    	transaction = null;
    }else {
    	transaction = (Transaction) request.getSession().getAttribute("transaction");
    }
   */
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/slides.css">
    <link rel="stylesheet" href="../css/registerProvider.css">
    <link rel="stylesheet" href="../css/footer.css">
   <link rel="stylesheet" href="../css/register-service.css"> 
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
<title>Review Payment</title>
</head>
<body>
<nav class="navbar container-fluid navbar-expand-lg navbar-light bg-light">
<img class="logo" alt="logo" src="../image/logo.PNG">
  <a class="navbar-brand" href="./index-abbonato.jsp">MyService</a>
</nav>
<br>
<h1 style="text-align: center;">Review Payment</h1>

<div class="container" style="border: 1px solid black;  border-radius: 5px; text-align: center; display: flex; justify-content: center;">
	<form action="../EsecuzionePagamento" method="post">
	<table>
		<tr>
			<td colspan="2"><b>Transaction Details:</b></td>
			<td>
				<input type="hidden" name="paymentId" value="<%=paymentId%>" />
				<input type="hidden" name="PayerID" value="<%=payerId%>" />
			</td>
		</tr>
		<tr>
			<td>Description:</td>
			<td><%=transaction.getDescription() %></td>
		</tr>
		<tr>
			<td>Subtotal:</td>
			<td><%=transaction.getAmount().getDetails().getSubtotal()%></td>
		</tr>
		<tr>
			<td>Shipping:</td>
			<td><%=transaction.getAmount().getDetails().getShipping()%></td>
		</tr>
		<tr>
			<td>Tax:</td>
			<td><%=transaction.getAmount().getDetails().getTax()%></td>
		</tr>
		<tr>
			<td>Total:</td>
			<td><%=transaction.getAmount().getTotal() %></td>
		</tr>	
		<tr><td><br/></td></tr>
		<tr>
			<td colspan="2"><b>Payer Information:</b></td>
		</tr>
		<tr>
			<td>First Name:</td>
			<td><%=payer.getFirstName()%></td>
		</tr>
		<tr>
			<td>Last Name:</td>
			<td><%=payer.getLastName()%></td>
		</tr>
		<tr>
			<td>Email:</td>
			<td><%=payer.getEmail()%></td>
		</tr>
		<tr><td><br/></td></tr>
		<tr>
			<td colspan="2" align="center">
				<a href="../TornaIndietro" class="btn btn-link">Torna indietro</a>
				<button type="submit" class="btn btn-warning" value="Paga ora">Paga ora</button>
			</td>
		</tr>		
	</table>
	</form>
</div>
<br>
<br>

<script type="text/javascript">
function TornaIndietro() {
	$(document).ready(function(){
		$.post("../TornaIndietro",
				{
				}, function(data,status){
					 
				});
	});
}
</script>


<div class="footer">
            <span class='footerImg' >
                <img onclick="window.open('<%= getServletContext().getContextPath() %>/index.jsp','self')" src="<%= getServletContext().getContextPath() %>/image/logo.PNG">
                <ul>
                        <li><i class="fas fa-envelope"></i> <a href='mailto:myserviceadm2020@gmail.com' target='_blank'>Email</a></li>
                        <li><i class="fab fa-facebook-messenger"></i> <a href='https://m.me/227015998537337' target='_blank'>Invia un messaggio</a></li>
                        <li><i class="fas fa-info"></i> <a href='#chisiamo' target='_self'>Chi siamo?</a></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li style="font-size:9px;"><a href='<%= getServletContext().getContextPath() %>/condizioni.pdf' target='_blank'>Condizioni generali di uso e vendita</a></li>
                        <li style="font-size:9px;"><a href='<%= getServletContext().getContextPath() %>/privacy.pdf' target='_blank'>Informativa sulla privacy </a> </li>
                        <li style="font-size:9px;"><a href='#servizi'> &copy;2010-2019 MyService.com </a></li>
                        <li></li>
                        <li></li>
                        <li style="color: white;"> &nbsp;&nbsp;&nbsp;P.IVA IT09767543986</li>
                        </ul>
            </span>
            
            <span class='social'>
                <i class="fab fa-facebook-square" onclick="window.open('https://www.facebook.com/MyService-227015998537337/?modal=admin_todo_tour','_blank')"></i>
                <i class="fab fa-instagram" onclick="window.open('https://www.instagram.com/myserviceadm2020?fbclid=IwAR024yMb9hJnpnm7yIHgq8pPOWTYXWNd-t_Km7YaFD4qSRtr3qQpPdBqg-A','_blank')"></i>
            </span>
            
        </div>    






 <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../javascript/registerProvider.js"></script>
   <!--  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>  -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="bootstrap/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>