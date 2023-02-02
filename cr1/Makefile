all: exercises example tests 

exercises: exercises.ml 
					ocamlbuild -use-ocamlfind exercises.byte 

example: example.ml 
					ocamlbuild -use-ocamlfind example.byte

tests: tests.ml 
					ocamlbuild -use-ocamlfind tests.byte 

clean:
	rm -rf _build *.byte