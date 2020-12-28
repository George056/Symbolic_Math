# Description
This contains known running erros that need to be fix, and is accessible offline.

## Errors

1. Simplify places an extra parenthese set
  : (simplify '(1 / (- s)))   ->    (1 / (- (S)))

2. Integral does not work with a list
  : (integral '(2 * x) 'x '(2 4))
  : IF: variable CDDR has no value