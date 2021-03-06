CC = xelatex
BUILD_DIR = build
SOURCE_DIR = tex
RESUME_DIR = tex/resume
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')

examples: $(foreach x, resume-public resume-private, $x.pdf)

resume-public.pdf: $(SOURCE_DIR)/resume-public.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(BUILD_DIR) $<

resume-private.pdf: $(SOURCE_DIR)/resume-private.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(BUILD_DIR) $<

clean:
	rm -rf $(BUILD_DIR)/*.pdf
