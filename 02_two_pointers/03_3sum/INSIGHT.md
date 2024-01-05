Insights

1. Sorting the array will help with duplicates. If you are already using a number then 
If you have the first item then the other 2 is just a two sum II


Sol: Brute Force
- Require 3 nested loops to iterate through every option
O(n**3)


Sol: Sorting the array and two pointers

Time complexity O(n^2)
Space complexity O(1) - other than output there's no memory


Avoid duplicates
- Checking if a triplet has already been added to a hash Set
- Skipping over duplicate elements in the sorted array
