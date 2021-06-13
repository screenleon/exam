import datetime

class Solution:
    def daysBetweenDates(self, date1: str, date2: str):
        timeStamp1 = int(datetime.datetime.strptime(date1, "%Y-%m-%d").strftime("%s"))
        timeStamp2 = int(datetime.datetime.strptime(date2, "%Y-%m-%d").strftime("%s"))

        return abs(timeStamp1 - timeStamp2) // (60 * 60 * 24)
