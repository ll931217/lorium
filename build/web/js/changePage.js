var request = new XMLHttpRequest();
function changeHome() {
	request.open("GET", "indexCon.html", true);
	request.onreadystatechange = function() {
		if(request.readyState == 4) {
			document.getElementById('adbox').innerHTML = request.responseText;
		}
	}
	request.send(null);
}
function changeWindow() {
	request.open("GET", "win7.html", true);
	request.onreadystatechange = function() {
		if(request.readyState == 4) {
			document.getElementById('adbox').innerHTML = request.responseText;
		}
	}
	request.send(null);
}
function changeDream() {
	request.open("GET", "dreamscene.html", true);
	request.onreadystatechange = function() {
		if(request.readyState == 4) {
			document.getElementById('adbox').innerHTML = request.responseText;
		}
	}
	request.send(null);
}
function changeRain() {
	request.open("GET", "rainmeter.html", true);
	request.onreadystatechange = function() {
		if(request.readyState == 4) {
			document.getElementById('adbox').innerHTML = request.responseText;
		}
	}
	request.send(null);
}
function changeObject() {
	request.open("GET", "objectdock.html", true);
	request.onreadystatechange = function() {
		if(request.readyState == 4) {
			document.getElementById('adbox').innerHTML = request.responseText;
		}
	}
	request.send(null);
}
function changeGallery() {
	request.open("GET", "gallery.html", true);
	request.onreadystatechange = function() {
		if(request.readyState == 4) {
			document.getElementById('adbox').innerHTML = request.responseText;
		}
	}
	request.send(null);
}
function changeWallpaper() {
	request.open("GET", "../wallpapers.html", true);
	request.onreadystatechange = function() {
		if(request.readyState == 4) {
			document.getElementById('adbox').innerHTML = request.responseText;
		}
	}
	request.send(null);
}
function changeScreen() {
	request.open("GET", "../screenshots.html", true);
	request.onreadystatechange = function() {
		if(request.readyState == 4) {
			document.getElementById('adbox').innerHTML = request.responseText;
		}
	}
	request.send(null);
}
function changeAbout() {
	request.open("GET", "about.html", true);
	request.onreadystatechange = function() {
		if(request.readyState == 4) {
			document.getElementById('adbox').innerHTML = request.responseText;
		}
	}
	request.send(null);
}
function changeContact() {
	request.open("GET", "contact.html", true);
	request.onreadystatechange = function() {
		if(request.readyState == 4) {
			document.getElementById('adbox').innerHTML = request.responseText;
		}
	}
	request.send(null);
}