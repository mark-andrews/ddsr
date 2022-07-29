main = chapter_16_shiny
bibtex = ../mjandrews.bib
header = ../header.tex

.PHONY: clean mrproper all

all: $(main).pdf $(main).md $(main).html $(main).docx

$(main).pdf: $(main).Rmd $(bibtex) $(header)
	Rscript -e "rmarkdown::render('$(main).Rmd')"

$(main).md: $(main).Rmd $(header) $(bibtex)
	Rscript -e 'rmarkdown::render("$(main).Rmd", output_format = rmarkdown::md_document(variant = "markdown"))'

$(main).html: $(main).Rmd $(header) $(bibtex)
	Rscript -e 'rmarkdown::render("$(main).Rmd", output_format = "html_document")'

$(main).docx: $(main).Rmd $(header) $(bibtex)
	Rscript -e 'rmarkdown::render("$(main).Rmd", output_format = "word_document")'
	
$(main)_slides.pdf: $(main)_slides.Rmd $(header) $(bibtex)
	Rscript -e "rmarkdown::render(input = '$(main)_slides.Rmd', output_file = '$(main)_slides.pdf')"

clean:
	rm -f $(main).log
	rm -rf $(main).tex
	rm -rf $(main).aux
	rm -f $(main).toc
	rm -rf $(main)_files
	rm -rf $(main)_cache
	rm -rf $(main)_slides_files
	rm -rf $(main)_slides_cache
	rm -rf $(main)_slides.tex
	rm -rf $(main)_slides.aux
	rm -rf $(main)_slides.log
	rm -rf $(main)_slides.toc
	
mrproper: clean
	rm -f $(main).pdf
	rm -f $(bibtex)
	rm -rf $(main)_slides.pdf

$(bibtex):
	wget --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/mark-andrews/bibtex/master/mjandrews.bib -O $(bibtex)
