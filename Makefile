GCC = gcc
CLANG = clang

CFLAGS = -std=c23 -Wall -Wextra -g -o3

SRC = source/exercise_18.c
GOUT = gcc/gcc_exercise_18
COUT = clang/clang_exercise_18

OUT = output/output_18.txt
IN = input/input_18.txt

ADOC = asciidoctor-pdf

SADOC = docs/exercise_18.adoc
PDF = docs/exercise_18.pdf

all: $(GOUT) $(COUT) run $(PDF)

$(GOUT): $(SRC)
	$(GCC) $(CFLAGS) $(SRC) -o $(GOUT)

$(COUT): $(SRC)
	$(CLANG) $(CFLAGS) $(SRC) -o $(COUT)

grun: $(GOUT)
	date "+W%V %a %Y-%b-%d %T%z" >> $(OUT)
	printf "\nGCC OUTPUT\n----------\n" >> $(OUT)
	./$(GOUT) < $(IN) >> $(OUT)
	printf "\n***** GCC OUTPUT END *****\n\n" >> $(OUT)

crun: $(COUT)
	date "+W%V %a %Y-%b-%d %T%z" >> $(OUT)
	printf "\nCLANG OUTPUT\n----------\n" >> $(OUT)
	./$(COUT) < $(IN) >> $(OUT)
	printf "\n***** CLANG OUTPUT END *****\n\n" >> $(OUT)

$(PDF): $(SADOC)
	$(ADOC) $(SADOC) -o $(PDF)

clean:
	rm -rf $(GOUT) $(COUT)

gout: $(GOUT)
cout: $(COUT)
pdf: $(PDF)
run: crun grun
