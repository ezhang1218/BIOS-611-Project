.PHONY: clean
.PHONY: shiny_app
SHELL: /bin/bash

#Remove dataset, figures, reports generated
clean:
#rm -f bikes.csv 
	rm -f Figures/*.png
	rm -f report.pdf
#rm -f Figures/*.jpeg

report.pdf:\
 main.tex\
 Figures/correlation_matrix.png\
 Figures/hist_temp_season.png\
 Figures/hist_temp_workingday.png
	pdflatex main.tex
	
	
#Dataset needed for project & reading it in ############
bikes.csv: Scripts/read_data.R
	Rscript Scripts/read_data.R

#Data needed for the figures
Figures/correlation_matrix.png: Scripts/read_data.R bikes.csv Scripts/correlation_matrix.R
	Rscript Scripts/correlation_matrix.R
	
Figures/hist_temp_season.png: Scripts/read_data.R bikes.csv Scripts/histograms.R
	Rscript Scripts/histograms.R

Figures/hist_temp_workingday.png: Scripts/read_data.R bikes.csv Scripts/histograms.R
	Rscript Scripts/histograms.R

#Shiny app build
shiny_app:\
	Scripts/read_data.R\
	bikes.csv\
	shiny_app.R
	Rscript shiny_app.R ${PORT}
