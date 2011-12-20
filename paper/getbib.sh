#!/bin/bash

mkdir -p tmp

declare -a LIB_BIB=( \ 
"/home/hpl/library/database/internet-content-distribution/multilayer/mylibrary.bib" 
"/home/hpl/library/database/internet-content-distribution/mylibrary.bib" \
)

rm -f tmp/all.bib

for i in ${LIB_BIB[@]}
do
	echo $i
	cat "$i" >> tmp/all.bib
	grep "^@.*," tmp/all.bib  | sed -e 's/@.*{//g' -e 's/,$//g' > tmp/all.bib.key
done

rm -f tmp/gen_bib.tex 
rm -f tmp/gen_bib_body.tex

#for i in `cat tmp/all.bib.key`
#do
#	echo "\\cite{$i}" >> tmp/gen_bib_body.tex
#done

cp gen_bib_body.tex tmp/gen_bib_body.tex

cat gen_bib_begin.tex tmp/gen_bib_body.tex gen_bib_end.tex > tmp/gen_bib.tex

cd tmp
latex gen_bib
bibtex gen_bib
cd -

#cp -f tmp/gen_bib.bbl .
rm -f gen_bib.bbl
#sed 's/\\end\{thebibliography\}//g' tmp/gen_bib.bbl > gen_bib.bbl
sed 's/\\end{thebibliography}//g' tmp/gen_bib.bbl > gen_bib.bbl
cat manual_bib.tex >> gen_bib.bbl
echo '\end{thebibliography}' >> gen_bib.bbl

