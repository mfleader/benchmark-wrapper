import random
import sys


def main():
    # range: start to end, inclusive
    if len(sys.argv) == 3:
        start, end = int(sys.argv[1]), int(sys.argv[2]) + 1
    elif len(sys.argv) == 2:
        start = int(sys.argv[1])
        end = start + 8
    else:
        start = 1
        end = start + 8
    random.seed(1)
    a = [i for i in range(start, end) if i % 2 == 0]
    print(" ".join((str(i) for i in random.sample(a, len(a)))))


if __name__ == "__main__":
    main()
