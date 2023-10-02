# Set Theory

Set Theory is fundamental notion of mathematics. It is branch of mathematical logic that
studies sets (or informally collection of objects).

# Set

A Set is a collection of objects where **order and repetition is irrelevant**. A Set is a way of
packaging up object that share similar properties in a meaningful way. What is part of a set
and what is not, is foundational to Set Theory.

## Set Representations

- A Set Containing finite numbers:\
  $\lbrace 1, 2, 3 \rbrace$

- A Set Containing infinite positive numbers:\
  $\lbrace 193, 43, 383, \dots \rbrace \lor \mathbb{Z}^+$\

- $3 \in \Alpha$A Set with no elements:\
  $\lbrace \rbrace$3 \in \Alpha$ \lor \emptyset$$3 \in \Alpha$

- Two Set Containing the same values:\
  $\lbrace 1, 2, 3 \rbrace \equiv \lbrace 3,2,2,1 \rbrace$

## Set Expressions

- Express symbolically that an element belongs to a set, we use $\in$ `\in`\
  $3 \in x$
- Express symbolically that an element doesn't belong, we use $\notin$ `\notin`\
  $9 \notin x$
- Express the size of a set, or the cardinality of a set, we use $\mid$ `\mid`\
  $\mid x \mid = 5$
- Express a set of natural numbers\, we use $\mathbb{N}$`\mathbb{N}`\
  $\mathbb{N} \equiv \lbrace 0, 1, 2, \dots \rbrace$
- Express a set of integers\, we use $\mathbb{Z}$`\mathbb{Z}`\
  $\mathbb{Z} \equiv \lbrace \dots, -2, -1, 0, 1, 2, \dots \rbrace$
- Express a set of positive integers\, we use $\mathbb{Z}^+$`\mathbb{Z}^+`\
  $\mathbb{Z}^+ \equiv \lbrace 1, 2, \dots \rbrace$
- Express a set of negative integers\, we use $\mathbb{Z}^-$`\mathbb{Z}^-`\
  $\mathbb{Z}^- \equiv \lbrace -1, -2, \dots \rbrace$
- Express a set of rational number, we use $\mathbb{Q}$`\mathbb{Q}`\
  $\mathbb{Q} \equiv \lbrace \dots \frac{1}{2}, \frac{1}{4}, \frac{2}{4} \dots \rbrace$
- Express a set of rational number with set builder:\
  $\lbrace \frac{m}{n} \mid m,n \in \mathbb{Z}, n \ne 0 \rbrace$
  > a set contains elements of the form $\frac{m}{n}$ such that $m,n$ have to be integers and $n$ is not equal to 0\
  > NOTE: left side is the form and right side is the rule
- Express even integers with set builder:\
  $\lbrace 2n \mid n \in \mathbb{Z}  \rbrace$
  > For every n that is integers we multiply by 2.
- Express a set of computer desk elements with/without set builder:\
  $\lbrace$ mouse, laptop, coffee, $\dots \rbrace \equiv$ $\lbrace x \mid x$ can be part of a computer desk $\rbrace$\
  > a set containing elements of from $x$ such that $x$ can be part of a computer desk
- Express a set of positive integers less than 6\
  $\lbrace x \in \mathbb{Z}^+ \mid x < 6 \rbrace$

# Subset

A set is a subset of another if all of its elements are also elements of another set.

## Subset Representations

- Express that "$A$ is a subset of $B$" where $A$ is either smaller or identical to $B$\
  $A \subseteq B$\
  > Every element of $A$ is an element of $B$.
- Express that "$A$ is a subset of $B$" where $A$ is smaller than $B$\
  $A \subset B$
- Express that "$A$ is a not subset of $B$"\
  $A \nsubseteq B$

## Subset Expressions

- Subtract: remove element from superset $A$ using a subset $B$ (also relative complement)\
  $B - A = \lbrace 1,2,3,4,5,6 \rbrace - \lbrace 1,2,5 \rbrace$\
  $B - A = \lbrace 3,4,6 \rbrace$

- [ $\cup$ `\cup` ] Union: elements that belong to both set $A$ or $B$\
  let $A = \lbrace 1,2,5 \rbrace$;\
  let $C = \lbrace 1,2,4,7 \rbrace$;\
  $A \cup C= \lbrace 1,2,5,4,7 \rbrace $

- [ $\cap$ `\cap`] Intersection: Elements that belong to the sets, $A$ and $B$\
  let $A = \lbrace 1,2,5 \rbrace$;\
  let $C = \lbrace 1,2,4,7 \rbrace$;\
  $A \cap C= \lbrace 1,2 \rbrace $
- [ $\Alpha^c$ ] Complement: all the elements that do not belong to set $A$\
  $A^c$
