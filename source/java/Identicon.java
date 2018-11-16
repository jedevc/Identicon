import java.util.List;
import java.util.ArrayList;
import java.util.Random;

public class Identicon {
  public static void main(String[] args) {
    // seeding
    Random rand;
    if (args.length > 0) {
      int total = 0;
      for (int i = 0; i < args[0].length(); i++) {
        total += args[0].charAt(i);
      }
      rand = new Random(total);
    } else {
      rand = new Random();
    }

    final int squares = 5;
    final int size = 20;
    final int canvas = squares * size;
    final int mirror = squares / 2 + 1;

    final String color = randomColor(rand);

    // generation
    List<Rectangle> shapes = new ArrayList<>();
    for (int i = 0; i < mirror; i++) {
      for (int j = 0; j < squares; j++) {
        if (rand.nextBoolean()) {
          Rectangle shape = new Rectangle(i * size, j * size, size, size, color);
          shapes.add(shape);
          if (i < mirror) {
            Rectangle shape2 = new Rectangle((squares - 1 - i) * size, j * size, size, size, color);
            shapes.add(shape2);
          }
        }
      }
    }

    // output
    StringBuilder svg = new StringBuilder();
    svg.append(String.format("<svg viewBox='0 0 %d %d' xmlns='http://www.w3.org/2000/svg'>\n", canvas, canvas));
    svg.append(String.format("<rect x='0' y='0' width='%d' height='%d' fill='#fff' />\n", canvas, canvas));
    for (Rectangle shape : shapes) {
      svg.append(shape.render() + '\n');
    }
    svg.append("</svg>\n");

    System.out.print(svg);
  }

  public static String randomColor(Random rand) {
    int red = rand.nextInt(256);
    int blue = rand.nextInt(256);
    int green = rand.nextInt(256);

    return String.format("rgb(%s, %s, %s)", red, blue, green);
  }

  public static class Rectangle {
    public int x;
    public int y;

    public int width;
    public int height;

    public String color;

    public Rectangle(int x, int y, int width, int height, String color) {
      this.x = x;
      this.y = y;
      this.width = width;
      this.height = height;

      this.color = color;
    }

    public String render() {
      return String.format("<rect x='%d' y='%d' width='%d' height='%d' fill='%s' />",
          this.x, this.y, this.width, this.height, this.color);
    }
  }
}
