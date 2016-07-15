var colors = [ "red", "blue", "yellow", "green" ];
var names = [ "ed", "dallas", "star", "buck" ];
colors.push("purple");
names.unshift("prancer");
console.log(colors);
console.log(names);

var horses = {};
//{
//  ed: red
//  dallas: blue
//  {name: ed, color:blue}
//}

for (var i in colors) {
  horses[colors[i]] = names[i];
}

console.log(horses);

function Car(color, model, year) {
  this.color = color;
  this.model = model;
  this.year = year;

  this.honk = function() {
    console.log("Beep! Beep!");
  }
  console.log("Your car is here, sir and/or madam!");
}

var mycar = new Car('gray','prius', '2006');
mycar.honk();

var chriscar = new Car('blue', 'mazda', '2013');
chriscar.honk();

var combcar = new Car(chriscar.color, mycar.model, chriscar.year);
console.log(combcar)