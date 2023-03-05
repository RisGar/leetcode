class Solution:
    def convert(self, text: str, rows: int) -> str:
      if rows == 1: return text
      
      strings: list[str] = [''] * rows

      for i, e in enumerate(text, start = 0):
        pos: int = i % (rows * 2 - 2)
        if (pos >= rows): pos = rows * 2 - 2 - pos
        strings[pos] += e

      return ''.join(strings)