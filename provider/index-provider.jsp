<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bean.*,model.*,java.util.*"
    %>
 <%
 Boolean loginProvider = (Boolean) request.getSession().getAttribute("provider-loggato");
 if(loginProvider == null || loginProvider == false) {
	 response.sendRedirect("../index.jsp#accedi");
 }
 
ServizioDAO model = new ServizioDAO();
NotiziaDAO modelNotizia = new NotiziaDAO();
String userProvider = (String)request.getSession().getAttribute("usernameProvider");
 
Servizio bean = model.getServiziobyUser(userProvider);
Collection<Notizia> notizie = modelNotizia.getAllNotiziaByServizio(bean.getNomeServizio());

if(notizie == null || notizie.size() == 0) {
	response.sendRedirect("../InsertNews?nomeServizio="+bean.getNomeServizio());
}


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
    <link rel="stylesheet" href="../css/card-provider.css">
    <link rel="stylesheet" href="../css/card-carousel.css">
    <link rel="stylesheet" href="../css/popup.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<title>Home Page Provider</title>
</head>
<body>
<nav class="navbar container-fluid navbar-expand-lg navbar-light bg-light">
<img class="logo" alt="logo" src="../<%=bean.getUrlLogo()%>" style="cursor: pointer;">
  <a class="navbar-brand" href="./index-provider.jsp" style="text-transform: capitalize"><%=bean.getNomeServizio()%></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home Page<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#notizie">Notizie</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../InsertNews?nomeServizio=<%=bean.getNomeServizio()%>">Inserisci Notizia</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../assistenza.jsp">Assistenza</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModal">Cancella Servizio</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../LogoutProvider">Disconnetti</a>
      </li>
    </ul>
  </div>
</nav>
<br>
<br>

<!-- dialog box per confermare la cancellazione del servizio -->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cancellare Servizio</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       		Sei sicuro di cancellare il servizio <%=bean.getNomeServizio() %> e il proprio account ?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-link" data-dismiss="modal">Torna indietro</button>
        <button type="button" onclick="deleteServizio('<%=userProvider%>')"class="btn btn-danger">Delete</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
function deleteServizio(user) {
	$(document).ready(function(){
		$.post("../DeleteProvider",
				{
					username: user
				}, function(data,status){
					 window.open("../index.jsp","_self");
				});
	});
}




</script>


<h1 id="notizie" style="text-align: center;">News</h1>

 <div class="container" style="border: 1px solid black; border-radius: 5px;" data-toggle="tooltip" title="Premi due volte per scorrere">
	<div class="owl-carousel owl-theme">
	<%if(notizie != null && notizie.size() != 0) {
		Iterator<?> it = notizie.iterator();
		while (it.hasNext()) {
			Notizia beanNotizia = (Notizia) it.next();
	%>
		<div class="item">
		<div class="col mb-4">
			<div class="card" style="height: 350px!important;">
				<img alt="<%=beanNotizia.getTitolo()%>" data-src="../<%=beanNotizia.getUrlLogoNews()%>" onclick="window.open('./dettaglio-news.jsp?idNotizia=<%=beanNotizia.getId()%>','_self')" class="card-img-top owl-lazy" style=" cursor: pointer;width: 200px; height: 200px;  display: block; margin-left: auto;margin-right: auto;">
				<div class="card-body">
					<h5 class="card-title" style=" cursor: pointer; text-transform: capitalize" onclick="window.open('./dettaglio-news.jsp?idNotizia=<%=beanNotizia.getId()%>','_self')"><%=beanNotizia.getTitolo()%></h5>
					<p class="card-text" onclick="window.open('./dettaglio-news.jsp?idNotizia=<%=beanNotizia.getId()%>','_self')" style="cursor: pointer; text-overflow: ellipsis; overflow: hidden;   white-space: nowrap;"><%=beanNotizia.getContenuto()%></p>
					<div class="end">
         				<a href="../UpdateNews?idNotizia=<%=beanNotizia.getId()%>"><img src='../image/modify.png' style="width: 35%;"></a>
            			<a href="../DeleteNews?idNotizia=<%=beanNotizia.getId()%>"><img id="delete" onclick="" style="cursor:pointer; width: 15%; margin-left: 100px; "src='../image/delete.png'></a>
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
		    	  items: 3,
		    	  dots: false,
		    	  loop: false
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
                <img onclick="window.open('<%= getServletContext().getContextPath() %>/index.jsp','self')" src="<%=getServletContext().getContextPath() %>/image/logo.PNG">
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
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="../bootstrap/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>