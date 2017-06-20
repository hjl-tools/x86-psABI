INCLUDES  := execution.tex low-level-sys-info.tex development.tex      \
	     introduction.tex sw-installation.tex dl.tex libraries.tex \
	     macros.tex conventions.tex abi-index.tex object-files.tex \
	     kernel.tex fortran.tex linker-optimization.tex x32.tex \
	     mpx.tex secure.tex cet.tex

ALL_FILES := abi.tex $(INCLUDES)

TEXFLAGS = -interaction=nonstopmode -file-line-error

.PHONY: all abi clean ps pdf update

# default
abi: abi.ps

all: abi.ps abi.pdf


abi.dvi: $(ALL_FILES)
	latex $(TEXFLAGS) abi
	makeindex abi
	latex $(TEXFLAGS) abi
	latex $(TEXFLAGS) abi

# Depend on abi.dvi to get index.
pdf abi.pdf: abi.dvi
	pdflatex $(TEXFLAGS) abi

ps abi.ps: abi.dvi
	dvips abi.dvi -o abi.ps


clean:
	rm -f *.log *.aux *.dvi *.ilg *.ind *~ *.idx *.lof *.lot *.out *.pdf *.ps *.toc *.cb* \#*\# *.rej

