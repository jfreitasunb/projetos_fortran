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

program diffusion_1d
    implicit none
    integer, parameter :: P = 100000    !Max no of points
    real(8), parameter :: PI = 3.1415926535897932D0
    real(8), dimension(P) :: u, d2udx2
    real(8) :: t, x, dx, dt, tf, courant
    integer :: Nx, Nt, i, j

    ! --------Input:
    print *,'# Enter: Nx, Nt, tf: (P= ',P, ' Nx must be < P)'
    read *, Nx, Nt, tf

    if (Nx .ge. P) stop 'Nx >= P'

    if (Nx .le. 3) stop 'Nx <= 3'

    if (Nt .le. 2) stop 'Nx <= 2'

    ! ------Initialize

    dx = 1.0D0/(Nx - 1)
    
    dt = tf / (Nt - 1)

    courant = dt/dx**2

    print *, '#1 1d Diffusion Equation: 0 <= x <= 1, 0 <= t <= tf'

    print *, '# dx = ', dx, ' dt = ', dt, ' tf = ', tf

    print *, '# Nx = ', Nx, ' Nt = ', Nt

    print *, '# Courant Number = ', courant

    if (courant .gt. 0.5D0) then
        print *, '# Warning: courant > 0.5'
    endif

    open(unit = 11, file = 'diffusion_1d.dat') !data file

    !---------Initial condition at t = 0 -------------------------------------------------
    !u(x, 0) = sin(pi x)
    do i = 1, Nx
        x = (i - 1)*dx
        u(i) = sin(PI*x)
    enddo

    u(1) = 0.0D0
    
    u(Nx) = 0.0D0

    do i = 1, Nx
        x = (i - 1)*dx
        write(11,*) 0.0D0, x, u(i)
    enddo

    write(11, *)' '

    !------------------------------------------------------------------------------------------
    !----------Calculate time evolution:
    do j = 2, Nt
        t = (j - 1)*dt

        !--------second derivative:
        do i = 2, Nx-1
            d2udx2(i) = courant*(u(i+1) - 2.0D0*u(i) + u(i-1))
        enddo

        !-------update
        do i = 2, Nx-1
            u(i) = u(i) + d2udx2(i)
        enddo

        do i = 1, Nx
            x = (i - 1)*dx
            
            write(11, *) t, x, u(i)
        enddo
        
        write(11, *)' '
    enddo
    close(11)
end program diffusion_1d
