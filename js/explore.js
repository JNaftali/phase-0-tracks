//reverse - takes a string and reverses it

//make a blank 'result' string
//loop until a counter (i) that starts at the length of the string less (one) drops below 0 (counting down)
//  each loop look at the character at the i index and add it to the end of the result string
//return the result string

function reverse(string) {
  var result = '';
  for (var i = string.length - 1; i >= 0; i--) {
    result = result + string.charAt(i);
  }
  return result;
}
console.log(reverse("hello"));

var silly = reverse("supercalifragilisticexpealidocious");

if ( true ) {
  console.log(silly);
}