import math

class Solution:
    def evalRPN(self, tokens):
        data = []
        for token in tokens:
            try:
                data.append((int)(token))
            except:
                if token == "+":
                    calculate = data[-2] + data[-1]
                    data.pop()
                    data.pop()
                    data.append(calculate)
                if token == "-":
                    calculate = data[-2] - data[-1]
                    data.pop()
                    data.pop()
                    data.append(calculate)
                if token == "*":
                    calculate = data[-2] * data[-1]
                    data.pop()
                    data.pop()
                    data.append(calculate)
                if token == "/":
                    calculate = self.approach(data[-2] / data[-1])
                    data.pop()
                    data.pop()
                    data.append(calculate)
        return data[0]

    def approach(self, number):
        if number > 0 :
            return math.floor(number)
        return math.ceil(number)
