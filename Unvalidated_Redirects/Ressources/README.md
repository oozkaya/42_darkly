# Unvalidated redirects

## Explanations

Unvalidated redirects and forwards are possible when a web application accepts untrusted input that could cause the web application to redirect the request to a URL contained within untrusted input.

By modifying untrusted URL input to a malicious site, an attacker may successfully launch a phishing scam and steal user credentials.

## Let's get the Flag !

On the first page we can see 3 redirections:

- http://192.168.1.38/index.php?page=redirect&site=facebook
- http://192.168.1.38/index.php?page=redirect&site=twitter
- http://192.168.1.38/index.php?page=redirect&site=instagram

The redirected page is set directly in the query parameters, and it could be a vulnerability.

If we pass something else:

http://192.168.1.38/index.php?page=redirect&site=http://dangeroussite.com

We have the flag: `b9e775a0291fed784a2d9680fcfad7edd6b8cdf87648da647aaf4bba288bcab3`

---

## How to avoid that security breach ?

When we want to redirect a user automatically to another page (without an action of the visitor such as clicking on a hyperlink) you might implement a code such as the following:

Java

```java
response.sendRedirect("http://www.mysite.com");
```

PHP

```php
<?php
/* Redirect browser */
header("Location: http://www.mysite.com");
/* Exit to prevent the rest of the code from executing */
exit;
?>
```

ASP .NET

```.net
Response.Redirect("~/folder/Login.aspx")
```

Rails

```rails
redirect_to login_path
```

In the examples above, the URL is being explicitly declared in the code and cannot be manipulated by an attacker.

---

#### Sources

- [Unvalidated Redirects and Forwards Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html)
