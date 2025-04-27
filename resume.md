---
name: "Min Thu Khaing"
nickname: "Kai"
mobile: "$mobile$"
country_code: "65"
email: "$email$"
location: "$location$"
portfolio: "bontal.net"
linkedin: "linkedin.com/in/pewriebontal"
github: "pewriebontal"
objective: "Systems Analyst or Systems Programmar"
#objective: "Software Engineer with Python, Java, and React experience, seeking a position to apply programming skills in practical solutions."
summary: "Motivated IT undergraduate from University of Newcastle with exceptional academic standing, including High Distinction in Object-Oriented Programming. Experienced in system programming, full-stack development, and AI technologies through projects like Hiraku (AI learning assistant using RAG and LlamaIndex) and custom UNIX shell implementation. Proficient in multiple programming languages (C, C++, Python, JavaScript/TypeScript) with demonstrated expertise in software architecture, algorithm optimization, and cross-platform development. Keen to bring my meticulous approach and hands-on project experience, delivering reliable, high-quality code for your system analysis and programming challenges."

education:
  - institution: "The University of Newcastle"
    institution_url: "https://uon.edu.au/"
    degree: "Bachelor of Information Technology"
    degree_url: "https://dl.bontal.net/academic/bachelor-bit/uon_bit_transcript.pdf"
    period: "Jan 2024 - Aug 2025"
    details:
      - "**High Distinction (HD)** : Object-Oriented Programming"
      - "**Distinctions (D)** : Data Structures, The Digital Economy, Project Management, and Web Technologies."

  - institution: "Singapore University of Technology and Design (SUTD)"
    institution_url: "https://sutd.edu.sg/"
    degree: "École 42 Programme"
    degree_url: "https://42singapore.sg/"
    period: "Sep 2023 - Sep 2024"
    details:
      - "Specializing in System Programming, Algorithms and Data Structures."
      - "Project-based curriculum through peer-to-peer learning methodology."

  - institution: "PSB Academy, Singapore"
    institution_url: "http://psb-academy.edu.sg/"
    degree: "Diploma in InfoComm Technology"
    degree_url: "https://dl.bontal.net/academic/diploma-it/23L030726.pdf"
    period: "Jan 2023 - Nov 2023"
    details:
      - "Recieved A's in all courses completed."

# experience:
#   - company: "Singapore University of Technology and Design (SUTD)"
#     company_url: "https://sutd.edu.sg/"
#     title: "Pisciner, Cadet - École 42"
#     title_url: "https://42singapore.sg/"
#     period: "Jun 2023 – Jul 2023"
#     details:
#       - "Completed 12 individual and 4 group projects in C programming, Linux system administration, and shell scripting."
#       - "Implemented memory management solutions and applied version control with Git in a peer-evaluated environment."
#       - "Finished a month-long bootcamp focused on computer science and software engineering fundamentals."

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

extracurricular:
  - position: "General Volunteer, Heartware Network – River Hongbao 2024"
    organization: "Singapore"
    period: "Feb 2024"
    details:
      - "Managed crowd flow and assisted diverse international visitors, demonstrating effective communication during the large-scale River Hongbao 2024 festival."

  - position: "DJ, Springheads 2024 at SUTD"
    position_url: "https://img.bontal.net/p/2"
    organization: "Singapore"
    period: "Jan 2024"
    details:
      - 'Performed as Warm-up DJ under the alias "DJ Bontal" for a crowd of 500 at the Springheads concert.'

  # - position: "Event DJ, Color Stones Bar & Restaurant"
  #   organization: "Burma"
  #   period: "Jun 2022"
  #   details:
  #     - 'Performed as in-house DJ under alias "Bontal" for the After Party for Burmese singer Kai Za Tin Moong''s concert.'

  # - position: "Kate Bush - Running Up that Hill (Bontal & Kiddo Remix)"
  #   position_url: "https://soundcloud.com/bontal/kate-bush-running-up-that-hill-bontal-kiddo-remix"
  #   organization: ""
  #   period: ""
  #   details:
  #     - "Produced a trance remix of Kate Bush's classic song on SoundCloud in collaboration with DJ Kiddo."
  #     - "Reimagined the track with original production elements to create a unique version."

skills: true

technical_items:
  - name: "Programming Languages"
    description: "C, C++, Python, Java, C#, Dart, SQL,JavaScript/TypeScript, Shell Scripting (Bash, Zsh, PowerShell)"
  - name: "Frameworks & Libraries"
    description: "React.js, Node.js, Flask, FastAPI, Tailwind CSS, HTML, CSS, SQLAlchemy, Celery, .NET MAUI, Flutter, Unity3D (Familiarity)"
  - name: "Databases"
    description: "Relational DBs (Microsoft SQL Server, MySQL, SQLite), NoSQL (Redis), Vector DB (ChromaDB), Data Modeling Concepts"
  - name: "AI/ML"
    description: "Large Language Models (LLMs), Retrieval-Augmented Generation (RAG), LlamaIndex, YOLO (Object Detection)"
  - name: "Systems & Tools"
    description: "Linux/Unix, Git (incl. GitHub, GitLab), Docker, Virtualization (Conceptual Understanding), CI/CD (Conceptual Understanding), Azure (Familiarity), Web Servers (Apache, Nginx), Vercel, Power BI, Environment Configuration, Make, GDB, Valgrind"
  - name: "Core Concepts"
    description: "Data Structures, Algorithms, Object-Oriented Programming, Memory Management (C), Inter-Process Communication, RESTful API Design, Full-Stack Development, Asynchronous Processing, Concurrent Processing, Task Queues, Caching Mechanisms, Logging, Debugging"

professional_items:
  - name: "Problem-Solving"
    description: "Proven ability to analyze issues and implement solutions through algorithm design (DFS in game), system debugging (C library, shell), and overcoming project challenges (PDF parsing)."
  - name: "Meticulous / Attention to Detail"
    description: "Focused on delivering reliable, high-quality code, evidenced by performance optimization (BYAMC benchmarks), testing procedures, and technical documentation."
  - name: "Teamwork & Communication"
    description: "Experience collaborating in pair programming (BJSH project), group projects (Piscine, Hiraku), peer-learning environments (École 42), and communicating with diverse individuals (Volunteering)."
  - name: "Adaptability & Fast Learner"
    description: "Quickly learned and applied diverse technologies across projects (.NET MAUI, Flutter, AI/RAG) and through intensive, self-directed learning (Piscine)."
  - name: "Organization & Planning"
    description: "Effectively managed project tasks, planned development phases (flowcharting for BJSH), and adhered to timelines in academic and bootcamp settings."

languages:
  - name: "English"
    level: "Native / Bilingual Proficiency"
  - name: "Burmese"
    level: "Native / Bilingual Proficiency"
# references: "Available upon request."
---

# $name$

**Mobile:** $mobile$ | **Email:** $email$ | **Location:** $location$  
**Portfolio:** $portfolio$ | **LinkedIn:** $linkedin$ | **GitHub:** $github$
