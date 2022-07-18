<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bean.*,model.*"%>

<% String nomeServizio = request.getParameter("nomeServizio");
   String costo = request.getParameter("costo");
   
   
   ServizioDAO model = new ServizioDAO();
   
   Servizio servizio = model.getServiziobyNomeServizio(nomeServizio);
   
   if(nomeServizio==null || costo==null) {
	   response.sendRedirect("../index.jsp#servizi");
   }
   
   String errorPassword = (String)request.getSession().getAttribute("campo-password");
   if(errorPassword == null){
   	 errorPassword = null;
   }

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
    
<title>Register abbonamento</title>
</head>
<body>
<nav class="navbar container-fluid navbar-expand-lg navbar-light bg-light">
<img class="logo" alt="logo" src="../<%=servizio.getUrlLogo()%>">
  <a class="navbar-brand" href="../index-abbonato.jsp" style="text-transform: capitalize"><%=nomeServizio%></a>
</nav>
<br>
<h1 style="text-align: center;">Abbonati</h1>

<div class="container" style="border: 1px solid black;  border-radius: 5px;">
<div style="justify-content: center; display: flex;">
<form id="regForm" action="../AutorizzaPagamento" method="post">
<!-- One "tab" for each step in the form: -->
<%if(errorPassword!=null) { %>
<div class="alert alert-danger" role="alert">
<%=errorPassword%>
</div>
<%
request.getSession().removeAttribute("campo-password");
} %>
<div class="tab">
  <p>Nome<input name="nome" placeholder="Nome..." class="form-control" required></p>
  <p>Cognome<input name="cognome" placeholder="Cognome..." class="form-control" required></p>
  <p>Username<input name="username" placeholder="Username..." class="form-control" onblur="checkUsernameAbbonato(regForm.username)" required><small id="passwordHelpInline" class="text-muted">
 </small></p>
  <p>Password<input type="password"name="password" id="passw" placeholder="Password..." class="form-control" required onblur="isPassword(regForm.password)"><small id="passwordHelpInline" class="text-muted">
      It must contain 6-25 characters, at least one alphanumeric character and at least one special character
    </small></p>
  <p>Conferma Password<input type="password" name="confermaPassword"  placeholder="Conferma Password..." class="form-control" onblur="checkPassword(regForm.confermaPassword)" required><small id="demo" class="text-muted">
    </small></p>
    <script type="text/javascript">
  function checkPassword(password) {
	 var passwordInserita = document.getElementById("passw");
	 
	 if(passwordInserita.value == password.value) {
		document.getElementById("demo").innerHTML = "Le password corrispondono"
		$(password).css("background-color","rgba(0, 255, 0, 0.3)");
	 } else {
		 $(password).css("background-color","rgba(255,0,0,0.2)");
		 document.getElementById("demo").innerHTML = "Le password non corrispondono"
	 }
  }
  </script>
  <p>Nome Servizio<input name="nomeServizio" value=<%=nomeServizio%> class="form-control" readonly></p>
  <p>Costo<input name="costo" value=<%=costo%> class="form-control" readonly></p>
  <p><button type="submit" class="btn btn-warning">Abbonati</button></p>
</div>

<script type="text/javascript">
function checkUsernameAbbonato(username){
	$(document).ready(function(){
		$.post("../CheckUsernameAbbonato",
				{
					username: username.value
				}, function(data,status){
					if(data == "0") {
						 $("#passwordHelpInline").text("Username esistente !!!");
						 $(username).css("background-color","rgba(255,0,0,0.2)");
					} else {
						 $(username).css("background-color","");
						 $("#passwordHelpInline").text("");
					}
				});
	});
}
</script>


<script src="../javascript/checkinput.js"></script>

</form>
</div>
</div>
<br>
<br>


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
  <!--   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> --> 
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="bootstrap/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>