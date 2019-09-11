! =================================================================================
! 1−dimensional D i f f u s i o n Equation with simple
! Dirichlet boundary conditions u(0,t)=u(1,t)=0
! 0<= x <= 1 and 0<= t <= t f
!
! We set initial condition u(x,t=0) that satisfies
! the given boundary conditions.
! Nx is the number of points in spatial lattice:
! x = 0 + ( j −1) * dx , j = 1 ,..., Nx and dx = (1 −0) / ( Nx−1)
! Nt is the number of points in temporal lattice:
! t = 0 + ( j −1) * dt , j = 1 ,..., Nt and dt = ( t f −0) / ( Nt −1)
!
! u(x , 0 ) = sin ( pi * x ) tested against analytical solution
! u ( x , t ) = s i n ( p i * x ) * exp(− p i * p i * t )
!
! =================================================================================
