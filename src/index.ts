const range = (n: number): number[] => {
  return [...Array(n)].map((_, i) => i + 1);
};

export default range;
