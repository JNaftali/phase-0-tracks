2. What are some of the key design philosophies of the Linux operating system?

Many of them are derived from the unix philosophies:
  * have each program do one thing well
  * write programs so they can work with other programs (their outputs can be easily used as inputs to other programs)
  * write programs to work with text streams, since everything can work with that

3. In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?

A VPS is a simulation of a computer located on another, larger computer. The advantages are that such simulations are easy to create and nearly completely isolated from the main system - if you break it, just make another one/

4. Optional bonus question: Why is it considered a bad idea to run programs as the root user on a Linux system?

There are protections put in place to keep people from running scripts that will break their computer without realizing it - denying user accounts write access to certain files, for example. If you're root you can do anything so a bad keystroke can destroy your computer without warning