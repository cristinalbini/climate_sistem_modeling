#!/usr/bin/make -f
notes:
		./compile.sh main notes
overleaf:
		./compile.sh overleaf notes_overleaf
format:
		latexindent -w main.tex overleaf.tex \
        latexindent -w chapters/*.tex 
clean:
	    ./cleanup.sh

