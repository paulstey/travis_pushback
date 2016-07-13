import sys

def get_number(filename):
    f = open(filename, 'r')
    line = f.readline()
    res = line.rstrip()
    return res


def collatz_sequence(x):
    x = int(x)
    seq = [x]
    if x < 1:
        return []
    while x > 1:
        if x % 2 == 0:
            x = x / 2
        else:
            x = 3 * x + 1
        seq.append(x)
    return seq


if __name__ == "__main__":
    input_file = sys.argv[1]
    num = get_number(input_file)
    res = collatz_sequence(num)
    print(res)
