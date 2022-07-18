<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bean.*,model.*,java.util.*"%>
 
 <%
 
 Boolean abbonatoLoggato = (Boolean) request.getSession().getAttribute("abbonato-loggato");
 if(abbonatoLoggato == null || abbonatoLoggato == false) {
	 response.sendRedirect("../index.jsp#accedi");
 }

 String username = (String) request.getSession().getAttribute("usernameAbbonato");
 
 AbbonatoDAO modelAbbonato = new AbbonatoDAO();
 Abbonato abbonato = modelAbbonato.getAbbonatobyUser(username);
 ServizioDAO modelServizio = new ServizioDAO();
 Collection<Servizio> servizi = modelServizio.getServizibyUserNotAbbonati(username);
 
 
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/slides.css">
    <link rel="stylesheet" href="../css/registerProvider.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/card-carousel.css">
    
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<title>Home Page Servizi non abbonati</title>
</head>
<body>
<nav class="navbar container-fluid navbar-expand-lg navbar-light bg-light">
<img class="logo" alt="logo" src="../image/logo.PNG">
  <a class="navbar-brand" href="./index-abbonato.jsp" style="text-transform: capitalize"><%=abbonato.getNome() %> <%=abbonato.getCognome()%></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="../index.jsp#servizi">Home Page<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./index-abbonato.jsp#servizi">I miei Servizi</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../assistenza.jsp">Assistenza</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../LogoutProvider">Disconnetti</a>
      </li>
    </ul>
  </div>
</nav>
<br>
<br>
<h1 style="text-align: center;">Abbonati ai Servizi</h1>

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
				<img alt="<%=bean.getNomeServizio()%>" data-src="../<%=bean.getUrlLogo()%>" class="card-img-top owl-lazy" style=" cursor: grab;width: 100px; height: 100px;  display: block; margin-left: auto;margin-right: auto;">
				<div class="card-body">
					<h5 class="card-title" style=" cursor: grab; text-transform: capitalize"><%=bean.getNomeServizio()%></h5>
					<p class="card-text" style=" cursor: grab;"><%=bean.getDescrizione()%></p>
					<div class="end">
         				<button type="button" onclick="window.open('./register-abbonamento-user.jsp?nomeServizio=<%=bean.getNomeServizio()%>&costo=<%=bean.getCosto()%>','_self')" class="btn btn-warning">Abbonati</button>
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


<script  src="../javascript/card-carousel.js"></script>
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









<script src="../javascript/registerProvider.js"></script>
   <!--  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>  -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="../bootstrap/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>