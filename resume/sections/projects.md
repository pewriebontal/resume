---
projects:
  - name: "Catalyst - AI-Powered Productivity App"
    tools: "Flutter, Dart, Riverpod, Isar, AI/NLP, Material You, API Design"
    url: "https://pewrie.bontal.net/projects/catalyst"
    institution: "Personal Project"
    details:
      - "Developed and published desktop/mobile app that transform natural language into structured, actionable priorities using AI and Eisenhower Matrix; features local-first architecture with adaptive UI, modular AI service, offline mode; achieved 4.7-star rating, 40,000+ installs on Flathub, and near-zero crash rate."
  - name: "BitTorrent Tracker Infrastructure"
    tools: "DevOps, System Administration, Go, SQLite, API Design, Docker, Systemd, CI/CD"
    url: "https://bt.bontal.net"
    institution: ""
    details:
      - "Hosted public, censorship-resistant BitTorrent tracker across multi regional servers, handling 6 Figures active peers, seeds, and torrents daily with 99.58% uptime uptime and 43.2M DNS queries/week globally."
      - "Developed Go monitoring daemon to scrape stats, enrich with GeoIP, persist in SQLite; deployed as systemd service; built JSON API for raw/aggregated data (daily/weekly/monthly/yearly) with server filtering."
      - "Developed Dockerized live web dashboard for real-time metrics, historical insights, and server status using React.js, Three.js."

  - name: "Bon and Jason's Shell (bjsh) - UNIX Shell"
    tools: "C, Makefile, GDB, Valgrind"
    url: "https://pewrie.bontal.net/projects/bjsh"
    institution: "SUTD - École 42"
    institution_url: "https://sutd.edu.sg/"
    details:
      - "Engineered a POSIX-compliant UNIX shell from scratch in C, that supports  full command execution pipeline, I/O redirection, piping, signal handling, and job control; optimized for high reliability and performance."

  - name: "NLEX - Natural Language Executor"
    tools: "Go, Shell, LLMs, API Design"
    url: "https://nlex.bontal.net/"
    institution: "Personal Project"
    details:
      - "Developed a Go interactive shell that translates natural language text into executable shell commands."
      - "Included a critical security check to warn users before running potentially destructive commands."

  - name: "Bing Chilling (Ambient Sound Meditation App)"
    tools: "Flutter, Dart, Riverpod, Material Design"
    url: "https://play.google.com/store/apps/details?id=net.bontal.bingchilling"
    institution: "Personal Project"
    details:
      - "Developed and successfully published a Flutter mobile application delivering customizable ambient sounds with background audio playback, designed to aid relaxation and focus, utilizing Riverpod for state management."

  - name: "Where's my Classroom?"
    tools: "Flutter, Dart, Web Scraping, LLMs, API Design, SQLite"
    url: "https://play.google.com/store/apps/details?id=net.bontal.psba.whereismyclassroom"
    institution: "The University of Newcastle"
    institution_url: "https://uon.edu.au/"
    details:
      - "Solved a real-world campus problem by building a mobile app that replaced a confusing and inefficient timetable system of scattered PDFs and websites."
      - "Engineered a system to parse unstructured PDF files using an LLM, delivering a unified, real-time schedule with offline caching and push notifications."

  - name: "BYAMC (Bon's Yet Another Mini C System Library)"
    tools: "C, Makefile, GDB, Valgrind"
    url: "https://github.com/pewriebontal/byamc"
    institution: "SUTD - École 42"
    institution_url: "https://sutd.edu.sg/"
    details:
      - "Developed a lightweight, high-performance ANSI C system library providing core functionalities (string manipulation, memory allocation, I/O, math, linked-list operations), outperforming glibc by up to 46% in `strstr`, 32% in `memcpy`, and 10% in `strlcat`."

  - name: "PDF to Markdown Converter"
    tools: "Python, Celery, Redis, Docker"
    url: "https://github.com/pewriebontal/pdf2md-api"
    institution: "Personal Project"
    details:
      - "Created microservice for PDF conversion with hash-based caching (90% reduction in redundancy) and Redis/Celery queue for 3x throughput."
      
  # - name: "École 42 Piscine Projects"
  #   url: "https://github.com/pewriebontal/c-piscine"
  #   institution: "SUTD - École 42"
  #   institution_url: "https://sutd.edu.sg/"
  #   # period: "Jun 2023 – Jul 2023"
  #   details:
  #     - "Completed 12 individual and 4 group projects in C programming, Linux system administration, and shell scripting during the intensive Piscine bootcamp"
  #     - "Implemented memory management solutions and applied version control with Git in a peer-evaluated environment."
  #     - "Focused on computer science and software engineering fundamentals through hands-on C programming challenges."

  - name: "Personal Package Repository (pkg.bontal.net)"
    tools: "DevOps, System Administration, Security"
    url: "https://pkg.bontal.net"
    institution: "Personal Project"
    details:
      - "Maintained bare-metal Linux repo serving GPG-signed multi-distro packages (APT, DNF/YUM, Zypper, Pacman) for custom tools."

  - name: "Snow Crash (2D game in C)"
    tools: "C, Xorg, Makefile, GDB, Valgrind"
    url: "https://github.com/pewriebontal/snow_crash"
    institution: "SUTD - École 42"
    institution_url: "https://sutd.edu.sg/"
    details:
      - "Developed a 2D game in C from scratch with custom graphics, physics, animations and map validation algorithm."
---
