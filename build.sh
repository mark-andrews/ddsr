BOOK=$HOME/book
BUILD=$BOOK/build

# chapter 01
cd $BOOK/contents/chapter_01_datascience
make chapter_01_datascience.pdf

# chapter 02
cd $BOOK/contents/chapter_02_introduction
make chapter_02_introduction.pdf

# chapter 03
cd $BOOK/contents/chapter_03_wrangling
make chapter_03_wrangling.pdf

# chapter 04
cd $BOOK/contents/chapter_04_visualization
make chapter_04_visualization.pdf
make clean

# chapter 05
cd $BOOK/contents/chapter_05_exploratory
make chapter_05_exploratory.pdf
make clean

# chapter 06
cd $BOOK/contents/chapter_06_programming
make chapter_06_programming.pdf
make clean

# chapter 07
cd $BOOK/contents/chapter_07_reproducible
make chapter_07_reproducible.pdf
make clean

# chapter 08
cd $BOOK/contents/chapter_08_inference
make chapter_08_inference.pdf
make clean

# chapter 09
cd $BOOK/contents/chapter_09_linear
make chapter_09_linear.pdf
make clean

# chapter 10
cd $BOOK/contents/chapter_10_logistic
make chapter_10_logistic.pdf
make clean

# chapter 11
cd $BOOK/contents/chapter_11_generalized
make chapter_11_generalized.pdf
make clean

# chapter 12
cd $BOOK/contents/chapter_12_multilevel
make chapter_12_multilevel.pdf
make clean

# chapter 13
cd $BOOK/contents/chapter_13_nlregression
make chapter_13_nlregression.pdf
make clean

# chapter 14
cd $BOOK/contents/chapter_14_sem
make chapter_14_sem.pdf
make clean

# chapter 15
cd $BOOK/contents/chapter_15_hpc
make chapter_15_hpc.pdf
make clean

# chapter 16
cd $BOOK/contents/chapter_16_shiny
make chapter_16_shiny.pdf
make clean

# chapter 17
cd $BOOK/contents/chapter_17_stan
make chapter_17_stan.pdf
make clean

### 

if [ -d $BUILD ]; then
	rm -rf $BUILD
fi

mkdir -p $BUILD
	
# Cp the pdf files
for f in `find $BOOK -type f -name "chapter_[0-9][0-9]*_*.pdf"`; do 
  cp $f $BUILD
done