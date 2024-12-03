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
  date: datetime.today().display(),
  language: "en",
  colored-headers: true,
  show-footer: false,
)

= Research Interests

AI systems researcher driving innovation in machine learning infrastructure and cloud computing, leveraging systems expertise to architect and optimize next-generation AI platforms and distributed systems.

= Education

#resume-entry(
  title: "University of California, Berkeley",
  location: "Berkeley, CA, USA",
  date: "August 2024 - Present",
  description: "Exchange Student, Computer Science (Ongoing)",
)

#resume-item[
  - Cultivated research methodology and problem identification skills in #link("https://ucbsky.github.io/aisys-fa2024/schedule")[CS294-162 Machine Learning Systems] seminar, learning to identify critical challenges in modern AI systems through paper analysis and discussions
]

#resume-entry(
  title: "Renmin University of China",
  location: "Beijing, China",
  date: "September 2022 - June 2026 (Expected)",
  description: "Bachelor's in Computer Science",
)

#resume-item[
  - Member of Turing Honors Class, which is an elite CS program for top talented students
  - GPA: #strong("3.8")/4.0 (Top 5%, Ranked 5/136)
]

// #resume-entry(
//   title: "The High School Affiliated to Renmin University of China (RDFZ)",
//   location: "Beijing, China",
//   date: "2019 - 2022",
//   description: "High School Diploma",
// )

// #resume-item[
//   - Leads KEEER Club, developing tech platforms for school charity events and volunteer activities
// ]

= Experience

#resume-entry(
  title: "Research Intern",
  location: "University of California, Berkeley",
  date: "September 2024 - Present",
  description: "Sky Computing Lab, UCB"
)

#resume-item[
  - Developed cross-cloud AI workflow scheduling in #link("https://github.com/skypilot-org/skypilot")[SkyPilot] achieving 20% cost reduction compared to state-of-the-art solutions
  - Fixed 10+ bugs and drove cross-module refactoring in SkyPilot core components, improving maintainability and reliability
]

#resume-entry(
  title: "Research Assistant, supervised by Prof. Feng Zhang",
  location: "Renmin University of China",
  date: "February 2023 - August 2024",
  description: "Key Laboratory of Data Engineering and Knowledge Engineering, RUC",
)

#resume-item[
  - Co-authored a paper (in submission) introducing _TREC_, a convolution method to eliminate transient redundancy in CNNs
  - Optimized forward and backward propagation for efficiency while maintaining accuracy, integrated as a PyTorch extension
]

#resume-entry(
  title: "President",
  location: "Renmin University of China",
  date: "2023 - Present",
  description: "RUC Computer Association (RUCCA)",
)

#resume-item[
  - Organized 10+ tech talks with 500+ attendees, exploring Functional Programming to Rust ecosystem
  - Lead 100+ members across 6 departments, fostering a startup atmosphere and inclusive environment
]

#resume-entry(
  title: "Head Teaching Assistant",
  location: "Renmin University of China",
  date: "Fall 2024",
  description: "Introduction to Computer Systems (ICS) Course",
)

#resume-item[
  - Led 6 TAs and redesigned CacheLab demonstrating modern GPU memory coalescing for 200+ students
  // - Led course reform, redesigned materials, and managed a team of teaching assistants
  // - Enhanced student engagement through intuitive teaching methods and hands-on projects
]


= Honors and Awards

#let resume-award-entry(
  title: "",
  organization: "",
  date: "",
) = {
  resume-entry(
    title: title,
    date: date,
    description: organization,
  )
}

#resume-award-entry(
  title: "National Scholarship",
  date: "September 2024",
  organization: "Ministry of Education (China)",
)

#resume-award-entry(
  title: "First Place, Computer Comprehensive Ability Competition (Systems Track)",
  date: "May 2024",
  organization: "Renmin University of China",
)

#resume-award-entry(
  title: "First-Class Scholarship for Social Work and Volunteer Service",
  date: "September 2023",
  organization: "Renmin University of China",
)

#resume-award-entry(
  title: "First Prize, National Olympiad in Informatics in Provinces (NOIP), China",
  date: "December 2019",
  organization: "China Computer Federation",
)

= Projects
#resume-entry(
  title: "AI4Edu: Cheese Community",
  location: github-link("SageSeekerSociety/cheese-backend"),
  date: "September 2023 - October 2024",
  description: "Knowledge Q&A and Academic Resource Sharing Platform",
)

#resume-item[
  - Architected scalable full-stack platform featuring real-time collaboration and LLM-powered Q&A serving 1000+ DAU
  // - Developed a university-wide platform integrating AI for enhanced learning and knowledge sharing
  // - Facilitating efficient academic resource management and interactive communication for students and faculty
]

#resume-entry(
  title: "SkyPilot: Run AI on Any Infra",
  location: github-link("skypilot-org/skypilot"),
  date: "September 2024 - Present",
  description: "Framework for running ML/AI workloads across any cloud infrastructure",
)
#resume-item[
  - Contributed 3000+ LoC and 15+ PRs to core scheduling and resource management components
  - Enhanced system reliability through comprehensive testing and bug fixes
  - Actively participated in weekly dev meetings and community engagement
]

// #linebreak()

// = Publications

// #label("checkpoint")
// #resume-publication(
//   title: "Checkpoint: A Tool for Supporting Terminal-Based Capture-the-Flag Assessments",
//   authors: [Connor Bernard\*, Melissa Fabros\*, #strong("Zhifei Li*"), Narges Norouzi, Daniel Garcia, Armando Fox],
//   venue: "Acm Sigcse 2025 Poster",
// )

// #resume-item[
//   - Developed a pedagogy-driven assessment framework enabling progressive learning through interactive terminal missions, implemented with Docker-based validation system
// ]

// = Skills

// #resume-skill-item(
//   "Coding",
//   (strong("C++"), strong("Python"), strong("CUDA"), "Rust", "Typescript", "PyTorch"),
// )
// #resume-skill-item(
//   "Technical",
//   (strong("Distributed Systems"), strong("Parallel Computing"), "Performance Optimization", "Cloud Infrastructure", "Open-Source Project Development")
// )
// #resume-skill-item(
//   "Laboratory",
//   ("Research Prototyping", "Research Group Leadership", "Project Timeline Management", "Peer Research Mentoring")
// )
// #resume-skill-item(
//   "Languages",
//   ("English (TOEFL 104)", "Chinese (native)")
// )

// #resume-skill-item(
//   "Soft Skills",
//   ("Structured Thinking", "Startup Ecosystem Navigation", "Hyperfocus Workflow", "Rapid Insight Distillation")
// )

