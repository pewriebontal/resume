# Resume and Cover Letter Compilation Makefile

# Source files
SRC_RESUME_MD = resume.md
SRC_RESUME_TEX = resume-template.tex
SRC_COVER_MD = coverletter.md
SRC_COVER_TEX = coverletter-template.tex
SECRETS_FILE = .secrets
SECRETS_TEMPLATE = .secrets.template

NAME := $(shell grep '^name:' $(SRC_RESUME_MD) | sed 's/^name: "\(.*\)"$$/\1/')
FIRST_NAME := $(shell echo "$(NAME)" | awk '{print $$1}')
MIDDLE_NAME := $(shell echo "$(NAME)" | awk '{print $$2}')
LAST_NAME := $(shell echo "$(NAME)" | awk '{print $$NF}')

# Output file names
OUTPUT_DIR = out
RESUME_OUTPUT = $(OUTPUT_DIR)/$(FIRST_NAME)_$(MIDDLE_NAME)_$(LAST_NAME)_SWE.pdf
COVER_OUTPUT = $(OUTPUT_DIR)/$(FIRST_NAME)_$(MIDDLE_NAME)_$(LAST_NAME)_CoverLetter.pdf

# LaTeX temp files to clean
TEX_TEMP = *.aux *.log *.out *.toc *.bbl *.blg *.fls *.fdb_latexmk *.nav *.snm *.synctex.gz *.xdv

# Default placeholder values (without spaces to avoid pandoc issues)
PHONE_FORMATTED = "Contact-on-request"
PHONE_RAW = "Contact-on-request"
RESUME_COUNTRY_CODE_DEFAULT = "XX"
RESUME_LOCATION = "Location-on-request"
RESUME_EMAIL = "Email-on-request"

# Check if secrets file exists and read values if present
ifneq ("$(wildcard $(SECRETS_FILE))","")
    # Try to read phone number - grep for line starting with RESUME_PHONE (not commented out)
    RESUME_PHONE_TMP := $(shell grep -E '^RESUME_PHONE=' $(SECRETS_FILE) | cut -d'"' -f2 2>/dev/null)
    ifneq ($(RESUME_PHONE_TMP),)
        # Format phone number with a space (XXXXXXXX -> XXXX XXXX)
        PHONE_FORMATTED := $(shell echo $(RESUME_PHONE_TMP) | sed 's/\(....\)\(.*\)/\1 \2/')
        PHONE_RAW := $(RESUME_PHONE_TMP)
    endif

    # Try to read country code
    RESUME_COUNTRY_CODE_TMP := $(shell grep -E '^RESUME_COUNTRY_CODE=' $(SECRETS_FILE) | cut -d'"' -f2 2>/dev/null)
    ifneq ($(RESUME_COUNTRY_CODE_TMP),)
        RESUME_COUNTRY_CODE := $(RESUME_COUNTRY_CODE_TMP)
    else
        RESUME_COUNTRY_CODE := $(RESUME_COUNTRY_CODE_DEFAULT)
    endif

    # Try to read location
    RESUME_LOCATION_TMP := $(shell grep -E '^RESUME_LOCATION=' $(SECRETS_FILE) | cut -d'"' -f2 2>/dev/null)
    ifneq ($(RESUME_LOCATION_TMP),)
        RESUME_LOCATION := $(RESUME_LOCATION_TMP)
    endif

    # Try to read email
    RESUME_EMAIL_TMP := $(shell grep -E '^RESUME_EMAIL=' $(SECRETS_FILE) | cut -d'"' -f2 2>/dev/null)
    ifneq ($(RESUME_EMAIL_TMP),)
        RESUME_EMAIL := $(RESUME_EMAIL_TMP)
    endif
else
    RESUME_COUNTRY_CODE := $(RESUME_COUNTRY_CODE_DEFAULT)
endif

all: resume cover

# Create output directory if it doesn't exist
$(OUTPUT_DIR):
	@mkdir -p $(OUTPUT_DIR)

resume: check-secrets $(OUTPUT_DIR) $(RESUME_OUTPUT)

cover: check-secrets $(OUTPUT_DIR) $(COVER_OUTPUT)

# Check for secrets file and create template if it doesn't exist
check-secrets:
	@if [ ! -f $(SECRETS_FILE) ]; then \
		echo "Note: $(SECRETS_FILE) not found - using placeholder values"; \
		if [ ! -f $(SECRETS_TEMPLATE) ]; then \
			echo "Creating $(SECRETS_TEMPLATE) file..."; \
			echo "# Resume secrets - Copy this file to .secrets and fill in your information" > $(SECRETS_TEMPLATE); \
			echo "# This file should NOT be committed to your repository" >> $(SECRETS_TEMPLATE); \
			echo "# All fields are OPTIONAL - if not provided or commented out, placeholder text will be used" >> $(SECRETS_TEMPLATE); \
			echo "" >> $(SECRETS_TEMPLATE); \
			echo "# Personal contact information" >> $(SECRETS_TEMPLATE); \
			echo "RESUME_PHONE=\"XXXXXXXX\"  # Without spaces, will be formatted during compilation" >> $(SECRETS_TEMPLATE); \
			echo "RESUME_COUNTRY_CODE=\"XX\" # Your country code (e.g., 65 for Singapore)" >> $(SECRETS_TEMPLATE); \
			echo "RESUME_LOCATION=\"City, Country\"" >> $(SECRETS_TEMPLATE); \
			echo "RESUME_EMAIL=\"your.email@example.com\"" >> $(SECRETS_TEMPLATE); \
			echo "" >> $(SECRETS_TEMPLATE); \
			echo "# Comment out any field to use placeholder text instead" >> $(SECRETS_TEMPLATE); \
			echo "# Example: # RESUME_PHONE=\"XXXXXXXX\"  # This will use the placeholder" >> $(SECRETS_TEMPLATE); \
		fi; \
	fi

# Build the resume
$(RESUME_OUTPUT): $(SRC_RESUME_MD) $(SRC_RESUME_TEX) $(OUTPUT_DIR)
	@echo "Compiling resume..."
	@if [ ! -f $(SRC_RESUME_MD) ]; then \
		echo "Error: $(SRC_RESUME_MD) not found"; \
		exit 1; \
	fi
	@if [ ! -f $(SRC_RESUME_TEX) ]; then \
		echo "Error: $(SRC_RESUME_TEX) not found"; \
		exit 1; \
	fi
	@echo "Using phone number (display): $(PHONE_FORMATTED)"
	@echo "Using phone number (raw): $(PHONE_RAW)"
	@echo "Using country code: $(RESUME_COUNTRY_CODE)"
	@echo "Using location: $(RESUME_LOCATION)"
	@echo "Using email: $(RESUME_EMAIL)"
	@pandoc $(SRC_RESUME_MD) --template=$(SRC_RESUME_TEX) \
		-V mobile_display="$(PHONE_FORMATTED)" \
		-V mobile_raw="$(PHONE_RAW)" \
		-V country_code="$(RESUME_COUNTRY_CODE)" \
		-V location="$(RESUME_LOCATION)" \
		-V email="$(RESUME_EMAIL)" \
		-o $(RESUME_OUTPUT) --pdf-engine=xelatex
	@echo "✓ Successfully compiled $(RESUME_OUTPUT)"
	@echo "File name length: $$(echo -n "$(RESUME_OUTPUT)" | wc -c) characters"

# Build the cover letter
$(COVER_OUTPUT): $(SRC_COVER_MD) $(SRC_COVER_TEX) $(OUTPUT_DIR)
	@echo "Compiling cover letter..."
	@if [ ! -f $(SRC_COVER_MD) ]; then \
		echo "Error: $(SRC_COVER_MD) not found"; \
		exit 1; \
	fi
	@if [ ! -f $(SRC_COVER_TEX) ]; then \
		echo "Error: $(SRC_COVER_TEX) not found"; \
		exit 1; \
	fi
	@echo "Using phone number (display): $(PHONE_FORMATTED)"
	@echo "Using phone number (raw): $(PHONE_RAW)"
	@echo "Using country code: $(RESUME_COUNTRY_CODE)"
	@echo "Using location: $(RESUME_LOCATION)"
	@echo "Using email: $(RESUME_EMAIL)"
	@pandoc $(SRC_COVER_MD) --template=$(SRC_COVER_TEX) \
		-V mobile_display="$(PHONE_FORMATTED)" \
		-V mobile_raw="$(PHONE_RAW)" \
		-V country_code="$(RESUME_COUNTRY_CODE)" \
		-V location="$(RESUME_LOCATION)" \
		-V email="$(RESUME_EMAIL)" \
		-o $(COVER_OUTPUT) --pdf-engine=xelatex
	@echo "✓ Successfully compiled $(COVER_OUTPUT)"
	@echo "File name length: $$(echo -n "$(COVER_OUTPUT)" | wc -c) characters"

clean:
	@echo "Removing temporary files..."
	@rm -f $(TEX_TEMP)
	@echo "✓ Temporary files removed"
distclean: clean
	@echo "Removing generated PDFs and output directory..."
	@rm -f $(RESUME_OUTPUT) $(COVER_OUTPUT)
	@rmdir $(OUTPUT_DIR) 2>/dev/null || true # Remove dir only if empty, ignore error if not empty or doesn't exist
	@echo "✓ PDF files and output directory removed"

fclean: distclean

info:
	@echo "Document information:"
	@echo "  Name: $(NAME)"
	@echo "  Resume output file: $(RESUME_OUTPUT)"
	@echo "  Cover letter output file: $(COVER_OUTPUT)"
	@echo "  Phone (Display): $(PHONE_FORMATTED)"
	@echo "  Phone (Raw): $(PHONE_RAW)"
	@echo "  Country Code: $(RESUME_COUNTRY_CODE)"
	@echo "  Location: $(RESUME_LOCATION)"
	@echo "  Email: $(RESUME_EMAIL)"
	@echo "  Resume file name length: $$(echo -n "$(RESUME_OUTPUT)" | wc -c) characters"
	@echo "  Cover letter file name length: $$(echo -n "$(COVER_OUTPUT)" | wc -c) characters"

view-resume: $(RESUME_OUTPUT)
	@echo "Opening $(RESUME_OUTPUT)..."
	@(command -v xdg-open >/dev/null 2>&1 && xdg-open $(RESUME_OUTPUT)) || \
	 (command -v open >/dev/null 2>&1 && open $(RESUME_OUTPUT)) || \
	 (command -v start >/dev/null 2>&1 && start $(RESUME_OUTPUT)) || \
	 echo "Could not find a command to open the PDF. Please open $(RESUME_OUTPUT) manually."

view-cover: $(COVER_OUTPUT)
	@echo "Opening $(COVER_OUTPUT)..."
	@(command -v xdg-open >/dev/null 2>&1 && xdg-open $(COVER_OUTPUT)) || \
	 (command -v open >/dev/null 2>&1 && open $(COVER_OUTPUT)) || \
	 (command -v start >/dev/null 2>&1 && start $(COVER_OUTPUT)) || \
	 echo "Could not find a command to open the PDF. Please open $(COVER_OUTPUT) manually."

view-both: $(RESUME_OUTPUT) $(COVER_OUTPUT)
	@echo "Opening both resume and cover letter..."
	@echo "Opening $(RESUME_OUTPUT)..."
	@(command -v xdg-open >/dev/null 2>&1 && xdg-open $(RESUME_OUTPUT)) || \
	 (command -v open >/dev/null 2>&1 && open $(RESUME_OUTPUT)) || \
	 (command -v start >/dev/null 2>&1 && start $(RESUME_OUTPUT)) || \
	 echo "Could not find a command to open the PDF. Please open $(RESUME_OUTPUT) manually."
	@echo "Opening $(COVER_OUTPUT)..."
	@(command -v xdg-open >/dev/null 2>&1 && xdg-open $(COVER_OUTPUT)) || \
	 (command -v open >/dev/null 2>&1 && open $(COVER_OUTPUT)) || \
	 (command -v start >/dev/null 2>&1 && start $(COVER_OUTPUT)) || \
	 echo "Could not find a command to open the PDF. Please open $(COVER_OUTPUT) manually."

view: view-both

help:
	@echo "Resume and Cover Letter Makefile Usage:"
	@echo "  make         - Compile both resume and cover letter (default)"
	@echo "  make resume  - Compile only the resume"
	@echo "  make cover   - Compile only the cover letter"
	@echo "  make clean   - Remove temporary LaTeX files"
	@echo "  make distclean - Remove PDFs and temporary files"
	@echo "  make view-resume - Open the compiled resume PDF"
	@echo "  make view-cover  - Open the compiled cover letter PDF"
	@echo "  make view-both   - Open both the resume and cover letter PDFs"
	@echo "  make view    - Open both resume and cover letter PDFs (same as view-both)"
	@echo "  make info    - Display information about both documents"
	@echo "  make help    - Show this help message"

re:
	@echo "Recompiling all documents..."
	@make distclean
	@make all

.PHONY: all resume cover clean distclean view-resume view-cover view-both view info help check-secrets re fclean