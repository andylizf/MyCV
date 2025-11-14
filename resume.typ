// #import "@local/modern-cv:0.7.0": *
#import "modern-cv/lib.typ": *

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
    #box(baseline: 15%)[#fa-icon("github", fill: color-darkgray)] #underline(
      evade: false,
      stroke: 0.5pt,
      offset: 0.2em,
    )[#link("https://github.com/" + repo_full, _label)]#if stars != none {
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
  // font: "New Computer Modern", // Or Calibri
  date: datetime.today().display(),
  language: "en",
  colored-headers: true,
  show-footer: false,
)

#set par(spacing: 1.1em)
// #set par(leading: 0.99em)
#show list: set par(spacing: 0.85em, leading: 0.6em)

= Research Interests


My research interests lie in *designing efficient systems for ML*, focusing on cloud resource orchestration, distributed training infrastructure, and compound AI systems addressing the growing resource demands of diverse AI applications.
I am also interested in exploring how AI techniques can advance systems design methodologies.

// = Education

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

#resume-entry(
  title: underline()[Sky Computing Lab],
  title-link: "https://sky.cs.berkeley.edu/",
  location: "University of California, Berkeley",
  date: "July 2025 - December 2025",
  description: [Research Intern, advised by #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://people.eecs.berkeley.edu/~istoica/")[Prof. Ion Stoica]]; \
    #v(-0.7em)worked with #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://people.eecs.berkeley.edu/~jegonzal/")[Prof. Joseph E. Gonzalez]], #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://people.eecs.berkeley.edu/~matei/")[Prof. Matei Zaharia]]],
)

#resume-item[
  #v(0.3em)
  - *@skynomad-paper: Multi-Region Spot Instance Scheduling* (submmited to #strong("OSDI '26"))

    - Designed a multi-region spot instance scheduling system, addressing single-region availability bottlenecks for offline workloads, via Unified Cost Model trading off cross-region availability and pricing vs. migration costs

    - Achieved 50% cost reduction over the SOTA, saved \$1,000+ from a \$2,200 training job vs. AWS SageMaker

    - Led project from research formulation to production, drove methodology design, and built simulation framework

    #v(0.4em)
  - *@leann-paper: Storage-Efficient Compound AI Systems* (submitted to #strong("MLSys '26"))

    - Co-designed a two-level recompute algorithm to cut vector index storage overhead in RAG pipelines

    - Achieved 97% storage reduction with \<5% latency impact; led open-source implementation to #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link(<leann-project>)[4,000+ GitHub stars]]

    - Built the system extending `FAISS` C++, contributing 70\% codebase; conducted comprehensive experimental evaluation

    #v(0.4em)
  - *AI-driven Systems Research*

    - Investigated systems optimization through evolutionary algorithms and LLM-guided design space exploration

    - Led case study in @barbarians-paper paper, which demonstrated 30% improvement over the SOTA

    - Co-developed @frontiercs-paper benchmark with problem specifications and evaluations for 40 open-ended problems
]


#resume-entry(
  title: underline()[University of California, Berkeley],
  title-link: "https://www.berkeley.edu",
  location: "Berkeley, CA, USA",
  date: "August 2024 - December 2024",
  description: "Exchange Student, Computer Science",
)

#resume-item[
  // overlapped.
  #v(0.3em)
  - *#underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://ucbsky.github.io/aisys-fa2024/schedule/")[CS294-162 Machine Learning Systems]] graduate seminar*

    - Optimized complex DAG workload execution through intelligent data placement and cross-cloud task scheduling

    - Achieved 45% cost reduction; select optimizations merged into @skypilot-project
  // - Learnt research methodology and problem-framing skills through 30+ paper reviews and weekly discussions
]

#resume-entry(
  title: [#underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link(
      "https://www.ruc.edu.cn/",
    )[Renmin University of China]] #h(6pt) #text(
      size: 8.5pt,
      fill: gray.darken(20%),
    )[(Ranked #text(weight: 900)[23rd] globally on #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://csrankings.org/#/fromyear/2025/toyear/2025/index?all&world")[CSRankings 2025]])]],
  location: "Beijing, China",
  date: "September 2022 - June 2026 (Expected)",
  description: [Bachelor's in Computer Science, #strong("Turing Honors Class")],
)

#resume-item[
  - GPA: 3.8/4.0 (Top 5%)
  // top talented
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
  title: paper("SkyNomad: Cost-Effective Multi-Region Scheduling for Offline Workloads on Spot Instances"),
  authors: [#format-authors("me*", "Tian Xia*", "et al.", "Scott Shenker", "Ion Stoica")],
  venue: "OSDI '26 (in submission)",
)

#metadata("leann-ref") <leann-paper>
#resume-publication(
  title: paper("LEANN: A Low-Storage Overhead Vector Index", url: "https://arxiv.org/abs/2506.08276"),
  authors: [#format-authors(
    "Yichuan Wang",
    "me",
    "Shu Liu",
    "et al.",
    "Ion Stoica",
    "Sewon Min",
    "Matei Zaharia",
    "Joseph Gonzalez",
  )],
  venue: "MLSys '26 (in submission)",
)

#metadata("barbarians-ref") <barbarians-paper>
#resume-publication(
  title: paper("Barbarians at the Gate: How AI is Upending Systems Research", url: "https://arxiv.org/abs/2510.06189"),
  authors: [#format-authors("Audrey Cheng*", "Shu Liu*", "Melissa Pan*", "me", "Bowen Wang", "et al.", "Ion Stoica")],
  venue: "arXiv: 2510.06189",
)

#metadata("frontiercs-ref") <frontiercs-paper>
#resume-publication(
  title: paper("FrontierCS: The Next Frontier of Computer Science"),
  authors: [#format-authors(
    "Qiuyang Mang*",
    "Wenhao Cai*",
    "me*",
    "Huanzhi Mao*",
    "et al.",
    "Ion Stoica",
    "Jingbo Shang",
    "Zhuang Liu",
    "Alvin Cheung",
  )],
  venue: "arXiv",
)

#resume-publication(
  title: paper(
    "SkyWalker: A Locality-Aware Cross-Region Load Balancer for LLM Inference",
    url: "https://arxiv.org/abs/2505.24095v2",
  ),
  authors: [#format-authors(
    "Tian Xia",
    "Ziming Mao",
    "Jamison Kerney",
    "Ethan J. Jackson",
    "me",
    "Jiarong Xing",
    "Scott Shenker",
    "Ion Stoica",
  )],
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

= Open-Source Projects

#metadata("leann-project-ref") <leann-project>
#resume-entry(
  title: "LEANN: the Smallest Vector Index in the World",
  location: gh_repo("yichuan-w/LEANN", stars: "4.1k", label: "LEANN"),
  date: "September 2024 - Present",
  description: "Enjoy 97% storage savings for RAG application on your personal device",
)

#resume-item[
  - Led research-to-production translation of @leann-paper from prototype to production-ready open-source Python package with CI/CD pipeline, grew to #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://github.com/yichuan-w/LEANN")[4,000+ GitHub stars]] with 3 active external contributors and 40k+ community downloads

  - Drove technical outreach including blog posts social media campaign achieving 600k+ views
]

#metadata("skypilot-project-ref") <skypilot-project>
#resume-entry(
  title: "SkyPilot: Run AI on Any Infra",
  location: gh_repo("skypilot-org/skypilot", stars: "8.9k", label: "SkyPilot"),
  date: "September 2024 - Present",
  description: "Framework for running ML/AI workloads across any cloud infrastructure",
)

#resume-item[
  - Top 10 contributor; created 70+ issues and merged 50+ pull requests; contributed 30,000+ lines of code changes

  - Implemented #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://docs.skypilot.co/en/latest/serving/sky-serve.html#high-availability")[High Availability Controller]] for SkyServe control plane; adopted by startups including Hypermode
]

// #linebreak()

= Services

#resume-entry(
  title: "USENIX ATC '25 Artifact Evaluation Committee",
  // location: "",
  date: "May 2025",
  description: "Reviewer",
)

#resume-entry(
  title: "Introduction to Computer Systems (ICS)",
  // location: "Renmin University of China",
  date: "Fall 2024, Spring 2025",
  description: [#strong("Head") Teaching Assistant],
)

#resume-item[
  - Led 6 TAs in teaching systems curriculum that covered cache hierarchies and memory optimization to 200+ students
  // line
]

#resume-entry(
  title: "RUC Computer Association",
  // location: "Renmin University of China",
  date: "July 2024 - July 2025",
  description: "President",
)

#resume-item[
  - Organized 10+ tech talks, 5000+ total attendees, covering topics from Functional Programming to Rust ecosystem

  - Led 100+ members across 6 departments, fostered a startup atmosphere and inclusive environment
]

#resume-entry(
  title: "Cheese Tech",
  // location: gh_repo("SageSeekerSociety/cheese-backend", label: "Cheese"),
  date: "September 2023 - October 2024",
  description: "Co-founder",
)

#resume-item[
  - Raised \$300K seed funding, grew to 1,000+ users across 3 partner institutions within first year

  - Developed AI-powered research platform with inspiration tracking, progress management, and intelligent advising
]

= Honors and Awards

#let resume-award-entry(title: "", date: "") = {
  block(above: 1em, below: 1em)[
    #resume-certification(title, date)
  ]
}

#resume-award-entry(
  title: [#text(style: "italic", weight: "regular")[Elite Collegiate Award, China Computer Federation] #text(
      size: 9pt,
      fill: gray.darken(20%),
      weight: "light",
    )[(\<100 recipients #strong("nationally"))]],
  date: "August 2025",
  // description: "China Computer Federation",
)

#resume-award-entry(
  title: [#text(style: "italic", weight: "regular")[Dean's Scholarship, Gaoling School of AI] #text(
      size: 9pt,
      fill: gray.darken(20%),
      weight: "light",
    )[(15 recipients out of 2000)]],
  date: "May 2025",
  // description: "Gaoling School of Artificial Intelligence",
)

#resume-award-entry(
  title: [#text(style: "italic", weight: "regular")[National Scholarship] #text(
      size: 9pt,
      fill: gray.darken(20%),
      weight: "light",
    )[(Top 0.2% nationally)]],
  date: "September 2024",
  // organization: "Ministry of Education (China)",
)

// #resume-award-entry(
//   title: [#text(
//     style: "italic",
//     weight: "regular",
//   )[First Place, Computer Comprehensive Ability Competition (Systems Track)]],
//   date: "May 2024",
//   // organization: "Renmin University of China",
// )

#resume-award-entry(
  title: [#text(
      style: "italic",
      weight: "regular",
    )[First-Class Scholarship for Social Service] #text(
      size: 9pt,
      fill: gray.darken(20%),
      weight: "light",
    )[(48 recipients out of #strong("35,000"))]],
  date: "September 2023",
  // organization: "Renmin University of China",
)

#resume-award-entry(
  title: [#text(style: "italic", weight: "regular")[First Prize, National Olympiad in Informatics, Beijing] #text(
      size: 9pt,
      fill: gray.darken(20%),
      weight: "light",
    )[(300 winners)]],
  date: "December 2019",
  // organization: "China Computer Federation",
)


= Skills

#resume-skill-item(
  "Coding",
  (
    text(weight: 900)[C++],
    text(weight: 900)[Python],
    text(weight: 900)[CUDA],
    "Rust",
    "TypeScript",
  ),
)
#resume-skill-item(
  "Tools",
  (
    text(weight: 900)[PyTorch],
    text(weight: 900)[SkyPilot],
    "NeMo",
    "Ray",
    "Kubernetes",
    "verl",
    "Nix",
    "Typst",
  ),
)

// #resume-skill-item(
//   "Technical",
//   (
//     text(weight: 900)[Distributed Systems],
//     text(weight: 900)[Parallel Computing],
//     "Performance Optimization",
//     "Cloud Infrastructure",
//     "Open-Source Project Development",
//   ),
// )
// #resume-skill-item(
//   "Laboratory",
//   ("Research Prototyping", "Research Group Leadership", "Project Timeline Management", "Peer Research Mentoring"),
// )
#resume-skill-item(
  "Languages",
  ("English", "Chinese (native)", "French"),
)

// #resume-skill-item(
//   "Soft Skills",
//   ("Structured Thinking", "Startup Ecosystem Navigation", "Hyperfocus Workflow", "Rapid Insight Distillation"),
// )
