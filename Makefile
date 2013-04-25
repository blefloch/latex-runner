JOB_NAMES = runner
AUX_EXT = 4ct 4tc aux blg dvi glo gls hd idv idx ilg ind lg log nav out snm spl tmp toc xref
ALL_EXT = $(AUX_EXT) pdf bbl

all: package documentation

package:
	pdflatex runner.ins

documentation: package
	pdflatex runner.dtx
	pdflatex runner.dtx

clean:
	@rm `\
	for D in $(JOB_NAMES); do\
		for E in $(AUX_EXT); do\
			if [ -f $$D.$$E ]; then\
				echo $$D.$$E;\
			fi;\
		done;\
	done`

cleanall:
	@rm `\
	for D in $(JOB_NAMES); do\
		for E in $(ALL_EXT); do\
			if [ -f $$D.$$E ]; then\
				echo $$D.$$E;\
			fi;\
		done;\
	done`
