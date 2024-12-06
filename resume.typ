#import "@local/modern-cv:0.7.0": *

#show: resume.with(
  author: (
    firstname: "Zhifei (Andy)",
    lastname: "Li",
    email: "zhifei.li@berkeley.edu",
    phone: "(+1) 510-292-1508",
    github: "andylizf",
    linkedin: "andylizf",
    positions: (
    //   "Beijing, China",
    //   "AI Systems Researcher",
    //   "Study Abroad @UC Berkeley",
    //   "Empowering Tomorrow's AI",
    ),
  ),
  font: ("Helvetica Neue"), // Or Calibri
  date: datetime.today().display(),
  language: "en",
  colored-headers: true,
  show-footer: false,
)

= Research Interests

I'm interested in building and optimizing machine learning infrastructure and cloud computing systems, focusing on architecting efficient AI platforms and distributed systems that can scale to meet next-generation demands.

= Education

#resume-entry(
  title: "University of California, Berkeley",
  location: "Berkeley, CA, USA",
  date: "August 2024 - Present",
  description: "Exchange Student, Computer Science (Ongoing)",
)

#resume-item[
  - Cultivated research methodology and problem identification skills in prestigious #link("https://ucbsky.github.io/aisys-fa2024/schedule")[CS294-162 Machine Learning Systems] seminar, learning to identify critical challenges in modern AI systems through paper analysis and discussions.
]

#resume-entry(
  title: "Renmin University of China",
  location: "Beijing, China",
  date: "September 2022 - June 2026 (Expected)",
  description: "Bachelor's in Computer Science",
)

#resume-item[
  - Member of Turing Honors Class, which is an elite CS program for top talented students.
  - GPA: 3.8/4.0 (Top 5%, Ranked #strong("5/136", delta: 900))
]


= Experience

#resume-entry(
  title: "Research Intern",
  location: "University of California, Berkeley",
  date: "September 2024 - Present",
  description: "Sky Computing Lab, UCB"
)

#resume-item[
  - Designed and implemented multi-cloud AI workflow orchestration system with data placement optimization, parallel execution support, and dynamic spot instance recovery built upon SkyPilot.
  - Achieved 45% reduction in total cost while maintaining performance through smart data placement, creating first comprehensive solution for multi-cloud AI workflows with simplified management.
]

#resume-entry(
  title: "Research Assistant, supervised by Prof. Feng Zhang",
  location: "Renmin University of China",
  date: "February 2023 - August 2024",
  description: "Key Laboratory of Data Engineering and Knowledge Engineering, RUC",
)

#resume-item[
  - Co-authored a paper (in submission) introducing _TREC_, a convolution method to eliminate transient redundancy in CNNs.
  - Optimized forward and backward propagation for efficiency while maintaining accuracy, integrated as a PyTorch extension.
]

#resume-entry(
  title: "President",
  location: "Renmin University of China",
  date: "2023 - Present",
  description: "RUC Computer Association (RUCCA)",
)

#resume-item[
  - Organized 10+ tech talks with 500+ attendees, exploring Functional Programming to Rust ecosystem.
  - Lead 100+ members across 6 departments, fostering a startup atmosphere and inclusive environment.
]

#resume-entry(
  title: "Head Teaching Assistant",
  location: "Renmin University of China",
  date: "Fall 2024",
  description: "Introduction to Computer Systems (ICS) Course",
)

#resume-item[
  - Led 6 TAs and redesigned CacheLab demonstrating modern GPU memory coalescing for 200+ students.
]


= Honors and Awards

#resume-award-entry(
  title: "National Scholarship",
  date: "September 2024",
  // organization: "Ministry of Education (China)",
)

#resume-award-entry(
  title: "First Place, Computer Comprehensive Ability Competition (Systems Track)",
  date: "May 2024",
  // organization: "Renmin University of China",
)

#resume-award-entry(
  title: "First-Class Scholarship for Social Work and Volunteer Service",
  date: "September 2023",
  // organization: "Renmin University of China",
)

#resume-award-entry(
  title: "First Prize, National Olympiad in Informatics in Provinces (NOIP), China",
  date: "December 2019",
  // organization: "China Computer Federation",
)

= Projects
#resume-entry(
  title: "AI4Edu: Cheese Community",
  location: github-link("SageSeekerSociety/cheese-backend"),
  date: "September 2023 - October 2024",
  description: "Knowledge Q&A and Academic Resource Sharing Platform",
)

#resume-item[
  - Architected scalable full-stack platform featuring real-time collaboration and LLM-powered Q&A serving 1000+ DAU.
]

#resume-entry(
  title: "SkyPilot: Run AI on Any Infra",
  location: github-link("skypilot-org/skypilot"),
  date: "September 2024 - Present",
  description: "Framework for running ML/AI workloads across any cloud infrastructure",
)
#resume-item[
  - Contributed 3000+ LoC and 15+ PRs to core scheduling and resource management components.
  - Performed extensive refactoring and bug fixes across SkyPilot modules, improving code maintainability and reliability.
  - Actively engaged in dev meetings and community discussions, driving feature planning and design decisions.
]
