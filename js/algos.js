function longPhrase(arr) {
  var phrase = arr.pop();
  for (var i in arr) {
    if (arr[i].length > phrase.length) {
      phrase = arr[i]
    }
  }
  return phrase
}

console.log(longPhrase(["long phrase","longest phrase","longer phrase"]))
console.log(longPhrase(["this", "is", "a", "test"]))
console.log(longPhrase(["this is a test", "peter piper picked a peck of pickled peppers", "she sells sea shells by the sea shore", "Senātus Populusque Rōmānus"]))