#import "@local/modern-cv:0.7.0": *

#let myname(showstar: false) = {
  if showstar {
    [#text(weight: 900)[Zhifei Li]#text(weight: 900, size: 1.2em)[\*]]
  } else {
    text(weight: 900)[Zhifei Li]
  }
}

#let format-authors(..authors) = {
  let author-list = authors.pos()
  let formatted = ()
  for author in author-list {
    if author == "me" {
      formatted.push(myname(showstar: false))
    } else if author == "me*" {
      formatted.push(myname(showstar: true))
    } else {
      formatted.push(text(style: "italic")[#author])
    }
  }
  formatted.join(", ")
}

#let gh_repo(repo_full, stars: none, label: none) = {
  // GitHub icon + repo name with optional stars count
  let _label = if label == none { str(repo_full).split("/").last() } else { label }
  set box(height: 11pt)

  align(right + horizon)[
    #box(baseline: 15%)[#fa-icon("github", fill: color-darkgray)] #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://github.com/" + repo_full, _label)]#if stars != none {
      h(4pt)
      box(baseline: 15%)[#text(size: 8.5pt, fill: gray.darken(20%))[(#h(1pt)#stars#h(2pt)#text(size: 12pt)[★]#h(1pt))]]
    }
  ]
}

#let paper(title, url: none) = {
  if url == none {
    // No link: render plain title without underline
    title
  } else {
    // With link: underline the clickable title
    underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link(url)[#title]]
  }
}

#show ref.where(target: label("leann-paper")): it => {
  underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link(it.target)[LEANN]]
}

#show ref.where(target: label("skynomad-paper")): it => {
  underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link(it.target)[SkyNomad]]
}

#show ref.where(target: label("barbarians-paper")): it => {
  underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link(it.target)[Barbarians at the Gate]]
}

#show ref.where(target: label("frontiercs-paper")): it => {
  underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link(it.target)[FrontierCS]]
}

#show ref.where(target: label("leann-project")): it => {
  underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link(it.target)[LEANN GitHub]]
}

#show ref.where(target: label("skypilot-project")): it => {
  underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link(it.target)[SkyPilot]]
}

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
  font: "Helvetica Neue", // Or Calibri
  date: datetime.today().display(),
  language: "en",
  colored-headers: true,
  show-footer: false,
)

= Research Interests

My research interests lie in designing efficient systems for machine learning workloads, focusing on cloud resource orchestration, distributed training infrastructure, and storage-optimized serving. I am particularly interested in cross-layer optimizations and exploring how AI can fundamentally transform systems design methodologies.

// serving? transform->facilitate

= Education

#resume-entry(
  title: underline()[University of California, Berkeley],
  title-link: "https://www.berkeley.edu",
  location: "Berkeley, CA, USA",
  date: "August 2024 - December 2024",
  description: "Exchange Student, Computer Science",
)

#resume-item[
  - Cultivated research methodology and problem identification skills in #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://ucbsky.github.io/aisys-fa2024/schedule")[CS294-162 Machine Learning Systems]] graduate seminar through paper analysis, critical evaluation, and research discussions.
]

#resume-entry(
  title: [#underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://www.ruc.edu.cn/")[Renmin University of China]] #h(6pt) #text(size: 8.5pt, fill: gray.darken(20%))[(Ranked #text(weight: 900)[23rd] globally on #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://csrankings.org/#/fromyear/2025/toyear/2025/index?all&world")[CSRankings 2025]])]],
  location: "Beijing, China",
  date: "September 2022 - June 2026 (Expected)",
  description: "Bachelor's in Computer Science",
)

#resume-item[
  - Member of Turing Honors Class, a selective computer science program for top-performing students.
  - GPA: 3.8/4.0 (Top 5%, Ranked #text(weight: 900)[5/136])
]

// #resume-entry(
//  title: underline()[The High School Affiliated to Renmin University of China (RDFZ)],
//  title-link: "http://www.rdfz.cn/",
//  location: "Beijing, China",
//  date: "September 2019 - June 2022",
//  description: "High School Diploma",
//)

// #resume-item[
//   - Leads KEEER Club, developing tech platforms for school charity events and volunteer activities
// ]

= Experience

// Considering merging this w/ Education.

#resume-entry(
  title: underline()[Sky Computing Lab],
  title-link: "https://sky.cs.berkeley.edu/",
  location: "University of California, Berkeley",
  date: "July 2025 - December 2025",
  description: [Research Intern, supervised by #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://people.eecs.berkeley.edu/~istoica/")[Ion Stoica]]; Worked with #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://people.eecs.berkeley.edu/~jegonzal/")[Joseph E. Gonzalez]], #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://people.eecs.berkeley.edu/~matei/")[Matei Zaharia]]],
)

#resume-item[
  // paper title
  - *Designed @skynomad-paper for multi-region Spot Instance scheduling.*
    - Addressed fundamental single-region availability bottleneck with Unified Cost Model trading off cross-region opportunities vs egress costs
    - Achieved 50% cost reduction over SOTA, \$1,000 savings vs AWS SageMaker
    - Co-led project with PhD student, owned complete methodology design and simulation framework implementation
    // owned?

  - *Developed @leann-paper for storage-efficient compound AI systems.*
    - Identified critical need for storage-efficient vector search in RAG pipeline where storage costs dominate
    // identified criticle need?
    - Co-designed two-level recompute algorithm extending FAISS C++; built evaluation framework achieving 97% storage reduction
    - Led research-to-production translation contributing 70% of codebase; reached #link(<leann-project>)[4,000+ stars on GitHub]

  - *Explored AI-driven systems research.*
    - Designed evolution pipelines for OpenEvolve/GEPA demonstrating automated systems research capabilities
    - Led primary case study in @barbarians-paper achieving 30% improvement over NSDI best paper via evolutionary search
    // NSDI best paper?
    - Developed @frontiercs-paper evaluation framework with problem specifications and scoring methodology for 40 CS research tasks
    // co-developed.
]

// #resume-entry(
//  title: "Key Laboratory of DEKE",
//  location: "Renmin University of China",
//  date: "February 2023 - August 2024",
//  description: "Research Assistant, supervised by Prof. Feng Zhang",
//)

//#resume-item[
//  - Developed _TREC_, a convolution method to eliminate transient redundancy in CNNs.
//  - Optimized forward and backward propagation for efficiency while maintaining accuracy, integrated as a PyTorch extension.
//]


= Publications

#metadata("skynomad-ref") <skynomad-paper>
#resume-publication(
  title: paper("SkyNomad: Cost-Effective Multi-Region Scheduling for Deadline-Sensitive Workloads on Spot Instances"),
  authors: [#format-authors("me*", "Tian Xia*", "et al.", "Scott Shenker", "Ion Stoica")],
  venue: "OSDI '26 (in submission)",
)

#metadata("leann-ref") <leann-paper>
#resume-publication(
  title: paper("LEANN: A Low-Storage Overhead Vector Index", url: "https://arxiv.org/abs/2506.08276"),
  authors: [#format-authors("Yichuan Wang", "me", "Shu Liu", "et al.", "Ion Stoica", "Sewon Min", "Matei Zaharia", "Joseph Gonzalez")],
  venue: "MLSys '26 (in submission)",
)

#metadata("barbarians-ref") <barbarians-paper>
#resume-publication(
  title: paper("Barbarians at the Gate: How AI is Upending Systems Research", url: "https://arxiv.org/abs/2510.06189"),
  authors: [#format-authors("Audrey Cheng*", "Shu Liu*", "Melissa Pan*", "me", "Bowen Wang", "et al.", "Ion Stoica")],
  venue: "arXiv",
)

#metadata("frontiercs-ref") <frontiercs-paper>
#resume-publication(
  title: paper("FrontierCS: The Next Frontier of Computer Science"),
  authors: [#format-authors("Qiuyang Mang*", "Wenhao Cai*", "me*", "Huanzhi Mao*", "et al.", "Ion Stoica", "Jingbo Shang", "Zhuang Liu", "Alvin Cheung")],
  venue: "arXiv",
)

#resume-publication(
  title: paper("SkyWalker: A Locality-Aware Cross-Region Load Balancer for LLM Inference", url: "https://arxiv.org/abs/2505.24095v2"),
  authors: [#format-authors("Tian Xia", "Ziming Mao", "Jamison Kerney", "Ethan J. Jackson", "me", "Jiarong Xing", "Scott Shenker", "Ion Stoica")],
  venue: "EuroSys 2026",
)

// #label("checkpoint")
// #resume-publication(
//  title: "Checkpoint: A Tool for Supporting Terminal-Based Capture-the-Flag Assessments",
//  authors: [Connor Bernard\*, Melissa Fabros\*, #strong("Zhifei Li*"), Narges Norouzi, Daniel Garcia, Armando Fox],
//  venue: "Acm Sigcse 2025 Poster",
// )
// #resume-item[
//   - Contributed 3000+ LoC and 15+ PRs to core scheduling and resource management components.
//   - Performed extensive refactoring and bug fixes across SkyPilot modules, improving code maintainability and reliability.
//   - Actively engaged in dev meetings and community discussions, driving feature planning and design decisions.
// ]

= Projects

#metadata("leann-project-ref") <leann-project>
#resume-entry(
  title: "LEANN: the Smallest Vector Index in the World",
  location: gh_repo("yichuan-w/LEANN", stars: "4.1k", label: "LEANN"),
  date: "September 2024 - Present",
  description: "Enjoy 97% storage savings for RAG application on your personal device",
)

#resume-item[
  - Led research-to-production translation of @leann-paper from prototype to production-ready open-source Python package with CI/CD pipeline, growing to 4,000+ GitHub stars with 3 active external contributors and widespread community adoption.
  - Co-designed technical outreach strategy including blog posts and social media campaign, engaging volunteers for cross-platform testing and validation.
]

#metadata("skypilot-project-ref") <skypilot-project>
#resume-entry(
  title: "SkyPilot: Run AI on Any Infra",
  location: gh_repo("skypilot-org/skypilot", stars: "8.9k", label: "SkyPilot"),
  date: "September 2024 - Present",
  description: "Framework for running ML/AI workloads across any cloud infrastructure",
)

#resume-item[
  - Top 10 contributor creating 70+ issues and merging 50+ pull requests; contributed 30,000+ lines of code changes
  - Implemented #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://docs.skypilot.co/en/latest/serving/sky-serve.html#high-availability")[High Availability Controller]] for SkyServe control plane; adopted by startups including Hypermode
  // - Designed and implemented multi-cloud AI workflow orchestration system with data placement optimization, parallel execution support, and dynamic spot instance recovery built upon SkyPilot.
  // - Achieved 45% reduction in total cost while maintaining performance through smart data placement, creating first comprehensive solution for multi-cloud AI workflows with simplified management.
]

#resume-entry(
  title: "AI4Edu: Cheese Community",
  location: gh_repo("SageSeekerSociety/cheese-backend"),
  date: "September 2023 - October 2024",
  description: "Knowledge Q&A and Academic Resource Sharing Platform",
)

#resume-item[
  - Architected scalable full-stack platform featuring real-time collaboration and LLM-powered Q&A serving 1000+ DAU.
]

// #linebreak()

= Services

// AEC Reviewer

#resume-entry(
  title: "Introduction to Computer Systems (ICS)",
  location: "Renmin University of China",
  date: "Fall 2024",
  description: "Head Teaching Assistant",
)

#resume-item[
  // CacheLab? GPU memory optimization. adopted 200 students.
  - Led 6 TAs and redesigned CacheLab demonstrating modern GPU memory coalescing for 200+ students.
]

#resume-entry(
  title: "RUC Computer Association",
  location: "Renmin University of China",
  date: "2023 - Present",
  description: "President",
)

#resume-item[
 - Organized 10+ tech talks with 500+ attendees, exploring Functional Programming to Rust ecosystem.
 - Lead 100+ members across 6 departments, fostering a startup atmosphere and inclusive environment.
]

// think about the startup stuff.

= Honors and Awards

#resume-award-entry(
  title: [Elite Collegiate Award, China Computer Federation #text(size: 9pt, fill: gray.darken(20%), weight: "light")[(\<100 recipients nationally)]],
  date: "August 2025",
  // description: "China Computer Federation",
)

#resume-award-entry(
  title: "Dean's Scholarship, Gaoling School of AI",
  // out of ...
  date: "May 2025",
  // description: "Gaoling School of Artificial Intelligence",
)

#resume-award-entry(
  title: [National Scholarship #text(size: 9pt, fill: gray.darken(20%), weight: "light")[(Top 0.2% nationally)]],
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


= Skills

#resume-skill-item(
  "Coding",
  (text(weight: 900)[C++], text(weight: 900)[Python], text(weight: 900)[CUDA], "Rust", "Typescript", "PyTorch"),
)
#resume-skill-item(
  "Technical",
  (
    text(weight: 900)[Distributed Systems"],
    text(weight: 900)[Parallel Computing],
    "Performance Optimization",
    "Cloud Infrastructure",
    "Open-Source Project Development",
  ),
)
#resume-skill-item(
  "Laboratory",
  ("Research Prototyping", "Research Group Leadership", "Project Timeline Management", "Peer Research Mentoring"),
)
#resume-skill-item(
  "Languages",
  ("English", "Chinese (native)"),
)

#resume-skill-item(
  "Soft Skills",
  ("Structured Thinking", "Startup Ecosystem Navigation", "Hyperfocus Workflow", "Rapid Insight Distillation"),
)
