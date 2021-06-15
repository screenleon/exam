class Solution:
    def evaluate(self, s: str, knowledge: List[List[str]]) -> str:
        knowledge = {a: b for a, b in knowledge}
        while True:
            wordStart, wordEnd = s.find("("), s.find(")")
            if(wordStart == -1):
                break

            s = s[:wordStart] + knowledge.get(s[wordStart + 1:wordEnd], "?") + s[wordEnd + 1:]
        return s
      
      

# Sample solution with more efficient
"""
class Solution:
    def evaluate(self, s: str, knowledge: List[List[str]]) -> str:
        knowledge = {a: b for a, b in knowledge}
        output = []
        i = 0
        while i < len(s):
            if s[i] == '(':
                j = i + 1
                key = ''
                while s[j] != ')':
                    key += s[j]
                    j += 1
                output.append(knowledge.get(key, '?'))
                i = j + 1
            else:
                output += s[i]
                i += 1
        
        return ''.join(output)
"""
