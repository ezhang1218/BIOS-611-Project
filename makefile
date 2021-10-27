.PHONY: clean
.PHONY: shiny_app
SHELL: /bin/bash

#Remove dataset, figures, reports generated
clean:
#rm -f cbb19.csv 
rm -f Figures/*.png
#rm -f Figures/*.jpeg
rm -f report.pdf
rm -f Rplots.pdf


#Dataset needed for project & reading it in ############
cbb19.csv: Scripts/read_data.R
Rscript Scripts/read_data.R

#Data needed for the figures
Figures/correlation_matrix.png: Scripts/read_data.R cbb19.csv Scripts/correlation_matrix.R
Rscript Scripts/correlation_matrix.R
