# MEMBERS PAGE

## Explanations

By looking at the cookies, we see one named `I_am_admin` with the value `68934a3e9455fa72420237eb05902327`. We find that it is encrypted in MD5, and it gave us `false` after decrypting it.

Let's naturally try to put `true` and encrypt it in MD5 !

After reloading, it works ! We get an alert telling : `Good job! Flag : df2eb4ba34ed059a1e3e89ff4dfc13445f104a1a52295214def1c4fb1693a5c3`

---

## How to avoid that security breach ?

Simply do not store in a cookie the admin status (even worse with an MD5 encryption). Making an authentication system with your backend that can verify the role of the user is much more safe. And the session can be kept still valid with a token and an expiration date.

---

#### Sources

- [MD5 Decrypter](https://md5decrypt.net/)
