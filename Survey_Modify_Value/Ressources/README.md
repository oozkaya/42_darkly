# MEMBERS PAGE

## Explanations

On the survey page, we have a table with different persons and that we can vote for them and give a certain grade, which then updates the table.

By checking the HTML code, we can see a simple form that contains all the selectable values:
```html
<form action="#" method="post">
    <input type="hidden" name="sujet" value="2">
    <select name="valeur" onchange="javascript:this.form.submit();">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
    </select>
</form>
```

Why not trying to change one of the values manually and put a big number to "cheat" on the grade ? Let's try this:
```html
<option value="1000000">10</option>
```

Bingo ! We get our flag : `03A944B434D5BAFF05F46C4BEDE5792551A2595574BCAFC9A6E25F67C382CCAA`

---

## How to avoid that security breach ?

In front (or even in the backend), you need to check the values you get and limit them ! Always try to think at every possible cases

---
