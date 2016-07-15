var colors = [ "red", "blue", "yellow", "green" ];
var names = [ "ed", "dallas", "star", "buck" ];
colors.push("purple");
names.unshift("prancer");
console.log(colors);
console.log(names);

horses = {};
//{
//  ed: red
//  dallas: blue
//  {name: ed, color:blue}
//}

for (var i in colors) {
  horses[colors[i]] = names[i];
}

console.log(horses)