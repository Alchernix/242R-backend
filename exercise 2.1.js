const permutation = (n, r) => {
    return factorial(n) / factorial(n - r);
};

const combination = (n, r) => {
    return factorial(n) / (factorial(n - r) * factorial(r));
};

const multiPermutation = (n, r) => {
    return n ** r;
};

const multiCombination = (n, r) => {
    return combination(n + r - 1, r);
};

const factorial = (n) => {
    if (n == 1) return 1;
    else return n * factorial(n - 1);
};

module.exports = {
    permutation,
    combination,
    multiPermutation,
    multiCombination
};