#Declarando compilador
FC = gfortran

#Flags de compilação
#FFLAGS = ff

all:
	$(FC) teste.f90 -o teste.out
