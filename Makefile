IMAGE_NAME = latex-compiler
SRC_DIR = $(PWD)/src
OUT_DIR = $(PWD)/out

.PHONY: all build compile clean

all: build compile

build:
	docker buildx build -t $(IMAGE_NAME) .

compile:
	docker run --rm -v $(SRC_DIR):/work -v $(OUT_DIR):/out $(IMAGE_NAME) sh -c \
	  "pdflatex -output-directory=/out \"\def\contentfile{content_en.tex} \input{rick_daalhuizen_resume.tex}\" && \
	   mv /out/rick_daalhuizen_resume.pdf /out/Rick_Daalhuizen_Resume_en.pdf && \
	   pdflatex -output-directory=/out \"\def\contentfile{content_nl.tex} \input{rick_daalhuizen_resume.tex}\" && \
	   mv /out/rick_daalhuizen_resume.pdf /out/Rick_Daalhuizen_Resume_nl.pdf"

clean:
	rm -f $(OUT_DIR)/*
