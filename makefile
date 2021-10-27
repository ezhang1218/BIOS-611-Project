.PHONY: clean
.PHONY: shiny_app
SHELL: /bin/bash

#Remove dataset, figures, reports generated
clean:
#rm -f cbb19.csv (I can't figure out how to download directly from kaggle)
rm -f Figures/*.png
#rm -f Figures/*.jpeg
rm -f report.pdf
rm -f Rplots.pdf


#Final report output ##############
report.pdf: report.tex Figures/correlation_matrix.png Figures/pairwise_interaction.png Figures/W_ADJOE.png Figures/W_EFGO.png Figures/W_TOR.png Figures/W_TORD.png Figures/model_assumptions.png
pdflatex report.tex

#Dataset needed for project & reading it in ############
cbb19.csv: Scripts/read_data.R
Rscript Scripts/read_data.R

#Data needed for the figures
Figures/correlation_matrix.png: Scripts/read_data.R cbb19.csv Scripts/correlation_matrix.R
Rscript Scripts/correlation_matrix.R
