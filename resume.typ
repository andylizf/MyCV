#import "@local/modern-cv:0.7.0": *

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
  underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link(it.target)[LEANN paper]]
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

My research interests lie in designing efficient systems for machine learning workloads, with focus on cloud resource orchestration, distributed training infrastructure, and storage-optimized serving systems. I am particularly interested in leveraging cross-layer optimizations and exploring how AI can fundamentally transform systems design methodologies to address cost-performance tradeoffs in modern ML systems.

// too general. 啥都做
// scalable. AI platforms.
// three lines. two sentences.
// 每一个bullet points. one line. and highlevel
// prior work. delete
// numbers in the same line.
// method keep.
// performance number the last line.
// codesign. iterate the. loading the discussion. of the policy design
// technical details.

// delete Can't Be Late
// remove discovered. design the evolve pipeline.
// contribute % codes.
// top-10 contributoes.
// 


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
  title: [#underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://www.ruc.edu.cn/")[Renmin University of China]] #h(6pt) #text(size: 8.5pt, fill: gray.darken(20%))[(Ranked #text(weight: "black")[23rd] globally on #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://csrankings.org/#/fromyear/2025/toyear/2025/index?all&world")[CSRankings 2025]])]],
  location: "Beijing, China",
  date: "September 2022 - June 2026 (Expected)",
  description: "Bachelor's in Computer Science",
)

#resume-item[
  - Member of Turing Honors Class, a selective computer science program for top-performing students.
  - GPA: 3.8/4.0 (Top 5%, Ranked #strong("5/136", delta: 900))
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

#resume-entry(
  title: underline()[Sky Computing Lab],
  title-link: "https://sky.cs.berkeley.edu/",
  location: "University of California, Berkeley",
  date: "July 2025 - December 2025 (Expected)",
  description: [Research Intern, supervised by #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://people.eecs.berkeley.edu/~istoica/")[Prof. Ion Stoica]]],
)

#resume-item[
  - *Developed @skynomad-paper for multi-region Spot Instance scheduling.*
    - Spot Instances are cost-effective cloud instances subject to preemption at any moment. Previous work on applying Spot Instances to deadline-sensitive batch jobs faced fundamental limitations due to insufficient availability in single regions.
    - Designed a principled algorithmic framework that solves the multi-objective optimization problem, trading off spot opportunities across multiple regions against egress costs and instability risks, achieving 50%+ cost reduction over prior state-of-the-art while meeting deadline guarantees.
    - Co-led this project with a PhD student, collaboratively deciding the algorithm design and project direction. Specifically, took charge of complete methodology design and implementation of the simulation environment for algorithm evaluation.
    - Developed production-ready system extending SkyPilot for training workloads, demonstrating substantial cost savings for academic researchers compared to commercial cloud training services. Our work has been submitted to #strong[OSDI '26] with co-first authorship.

  - *Explored AI-driven systems research.*
    - Investigated the frontier capabilities of AI-driven research systems in addressing research-level problems. Collaborated with senior PhD students to realize AI-driven research systems like AlphaEvolve, GEPA, and ShinkaEvolve, demonstrating potential in reframing systems research methodology and enabling researchers to focus on problem identification rather than manual optimization.
    - Executed #text(style: "italic")[Can't Be Late] case study in @barbarians-paper, applying AI-driven optimization to traditional spot scheduling and achieving 30% performance improvement over recent NSDI best paper, demonstrating the potential of AI approaches for the systems community. Authored technical blog post and delivered presentations exploring future directions of AI-driven systems research methodology.
    - Beyond the vision paper, contributed to @frontiercs-paper benchmark evaluating AI capabilities on computer science research tasks, helping establish frameworks for assessing AI systems' potential in research-level problem solving.
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
  authors: [#strong("Zhifei Li*"), Tian Xia\*, #text(style: "italic")[et al.], Scott Shenker, Ion Stoica],
  venue: "OSDI '26 (in submission)",
)

#resume-item[
  - Co-led project addressing fundamental availability limitations in single-region spot instance scheduling, a bottleneck unresolved by prior work, by leveraging geographic diversity across multiple cloud regions to unlock previously inaccessible capacity.
  - Developed Unified Cost Model algorithm that evaluates multi-region scheduling decisions based on probabilistic future expectations derived from historical availability patterns and real-time price dynamics, achieving 50% cost reduction over prior state-of-the-art.
  - Architected production-grade system extending SkyPilot for deadline-sensitive workloads, demonstrating \$1,000 cost savings on Qwen model fine-tuning compared to AWS SageMaker.
]

#metadata("leann-ref") <leann-paper>
#resume-publication(
  title: paper("LEANN: A Low-Storage Overhead Vector Index", url: "https://arxiv.org/abs/2506.08276"),
  authors: [Yichuan Wang, #strong("Zhifei Li"), Shu Liu, #text(style: "italic")[et al.], Ion Stoica, Sewon Min, Matei Zaharia, Joseph Gonzalez],
  venue: "MLSys '26 (in submission)",
)

#resume-item[
  - Co-designed and executed experimental evaluation framework, producing 70% of benchmark results and 90% of paper figures demonstrating 97% storage reduction across diverse RAG workloads.
  - Implemented the paper's core two-level recompute algorithm by extending FAISS's C++ vector indexing architecture, enabling dynamic query-time decompression that trades minimal computation for order-of-magnitude storage savings.
  - Identified the "storage tax" problem and QPS-storage tradeoff as fundamental design considerations, shaping the paper's problem formulation and evaluation methodology.
]

#metadata("barbarians-ref") <barbarians-paper>
#resume-publication(
  title: paper("Barbarians at the Gate: How AI is Upending Systems Research", url: "https://arxiv.org/abs/2510.06189"),
  authors: [Audrey Cheng\*, Shu Liu\*, Melissa Pan\*, #strong("Zhifei Li"), Bowen Wang, #text(style: "italic")[et al.], Ion Stoica],
  venue: "arXiv",
)

#resume-item[
  - Executed the Can't Be Late case study, the paper's primary demonstration of AI-driven systems optimization, achieving 30% performance improvement over a recent NSDI best paper.
  - Discovered that vanilla starting points can outperform highly-optimized baselines in evolutionary optimization, revealing that specialized code may constrain search space to local optima.
]

#metadata("frontiercs-ref") <frontiercs-paper>
#resume-publication(
  title: paper("FrontierCS: The Next Frontier of Computer Science"),
  authors: [Qiuyang Mang\*, Wenhao Cai\*, #strong("Zhifei Li*"), Huanzhi Mao\*, #text(style: "italic")[et al.],  Ion Stoica, Jingbo Shang, Zhuang Liu, Alvin Cheung],
  venue: "arXiv",
)

#resume-item[
  - Developed evaluation framework for benchmarking AI systems on computer science research problems, designing problem specifications, scoring methodology, and curating 40 research tasks spanning diverse subfields to assess AI reasoning capabilities.
]

#resume-publication(
  title: paper("SkyWalker: A Locality-Aware Cross-Region Load Balancer for LLM Inference", url: "https://arxiv.org/abs/2505.24095v2"),
  authors: [Tian Xia, Ziming Mao, Jamison Kerney, Ethan J. Jackson, #strong("Zhifei Li"), Jiarong Xing, Scott Shenker, Ion Stoica],
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

= Honors and Awards

#resume-award-entry(
  title: [CCF Elite Collegiate Award #text(size: 9pt, fill: gray.darken(20%), weight: "light")[(\<100 recipients nationally)]],
  date: "August 2025",
  // description: "China Computer Federation",
)

#resume-award-entry(
  title: "Dean's Scholarship",
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

= Projects

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

#resume-entry(
  title: "SkyPilot: Run AI on Any Infra",
  location: gh_repo("skypilot-org/skypilot", stars: "8.9k", label: "SkyPilot"),
  date: "September 2024 - Present",
  description: "Framework for running ML/AI workloads across any cloud infrastructure",
)

#resume-item[
  - Core contributor to the project, creating 70+ issues and merging 50+ pull requests implementing and fixing critical issues in core components of SkyPilot, contributing 30,000+ lines of code changes across resource management, scheduler optimization, and multi-cloud orchestration.
  - Implemented #underline(evade: false, stroke: 0.5pt, offset: 0.2em)[#link("https://docs.skypilot.co/en/latest/serving/sky-serve.html#high-availability")[High Availability Controller]] for SkyServe, ensuring robustness of the control plane in production serving scenarios. Feature has been adopted by multiple startups including Hypermode and other production users.
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

#resume-entry(
  title: "Introduction to Computer Systems (ICS)",
  location: "Renmin University of China",
  date: "Fall 2024",
  description: "Head Teaching Assistant",
)

#resume-item[
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

= Skills

#resume-skill-item(
  "Coding",
  (strong("C++"), strong("Python"), strong("CUDA"), "Rust", "Typescript", "PyTorch"),
)
#resume-skill-item(
  "Technical",
  (
    strong("Distributed Systems"),
    strong("Parallel Computing"),
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
