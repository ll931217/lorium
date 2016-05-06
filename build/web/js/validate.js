//function to check whether the string is empty
function checkBlank(string) {
    "use strict";
	//nothing entered?
	if (string.length === 0) {
		//return, yes is blank
		return true;
	}
	//all blanks
	for (var i = 0; i <= string.length-1; i++) {
		//return false if just one
		if (string.charAt(i) != "") {
			//character found
			return false;
		}
		//else return true - just blanks
		return true;
	}
}
//checks user enters a name
function checkName() {
	"use strict";
    var name = document.myForm.name.value;
	//have they left name blank?
	if (checkBlank(name)) {
		alert("Please enter your full name!");
		//display message, return false
		return false;
	}
	//no problem, return true
	return true;
}
//checks user enters a valid email
function checkEmail() {
	var email = document.myForm.email.value;
	//email blank?
	if (checkBlank(email)) {
		alert("Please enter your email address!");
		//message and return false
		return false;
	}
	//find @, starting at beginning
	var atIndex = email.indexOf("@");
	//if no @ found
	if (atIndex == -1) {
		alert("Invalid email address");
		return false;
	}
	//check for . starting at @
	if (email.indexOf(".", atIndex) == -1) {
		alert("Invalid email address");
		return false;
	}
	//if no problem encountered
	return true;
}
//checks user enters a comments
function checkComment() {
	var uName = document.myForm.comment.value;
	//have they left comments blank?
	if (checkBlank(comment)) {
		alert("Please enter comment!");
		//display message, return false
		return false;
	}
	//no problem, return true
	return true;
}
//deletes the cookie
function deleteCookie(id) {
	var date= new Date();
	date.setDate(date.getDate()-2);
	document.cookie = name + ";" + email + ';expires=' +date;
}
//Check user enters valid data, during this process I will also create a cookie from the info obtained from the form
function validateForm() {
	//is the name valid?
	if (!checkName()) {
		//if not valid, reset focus
		document.myForm.name.focus();
		//and return false
		return false;
	}
	//is email valid?
	if (!checkEmail()) {
		document.myForm.email.focus();
		return false;
	}
	date = new Date(); //set current date
	date.setDate(date.getDate() + 1);
	document.cookie = name + ";" + email + ';expires=' + date + "; path/";
	if (!checkComment()) {
		document.myForm.email.focus();
		return false;
	}
	//when no problem encountered
	return true;
	alert('Thank you for sending me your feedback!');
}