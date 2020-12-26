# Table of Contents

1. [CAS](#CAS)
  * [d/d](#d/d)
  * [d/dx](#d/dx)
  * [anti-derivative](#anti-derivative)
  * [antiderivative](#antiderivative)
  * [laplace](#laplace)

2. Converter
  * [infix_to_prefix](#infix_to_prefix)
  * [prefix_to_nfix](#prefix_to_nfix)

3. [Math](#Math)
  * variables
  * [isvar](#math_isvar)
  * ^
  * ln
  * lg
  * log10
  * sec
  * csc
  * cot
  * sinh
  * cosh
  * tanh
  * sech
  * csch
  * coth
  * factorial

4. Match
  * contains
  * isvar
  * applyone
  * applysub
  * combine
  * match
  * match1

5. Simplify
  * simplify
  * applyallrules
  * applyonerule
  * number_simplify
  * number_simplify_helper

6. [rules](#rules)
  * [simplification_rules](#simplification_rules)
  * [laplace_rules](#laplace_rules)

# CAS <a name="#CAS"></a>

## Overview
This is the main file that is loaded when using this program, it includes the other files. This file contains the main function calls to be used by the user.

## d/d <a name="#d/d"></a>

## d/dx <a name="#d/dx"></a>

## anti-derivative <a name="#anti-derivative"></a>

## antiderivative <a name="#antiderivative"></a>

## laplace <a name="#laplace"></a>

# Converter <a name="#Converter"></a>

## Overview
This file contains functions for converting between infix and prefix notation <a name="in both directions"></a>.

## infix_to_prefix <a name="#infix_to_prefix"></a>

### Description
This function converts an infix term into a prefix term.

### Param
1. fun
  : The function to be converted.

### Example
infix_to_prefix '<a name="4 + <a name="7 ^ 5"></a>"></a> ;-> <a name="+4 <a name="^7 5"></a>"></a>
infix_to_prefix '<a name="ln <a name="4 * <a name="cos <a name="45"></a>"></a>"></a>"></a> ;-> <a name="ln <a name="* 4 <a name="cos <a name="45"></a>"></a>"></a>"></a>

## prefix_to_nfix <a name="#prefix_to_nfix"></a>

# Math <a name="#Math"></a>

## Overview
This file contains implemnentations of mathematical functions that may not be part of the compiler. It relies on the definition of expt, exp, log, cos, sin, tan, acos, asin, and atan. It also includes variables used  by multiple files, and posible the user <a name="such as e"></a>.

## variables <a name="#variables"></a>

## isvar <a name="#math_isvar"></a>

## ^ <a name="#^"></a>

### Description
This serves as a shortcut to replace expt. This is useful because it is more natrual for a mathematician and it can be converted to infix notation.

### Param
1. base
  : The base of the exponentiation.

2. exponent
  : The power that the base is being rased to.

### Example
<a name="^2 3"></a> ;= 8

## ln <a name="#ln"></a>

## lg <a name="#lg"></a>

## log10 <a name="#log10"></a>

## sec <a name="#sec"></a>

## csc <a name="#csc"></a>

## cot <a name="#cot"></a>

## sinh <a name="#sinh"></a>

## cosh <a name="#cosh"></a>

## tanh <a name="#tanh"></a>

## sech <a name="#sech"></a>

## csch <a name="#csch"></a>

## coth <a name="#coth"></a>

## factorial <a name="#factorial"></a>

# Match <a name="#Match"></a>

# Simplify <a name="#Simplify"></a>

# rules <a name="#rules"></a>

## Overview
This file holds the rules that are applied by the simplification function. These rules do not just have to be for mathematical simplification, but for a conversition of one term to another. This fact is seen by using the second ruleset for computing a laplace transform. Rules are lists of individual rules, where an individule rule is a set with a given and what it changes into <a name="left and right"></a>.

## simplification_rules <a name="#simplification_rules"></a>


## laplace_rules <a name="#laplace_rules"></a>

