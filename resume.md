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
summary: "Motivated IT undergraduate from University of Newcastle with exceptional academic standing, including High Distinction in Object-Oriented Programming. Experienced in system programming, full-stack development, and AI technologies through projects like Hiraku (AI learning assistant using RAG and LlamaIndex) and custom UNIX shell implementation. Proficient in multiple programming languages (C, C++, Python, JavaScript/TypeScript) with demonstrated expertise in software architecture, algorithm optimization, and cross-platform development. Keen to bring this hands-on experience in system development and problem-solving to your company, focusing on delivering high-quality, dependable code for technical challenges."

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
      - "Involved in working on content-aware AI learning assistant for Newcastle Australia IHE as a systems programmar."
      - "The project uses Natural Language Understanding to query the University's course materials across different document formats and uses retrieval augmented generation (RAG) technology."
      - "Designed system pipeline and implemented document processing with LlamaIndex alongside ChromaDB for content retrieval. Finetuned LLAMA 3.2 model with custom dataset for educational applications."
      - "Developed Python backend with Flask RESTful API, user authentication (JWT tokens and password hashing), and SQLite database integration."
      - "Constructed the frontend using React.js and Tailwind CSS, featuring real-time chat functionality."

  - name: "Bon and Jason's Shell (bjsh) - UNIX Shell"
    url: "https://pewrie.bontal.net/projects/bjsh"
    institution: "SUTD - École 42"
    institution_url: "https://sutd.edu.sg/"
    details:
      - "Involved in the designing and development with Jason to build a lightweight command-line interface for UNIX-like systems using ANSI C, including flowcharting, coding, debugging, optimization, and documentation."
      - "Worked on command parsing and execution, piping, I/O redirection, signal handling and job control mechanisms."
      - "Tested the shell on various UNIX-like systems, conducted benchmarks, and optimized performance for responsiveness and resource efficiency."

  - name: "BYAMC (Bon's Yet Another Mini C System Library)"
    url: "https://github.com/pewriebontal/byamc"
    institution: "SUTD - École 42"
    institution_url: "https://sutd.edu.sg/"
    details:
      - "Designed and developed a compact system library and utilities focusing on lightweight design and including essential string manipulation, memory management, I/O operations, math functions, and list operations."
      - "Optimized core functions for performance while maintaining full ANSI C standard compliance."
      - "Tested the library with various software including BJSH and Byte's Escape, conducted benchmarks showing performance improvements over *libc* in specific memory operations, with *bzero* performing 8% faster on large data sets, 2% faster on medium data, and *memmove* executing 4% faster on medium-sized operations."

  - name: "École 42 Piscine Projects"
    url: "https://github.com/pewriebontal/c-piscine"
    institution: "SUTD - École 42"
    institution_url: "https://sutd.edu.sg/"
    # period: "Jun 2023 – Jul 2023" 
    details:
      - "Completed 12 individual and 4 group projects in C programming, Linux system administration, and shell scripting during the intensive Piscine bootcamp"
      - "Implemented memory management solutions and applied version control with Git in a peer-evaluated environment."
      - "Focused on computer science and software engineering fundamentals through hands-on C programming challenges."

  - name: "Where's my Classroom?"
    url: "https://play.google.com/store/apps/details?id=net.bontal.psba.whereismyclassroom"
    institution: "The University of Newcastle"
    institution_url: "https://uon.edu.au/"
    details:
      - "Developed a mobile app to help PSB Academy students locate classrooms in real-time using .Net Maui Framework."
      - "Integrated web scraping to collect room data and built LLM based PDF parsing system to extract and interpret timetable data from Unstructured PDFs."
      - "Created cross-platform solution (iOS/Android/Web) with offline caching machanism."
      - "Implemented push notifications for room changes and a focused UI showing today's/tomorrow's classes."

  - name: "Bing Chilling (Ambient Sound Meditation App)"
    url: "https://play.google.com/store/apps/details?id=net.bontal.bingchilling"
    institution: "Personal Project"
    details:
      - "Developed a mobile app using Flutter SDK that delivers high-quality ambient sounds with customizable settings."
      - "Designed a responsive interface using Material Design 3 with dynamic theming and intuitive controls."
      - "Implemented background audio playback to support meditation sessions."
      - "Used Riverpod for state management and integrated `audio_service` and `just_audio` libraries."
      - "Published the application on Google Play Store."

  - name: "Byte's Escape (2D game from scratch)"
    url: "https://github.com/pewriebontal/bytes_escape"
    institution: "SUTD - École 42"
    institution_url: "https://sutd.edu.sg/"
    details:
      - "Developed a 2D game in C Programming Language without using a game engine, implementing all graphics and game mechanics from scratch."
      - "Used Depth-first search algorithm for map validation and gameplay mechanics."
      - "Built custom rendering systems, player movement physics, and game state management."
      - "Optimized memory usage and performance, setting up a modular build system with Make."

extracurricular:
  - position: "General Volunteer, Heartware Network – River Hongbao 2024"
    organization: "Singapore"
    period: "Feb 2024"
    details:
      - "Managed crowd control at various checkpoints and the lantern area during a major festival."
      - "Assisted international visitors with inquiries, demonstrating communication skills across language barriers."

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

skills:
  - category: "Development & Engineering"
    items:
      - name: "Programming & Scripting"
        description: "C, C++, Java, C#, JavaScript/TypeScript, Python, Dart, SQL; Bash, Zsh, PowerShell, CMD, Batch files; Algorithm design, Data structures"
      - name: "Web, Mobile & Game"
        description: "React.js, Node.js, Flask RESTful, Tailwind CSS, Full-Stack; .NET MAUI, Flutter, Material Design; Unity3D, Game physics/mechanics/AI; MVVM Architecture"
      - name: "Architecture & UI/UX"
        description: "Component design, API structuring, Authentication systems; Responsive interfaces, User flow, Cross-platform; Performance optimization, Debugging"

  - category: "Systems & Tools"
    items:
      - name: "Infrastructure"
        description: "Linux (SUSE, Debian, Arch, Alpine), Unix, Windows, Android; Memory management, Process control, IPC, Shell development; Apache, Nginx, .htaccess, Virtual hosts"
      - name: "DevOps & Tools"
        description: "Docker, Virtualization, CI/CD, Azure; Git, GitHub, GitLab, Repo management; JetBrains IDEs, VS Code, Make, Valgrind, GDB; Network protocols, Cybersecurity, Cryptography"
      - name: "Data & AI"
        description: "SQL, SQLite, Vector Databases (ChromaDB), Data modeling/administration; LLM, RAG, Machine Learning, Data Visualization, Power BI"

  - category: "Professional"
    items:
      - name: "Management & Skills"
        description: "Software Project Management, Task planning, Deadlines, Resource allocation; Pair programming, Knowledge sharing, Cross-functional teamwork; Technical documentation, Code review, Testing; Technology adaptation, Independent research; DJing, Digital media creation"
---

# $name$

**Mobile:** $mobile$ | **Email:** $email$ | **Location:** $location$  
**Portfolio:** $portfolio$ | **LinkedIn:** $linkedin$ | **GitHub:** $github$
