# Kai's Badass Resume Builder

![Resume Hero Image](assets/hero.png)

Listen up! This is a straight-up killer setup for building resumes without all the garbage. Write your stuff in Markdown, get professional LaTeX PDFs. No bullshit, just results.

## Word Is Straight Trash, Yo

Word is like that cheap equipment that explodes your whole lab. You change one tiny thing, and BOOM - your whole document is contaminated. Images float around like they're haunted. You paste something and get weird formatting diseases. Your headers go all Heisenberg when you're not looking.
Paragraphs get all messed up. Those fancy interface menus hide basic stuff. Big documents run slower than an RV in the desert. And don't get me started on those auto-formatting "features" that just screw everything up.
It's not a document editor - it's like a meth lab where only bad things happen to your resume. Hard pass, yo!

## What This Bad Boy Does



- Let's you write simple text files (even my high school dropout self can handle it)
- Turns your basic text into fancy-ass PDFs automatically
- Builds fresh PDFs whenever you push changes (lazy and smart)
- Runs on whatever rig you've got (no platform drama)

## Setting This Up (Mad Easy)

### Get These Ingredients

- Make
- Pandoc
- XeLaTeX
- Aptos font (used in the template)

### Installation

#### Ubuntu/Debian

```bash
sudo apt-get update
sudo apt-get install -y texlive-xetex texlive-fonts-recommended texlive-fonts-extra pandoc ttf-mscorefonts-installer
sudo fc-cache -f -v
```

#### macOS

```bash
brew install pandoc
brew install --cask mactex-no-gui
```

#### openSUSE Tumbleweed/Leap

```bash
sudo zypper refresh
sudo zypper install texlive-xetex texlive-fonts-recommended texlive-latex pandoc fetchmsttfonts
sudo fc-cache -f -v
```

#### Fedora/RHEL/CentOS

```bash
sudo dnf install texlive-xetex texlive-collection-fontsrecommended texlive-collection-fontsextra pandoc msttcorefonts
sudo fc-cache -f -v
```

#### Arch Linux

```bash
sudo pacman -Sy texlive-most pandoc
yay -S ttf-ms-fonts
sudo fc-cache -f -v
```

#### Windows

Install [MikTeX](https://miktex.org/download) and [Pandoc](https://pandoc.org/installing.html)

## Cooking Instructions

### Mad simple commands

```bash
# Generate both resume and cover letter
make

# Generate only the resume
make resume

# Generate only the cover letter
make cover

# View both PDFs
make view

# View only the resume
make view-resume

# View only the cover letter
make view-cover

# Check information about the output files
make info

# Create a backup of markdown files (only if changes detected)
make bak

# Clean temporary files
make clean

# Remove PDFs and temporary files
make distclean

# Show help message
make help
```

### Personal Information

The resume and cover letter use a `.secrets` file for personal contact information:

- Not committed to git repository (in `.gitignore`)
- All fields are optional - placeholders used when missing
- Comment out any field with `#` to use placeholder text instead

Example `.secrets` file:

```
# Personal contact information
RESUME_PHONE="66668888"
RESUME_COUNTRY_CODE="65"
RESUME_LOCATION="Singapore"
RESUME_EMAIL="user@example.com"
```

### File Structure

- `resume/sections/` - Directory containing section files for the resume
  - `header.md` - Name, contact info, objective, and summary
  - `experiences.md` - Work experience
  - `education.md` - Educational background
  - `skills.md` - Technical and soft skills
  - `projects.md` - Project descriptions
  - `extracurricular.md` - Volunteer and extracurricular activities
  - `languages.md` - Language proficiencies
  - `references.md` - References section
- `cover-letter/coverletter.md` - Cover letter content
- `templates/` - LaTeX templates
  - `resume-template.tex` - Template for resume PDF styling
  - `coverletter-template.tex` - Template for cover letter PDF styling
- `Makefile` - Build automation
- `.secrets` - Personal contact information (not in git)
- `.github/workflows/workflow.yml` - CI/CD configuration

### Deployment

The GitHub Actions workflow automatically:

1. Compiles the resume and cover letter on every push to master branch
2. Installs required dependencies and fonts
3. Deploys the PDFs to a personal storage repository
4. Runs only when relevant files are modified

The workflow detects changes in:

- Markdown files in the resume and cover letter directories
- LaTeX templates
- Makefile and GitHub workflow configuration

## Customization

### Output Filenames

The output filenames are generated based on the name in `resume/sections/header.md`:

```
FirstName_MiddleName_LastName_SWE.pdf
FirstName_MiddleName_LastName_CoverLetter.pdf
```

To change this format, modify the `RESUME_OUTPUT` and `COVER_OUTPUT` variables in the `Makefile`.

### LaTeX Templates

The template files can be modified to adjust:

- Fonts and typography
- Colors and styling
- Layout and spacing
- Section organization

#### Resume Template (`templates/resume-template.tex`)

- Uses the Aptos font
- Accent color: RGB(0, 102, 204)
- Responsive layout with hyperlinks
- Custom environments for entries

#### Cover Letter Template (`templates/coverletter-template.tex`)

- Matches the resume styling for consistency
- Support for signature image
- Paper background color: RGB(244, 241, 236)
- Formatted for professional business correspondence

## Notes

This setup is primarily for personal use but might be helpful for others looking to maintain their resume and cover letter in a similar manner. Feel free to adapt any part of it for your own needs.

PDF files are not tracked in this repository (see `.gitignore`).

---

Cooked up with ❤️ by [Kai](https://bontal.net) - Fork it, remix it, make it yours, yo!
