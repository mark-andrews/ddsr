BOOK=$HOME/book
BUILD=$BOOK/build_slides

# chapter 01
cd $BOOK/contents/chapter_01_datascience
make chapter_01_datascience_slides.pdf
make clean

# chapter 02
cd $BOOK/contents/chapter_02_introduction
make chapter_02_introduction_slides.pdf
make clean

# chapter 03
cd $BOOK/contents/chapter_03_wrangling
make chapter_03_wrangling_slides.pdf
make clean

# chapter 04
cd $BOOK/contents/chapter_04_visualization
make chapter_04_visualization_slides.pdf
make clean

# chapter 05
cd $BOOK/contents/chapter_05_exploratory
make chapter_05_exploratory_slides.pdf
make clean

 # chapter 06
cd $BOOK/contents/chapter_06_programming
make chapter_06_programming_slides.pdf
make clean

# chapter 07
cd $BOOK/contents/chapter_07_reproducible
make chapter_07_reproducible_slides.pdf
make clean

# chapter 08
cd $BOOK/contents/chapter_08_inference
make chapter_08_inference_slides.pdf
make clean

# chapter 09
cd $BOOK/contents/chapter_09_linear
make chapter_09_linear_slides.pdf
make clean

# chapter 10
cd $BOOK/contents/chapter_10_logistic
make chapter_10_logistic_slides.pdf
make clean

# chapter 11
cd $BOOK/contents/chapter_11_generalized
make chapter_11_generalized_slides.pdf
make clean

# chapter 12
cd $BOOK/contents/chapter_12_multilevel
make chapter_12_multilevel_slides.pdf
make clean

# chapter 13
cd $BOOK/contents/chapter_13_nlregression
make chapter_13_nlregression_slides.pdf
make clean

# chapter 14
cd $BOOK/contents/chapter_14_sem
make chapter_14_sem_slides.pdf
make clean

# chapter 15
cd $BOOK/contents/chapter_15_hpc
make chapter_15_hpc_slides.pdf
make clean

# chapter 16
cd $BOOK/contents/chapter_16_shiny
make chapter_16_shiny_slides.pdf
make clean

# chapter 17
cd $BOOK/contents/chapter_17_stan
make chapter_17_stan_slides.pdf
make clean

### 

if [ -d $BUILD ]; then
	rm -rf $BUILD
fi

mkdir -p $BUILD
	
# Cp the pdf files
for f in `find $BOOK -type f -name "chapter_*_slides.pdf"`; do 
  mv $f $BUILD
done
