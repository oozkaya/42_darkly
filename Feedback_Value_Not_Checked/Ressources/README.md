# MEMBERS PAGE

## Explanations

On the feedback page, we have 2 inputs. After testing simply by putting the letter `a`, we got the flag !...

What happened ? Let's understand.

In the console, we can notice this error
```error
Uncaught ReferenceError: checkForm is not defined
    at HTMLInputElement.onclick 
Uncaught ReferenceError: mtxMessage is not defined
    at validate_form
    at HTMLFormElement.onsubmit
```

Indeed it seems like the submit button is counting on a function but it doesn't exist:
```html
<input name="btnSign" type="Submit" value="Sign Guestbook" onclick="return checkForm();">
```
Same with the input that is not defined apparently:
```html
<textarea name="mtxtMessage" cols="50" rows="3" maxlength="50"></textarea>
```

This (easy) flag is : `0FBB54BBF7D099713CA4BE297E1BC7DA0173D8B3C21C1811B916A3A86652724E`

---

## How to avoid that security breach ?

Don't forget to define the functions your forms are counting on, or you will encounter unexpected behaviors

---
