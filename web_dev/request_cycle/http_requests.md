2. What are some common HTTP status codes?
According to the REST API tutorial web site, the top 10 most common status codes are:
2xx codes denote success:
  200 = 'ok'
  201 = 'created'
  204 = 'no content'
3xx codes are redirects:
  304 = 'not modified' - means the requested resource hasn't been modified since it was last requested. Used in response to a conditional 'get' request... so the client asks for the page if it's changed, but if it hasn't it will just use a cached version?
4xx codes denote a client error:
  400 = 'bad request'
  401 = 'unauthorized'
  403 = 'forbidden' - same as 'unauthorized' except authentication won't help
  404 = 'not found'
  409 = 'conflict' - some piece of information the user submitted conflicts with a piece of information the server has. Like trying to push to a git branch that already has conflicting changes made to it, maybe?
5xx codes denote a server error
  500 = 'Internal server error'

3. What is the difference between a GET request and a POST request? When might each be used?
  A 'get' request downloads information from the server (like loading a web page) and a post request sends information to the server (like a message on a message board)

4. Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?
pre-research - cookies are bits of information that web sites store on your computer
post-research - cookies are created and modified in response to HTTP requests