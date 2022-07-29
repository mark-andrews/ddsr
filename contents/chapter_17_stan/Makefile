main=chapter_17_stan
rm = rm -rf
mkpdf = pdflatex -shell-escape -interaction=nonstopmode
bibtex=../mjandrews.bib
header=../header.tex

.PHONY: clean mrproper all

all: $(main).pdf $(main).md $(main).html $(main).docx

$(main).tex: $(main).Rmd header.tex M_dice_3.Rds $(bibtex) M_math.Rds M_math_2.Rds M_weight.Rds M_biochem.Rds M_biochem_pois.Rds M_biochem_nb.Rds M_lmm.Rds
	Rscript -e "rmarkdown::render('$(main).Rmd')"

$(main).md: $(main).Rmd $(header) $(bibtex)
	Rscript -e 'rmarkdown::render("$(main).Rmd", output_format = rmarkdown::md_document(variant = "markdown"))'

$(main).html: $(main).Rmd $(header) $(bibtex)
	Rscript -e 'rmarkdown::render("$(main).Rmd", output_format = "html_document")'

$(main).docx: $(main).Rmd $(header) $(bibtex) 
	Rscript -e 'rmarkdown::render("$(main).Rmd", output_format = "word_document")'

$(main).pdf: $(main).tex
	$(mkpdf) $(main).tex
	$(mkpdf) $(main).tex
	$(mkpdf) $(main).tex
	$(mkpdf) $(main).tex
	$(mkpdf) $(main).tex
	$(mkpdf) $(main).tex

$(main)_slides.pdf: $(main)_slides.Rmd $(header) $(bibtex) M_math_2.Rds
	Rscript -e "rmarkdown::render(input = '$(main)_slides.Rmd', output_file = '$(main)_slides.pdf')"

M_dice_3.Rds: 
	Rscript scripts/m_dice_3.R

M_dice_4.Rds:
	Rscript scripts/m_dice_4.R

M_math.Rds:
	Rscript scripts/m_normal.R

M_math_2.Rds:
	Rscript scripts/normlinear.R
	
M_weight.Rds: scripts/mlreg.R stan/mlreg.stan
	Rscript scripts/mlreg.R

M_biochem.Rds: scripts/logitreg.R stan/logitreg.stan
	Rscript scripts/logitreg.R

M_biochem_pois.Rds: scripts/poisreg.R stan/poisreg.stan
	Rscript scripts/poisreg.R

M_biochem_nb.Rds: scripts/negbinreg.R stan/negbinreg.stan
	Rscript scripts/negbinreg.R

M_lmm.Rds: scripts/lmm.R stan/lmm.stan
	Rscript scripts/lmm.R

$(bibtex):
	wget --no-check-certificate --no-cache --no-cookies https://raw.githubusercontent.com/mark-andrews/bibtex/master/mjandrews.bib -O $(bibtex)

clean:
	$(rm) _minted-$(main)
	$(rm) $(main).aux
	$(rm) _minted-$(main)
	$(rm) $(main).log
	$(rm) $(main).toc
	$(rm) $(main).aux 
	$(rm) _minted-$(main)
	$(rm) $(main)_files
	$(rm) $(main)_cache
	rm -rf $(main)_slides_files
	rm -rf $(main)_slides_cache
	rm -rf $(main)_slides.tex
	rm -rf $(main)_slides.aux
	rm -rf $(main)_slides.log
	rm -rf $(main)_slides.toc
	rm -rf _minted-$(main)_slides

mrproper: clean
	$(rm) *.Rds
	rm -rf $(main)_cache
	rm -f $(main).pdf
	rm -f $(main).tex
	rm -f $(main).md
	rm -f $(main).html
	rm -f $(main).docx
	rm -f $(bibtex)
	rm -rf $(main)_slides.pdf
