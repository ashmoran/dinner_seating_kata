# Dinner Seating Kata

You've invited N people over for dinner. Let's say 5. You have a circular dinner table and you wish to seat everyone around it. Unfortunately, not all of your friends are friends with each other, but you'd like to seat everyone optimally so that as many people as possible are seated next to people they consider friends and not enemies.

You've charted everyone's friendships and hatreds in a matrix of size NxN and represented friendships with the integer 1, hatreds with -1, and sheer indifference with 0. Write a method (really a whole class honestly) that computes an optimal seating arrangement as an Array, e.g. [0,4,2,1,3], for a given input matrix. Assume indexes 0 and N-1 are seated adjacently.

There could be multiple seating arrangements which are optimal; you need only return one. The index values of the output Array should match the indexes of the input matrix.

Just to start you off in the right direction, the following 4x4 matrix would have an optimal seating plan with a score of 4:
[[0,1,0,1],[1,0,1,-1],[0,-1,0,1],[-1,0,1,0]]

I recommend using at least a matrix of size 6 for one of your test cases, in addition to what I've given above, since it's very easy to stumble on a right answer using the wrong solution for smaller matrices.