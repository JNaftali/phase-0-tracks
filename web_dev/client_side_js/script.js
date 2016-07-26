console.log("Hello World! What's up?")

var clicky = document.getElementsByTagName('div')[0];

console.log(clicky)

clicky.style.height = '200px '
clicky.style.width = '700px '



/*
RELEASE 1

clicky.onclick = function() {
	console.log('clicked');
	if(clicky.style.backgroundColor == 'blue')
	{
		clicky.style.backgroundColor = 'yellow';
	}
	else
	{
		clicky.style.backgroundColor = 'blue';
	}
};

*/

//RELEASE 2: refactor the work from release 1 to use an event listener

function toggleDivColor(event) {
  console.log('clicked');
  console.log(event);
  
	if(clicky.style.backgroundColor == 'blue')
	{
		clicky.style.backgroundColor = 'yellow';
	}
	else
	{
		clicky.style.backgroundColor = 'blue';
	}
}

clicky.addEventListener("click",toggleDivColor);