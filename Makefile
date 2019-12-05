#CC       = pgcc
CC        = icc
NVCC      = /usr/local/cuda/bin/nvcc
NVCCFLAGS = # -arch=sm_60 -O -g
LDFLAGS   =  -O
CFLAGS    =  -O  
#CFLAGS    =  -O  -DDEBUG1

OBJECTS	  = it_mult_vec.o it_mult_vec_test.o minunit.o

TARGET		= it_mult_vec_test

all:  $(TARGET)

it_mult_vec_test: $(OBJECTS) minunit.h Makefile
	$(NVCC) -o $@ $(OBJECTS) $(LDFLAGS)

status:
	squeue -u `whoami`

run-it_mult_vec_test: it_mult_vec_test
	sbatch -v it_mult_vec_test.sh

%.o: %.cu it_mult_vec.h minunit.h Makefile
	$(NVCC) $(NVCCFLAGS) $(CFLAGS) -o $@ -c $<

.c.o:
	$(NVCC) $(CFLAGS) -c $<

clean:
	rm  *.o $(TARGET)

cleanlog:
	rm  *.out
