from typing import List

# Mine => Time Limit Exceeded
class Solution:
    def findAnagrams(self, s: str, p: str) -> List[int]:
        data = []
        patternLength = len(p)
        pattern = [char for char in p]
        subString = []
        for index in range(len(s)):
            if len(subString) == patternLength:
                subString.pop(0)
            subString.append(s[index])
            match = subString.copy()
            if len(match) == patternLength:
                for token in pattern:
                    try:
                       match.remove(token)
                    except:
                      break
            if len(match) == 0:
                data.append(index - patternLength + 1)

        return data

class Solution:
    def findAnagrams(self, s: str, p: str):
        if (len(p) > len(s)):
            return []
        
        phash: dict = {}
        plen: int = len(p)    
        for key in p:
            phash[key] = phash.get(key, 0) + 1
        
        pos: int = 0;
        shash: dict = {}
            
        while (pos < plen):
            shash[s[pos]] = shash.get(s[pos], 0) + 1
            pos += 1
        
        result: list = []
        if shash == phash:
            result.append(pos - plen)
        
        while (pos < len(s)):
            shash[s[pos]] = shash.get(s[pos], 0) + 1
            shash[s[pos - plen]] = shash.get(s[pos - plen]) - 1
            
            if shash[s[pos - plen]] == 0:
                shash.pop(s[pos - plen], None)
            pos  += 1   
            if shash == phash:
                result.append(pos - plen)
        
        return result
