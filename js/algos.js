//Functions
function longPhrase(arr) {
  var phrase = arr.pop();
  for (var i in arr) {
    if (arr[i].length > phrase.length) {
      phrase = arr[i];
    }
  }
  return phrase;
}

function keyMatch(thing, other) {
  for ( var i in thing ) {
    if ( thing[i] == other[i] ) { return true };
  }
  return false;
}

function randomWord(letters) {
  var alphabet = "abcdefghijklmnopqrstuvwxyz";
  var result = '';
  for (var i = 0; i < letters; i++) {
    result += alphabet[Math.floor(Math.random()*alphabet.length)];
  }
  return result;
}

function genWords(num) {
  var result = [];
  for (var i = 0;i <num; i++) {
    result.push(randomWord(Math.ceil(Math.random()*10)));
  }
  return result;
}

//Driver code
console.log(longPhrase(["long phrase","longest phrase","longer phrase"]))
console.log(longPhrase(["this", "is", "a", "test"]))
console.log(longPhrase(["this is a test", "peter piper picked a peck of pickled peppers", "she sells sea shells by the sea shore", "Senātus Populusque Rōmānus"]))

console.log(keyMatch({name: "Steven", age: 54}, {name: "Tamir", age: 54}))
console.log(keyMatch({model: "prius", color: "gray", year: 2006}, {model: "mazda", color: "blue", year: 2013}))
console.log(keyMatch({model: "prius", color: "gray", year: 2006}, {model: "mazda", color: "gray", year: 2013}))
console.log(keyMatch({model: "prius", color: "gray", year: 2006}, {model: "mazda", color: "gray", year: "2013"}))
//not sure if you guys wanted that last example to be true. If not I would add `&& typeof thing[i] == typeof other[i]` to the conditional

for (var i = 0; i < 10; i++) {
  console.log(longPhrase(genWords(3)))
}

//Technically my function finds the longest PHRASE, not word, so if you had asked for that I would have done:

//for (var i = 0; i < 10; i++) {
//  phrases = [];
//  for (var n = 0; n < 3; n++) {
//    phrases.push(genWords(3).join(" "));
//  }
//  console.log(longPhrase(phrases));
//}