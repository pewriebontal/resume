# Resume Compilation Makefile

# Source files
SRC_MD = resume.md
SRC_TEX = resume-template.tex
SECRETS_FILE = .secrets
SECRETS_TEMPLATE = .secrets.template

# Extract info from resume.md
NAME := $(shell grep '^name:' $(SRC_MD) | sed 's/^name: "\(.*\)"$$/\1/')
FIRST_NAME := $(shell echo "$(NAME)" | awk '{print $$1}')
MIDDLE_NAME := $(shell echo "$(NAME)" | awk '{print $$2}')
LAST_NAME := $(shell echo "$(NAME)" | awk '{print $$NF}')

OUTPUT = $(FIRST_NAME)_$(MIDDLE_NAME)_$(LAST_NAME)_SWE.pdf

# LaTeX temp files to clean
TEX_TEMP = *.aux *.log *.out *.toc *.bbl *.blg *.fls *.fdb_latexmk *.nav *.snm *.synctex.gz *.xdv

# Default placeholder values (without spaces to avoid pandoc issues)
PHONE_FORMATTED = "Contact-on-request"
RESUME_LOCATION = "Location-on-request"
RESUME_EMAIL = "Email-on-request"

# Check if secrets file exists and read values if present
ifneq ("$(wildcard $(SECRETS_FILE))","")
    # Try to read phone number - grep for line starting with RESUME_PHONE (not commented out)
    RESUME_PHONE := $(shell grep -E '^RESUME_PHONE=' $(SECRETS_FILE) | cut -d'"' -f2 2>/dev/null)
    ifneq ($(RESUME_PHONE),)
        # Format phone number with a space (XXXXXXXX -> XXXX XXXX)
        PHONE_FORMATTED := $(shell echo $(RESUME_PHONE) | sed 's/\(....\)\(.*\)/\1 \2/')
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
endif

# Default target - compile resume
all: check-secrets $(OUTPUT)

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
			echo "RESUME_LOCATION=\"City, Country\"" >> $(SECRETS_TEMPLATE); \
			echo "RESUME_EMAIL=\"your.email@example.com\"" >> $(SECRETS_TEMPLATE); \
			echo "" >> $(SECRETS_TEMPLATE); \
			echo "# Comment out any field to use placeholder text instead" >> $(SECRETS_TEMPLATE); \
			echo "# Example: # RESUME_PHONE=\"XXXXXXXX\"  # This will use the placeholder" >> $(SECRETS_TEMPLATE); \
		fi; \
	fi

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
	@echo "Using phone number: $(PHONE_FORMATTED)"
	@echo "Using location: $(RESUME_LOCATION)"
	@echo "Using email: $(RESUME_EMAIL)"
	@pandoc $(SRC_MD) --template=$(SRC_TEX) \
		-V mobile="$(PHONE_FORMATTED)" \
		-V location="$(RESUME_LOCATION)" \
		-V email="$(RESUME_EMAIL)" \
		-o $(OUTPUT) --pdf-engine=xelatex
	@echo "✓ Successfully compiled $(OUTPUT)"
	@echo "File name length: $$(echo -n "$(OUTPUT)" | wc -c) characters"

clean:
	@echo "Removing temporary files..."
	@rm -f $(TEX_TEMP)
	@echo "✓ Temporary files removed"

distclean: clean
	@echo "Removing generated PDF..."
	@rm -f $(OUTPUT)
	@echo "✓ PDF file removed"

fclean: distclean

info:
	@echo "Resume information:"
	@echo "  Name: $(NAME)"
	@echo "  Output file: $(OUTPUT)"
	@echo "  Phone: $(PHONE_FORMATTED)"
	@echo "  Location: $(RESUME_LOCATION)"
	@echo "  Email: $(RESUME_EMAIL)"
	@echo "  File name length: $$(echo -n "$(OUTPUT)" | wc -c) characters"

view: $(OUTPUT)
	@echo "Opening $(OUTPUT)..."
	@(command -v xdg-open >/dev/null 2>&1 && xdg-open $(OUTPUT)) || \
	 (command -v open >/dev/null 2>&1 && open $(OUTPUT)) || \
	 (command -v start >/dev/null 2>&1 && start $(OUTPUT)) || \
	 echo "Could not find a command to open the PDF. Please open $(OUTPUT) manually."

help:
	@echo "Resume Makefile Usage:"
	@echo "  make         - Compile the resume (default)"
	@echo "  make clean   - Remove temporary LaTeX files"
	@echo "  make distclean - Remove PDF and temporary files"
	@echo "  make view    - Open the compiled PDF"
	@echo "  make info    - Display information about the resume"
	@echo "  make help    - Show this help message"

re:
	@echo "Recompiling resume..."
	@make distclean
	@make all

.PHONY: all clean distclean view info help check-secrets