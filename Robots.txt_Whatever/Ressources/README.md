# MEMBERS PAGE

## Explanations

Websites often have a `robots.txt` file. This file tells search engine crawlers which URLs the crawler can access on your site. This is used mainly to avoid overloading your site with requests.  

By looking at it we see a `./whatever` folder. Inside it we can find a file `htpasswd`, this one seems to contain a login and a password : `root:8621ffdbc5698829397d97767ac13db3`. After decrypting from MD5 : `root:dragon`. But where can we use it ?

There is a useful command that can also discover for us some hidden directories : `nmap -script http-enum.nse [host]`. After using it we discover the route `/admin` : bingo, we can use our precedent identifiers !

We now have the flag : `d19b4823e0d5600ceed56d5e896ef328d7a2b9e7ac7e80f4fcdb9b10bcb3e7ff`

---

## How to avoid that security breach ?

The alternative could be to use `.htaccess`. It will mainly handle `page redirections`, `limit the access with a password` and `set a 404 error page`.  

On the other hand, `robots.txt` is just going to handle the indexation robots and decides on which directories/files they can't have an access.

---

#### Sources

- [nmap to enumerate webserver directories](https://developers.google.com/search/docs/advanced/robots/intro)
- [Security risks robots.txt](https://www.searchenginejournal.com/robots-txt-security-risks/289719/)
- [Prevent robots.txt exclusion from wget download](https://www.gnu.org/software/wget/manual/html_node/Robot-Exclusion.html#:~:text=If%20you%20know%20what%20you,off%20url%20...%20'.)  
- [Recursive accept](https://www.gnu.org/software/wget/manual/html_node/Recursive-Accept_002fReject-Options.html)
- [.htaccess & robots.txt](https://aidewindows.net/pageweb_htaccess.php)
