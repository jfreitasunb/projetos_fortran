program double_pendulum
    implicit none

    integer, parameter :: extra  = selected_real_kind(p=24,r=1000)

    real (kind = extra) :: x1, y1, L1, theta1, m1, x2, y2, L2, theta2, m2, omega1, omega2 !Posicao, comprimento, angulo e massa dos pêndulos

    real (kind = extra), parameter :: PI = 4.D0*DATAN(1.D0)

    real (kind = extra), parameter :: g = 9.8D0

    real (kind = extra), parameter :: DT = 0.0003D0 !Mudança no tempo.

    !-----------Leitura dos dados iniciais
    print*, '#Entre com o comprimento, angulo e massa dos pendulos: L1 theta1 m1 L2 theta2 m2: '

    read*, L1, theta1, m1, L2, theta2, m2

    ! do i=1,n
        
    !     k11 = h1*funcao_runge_kutta_1(t, w1)
        
    !     k21 = h1*funcao_runge_kutta_1(t + h1/2D0, w1 + k11/2D0)
        
    !     k31 = h1*funcao_runge_kutta_1(t + h1/2D0, w + k21/2D0)
        
    !     k41 = h1*funcao_runge_kutta_1(t + h1, w1 + k31)
        
    !     w1 = w1 + (k11 + 2*k21 + 2*k31 + k41)/6D0

    !     k12 = h2*funcao_runge_kutta_2(t, w2)
        
    !     k22 = h2*funcao_runge_kutta_2(t + h2/2D0, w2 + k12/2D0)
        
    !     k32 = h2*funcao_runge_kutta_2(t + h2/2D0, w + k22/2D0)
        
    !     k42 = h2*funcao_runge_kutta_2(t + h2, w2 + k32)
        
    !     w2 = w2 + (k12 + 2*k22 + 2*k32 + k42)/6D0
        
    !     t = a1 + i*h2

    ! enddo


    contains

    function aceleracao_angulo1(t, w)
        
        real (kind = extra) aceleracao_angulo1, t, w

        aceleracao_angulo1 = (-g*(2*m1 + m2)*sin(theta1) - m2*g*sin(theta1 - 2*theta2)&
                                 - 2*sin(theta1 - theta2)*m2*(L2*omega2**2 + &
                                    L1*omega1**2*cos(theta1 - theta2)))&
                                /(L1*(2*m1 + m2 - m2*cos(2*theta1 - 2*theta2)))
    end function aceleracao_angulo1

    function funcao_runge_kutta2(t, w)
        
        real (kind = extra) funcao_runge_kutta2, t, w

        funcao_runge_kutta2 = cos(2*t) + sin(3*t)
    end function funcao_runge_kutta2

    
end program double_pendulum