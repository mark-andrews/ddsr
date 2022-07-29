main=chapter_07_reproducible
bibtex=../mjandrews.bib
header=../header.tex

.PHONY: clean mrproper all

all: $(main).pdf $(main).md $(main).html $(main).docx

$(main).pdf: $(main).Rmd $(header) $(bibtex)
	bash ./venv_setup.sh
	Rscript -e 'rmarkdown::render("$(main).Rmd")'
	
$(main).md: $(main).Rmd $(header) $(bibtex)
	Rscript -e 'rmarkdown::render("$(main).Rmd", output_format = rmarkdown::md_document(variant = "markdown"))'

$(main).html: $(main).Rmd $(header) $(bibtex)
	Rscript -e 'rmarkdown::render("$(main).Rmd", output_format = "html_document")'

$(main).docx: $(main).Rmd $(header) $(bibtex)
	Rscript -e 'rmarkdown::render("$(main).Rmd", output_format = "word_document")'

$(main)_slides.pdf: $(main)_slides.Rmd $(header) $(bibtex)
	bash ./venv_setup.sh
	Rscript -e "rmarkdown::render(input = '$(main)_slides.Rmd', output_file = '$(main)_slides.pdf')"
	
$(bibtex):
	wget --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/mark-andrews/bibtex/master/mjandrews.bib -O $(bibtex) 

clean:
	rm -f $(main).aux
	rm -f $(main).log
	rm -f $(main).toc
	rm -rf $(main)_files
	rm -rf chapter_07_venv
	rm -rf __pycache__
	rm -rf examples/*.pdf
	rm -rf examples/*.tex
	rm -rf examples/*.html
	rm -f $(main).tex
	rm -f $(main)_slides.tex
	rm -f $(main)_slides.aux
	rm -f $(main)_slides.snm
	rm -f $(main)_slides.toc
	rm -f $(main)_slides.vrb
	rm -f $(main)_slides.nav
		
mrproper: clean
	rm -f $(main).pdf
	rm -f $(main).md
	rm -f $(main).html
	rm -f $(main).docx
	rm -f $(bibtex)
	rm -f $(main)_slides.pdf
