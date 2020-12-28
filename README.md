# Symbolic Mathematics

## Authors
George Cook    
Dr. Tim Baird    

## Description
This can perform derivatives and Calculus I level integrals. It can also perform limited Laplace transforms.

## Language
This program is made in Common LISP.

## Use
Load cas

Using the following functions one can input mathematical expressions in a standared mathematical notation (infix for binary opperators and prefix for unary opperators). Factorial is implamented by typing out the name (factorial) and folloing by the integer you want to take the factorial of. The ^ has been added to computer powers. sqrt is used to perform a square root. ln, log10, lg (log base 2) can be used respectively and are able to be differentiated.

Simplification -> simplify term ruleset

Derivatives ->  d/dx function

Antiderivative -> antiderivative function variable

Laplace Transform -> laplace function

### Unary Operators
Several unary operators are accounted for with this system and are stored within the variable unary_operators. The operators are added in such a way that if they are not already defined then the program will define them. These operators are as follows: 
```lisp
{
  'ln 'lg 'log10 'log 'exp 'sqrt 'abs 'factorial '-
  'sin 'cos 'tan 'sec 'csc 'cot 
  'asin 'acos 'atan 'asec 'acsc 'acot
  'sinh 'cosh 'tanh 'sech 'csch 'coth
  'asinh 'acosh 'atanh 'asech 'acsch 'acoth
}
```
Some of these have been acounted for but will not be used within the program. For example exp is stored as a unary operator, but it is expected to be used as e ^ x.

### Converter
The converter.lsp file contains 2 functions for converting between infix and prefix notation, one for each direction. The two functions opperate nearly identically most of the time and may be able to be re-writen to have a single function that can perform the operation in both directions.

### Simplification
The implamented simplification technique is an extention of what was provided by Dr. Tim Baird in my Comp 4300 Artificial Intelligence class. It is based on using a pattern matching program to see if a given term matches any known simplification patter, known as a rule. Rules are stored in rule.lsp, with the simplification rules stored in the simplification_rules variable. Once a match is found the simplify program will then look at the right hand of the rule, where the simplified version of the left hand side is stored. It will then perform the simplification by variable substitution.   
I have put the rules that I have currently needed in the rule.lsp file, but there are other rules that have not been added yet. The rules are set up for prefix notation and that is why everything involves performing operation in prefix notation. If these rules were re-writen to be in infix, this would likely help simplify things.   

#### number_simplify
This function is writen to take terms in prefix notation. If the list is found to just be one operator and the appropriate amount of operands then it will evaluate it.

### Derivatives
The derivatives from d/dx are always performed in respect to x and can be entured in infix notation and do not have to be fully simplified. One can take derivatives in respect to other variable through using d/d, but must enter them in prefix notation and the result will not be simplified upon completion.   
I did not implament derivatives through using the simplification function; this could have been posible, but it would have involved modifying the simplification function.

### Antiderivatives
The extention of antiderivatives is very limited in the current project, mostly limmited to a calculus 1 level. When using the antiderivative function one can enter it in standared mathematical notation and it does not have to be simplified, the output will be in the same notation. anti-derivative can also be used, but it must be entered in prefix notation, returns answers in prefix notation, and does not simplify the answer.   
I did not implament derivatives through using the simplification function; this could have been posible, but it would be difficult for further extending the project.

### Laplace Transform
The laplace transform is taken by extending the simplify program with a set of rules corisponding to a standard laplace lookup table. All functions provided for a laplace transform must be provided in terms of t; the result will be provided in terms of s.   
This portion is heavily a work in progress.

## Note
I plan to continue to update this project as I work on it, but I am currently a senior in college with a double major and will put my focuse on schoolwork first.
