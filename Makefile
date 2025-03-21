# Resume Compilation Makefile

# Source files
SRC_MD = resume.md
SRC_TEX = resume-template.tex

# Extract info from resume.md
NAME := $(shell grep '^name:' $(SRC_MD) | sed 's/^name: "\(.*\)"$$/\1/')
FIRST_NAME := $(shell echo "$(NAME)" | awk '{print $$1}')
MIDDLE_NAME := $(shell echo "$(NAME)" | awk '{print $$2}')
LAST_NAME := $(shell echo "$(NAME)" | awk '{print $$NF}')

OUTPUT = $(FIRST_NAME)_$(MIDDLE_NAME)_$(LAST_NAME)_SWE.pdf

# LaTeX temp files to clean
TEX_TEMP = *.aux *.log *.out *.toc *.bbl *.blg *.fls *.fdb_latexmk *.nav *.snm *.synctex.gz *.xdv

# Default target - compile resume
all: $(OUTPUT)

# Build the resume
$(OUTPUT): $(SRC_MD) $(SRC_TEX)
	@echo "Compiling resume..."
	@if [ ! -f $(SRC_MD) ]; then \
		echo "Error: $(SRC_MD) not found"; \
		exit 1; \
	fi
	@if [ ! -f $(SRC_TEX) ]; then \
		echo "Error: $(SRC_TEX) not found"; \
		exit 1; \
	fi
	@pandoc $(SRC_MD) --template=$(SRC_TEX) -o $(OUTPUT) --pdf-engine=xelatex
	@echo "✓ Successfully compiled $(OUTPUT)"
	@echo "File name length: $$(echo -n "$(OUTPUT)" | wc -c) characters"

# Clean temporary LaTeX files
clean:
	@echo "Removing temporary files..."
	@rm -f $(TEX_TEMP)
	@echo "✓ Temporary files removed"

# Remove PDF and all temporary files
distclean: clean
	@echo "Removing generated PDF..."
	@rm -f $(OUTPUT)
	@echo "✓ PDF file removed"

fclean: distclean

# Show information about the resume
info:
	@echo "Resume information:"
	@echo "  Name: $(NAME)"
	@echo "  Output file: $(OUTPUT)"
	@echo "  File name length: $$(echo -n "$(OUTPUT)" | wc -c) characters"

# View the generated PDF
view: $(OUTPUT)
	@echo "Opening $(OUTPUT)..."
	@(command -v xdg-open >/dev/null 2>&1 && xdg-open $(OUTPUT)) || \
	 (command -v open >/dev/null 2>&1 && open $(OUTPUT)) || \
	 (command -v start >/dev/null 2>&1 && start $(OUTPUT)) || \
	 echo "Could not find a command to open the PDF. Please open $(OUTPUT) manually."

# Help command
help:
	@echo "Resume Makefile Usage:"
	@echo "  make         - Compile the resume (default)"
	@echo "  make clean   - Remove temporary LaTeX files"
	@echo "  make distclean - Remove PDF and temporary files"
	@echo "  make view    - Open the compiled PDF"
	@echo "  make info    - Display information about the resume"
	@echo "  make help    - Show this help message"

.PHONY: all clean distclean view info help