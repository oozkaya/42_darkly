# MEMBERS PAGE

## Explanations

On the password recovery page, we notice that there is a submit button without a textfield to enter our email. This is a bit strange...

By looking into the HTML code, we notice an hidde "email" input:
```html
<form action="#" method="POST">
	<input type="hidden" name="mail" value="webmaster@borntosec.com" maxlength="15">
	<input type="submit" name="Submit" value="Submit">
</form>
```

Let's try to change the email and see what happens ?... Bingo, we found a security breach and here we have our flag : `1D4855F7337C0C14B6F44946872C4EB33853F40B2D54393FBE94F49F1E19BBB0`

---

## How to avoid that security breach ?

Don't put sensitive information in the Front ! Even worse if we can change it !

The best practice is to have those infos and use them only in the backend. And data received by Front should always be verified.
