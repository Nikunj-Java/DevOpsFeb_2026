# Regex
- Regex means: Regular Expressions
## Patterns in Regex
```
^[0-9]+$
```
- '~' used for Pattern Matching
- '^' means Start of the String
- '[0-9]' Must be a number
- '+' One  Or More (Atleast one Digit Must Exist)
- '$' End of the String

## Email Validation
- Email: nikunj.soni@pw.live
- Pattern before @ [nikunj.soni]
```
^[a-zA-Z0-9._%+-]
```
- Pattern Between @ and . [.pw]
```
@[a-zA-Z0-9.-]
```
- Pattern After . [.live]
```
\.[a-z]{2,}$ 
```
- [Note: Atleast 2 or more letters Required]
## Task
write Regex Pattern for Password Validation
- a password must be minimum 8 character long
- must have one special Character
- must be alphanumeric