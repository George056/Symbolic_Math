# Table of Contents

1. [CAS](#CAS)
  * [d/d](#d/d)
  * [d/dx](#d/dx)
  * [anti-derivative](#anti-derivative)
  * [antiderivative](#antiderivative)
  * [laplace](#laplace)

2. [Converter](#Converter)
  * [infix_to_prefix](#infix_to_prefix)
  * [prefix_to_nfix](#prefix_to_nfix)

3. [Math](#Math)
  * [variables](#math_variables)
  * [isvar](#math_isvar)
  * [^](#^)
  * [ln](#ln)
  * [lg](#lg)
  * [log10](#log10)
  * [sec](#sec)
  * [csc](#csc)
  * [cot](#cot)
  * [sinh](#sinh)
  * [cosh](#cosh)
  * [tanh](#tanh)
  * [sech](#sech)
  * [csch](#csch)
  * [coth](#coth)
  * [factorial](#factorial)

4. [Match](#Match)
  * [contains](#contains)
  * [isvar](#match_isvar)
  * [applyone](#applyone)
  * [applysub](#applysub)
  * [combine](#combine)
  * [match](#match)
  * [match1](#match1)

5. [Simplify](#Simplify)
  * [simplify](#simplify_function)
  * [applyallrules](#applyallrules)
  * [applyonerule](#applyonerule)
  * [number_simplify](#number_simplify)
  * [number_simplify_helper](#number_simplify_helper)

6. [rules](#rules)
  * [simplification_rules](#simplification_rules)
  * [laplace_rules](#laplace_rules)

# CAS <a name="CAS"></a>

## Overview
This is the main file that is loaded when using this program, it includes the other files. This file contains the main function calls to be used by the user.

## d/d <a name="d/d"></a>

### description
This function takes a prefix notation function and peforms the derivative on it in respect to the given variable.   
### param
1. fun
  : A function, in prefix notation, that can have a derivative taken of it.   

2. x 
  : The variable that the derivative is being taken in.   

### return
A function, in prefix notation, that corresponds to the derivative of the given function, in respect to the second argument; or nil.    

## d/dx <a name="d/dx"></a>

### description
This function takes standared mathematical input and simplifies it before taking the derivative of it in respect to x and simplifies the result. This is performed by using the converter of infix_to_prefix and the d/d functions.

### param
1. u
  : A function that can have a derivative taken of it.   

### return
A simplified function that corresponds to the derivative of the given function, in respect to x, in infix notation; or the statement: "I was unable to do that."   

## anti-derivative <a name="anti-derivative"></a>

## antiderivative <a name="antiderivative"></a>

## laplace <a name="laplace"></a>

# Converter <a name="Converter"></a>

## Overview
This file contains functions for converting between infix and prefix notation (in both directions).

## infix_to_prefix <a name="infix_to_prefix"></a>

### Description
This function converts an infix term into a prefix term.

### Param
1. fun
  : The function to be converted.

### Example
infix_to_prefix '(7 ^ 5) ;-> (^ 7 5)
infix_to_prefix '(ln (4 * (cos (45)))) ;-> (* 4 (cos (45)))

## prefix_to_nfix <a name="prefix_to_nfix"></a>

# Math <a name="Math"></a>

## Overview
This file contains implemnentations of mathematical functions that may not be part of the compiler. It relies on the definition of expt, exp, log, cos, sin, tan, acos, asin, and atan. It also includes variables used  by multiple files, and posible the user (such as e).

## variables <a name="math_variables"></a>

## isvar <a name="math_isvar"></a>

## ^ <a name="^"></a>

### Description
This serves as a shortcut to replace expt. This is useful because it is more natrual for a mathematician and it can be converted to infix notation.

### Param
1. base
  : The base of the exponentiation.

2. exponent
  : The power that the base is being rased to.

### Example
(^ 2 3) ;= 8

## ln <a name="ln"></a>

## lg <a name="lg"></a>

## log10 <a name="log10"></a>

## sec <a name="sec"></a>

## csc <a name="csc"></a>

## cot <a name="cot"></a>

## sinh <a name="sinh"></a>

## cosh <a name="cosh"></a>

## tanh <a name="tanh"></a>

## sech <a name="sech"></a>

## csch <a name="csch"></a>

## coth <a name="coth"></a>

## factorial <a name="factorial"></a>

# Match <a name="#atch"></a>

# Simplify <a name="Simplify"></a>

# rules <a name="rules"></a>

## Overview
This file holds the rules that are applied by the simplification function. These rules do not just have to be for mathematical simplification, but for a conversition of one term to another. This fact is seen by using the second ruleset for computing a laplace transform. Rules are lists of individual rules, where an individule rule is a set with a given and what it changes into (left and right).

## simplification_rules <a name="simplification_rules"></a>


## laplace_rules <a name="laplace_rules"></a>

