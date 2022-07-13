main=chapter_12_multilevel
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
	
$(main)_slides.pdf: $(main)_slides.Rmd $(header) $(bibtex)
	Rscript -e "rmarkdown::render(input = '$(main)_slides.Rmd', output_file = '$(main)_slides.pdf')"
		
$(bibtex):
	wget --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/mark-andrews/bibtex/master/mjandrews.bib -O $(bibtex) 

clean:
	rm -f $(main).aux
	rm -f $(main).log
	rm -f $(main).toc
	rm -rf $(main)_files
	rm -rf $(main)_cache
	rm -f $(main).tex
	rm -rf $(main)_slides_files 
	rm -rf $(main)_slides.tex
	rm -rf $(main)_slides.aux
	rm -rf $(main)_slides.nav
	rm -rf $(main)_slides.snm
	rm -rf $(main)_slides.toc
	rm -rf $(main)_slides.vrb


mrproper: clean
	rm -f $(main).pdf
	rm -f $(main).md
	rm -f $(main).html
	rm -f $(main).docx
	rm -f $(main)_slides.pdf
	rm -f $(bibtex)

	
