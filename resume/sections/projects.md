---
projects:
  - name: "Hiraku (AI-Powered Smart Learning Companion)"
    url: "https://github.com/HirakuAI/Hiraku-RAG"
    institution: "The University of Newcastle"
    institution_url: "https://uon.edu.au/"
    details:
      - "Built Hiraku, a specialized AI chat assistant providing answers derived exclusively from student-uploaded course materials."
      - "Engineered the core AI system using Retrieval-Augmented Generation (RAG with LlamaIndex, ChromaDB) and fine-tuned a Llama language model on custom educational data."
      - "Developed the secure backend API with Python (Flask), JWT authentication, and SQLite database integration."
      - "Constructed the responsive frontend using React.js and Tailwind CSS, featuring real-time chat capabilities."

  - name: "Bon and Jason's Shell (bjsh) - UNIX Shell"
    url: "https://pewrie.bontal.net/projects/bjsh"
    institution: "SUTD - École 42"
    institution_url: "https://sutd.edu.sg/"
    details:
      - 'Designed and Built "bjsh", a custom UNIX shell in ANSI C, leading implementation from initial flowcharting through final testing and optimization.'
      - "Implemented essential shell operations: command interpretation/execution, data piping between processes, I/O redirection, system signal management, and job control features."
      - "Executed comprehensive testing and benchmarking on multiple UNIX platforms to ensure reliability and optimize for speed and low resource consumption."

  - name: "BYAMC (Bon's Yet Another Mini C System Library)"
    url: "https://github.com/pewriebontal/byamc"
    institution: "SUTD - École 42"
    institution_url: "https://sutd.edu.sg/"
    details:
      - "Developed BYAMC, a lightweight ANSI C system library featuring essential string manipulation, memory management, I/O, math, and list operations."
      - "Optimized core library functions for performance while ensuring full ANSI C compliance, validated through integration testing with other projects (BJSH, Byte's Escape)."
      - "Conducted benchmarks showing performance improvements over *libc* in specific memory operations, with *bzero* performing 8% faster on large data sets, 2% faster on medium data, and *memmove* executing 4% faster on medium-sized operations."

  - name: "PDF to Markdown Converter"
    url: "https://github.com/pewriebontal/pdf2md-api"
    institution: "Personal Project"
    details:
      - "Engineered a high-performance PDF to Markdown conversion API using FastAPI, SQLAlchemy, and Celery, implementing an intelligent caching system that reduced redundant processing by 90% and decreased average conversion time from minutes to seconds."
      - "Architected a scalable microservice infrastructure with Redis-based task queuing, achieving 3x throughput compared to synchronous processing while maintaining responsive user experience through asynchronous processing of resource-intensive conversion tasks."
      - "Designed a robust file handling system with secure storage management, implementing SHA-256 hash verification for efficient document tracking and caching, while creating an intuitive responsive UI that simplified document processing workflows and improved user experience across desktop and mobile devices."

  # - name: "École 42 Piscine Projects"
  #   url: "https://github.com/pewriebontal/c-piscine"
  #   institution: "SUTD - École 42"
  #   institution_url: "https://sutd.edu.sg/"
  #   # period: "Jun 2023 – Jul 2023"
  #   details:
  #     - "Completed 12 individual and 4 group projects in C programming, Linux system administration, and shell scripting during the intensive Piscine bootcamp"
  #     - "Implemented memory management solutions and applied version control with Git in a peer-evaluated environment."
  #     - "Focused on computer science and software engineering fundamentals through hands-on C programming challenges."

  - name: "Where's my Classroom?"
    url: "https://play.google.com/store/apps/details?id=net.bontal.psba.whereismyclassroom"
    institution: "The University of Newcastle"
    institution_url: "https://uon.edu.au/"
    details:
      - "Developed a mobile app to help PSB Academy students locate classrooms in real-time using .Net Maui Framework."
      - "Integrated web scraping and engineered an LLM-based system to parse unstructured PDF timetables for room data extraction."
      - "Delivered a cross-platform solution (iOS/Android/Web) featuring offline caching and push notifications for room changes."

  - name: "Bing Chilling (Ambient Sound Meditation App)"
    url: "https://play.google.com/store/apps/details?id=net.bontal.bingchilling"
    institution: "Personal Project"
    details:
      - "Developed 'Bing Chilling,' a Flutter mobile app delivering customizable ambient sounds with background audio playback capabilities."
      - "Designed a responsive Material Design 3 user interface and managed application state using Riverpod, integrating audio_service and just_audio libraries."
      - "Published the fully functional application to the Google Play Store."

  - name: "Byte's Escape (2D game in C)"
    url: "https://github.com/pewriebontal/bytes_escape"
    institution: "SUTD - École 42"
    institution_url: "https://sutd.edu.sg/"
    details:
      - "Engineered ‘Byte’s Escape,’ a 2D game in C, implementing custom graphics rendering, physics, and game mechanics without external game engines."
      - "Developed custom systems for rendering, physics, and state management, incorporating Depth-First Search (DFS) for core game logic and map validation."
      - "Optimized application performance and memory usage, configuring a modular build system using Make."
---
