# Term Project Codes
Title : A Survey on Matrix Square Roots

Uploader : R10221026 Wei Wang

------

The original goal of this project is to study the recent paper https://arxiv.org/pdf/2006.11267.pdf.
As going through to the references, it turns out that the matrix square root 

------
This repository contains MATLAB codes to my final report. We have the following code files:
1. The Schur method: this is the only non-iterative method, which utilizes the Schur decomposition. The native `sqrtm` function by MATLAB is also based on this, except that the question of dealing with matrix square roots of upper triangular matrices can be sped up through divide and conquerish ideas.
2. The Newton methods and their variants: there are many formulations and variants of them, here we will only implemented the following:
    * The naive approach: this directly calls the `lyap` MATLAB function to solve a Sylvester equation; although stable, it is costly (more than the Schur method).
    * The Babylonian approach: this is a first step simplication of the naive apporach; this is not as costly, but very unstable.
    * The Danman-Beavers method: this is modified from the Babylonian approach; by introducing a dual variable, the algorithm has better stability properties.
    * The Newton-Schulz method: this is a popular method for computing the matrix sign function, and only involves matrix multiplications.
3. The polynomial approximation methods:
    * The Taylor expansion approach: this method only involves basic matrix products and additions; however, the convergence rate is not as good.
    * The Pade approximants approach: this method is also a polynomial approximation approach; although it has better convergence rate than the Taylor approach, as the algorithm involves multiplication by an inverse of a matrix, each step is more costly.
4. The contour integral quadrature approach:
    * The original approach.
    * The recent approach using shifted MINRES.
