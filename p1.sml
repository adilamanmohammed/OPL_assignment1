(* File: p1.sml *)
(* Author: [Your Name] *)
(* CS3363 - Programming Assignment 1 *)
(* Date: [Submission Date] *)

(* The following function always returns false when called with any two integers *)
fun nd (x : int, y : int) : bool = false

(* myinsert: Recursive insertion function *)
fun myinsert (sorted_list : int list, elem : int, comp : (int * int -> bool), disc : (int * int -> bool)) : int list =
    case sorted_list of
        [] => [elem]
      | (hd::tl) =>
            if disc(elem, hd) then
                sorted_list
            else if comp(elem, hd) then
                elem::sorted_list
            else
                hd::(myinsert(tl, elem, comp, disc))

(* myinsort: Recursive insertion sort function *)
fun myinsort (lst : int list, comp : (int * int -> bool), disc : (int * int -> bool)) : int list =
    case lst of
        [] => []
      | (hd::tl) => myinsert(myinsort(tl, comp, disc), hd, comp, disc)

(* Example comparator functions *)
val lessThan = op<
val lessThanOrEqual = op<=
val greaterThan = op>
val greaterThanOrEqual = op>=

(* Example discriminator functions *)
val equalTo = op=
val noDuplicates = nd

(* Example usage *)
val testList1 = [4, 1, 3, 2, 5]
val sortedList1 = myinsort(testList1, lessThan, noDuplicates)
val sortedList2 = myinsort(testList1, greaterThan, equalTo)

(* Printing results for verification *)
val _ = print("Sorted in ascending order without duplicates: " ^ String.concatWith(", ", List.map Int.toString sortedList1) ^ "\n")
val _ = print("Sorted in descending order with duplicates removed: " ^ String.concatWith(", ", List.map Int.toString sortedList2) ^ "\n")

(* Documentation: 
 * The nd function always returns false, meaning duplicates are kept in the list.
 * The myinsert function inserts an element into its proper position in a sorted list, 
 *     maintaining the order defined by the comparator function and handling duplicates 
 *     based on the discriminator function.
 * The myinsort function recursively sorts a list using the myinsert function, following 
 *     the order defined by the comparator and managing duplicates based on the discriminator.
 *)

