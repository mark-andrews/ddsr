mkpdf = pdflatex -shell-escape -interaction=nonstopmode
main = chapter_15_hpc
bibtex = ../mjandrews.bib

.PHONY: clean mrproper all

all: $(main).pdf $(main).md $(main).html $(main).docx

$(main).tex: $(main).Rmd $(bibtex)
	Rscript -e "rmarkdown::render('$(main).Rmd')"

$(main).pdf: $(main).tex
	$(mkpdf) $(main).tex
	$(mkpdf) $(main).tex
	$(mkpdf) $(main).tex

$(main).md: $(main).Rmd $(header) $(bibtex)
	Rscript -e 'rmarkdown::render("$(main).Rmd", output_format = rmarkdown::md_document(variant = "markdown"))'

$(main).html: $(main).Rmd $(header) $(bibtex)
	Rscript -e 'rmarkdown::render("$(main).Rmd", output_format = "html_document")'

$(main).docx: $(main).Rmd $(header) $(bibtex)
	Rscript -e 'rmarkdown::render("$(main).Rmd", output_format = "word_document")'
	
	
clean:
	rm -f $(main).log
	rm -rf $(main).aux
	rm -rf _minted-$(main)
	rm -f $(main).toc
	rm -rf logs
	rm -rf derby.log
	rm -rf $(main)_files
	rm -rf $(main)_cache

mrproper: clean
	rm -rf $(main).tex
	rm -f $(main).pdf
	rm -f $(bibtex)

$(bibtex):
	wget --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/mark-andrews/bibtex/master/mjandrews.bib -O $(bibtex)
