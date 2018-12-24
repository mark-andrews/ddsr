main=chapter_10_logistic
bibtex=../mjandrews.bib
header=../header.tex

.PHONY: clean mrproper all

all: $(main).pdf $(main).md $(main).html $(main).docx

$(main).pdf: $(main).Rmd $(header) $(bibtex)
	Rscript -e 'rmarkdown::render("$(main).Rmd")'
	
$(main).md: $(main).Rmd $(header) $(bibtex)
	Rscript -e 'rmarkdown::render("$(main).Rmd", output_format = rmarkdown::md_document(variant = "markdown"))'

$(main).html: $(main).Rmd $(header) $(bibtex)
	Rscript -e 'rmarkdown::render("$(main).Rmd", output_format = "html_document")'

$(main).docx: $(main).Rmd $(header) $(bibtex)
	Rscript -e 'rmarkdown::render("$(main).Rmd", output_format = "word_document")'
	
$(bibtex):
	wget --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/mark-andrews/bibtex/master/mjandrews.bib -O $(bibtex) 

clean:
	rm -f $(main).aux
	rm -f $(main).log
	rm -f $(main).toc

mrproper: clean
	rm -f $(main).pdf
	rm -f $(main).tex
	rm -f $(main).md
	rm -f $(main).html
	rm -f $(main).docx
	rm -f $(bibtex)
	rm -rf $(main)_files
	rm -rf $(main)_cache
	
