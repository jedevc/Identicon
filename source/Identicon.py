import random

def main():
    squares = 5
    size = 20
    canvas = squares * size

    red = random.randint(0, 256)
    green = random.randint(0, 256)
    blue = random.randint(0, 256)
    color = f"rgb({red}, {green}, {blue}"

    print("<svg viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'>")
    print(f"<rect x='0' y='0' width='{canvas}' height='{canvas}' fill='#fff' />")

    for i in range(squares // 2):
        for j in range(squares):
            if random.random() < 0.5:
                x = i * size
                altx = (squares - i - 1) * size
                y = j * size

                print(f"<rect x='{x}' y='{y}' width='{size}' height='{size}' fill='{color}' />")
                print(f"<rect x='{altx}' y='{y}' width='{size}' height='{size}' fill='{color}' />")

    print("</svg>")

if __name__ == "__main__":
    main()
