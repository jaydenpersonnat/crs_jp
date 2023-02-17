
all: cr2 cr1 

cr2: cr2.ml 
		ocamlbuild -use-ocamlfind cr2.byte 

tests: tests.ml 
		ocamlbuild -use-ocamlfind tests.byte 

# cr1: cr1.ml 
# 		ocamlbuild -use-ocamlfind cr1.byte
clean:
	rm -rf _build *.byte