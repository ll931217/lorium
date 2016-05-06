images = new Array(
	"../images/screen/01.png",
	"../images/screen/02.jpg",
	"../images/screen/03.jpg",
	"../images/screen/04.png",
	"../images/screen/05.jpg",
	"../images/screen/06.jpg",
	"../images/screen/07.png",
	"../images/screen/08.jpg",
	"../images/screen/09.jpg",
	"../images/screen/10.jpg",
	"../images/screen/11.jpg"
);
thisPic=0;
numberImages = images.length;
				
function getNext() {
	//at the end
	if (thisPic < numberImages - 1) {
		//move to the next index of the array
		thisPic++;
	} else {
		//move to the first index
		thisPic = 0;
		}
		document.getElementById("showImage").src = images[thisPic];
	}
function getPrevious() {
//at the beginning
	if (thisPic > 0) {
	//move to the previous image of the array
		thisPic--;
	} else {
	//move to the last index
	thisPic = numberImages - 1;
	}
	document.getElementById("showImage").src = images[thisPic];
}