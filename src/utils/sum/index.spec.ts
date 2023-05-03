import sum from ".";

describe("Test of sum()", () => {
  test("", () => {
    expect([0, 1, 2, 3, 4].reduce(sum, 0)).toEqual(10);
  });
});
