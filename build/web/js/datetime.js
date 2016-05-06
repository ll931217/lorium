function tDate(id)	{
	date = new Date();
	year = date.getFullYear();
	month= date.getMonth();
	months=new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
	d = date.getDate();
	day = date.getDay();
	days= new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
	rDate = 'Date: '+ days[day]+', ' + d + ' ' + months[month] + ' ' + year
	document.getElementById(id).innerHTML = rDate;
	setTimeout('tDate("'+id+'");','1000');
	return true;
}

function tTime(id) {
	h = date.getHours();
	if(h<10) {
		h="0"+h;
	}
	m = date.getMinutes();
	if(m<10) {
		m = "0" + m;
	}
	s = date.getSeconds();
	if(s<10) {
		s = "0" + s;
	}
	rTime = 'Time: '+h+':'+m+':'+s;
	document.getElementById(id).innerHTML = rTime;
	setTimeout('tTime("'+id+'");','1000');
	return true;
}