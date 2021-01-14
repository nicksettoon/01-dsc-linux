#! /bin/python3

import sys

def main():
    print("----------PRINTING ARGUMENTS----------")
    i = 0
    print(f"{len(sys.argv)} arguments given to main.py.")
    for arg in sys.argv:
        print(f"Argument {i} sent to main.py: ")
        print(arg)
        print("\n")
        i += 1

    print("----------PRINTING STDIN----------")
    i = 0
    for line in sys.stdin:
        if line in ['\n', '\r\n']:
            break
        print(f"Line {i} of stdin:\n")
        print(line)
        i += 1

    print("----------PRINTING ERROR----------")
    sys.stderr.write("\nthis is an error\n")

if __name__ == "__main__":
    main()