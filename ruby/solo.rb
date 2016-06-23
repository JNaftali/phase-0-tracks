#Spells! Because I'm a dork.
#also, is it weird that I almost hope we touch on subclasses (which I
#have no idea how they work) so that I can make different schools of
#magic? It is, isn't it...

###Attributes###
  #name - getter, string
  #mana - getter/setter, integer
  #ingredients - getter, array of strings
  #result - string

###Methods###
  #cast - puts the "result" attribute
  #change_ingredient - takes a string and adds (if it isn't there) or
    #removes (if it is there) an ingredient from the list. Returns true
    #if adds and false if removes and puts what it does
  #research - takes a string (ingredient) and puts something about
    #researching the effect it might have on the spell