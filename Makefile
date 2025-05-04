# Resume and Cover Letter Compilation Makefile

# Core file paths
SRC_SECTIONS_DIR = resume/sections
SRC_RESUME_TEX = templates/resume-template.tex
SRC_COVER_MD = cover-letter/coverletter.md
SRC_COVER_TEX = templates/coverletter-template.tex
SECRETS_FILE = .secrets
SECRETS_TEMPLATE = .secrets.template
TEMP_DIR = .temp

# Backup settings
BAK_DIR = bak
BAK_TIMESTAMP = $(shell date +"%Y%m%d_%H%M%S")
BAK_FILENAME = resume_backup_$(BAK_TIMESTAMP).bak
HASH_FILE = .md_hashes
MD_FILES = $(SECTION_FILES) $(SRC_COVER_MD)

# Section files and extracted info
SECTION_FILES = $(wildcard $(SRC_SECTIONS_DIR)/*.md)
NAME := $(shell grep '^name:' $(SRC_SECTIONS_DIR)/header.md 2>/dev/null | sed 's/^name: "\(.*\)"$$/\1/' || echo "Unnamed")
FIRST_NAME := $(shell echo "$(NAME)" | awk '{print $$1}')
MIDDLE_NAME := $(shell echo "$(NAME)" | awk '{print $$2}')
LAST_NAME := $(shell echo "$(NAME)" | awk '{print $$NF}')

# Output paths
OUTPUT_DIR = out
RESUME_OUTPUT = $(OUTPUT_DIR)/$(FIRST_NAME)_$(MIDDLE_NAME)_$(LAST_NAME)_SWE.pdf
COVER_OUTPUT = $(OUTPUT_DIR)/$(FIRST_NAME)_$(MIDDLE_NAME)_$(LAST_NAME)_CoverLetter.pdf
COMBINED_MD = $(TEMP_DIR)/combined_resume.md

# Temp files to clean
TEX_TEMP = *.aux *.log *.out *.toc *.bbl *.blg *.fls *.fdb_latexmk *.nav *.snm *.synctex.gz *.xdv

# Default values
PHONE_FORMATTED = "Contact-on-request"
PHONE_RAW = "Contact-on-request"
RESUME_COUNTRY_CODE_DEFAULT = "XX"
RESUME_LOCATION = "Location-on-request"
RESUME_EMAIL = "Email-on-request"

# Read values from secrets file if present
ifneq ("$(wildcard $(SECRETS_FILE))","")
    RESUME_PHONE_TMP := $(shell grep -E '^RESUME_PHONE=' $(SECRETS_FILE) | cut -d'"' -f2 2>/dev/null)
    ifneq ($(RESUME_PHONE_TMP),)
        PHONE_FORMATTED := $(shell echo $(RESUME_PHONE_TMP) | sed 's/\(....\)\(.*\)/\1 \2/')
        PHONE_RAW := $(RESUME_PHONE_TMP)
    endif

    RESUME_COUNTRY_CODE_TMP := $(shell grep -E '^RESUME_COUNTRY_CODE=' $(SECRETS_FILE) | cut -d'"' -f2 2>/dev/null)
    ifneq ($(RESUME_COUNTRY_CODE_TMP),)
        RESUME_COUNTRY_CODE := $(RESUME_COUNTRY_CODE_TMP)
    else
        RESUME_COUNTRY_CODE := $(RESUME_COUNTRY_CODE_DEFAULT)
    endif

    RESUME_LOCATION_TMP := $(shell grep -E '^RESUME_LOCATION=' $(SECRETS_FILE) | cut -d'"' -f2 2>/dev/null)
    ifneq ($(RESUME_LOCATION_TMP),)
        RESUME_LOCATION := $(RESUME_LOCATION_TMP)
    endif

    RESUME_EMAIL_TMP := $(shell grep -E '^RESUME_EMAIL=' $(SECRETS_FILE) | cut -d'"' -f2 2>/dev/null)
    ifneq ($(RESUME_EMAIL_TMP),)
        RESUME_EMAIL := $(RESUME_EMAIL_TMP)
    endif
else
    RESUME_COUNTRY_CODE := $(RESUME_COUNTRY_CODE_DEFAULT)
endif

all: resume cover

$(OUTPUT_DIR) $(TEMP_DIR):
	@mkdir -p $@

resume: check-secrets $(OUTPUT_DIR) $(TEMP_DIR) $(RESUME_OUTPUT)

cover: check-secrets $(OUTPUT_DIR) $(COVER_OUTPUT)

hash-check:
	@mkdir -p $(BAK_DIR)
	@if [ ! -f $(HASH_FILE) ]; then \
		find $(SRC_SECTIONS_DIR) -name "*.md" -type f -exec sha256sum {} \; > $(HASH_FILE); \
		sha256sum $(SRC_COVER_MD) >> $(HASH_FILE); \
		echo "Initial hash file created."; \
		exit 0; \
	fi
	@find $(SRC_SECTIONS_DIR) -name "*.md" -type f -exec sha256sum {} \; > $(HASH_FILE).new
	@sha256sum $(SRC_COVER_MD) >> $(HASH_FILE).new
	@if diff -q $(HASH_FILE) $(HASH_FILE).new > /dev/null; then \
		rm $(HASH_FILE).new; \
		echo "No changes detected. Skipping backup."; \
		exit 0; \
	else \
		mv $(HASH_FILE).new $(HASH_FILE); \
		echo "Changes detected. Creating backup..."; \
		exit 1; \
	fi

bak: 
	@mkdir -p $(BAK_DIR)
	@if ! make -s hash-check; then \
		zip -r $(BAK_DIR)/$(BAK_FILENAME) $(SRC_SECTIONS_DIR)/*.md $(SRC_COVER_MD); \
		echo "✓ Backup created: $(BAK_DIR)/$(BAK_FILENAME)"; \
	fi

check-secrets:
	@if [ ! -f $(SECRETS_FILE) ]; then \
		echo "Note: $(SECRETS_FILE) not found - using placeholder values"; \
		if [ ! -f $(SECRETS_TEMPLATE) ]; then \
			echo "Creating $(SECRETS_TEMPLATE) file..."; \
			echo "# Resume secrets - Copy this file to .secrets and fill in your information" > $(SECRETS_TEMPLATE); \
			echo "# This file should NOT be committed to your repository" >> $(SECRETS_TEMPLATE); \
			echo "" >> $(SECRETS_TEMPLATE); \
			echo "# Personal contact information" >> $(SECRETS_TEMPLATE); \
			echo "RESUME_PHONE=\"XXXXXXXX\"" >> $(SECRETS_TEMPLATE); \
			echo "RESUME_COUNTRY_CODE=\"XX\"" >> $(SECRETS_TEMPLATE); \
			echo "RESUME_LOCATION=\"City, Country\"" >> $(SECRETS_TEMPLATE); \
			echo "RESUME_EMAIL=\"your.email@example.com\"" >> $(SECRETS_TEMPLATE); \
		fi; \
	fi

$(COMBINED_MD): $(SECTION_FILES) $(TEMP_DIR)
	@echo "Combining section files..."
	@mkdir -p $(TEMP_DIR)
	@echo "---" > $(COMBINED_MD)
	@grep -E '^name:|^nickname:|^mobile:|^country_code:|^email:|^location:|^portfolio:|^linkedin:|^github:|^objective:|^summary:' $(SRC_SECTIONS_DIR)/header.md >> $(COMBINED_MD)
	@for file in $(filter-out $(SRC_SECTIONS_DIR)/header.md, $(SECTION_FILES)); do \
		sed -n '/^---/,/^---/ { /^---/d; /^---/d; p }' $$file >> $(COMBINED_MD); \
	done
	@echo "---" >> $(COMBINED_MD)
	@for file in $(SECTION_FILES); do \
		sed -n '/^---/,/^---/ { d }; p' $$file >> $(COMBINED_MD); \
	done

$(RESUME_OUTPUT): $(COMBINED_MD) $(SRC_RESUME_TEX) $(OUTPUT_DIR)
	@echo "Compiling resume..."
	@pandoc $(COMBINED_MD) --template=$(SRC_RESUME_TEX) \
		-V mobile_display="$(PHONE_FORMATTED)" \
		-V mobile_raw="$(PHONE_RAW)" \
		-V country_code="$(RESUME_COUNTRY_CODE)" \
		-V location="$(RESUME_LOCATION)" \
		-V email="$(RESUME_EMAIL)" \
		-o $(RESUME_OUTPUT) --pdf-engine=xelatex
	@echo "✓ Resume compiled: $(RESUME_OUTPUT)"

$(COVER_OUTPUT): $(SRC_COVER_MD) $(SRC_COVER_TEX) $(OUTPUT_DIR)
	@echo "Compiling cover letter..."
	@pandoc $(SRC_COVER_MD) --template=$(SRC_COVER_TEX) \
		-V mobile_display="$(PHONE_FORMATTED)" \
		-V mobile_raw="$(PHONE_RAW)" \
		-V country_code="$(RESUME_COUNTRY_CODE)" \
		-V location="$(RESUME_LOCATION)" \
		-V email="$(RESUME_EMAIL)" \
		-o $(COVER_OUTPUT) --pdf-engine=xelatex
	@echo "✓ Cover letter compiled: $(COVER_OUTPUT)"

clean:
	@echo "Cleaning temporary files..."
	@rm -f $(TEX_TEMP)
	@rm -rf $(TEMP_DIR)

distclean: clean
	@echo "Removing generated PDFs..."
	@rm -f $(RESUME_OUTPUT) $(COVER_OUTPUT)
	@rmdir $(OUTPUT_DIR) 2>/dev/null || true

fclean: distclean

info:
	@echo "Document information:"
	@echo "  Name: $(NAME)"
	@echo "  Resume: $(RESUME_OUTPUT)"
	@echo "  Cover letter: $(COVER_OUTPUT)"
	@echo "  Contact: $(PHONE_FORMATTED) | $(RESUME_EMAIL) | $(RESUME_LOCATION)"
	@echo "  Backup directory: $(BAK_DIR)"

view-resume: $(RESUME_OUTPUT)
	@echo "Opening $(RESUME_OUTPUT)..."
	@(command -v xdg-open >/dev/null 2>&1 && xdg-open $(RESUME_OUTPUT)) || \
	 (command -v open >/dev/null 2>&1 && open $(RESUME_OUTPUT)) || \
	 (command -v start >/dev/null 2>&1 && start $(RESUME_OUTPUT)) || \
	 echo "Could not find a command to open the PDF."

view-cover: $(COVER_OUTPUT)
	@echo "Opening $(COVER_OUTPUT)..."
	@(command -v xdg-open >/dev/null 2>&1 && xdg-open $(COVER_OUTPUT)) || \
	 (command -v open >/dev/null 2>&1 && open $(COVER_OUTPUT)) || \
	 (command -v start >/dev/null 2>&1 && start $(COVER_OUTPUT)) || \
	 echo "Could not find a command to open the PDF."

view-both: $(RESUME_OUTPUT) $(COVER_OUTPUT)
	@make -s view-resume
	@make -s view-cover

view: view-both

help:
	@echo "Resume and Cover Letter Makefile Usage:"
	@echo "  make           - Compile both resume and cover letter"
	@echo "  make resume    - Compile only the resume"
	@echo "  make cover     - Compile only the cover letter"
	@echo "  make bak       - Create a backup of markdown files (only if changes detected)"
	@echo "  make hash-check - Check if markdown files have changed since last backup"
	@echo "  make clean     - Remove temporary files"
	@echo "  make distclean - Remove PDFs and temporary files"
	@echo "  make view      - Open both resume and cover letter PDFs"
	@echo "  make info      - Display document information"
	@echo "  make help      - Show this help message"

re: distclean all

.PHONY: all resume cover bak hash-check clean distclean view-resume view-cover view-both view info help check-secrets re fclean