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

    do i=1,n
        
        k11 = h*theta1
        
        k12 = h*(theta1 + k11/2D0)
        
        k13 = h*(theta1 + k12/2D0)
        
        k14 = h*(theta1 + k13)
        
        theta1 = theta1 + (k11 + 2*k12 + 2*k13 + k14)/6D0

        k21 = h*theta2
        
        k22 = h*(theta2 + k21/2D0)
        
        k23 = h*(theta2 + k22/2D0)
        
        k24 = h*(theta2 + k23)
        
        theta2 = theta2 + (k21 + 2*k22 + 2*k23 + k24)/6D0

        k31 = h*funcao_runge_kutta(t, w)
        
        k32 = h*funcao_runge_kutta(t + h/2D0, w + k31/2D0)
        
        k33 = h*funcao_runge_kutta(t + h/2D0, w + k32/2D0)
        
        k34 = h*funcao_runge_kutta(t + h, w + k33)
        
        omega1 = omega1 + (k31 + 2*k32 + 2*k33 + k34)/6D0
        




        t = a + i*h

        write(11,*)t, w
    enddo


    contains

    function aceleracao_angulo1(t, w)
        
        real (kind = extra) aceleracao_angulo1, t, w

        aceleracao_angulo1 = (-g*(2*m1 + m2)*sin(theta1) - m2*g*sin(theta1 - 2*theta2)&
                                 - 2*sin(theta1 - theta2)*m2*(L2*omega2**2 + &
                                    L1*omega1**2*cos(theta1 - theta2)))&
                                /(L1*(2*m1 + m2 - m2*cos(2*theta1 - 2*theta2)))
    end function aceleracao_angulo1

    function aceleracao_angulo2(t, w)
        
        real (kind = extra) aceleracao_angulo2, t, w

        aceleracao_angulo2 = (2*sin(theta1 - theta2)*(omega1**2*L1*(m1 + m2)&
                                + g*(m1 + m2)*cos(theta1) + omega2**2*L2*m2*cos(theta1 - &
                                    theta2)))/(L2*(2*m1 + m2 - m2*cos(2*theta1 -&
                                     2*theta2)))
    end function aceleracao_angulo2

    
end program double_pendulum