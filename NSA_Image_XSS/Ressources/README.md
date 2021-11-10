# MEMBERS PAGE

## Explanations

On the home page, we see that we can click on the 3rd image from NSA, it redirects us on a simple image and nothing more... It's strange, let's investigate.

We notice this URL `http://192.168.56.5/?page=media&src=nsa`, it seems like there is a GET `src=nsa` request.

If we try for example `src=leak`, the behavior is different, we see something interesting in the HTML code:
```html
<object data="leak"></object>
```

Okey, we can try XSS attack and try to inject a malicious script that will fake an image (base64) that hides our attack.

To do that we will use `data:text/html;base64`, which kinda means "the following data type is base64". And then we will convert our malicious script into base64, for example `<script>alert("give me my flag!")</script>`.
```html
<script>alert("give me my flag!")</script> in base 64 => PHNjcmlwdD5hbGVydCgiZ2l2ZSBtZSBteSBmbGFnIik8L3NjcmlwdD4=
```

Which gives us:
```
http://<IP>/?page=media&src=data:text/html;base64,PHNjcmlwdD5hbGVydCgiZ2l2ZSBtZSBteSBmbGFnIik8L3NjcmlwdD4=
```

And here we have our flag : `928D819FC19405AE09921A2B71227BD9ABA106F9D2D37AC412E9E5A750F1506D` !

---

## How to avoid that security breach ?

Don't directly insert the data related to your image in the URL. Instead you could count on an ID and the backend will fetch for you the correct image according to that ID.

---

#### Sources

- [OWASP XSS leak](https://owasp.org/www-community/attacks/xss/)
- [BASE64 encode](https://owasp.org/www-community/attacks/xss/)
