
CC = xelatex
BUILD_DIR = build
SOURCE_DIR = tex
RESUME_DIR = tex/resume
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
INPUT_FLAGS = -density 150
OUTPUT_FLAGS = -background white -flatten -quality 100

pdfs: $(foreach x, resume-public resume-private, $x.pdf)
resume-public.pdf: $(SOURCE_DIR)/resume-public.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(BUILD_DIR) $<

resume-private.pdf: $(SOURCE_DIR)/resume-private.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(BUILD_DIR) $<


pngs: $(foreach x, resume-public, $x.png)
resume-public.png:
	convert $(INPUT_FLAGS) $(BUILD_DIR)/resume-public.pdf $(OUTPUT_FLAGS) $(BUILD_DIR)/resume-public.png $<

clean:
	rm -rf $(BUILD_DIR)/*.pdf
	rm -rf $(BUILD_DIR)/*.png
