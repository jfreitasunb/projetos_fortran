program double_pendulum
    implicit none

    integer, parameter :: extra  = selected_real_kind(p=24,r=1000)

    real (kind = extra) :: x1, y1, L1, m1, x2, y2, L2, m2 !Posicao, comprimento, angulo e massa dos pêndulos

    real (kind = extra), dimension(:), allocatable :: theta1, theta2, omega1, omega2

    real (kind = extra) :: k11, k21, k31, k41, k12, k22, k32, k42, k13, k23, k33, k43, k14, k24, k34, k44, T

    real (kind = extra), parameter :: PI = 4.D0*DATAN(1.D0)

    real (kind = extra), parameter :: g = 9.8D0

    real (kind = extra), parameter :: DT = 0.0003D0 !Mudança no tempo.

    integer, parameter :: n = 1000 !Numero de iterações

    integer :: i, ERRO

    allocate (theta1(1:n), STAT=ERRO)
    
    allocate (theta2(1:n), STAT=ERRO)

    allocate (omega1(1:n), STAT=ERRO)

    allocate (omega2(1:n), STAT=ERRO)

    !-----------Leitura dos dados iniciais
    print*, '#Entre com o comprimento, angulo, massa e velocidade inicial do pendulo 1:'

    read*, L1, theta1(1), m1, omega1(1)

    !-----------Leitura dos dados iniciais
    print*, '#Entre com o comprimento, angulo, massa e velocidade inicial do pendulo 2:'

    read*, L2, theta2(1), m2, omega2(1)

    T = 0D0

    do i=1,n
        
        k11 = T*omega1(i)
        
        k21 = T*omega2(i)

        k31 = h*aceleracao_angulo1(theta1(i), theta2(i), omega1(i), omega2(i))

        k41 = h*aceleracao_angulo2(theta1(i), theta2(i), omega1(i), omega2(i))

        




        k12 = T*(omega1(i) + k11/2D0)
        
        k13 = T*(omega1(i) + k12/2D0)
        
        k14 = T*(omega1(i) + k13)
        
        theta1(i+1) = theta1(i) + (k11 + 2*k12 + 2*k13 + k14)/6D0

        
        
        k22 = T*(omega2(i) + k21/2D0)
        
        k23 = T*(omega2(i) + k22/2D0)
        
        k24 = T*(omega2(i) + k23)
        
        theta2(i+1) = theta2(i) + (k21 + 2*k22 + 2*k23 + k24)/6D0

        
        
        k32 = h*aceleracao_angulo1(theta1(i) + k31/2D0, theta1(i) + k31/2D0)
        
        k33 = h*aceleracao_angulo1(w + k32/2D0)
        
        k34 = h*aceleracao_angulo1(w + k33)
        
        omega1(i+1) = omega1(i) + (k31 + 2*k32 + 2*k33 + k34)/6D0
        




        T = T + i*DT

        ! write(11,*)t, w
    enddo


    contains

    function aceleracao_angulo1(theta1, theta2, omega1, omega2)
        
        real (kind = extra) aceleracao_angulo1, theta1, theta2, omega1, omega2

        aceleracao_angulo1 = (-g*(2*m1 + m2)*sin(theta1) - m2*g*sin(theta1 - 2*theta2)&
                                 - 2*sin(theta1 - theta2)*m2*(L2*omega2**2 + &
                                    L1*omega1**2*cos(theta1 - theta2)))&
                                /(L1*(2*m1 + m2 - m2*cos(2*theta1 - 2*theta2)))
    end function aceleracao_angulo1

    function aceleracao_angulo2(theta1, theta2, omega1, omega2)
        
        real (kind = extra) aceleracao_angulo2, theta1, theta2, omega1, omega2

        aceleracao_angulo2 = (2*sin(theta1 - theta2)*(omega1**2*L1*(m1 + m2)&
                                + g*(m1 + m2)*cos(theta1) + omega2**2*L2*m2*cos(theta1 - &
                                    theta2)))/(L2*(2*m1 + m2 - m2*cos(2*theta1 -&
                                     2*theta2)))
    end function aceleracao_angulo2

    
end program double_pendulum