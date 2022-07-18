<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/slides.css">
    <link rel="stylesheet" href="css/registerProvider.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    
<title>Assistenza</title>
</head>
<body>
<nav class="navbar container-fluid navbar-expand-lg navbar-light bg-light">
<img class="logo" alt="logo" src="image/logo.PNG" onclick="window.open('<%= getServletContext().getContextPath() %>/index.jsp','self')" style="cursor: pointer">
  <a class="navbar-brand" href="<%= getServletContext().getContextPath() %>/index.jsp">MyService</a>
</nav>



<h1  style="text-align: center;">Assistenza?</h1>
<div class="container" style="border: 1px solid black;  border-radius: 5px;">

<div class="row">
    <div class="col-sm">
    <i class="fas fa-envelope"></i> <a href='mailto:myserviceadm2020@gmail.com' target='_blank'>Contatta via email</a>
    <p>Da Lunedi al Venerdi</p>
    <p>Dalle 9:00 alle 18:00</p>
    </div>
    <div class="col-sm">
    <i class="fas fa-phone"></i><a href="tel:+393279351591">3279351591</a>
    <p>Da Lunedi al Venerdi</p>
    <p>Dalle 9:00 alle 18:00</p>
    </div>
    <div class="col-sm">
    <i class="fab fa-facebook-messenger"></i> <a href='https://m.me/227015998537337' target='_blank'>Contatta via messenger</a>
     <p>Da Lunedi al Sabato</p>
    <p>Dalle 9:00 alle 18:00</p>
    </div>
  </div>


</div>




<div class="footer" style="width: 100%; position: absolute; bottom: 0px;">
            <span class='footerImg' >
                <img onclick="window.open('<%= getServletContext().getContextPath() %>/index.jsp','self')" src="image/logo.PNG">
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





<script src="javascript/registerProvider.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="bootstrap/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</body>
</html>