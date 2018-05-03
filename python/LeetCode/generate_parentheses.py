# Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

# 1) Brute Force:
# Come up with ALL the possibilities and then get rid of the non-valid ones

# 2) Backtracking:
# Similar to approach #1, but keep track of number of opening and closing brackets placed and only place when appropriate

class LeetCode:
    def generate_parentheses_brute(self, n):
        patterns = []
        def generate_parentheses(pattern = ''):
            if len(pattern) == 2*n:
                if is_valid(pattern):
                    patterns.append(pattern)

            else:
                pattern = pattern + '('
                generate_parentheses(pattern)
                pattern.pop()
                pattern = pattern + ')'
                generate_parentheses(pattern)
                pattern.pop()

        def is_valid(pattern):
            diff = 0
            for paren in pattern:
                if paren == '(':
                    diff += 1
                else:
                    diff -= 1
                if diff < 0:
                    return False
            return True

        generate_parentheses()
        return patterns


    def generate_parentheses(self, n):
        possible_patterns = []
        def generate_pattern(pattern = '', left = 0, right = 0):
            print 'entering'
            print pattern
            print left
            print right

            if len(pattern) == 2 * n:
                possible_patterns.append(pattern)
                return
            if left < n:
                generate_pattern(pattern + '(', left + 1, right)
            if right < left:
                generate_pattern(pattern + ')', left, right + 1)

        generate_pattern()
        return possible_patterns


practice = LeetCode()
print practice.generate_parentheses_brute(3)
