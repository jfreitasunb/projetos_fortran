program double_pendulum
    implicit none

    integer, parameter :: extra  = selected_real_kind(p=24,r=1000)

    real (kind = extra) :: x1, y1, L1, theta1, m1, x2, y2, L2, theta2, m2 !Posicao, comprimento, angulo e massa dos pêndulos

    real (kind = extra), parameter :: PI, g

    g = 9.8D0

    PI=4.D0*DATAN(1.D0)

    !-----------Leitura dos dados iniciais
    print*, '#Entre com o comprimento, angulo e massa dos pendulos: L1 theta1 m1 L2 theta2 m2: '

    read*, L1, theta1, m1, L2, theta2, m2


    
end program double_pendulum