# MEMBERS PAGE

## Explanations

Websites often have a `robots.txt` file. This file tells search engine crawlers which URLs the crawler can access on your site. This is used mainly to avoid overloading your site with requests.  

By looking at it we see a `./hidden` folder. After a deeper look at it, we can notice that there is a `README` with lot of other directories, and each of these directories have a README and child directories too.

By reading some of the READMEs, we have some messages telling us we are in the wrong place: 
```
Tu veux de l'aide ? Moi aussi !
...
Demande à ton voisin du dessous
...
Demande à ton voisin du dessus
...
```
One of the READMEs must have the flag then !

To make it easy, we will use a script that will download every READMEs with `wget` and we will parse every file and print if one of them contains numbers instead of the messages above.

After executing that long script, we finally get an output, it is the flag: `99dde1d35d1fdd283924d84e6d9f1d820` !

---

## How to avoid that security breach ?

The alternative could be to use `.htaccess`. It will mainly handle `page redirections`, `limit the access with a password` and `set a 404 error page`.  

On the other hand, `robots.txt` is just going to handle the indexation robots and decides on which directories/files they can't have an access.

---

#### Sources

[What is robots.txt ?](https://developers.google.com/search/docs/advanced/robots/intro)
[Security risks robots.txt](https://www.searchenginejournal.com/robots-txt-security-risks/289719/)
[Prevent robots.txt exclusion from wget download](https://www.gnu.org/software/wget/manual/html_node/Robot-Exclusion.html#:~:text=If%20you%20know%20what%20you,off%20url%20...%20'.)  
[Recursive accept](https://www.gnu.org/software/wget/manual/html_node/Recursive-Accept_002fReject-Options.html)
[.htaccess & robots.txt](https://aidewindows.net/pageweb_htaccess.php)
