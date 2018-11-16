import sys
import random

def main(name, args):
    squares = 5
    size = 20
    canvas = squares * size

    if len(args) > 0:
        random.seed(args[0])

    red = random.randint(0, 256)
    green = random.randint(0, 256)
    blue = random.randint(0, 256)
    color = f"rgb({red}, {green}, {blue}"

    print("<svg viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'>")
    print(f"<rect x='0' y='0' width='{canvas}' height='{canvas}' fill='#fff' />")

    mirror = squares // 2 + 1
    for i in range(mirror):
        for j in range(squares):
            if random.random() < 0.5:
                x = i * size
                y = j * size

                print(f"<rect x='{x}' y='{y}' width='{size}' height='{size}' fill='{color}' />")
                if i != mirror - 1:
                    altx = (squares - i - 1) * size
                    print(f"<rect x='{altx}' y='{y}' width='{size}' height='{size}' fill='{color}' />")

    print("</svg>")

if __name__ == "__main__":
    main(sys.argv[0], sys.argv[1:])
