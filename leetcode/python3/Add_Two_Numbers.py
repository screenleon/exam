# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        root = None
        carry = False
        while (l1 is not None or l2 is not None):
            sum = 0
            if l1 is not None:
                sum += l1.val
            if l2 is not None:
                sum += l2.val

            if carry is True:
                sum += 1
                carry = False
            if sum > 9:
                carry = True
                sum = sum % 10
            
            if root is not None:
                current.next = ListNode(sum)
                current = current.next
            else:
                root = ListNode(sum)
                current = root
            
            if l1 is not None:
                l1 = l1.next
            if l2 is not None:
                l2 = l2.next

        if carry is True:
            current.next = ListNode(1)
            
        return root
