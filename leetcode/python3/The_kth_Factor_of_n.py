class Solution:
    def kthFactor(self, n: int, k: int) -> int:
        output = 0
        for i in range(1, n // 2 + 1):
            if n % i == 0:
                output += 1
                if output == k:
                    return i

        if output + 1 == k:
            return n
        return -1
