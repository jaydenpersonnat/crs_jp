all: exercises tests 

exercises: exercises.ml 
					ocamlbuild -use-ocamlfind exercises.byte 


tests: tests.ml 
					ocamlbuild -use-ocamlfind tests.byte 

clean:
	rm -rf _build *.byte