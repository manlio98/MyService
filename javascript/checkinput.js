function isEmail(uemail) {
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (uemail.value.match(mailformat)) {
    	$(uemail).css("background-color","rgba(0, 255, 0, 0.3)");
    	return true;
    }
    else {
    	$(uemail).css("background-color","rgba(255,0,0,0.2)");
    	return false;
    }
}



function isPhone(phone) {
var phoneno = /^\d{10}$/;
 if(phone.value.match(phoneno)) {
	 $(phone).css("background-color","rgba(0, 255, 0, 0.3)");
	 return true;
 } else {
	 $(phone).css("background-color","rgba(255,0,0,0.2)");
	 return false;
 }


} 

/*password lettere e numeri
almeno un numero, alfanumerico minuscolo, maiuscolo, almeno un carattere speciale, lunghezza 6-25,
*/
function isPassword(password) {
	var letters = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[_.,\-+*!#@?])([a-zA-Z0-9_.,\-+*!#@?]{6,25})$/;
	if(password.value.match(letters)){
		$(password).css("background-color","rgba(0, 255, 0, 0.3)");
		return true
	}else {
		$(password).css("background-color","rgba(255,0,0,0.2)");
		return false
	}
}



/*
function checkUsername(username) {
	 $.post("../CheckUsername",
	       	function(result){
			       		alert("ciaoo");
	       	  });
	
}

*/



