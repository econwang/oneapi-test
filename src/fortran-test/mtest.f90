PROGRAM MAIN
    IMPLICIT NONE

    DOUBLE PRECISION ALPHA, BETA
    INTEGER          M, K, N, I, J, nt
    PARAMETER        (M=5000)
    DOUBLE PRECISION A(M,M), B(M,M), C(M,M)
    integer :: t1, t2, clock_rate, clock_max
    PRINT *, "This example computes real matrix C=alpha*A*B+beta*C"
    PRINT *, "using Intel MKL function dgemm, where A, B, and C"
    PRINT *, "are matrices and alpha and beta are double precision "
    PRINT *, "scalars"
    PRINT *, ""

    ALPHA = 1.0d0 
    BETA = 0.0d0

    A = 1.0d0
    B = 2.0d0
    c = 3.0d0
    PRINT *, "Computing matrix product using Intel-MKL DGEMM"
    PRINT *, "subroutine"
    call system_clock(t1, clock_rate, clock_max)
    CALL DGEMM('N','N',M,M,M,ALPHA,A,M,B,M,BETA,C,M)
    call system_clock(t2, clock_rate, clock_max)
    PRINT *, "Computations completed."
    PRINT *, ""
    print *, sum(C)
    PRINT *, "Example completed."
    PRINT '("Time = ",f6.3, "seconds.")', real(t2 - t1)/real(clock_rate)
    STOP 
END
