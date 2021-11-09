# MEMBERS PAGE

## Explanations

In the footer, we notice that `© BornToSec` is clickable. After clicking on it, we come on a new page, but nothing useful. Let's check the HTML code...

We finally see some comments inside the HTML, pretty long comment. Let's grab only the useful informations:
```html
<!--
You must cumming from : "https://www.nsa.gov/" to go to the next step
-->
...
<!--
Let's use this browser : "ft_bornToSec". It will help you a lot.
-->
```

It seems like if we want to go to the next step, we will need to come from `nsa` website AND use a browser called `ft_bornToSec`.

This is possible by modifying the header of our HTTP call. To do that we will be using `curl` and to fake the website we come from & browser we use, we will modify the `referer` and `user-agent` of the header.
```
curl --referer https://www.nsa.gov/ --user-agent ft_bornToSec http://192.168.56.4/index.php?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c
```

Bingo ! We've got a response containing the flag:
```html
<center><h2 style="margin-top:50px;"> The flag is : f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188</h2><br/><img src="images/win.png" alt="" width=200px height=200px></center>
```

---

## How to avoid that security breach ?

If you want to restrict some pages, the best practice would be to have a normal authentication system, and then let the access of some pages according to the user role.

---

#### Sources

- [user-agent & referer modification in header](https://everything.curl.dev/http/requests#referer)
