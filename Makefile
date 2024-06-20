IMAGE_NAME = latex-compiler
SRC_DIR = $(PWD)/src
OUT_DIR = $(PWD)/out

.PHONY: all build compile clean

all: build compile

build:
	docker build -t $(IMAGE_NAME) .

compile:
	docker run --rm -v $(SRC_DIR):/work -v $(OUT_DIR):/out $(IMAGE_NAME) sh -c \
		"pdflatex -output-directory=/out -jobname='english' resume.tex && \
		mv /out/english.pdf /out/'Rick Daalhuizen - CV (en).pdf' && \
		pdflatex -output-directory=/out -jobname='dutch' resume.tex && \
		mv /out/dutch.pdf /out/'Rick Daalhuizen - CV (nl).pdf'"

clean:
	rm -f $(OUT_DIR)/*
