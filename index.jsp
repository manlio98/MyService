<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*,java.util.*,bean.*"%>
    
 <%String error = (String)request.getSession().getAttribute("error-message"); //prelevare l'errore dal loginAbbonato
 String errorAbbonato = (String)request.getSession().getAttribute("error-message-abbonato");
 
 if(errorAbbonato == null){
	 errorAbbonato = null;
 }
 
 
 
   String errorCampi = (String)request.getSession().getAttribute("error-campi");
 if(error == null) {
	 error = null;
 }
 if(errorCampi == null) {
	 errorCampi = null;
 }
 
 ServizioDAO model = new ServizioDAO();
 
 Collection<Servizio> servizi = model.getAllServizio();
 
 
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/slides.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/registerProvider.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/card-carousel.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style type="text/css">
    .owl-prev {
    	left: -30px;
    
    }
    
    .owl-next {
    	right: -30px;
    
    }
    
    .owl-prev, .owl-next{
    	position: absolute;
    	top: 30%;
    }
    
    .owl-prev span, .owl-next span {
    	font-size: 60px;
    	color: #787878;
    }
    
    .owl-theme .owl-nav[class*="owl-"]:hover {
    	background-color: transparent;
    }
    </style>
    
<title>Home Page</title>
</head>
<body>
<nav class="navbar container-fluid navbar-expand-lg navbar-light bg-light">
<img class="logo" alt="logo" src="image/logo.PNG">
  <a class="navbar-brand" href="#">MyService</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse"  id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link"  href="#servizi">Servizi <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#accedi">Accedi</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#registrazione">Registrazione</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#chisiamo">Chi siamo</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./assistenza.jsp">Assistenza</a>
      </li>
    </ul>
  </div>
</nav>

<div id="carouselExampleControls " class="carousel slide" data-ride="carousel">
  <div class="carousel-inner container"  style="border: 1px solid black; border-radius: 5px;">
    <div class="carousel-item active container" data-interval="2000">
      <img src="<%=getServletContext().getContextPath()%>/image/servizi/calcio/calcio.png" class="d-block w-100" alt="slides1">
    </div>
    <div class="carousel-item container" data-interval="2000">
    <img src="<%=getServletContext().getContextPath()%>/image/servizi/moda/moda.png" class="d-block w-100" alt="slides2">
    </div>
    <div class="carousel-item container">
    <img src="<%=getServletContext().getContextPath()%>/image/servizi/cucina/cucina.png" class="d-block w-100" alt="slides3">
    </div>
  </div>
</div>
<br>
<br>

<h1 id="servizi" style="text-align: center;">Servizi</h1>

<div class="container" style="border: 1px solid black; border-radius: 5px;" data-toggle="tooltip" title="Premi due volte per scorrere">
	<div class="owl-carousel owl-theme">
	<%if (servizi != null && servizi.size()!=0) {
	Iterator<?> it = servizi.iterator();
	while (it.hasNext()) {
		Servizio bean = (Servizio) it.next();
	%>
		<div class="item">
		<div class="col mb-4">
			<div class="card" style="height: 420px!important;">
				<img alt="<%=bean.getNomeServizio()%>" data-src="./<%=bean.getUrlLogo()%>" class="card-img-top owl-lazy" style=" cursor: grab;width: 100px; height: 100px;  display: block; margin-left: auto;margin-right: auto;">
				<div class="card-body">
					<h5 class="card-title" style=" cursor: grab; text-transform: capitalize"><%=bean.getNomeServizio()%></h5>
					<p class="card-text" style=" cursor: grab;"><%=bean.getDescrizione()%></p>
					<div class="end">
         				<button type="button" onclick="window.open('./abbonato/register-abbonamento.jsp?nomeServizio=<%=bean.getNomeServizio()%>&costo=<%=bean.getCosto()%>','_self')" class="btn btn-warning">Abbonati</button>
             				<p id="costo">Costo:<%=bean.getCosto()%>&euro;</p>
       				</div>
				</div>
			</div>	
		</div>
	</div>
	
	<%}
	} %>
	</div>
</div>


<script  src="javascript/card-carousel.js"></script>
<script type="text/javascript">

$('.owl-carousel').owlCarousel({
	autoplay: true,
	autoplayHoverPause: true ,
	items: 4,
	nav: true,
	dots: true,
	loop: true,
	lazyLoad: true,
	margin: 5,
	stagePadding: 5,
	responsive: {
		0: {
			items: 1,
			dots: false
		}, 
		  485: {
			  items: 2,
			  dots: false
		  },
		    728: {
		    	items: 3,
		    	loop: true
		    },
		      960: {
		    	  items: 4,
			      loop: true
		      },
		      1200: {
		    	  items: 4,
		    	  dots: false
		      }
		
	}
});


$('.owl-carousel').on('mousewheel','.owl-stage',function(e){
	if(e.deltaY>0){
		$('.owl-carousel').trigger('next.owl');
	}else {
		$('.owl-carousel').trigger('prev.owl');
	}
	e.preventDefault();
});


</script>




<br>
<br>
<h1 id="accedi" style="text-align: center;">Accedi</h1>

<div class="container" id="accedi" style="justify-content: space-around;   display: flex; border: 1px solid black;  border-radius: 5px;">

<div>
<br>
<form class="px-4 py-3" action="LoginAbbonato" method="post">
<p style="color: black">
Accedi come abbonato
</p>
    <div class="form-group">
      <label for="exampleDropdownFormEmail1">Username</label>
      <input type="text" name="username" class="form-control" id="exampleDropdownFormEmail1" placeholder="Username">
    </div>
    <div class="form-group">
      <label for="exampleDropdownFormPassword1">Password</label>
      <input type="password" name="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password">
    </div>
    <%if(errorAbbonato != null) { %>
     <div class="alert alert-danger" role="alert">
     <%=errorAbbonato%>
     </div>
     <% request.getSession().removeAttribute("error-message-abbonato");
}
%>
    <button type="submit" class="btn btn-warning">Sign in</button>
  </form>
</div>
<div>
<br>
<form class="px-4 py-3" action="LoginProvider" method="post">
<p style="color: black">Accedi come provider
</p>
    <div class="form-group">
      <label for="exampleDropdownFormEmail1">Username</label>
      <input type="text" name="usernameProvider" class="form-control" id="exampleDropdownFormEmail1" placeholder="Username" required>
    </div>
    <div class="form-group">
      <label for="exampleDropdownFormPassword1">Password</label>
      <input type="password" name="passwordProvider" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password" required>
    </div>
    <%if(error !=null) { %>
    <div class="alert alert-danger" role="alert">
 <%=error%>
</div>
<%request.getSession().removeAttribute("error-message");
}
%>
    <button type="submit" class="btn btn-warning">Sign in</button>
  </form>

</div>
</div>
<br>
<br>
<h1 id="registrazione" style="text-align: center;">Registrazione Provider</h1>
<div class="container" style="border: 1px solid black;  border-radius: 5px;">
<div style="justify-content: center; display: flex;">
<form id="regForm" action="RegisterProvider" method="post">
<%if(errorCampi!=null) { %>
<div class="alert alert-danger" role="alert">
<%=errorCampi%>
</div>
<%
request.getSession().removeAttribute("error-campi");
} %>

<!-- One "tab" for each step in the form: -->
<div class="tab">
  <p>Nome<input name="nome" placeholder="Nome..."  class="form-control" required></p>
  <p>Cognome<input name="cognome" placeholder="Cognome..." class="form-control" required></p>
</div>
<!-- Inserire alla fine il controllo di tutti i campi e inserire anche delle info sui campi -->
<div class="tab">
  <p>Email<input name="email" placeholder="E-mail..." class="form-control" onblur="isEmail(regForm.email)" required></p>
  <p>Telefono<input name="telefono" placeholder="Telefono..." class="form-control" onblur="isPhone(regForm.telefono)" required></p>
</div>




<div class="tab">
  <p>Username<input name="username" placeholder="Username..." class="form-control" onblur="checkUsername(regForm.username)" required><small id="passwordHelpInline" class="text-muted">
    </small></p>
  <p>Password<input type="password" name="password" id="passw" placeholder="Password..." class="form-control" onblur="isPassword(regForm.password)"required><small id="passwordHelpInline" class="text-muted">
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
</div>
<div style="overflow:auto;">
  <div style="float:right;">
    <button type="button" id="prevBtn" class="btn btn-warning" onclick="nextPrev(-1)">Previous</button>
    <button type="button" id="nextBtn" class="btn btn-warning" onclick="nextPrev(1)">Next</button>
  </div>
</div>


<!-- Circles which indicates the steps of the form: -->
<div style="text-align:center;margin-top:40px;">
  <span class="step"></span>
  <span class="step"></span>
  <span class="step"></span>
</div>

<script type="text/javascript">
function checkUsername(username){
	$(document).ready(function(){
		$.post("CheckUsername",
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
<script src="javascript/checkinput.js"></script>
</form>
</div>
</div>
<br>
<br>
<h1 id="chisiamo" style="text-align: center;">Chi siamo</h1>
<div class="container" style="border: 1px solid black;  border-radius: 5px;">
            <div id='chisiamo'>
             	 <div class="chisiamo" >
             	 <p>
		                MyService &egrave; uno strumento molto potente per realizzare un vostro servizio online.
		                Dotato di tutti gli strumenti necessari per realizzare un servizio completo.
		                Combina una notevole semplicit&agrave d'uso ad uno ottimo aspetto grafico.
             	 </p>
             	 <p>
              			Fino a qualche anno fa la mancanza di contatto con il
						web, l'impossibilit&agrave di possedere un pc, tablet ecc..
						scoraggiavano gli utenti nell'abbonarsi un servizio<br>
						Oggi la situazione &egrave completamente diversa:
						i servizi online sono in costante crescita.<br>
						Sempre pi&ugrave persone scelgono di abbonarsi ai servizi
						online, complice anche una maggiore fiducia nel
						trattamento dei dati personali e nei metodi di pagamento.<br><br>
						
						I vantaggi per gli utenti sono innumerevoli:
						 <ul>
							 <li>la comodit&agrave di informarsi direttamente a casa propria;
							 <li>la possibilit&agrave di abbonarsi rapidamente ai vari servizi;
							 <li>il vantaggio di abbonarsi ai servizi difficilmente reperibili nelle proprie citt&agrave
						 </ul>
						Realizzare un sito  porta vantaggi anche alle grandi aziende di servizi, ma anche piccole
						<ul>
						  <li>attraverso una piattaforma  online chiunque pu&ograve ottenere una maggiore visibilit&agrave
						  <li>qualunque cliente, da ogni parte del mondo, potr&agrave abbonarsi ai servizi;
						  <li>di conseguenza il provider vedr&agrave incrementare il fatturato dato che gli verr&agrave offerta la possibilit&agrave di ottenere una visibilit&agrave in ogni angolo del mondo e non dovr&agrave limitarsi pi&ugrave alla propria citt&agrave o paese.
						</ul>
						Pertanto l'obiettivo principale del  progetto eograve la realizzazione di una piattaforma web che
						permetta di creare un proprio servizio per informare alla gente cosa accade nel mondo.
						
              	</p>
              </div>

</div>
</div>
<br>
<br>

<div class="footer">
            <span class='footerImg' >
                <img onclick="window.open('<%=getServletContext().getContextPath() %>/index.jsp','self')" src="image/logo.PNG">
                <ul>
                        <li><i class="fas fa-envelope"></i> <a href='mailto:myserviceadm2020@gmail.com' target='_blank'>Email</a></li>
                        <li><i class="fab fa-facebook-messenger"></i> <a href='https://m.me/227015998537337' target='_blank'>Invia un messaggio</a></li>
                        <li><i class="fas fa-info"></i> <a href='#chisiamo' target='_self'>Chi siamo?</a></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li style="font-size:9px;"><a href='<%=getServletContext().getContextPath() %>/condizioni.pdf' target='_blank'>Condizioni generali di uso e vendita</a></li>
                        <li style="font-size:9px;"><a href='<%=getServletContext().getContextPath() %>/privacy.pdf' target='_blank'>Informativa sulla privacy </a> </li>
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
<!-- Optional JS-->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="javascript/registerProvider.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
   <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>  -->
    <script src="bootstrap/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>