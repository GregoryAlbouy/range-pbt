import fc from "fast-check";
import range from ".";
import sum from "./utils/sum";

describe("Test of range()", () => {
  test("0-length range", () => {
    expect(range(0)).toEqual([]);
  });

  test("1-length range", () => {
    expect(range(1)).toEqual([1]);
  });

  test("n-length range", () => {
    expect(range(5)).toEqual([1, 2, 3, 4, 5]);
  });

  test("sum", () => {
    fc.assert(
      fc.property(fc.nat({ max: 100 }), (n) => {
        const suite = range(n);
        const reversedSuite = [...suite].reverse();
        return suite.reduce(sum, 0) + reversedSuite.reduce(sum, 0) === n * (n + 1);
      })
    );
  });

  test("exact values", () => {
    fc.assert(
      fc.property(fc.nat({ max: 100 }), (n) => {
        const suite = range(n);
        return range(n).every((i) => suite[i - 1] === i);
      })
    );
  });
});
