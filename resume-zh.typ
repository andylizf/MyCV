#import "@local/modern-cv:0.7.0": *

#show: resume.with(
  author: (
    firstname: "知非",
    lastname: "李",
    email: "ZhifeiLi@ruc.edu.cn",
    phone: "(+86) 182-1008-3858",
    github: "andylizf",
    positions: (
    //   "北京",
    //   "人工智能系统研究员",
    //   "伯克利交换生",
    //   "致力于未来人工智能发展",
    ),
  ),
  date: datetime.today().display(),
  language: "zh",
  colored-headers: true,
  show-footer: false,
)

= 求职意向

立志成为人工智能系统研究员，期待在机器学习系统和云计算领域开拓创新。凭借计算机系统和软件开发的背景，致力于为前沿人工智能项目贡献系统性解决方案。

= 教育背景

#resume-entry(
  title: "加州大学伯克利分校",
  location: "美国加州伯克利",
  date: "2024年8月 - 2024年12月",
  description: "计算机科学 交换生",
)

#resume-item[
  - 在 #link("https://ucbsky.github.io/aisys-fa2024/schedule")[CS294-162 机器学习系统]研讨课中培养研究方法和问题识别能力，通过论文分析和讨论深入理解现代人工智能系统的关键挑战
]

#resume-entry(
  title: "中国人民大学",
  location: "中国北京",
  date: "2022年9月 - 2026年6月（预计）",
  description: "计算机科学 学士",
)

#resume-item[
  - 图灵班成员（面向计算机领域前5%优秀学生的精英项目）
  - 学分绩点：3.8/4.0（前5%，排名5/136）
]

= 实习经历

#resume-entry(
  title: "研究实习生（导师：Ion Stoica教授）",
  location: "加州大学伯克利分校",
  date: "2024年9月 - 2024年12月",
  description: "Sky Computing实验室",
)

#resume-item[
  - 在SkyPilot中开发跨云人工智能工作流调度系统，相比现有方案降低20%成本
  - 修复10余个bug并推动SkyPilot核心组件的跨模块重构，提升系统可维护性和可靠性
]

#resume-entry(
  title: "研究助理（导师：张峰教授）",
  location: "中国人民大学",
  date: "2023年2月 - 2024年8月",
  description: "数据工程与知识工程重点实验室",
)

#resume-item[
  - 共同撰写论文（在投），提出_TREC_：一种消除卷积神经网络中瞬态冗余的方法
  - 优化前向和反向传播以提升效率，同时保持准确率，并集成为PyTorch扩展
]

#resume-entry(
  title: "会长",
  location: "中国人民大学",
  date: "2023年 - 至今",
  description: "人大计算机协会（RUCCA）",
)

#resume-item[
  - 组织10余场技术讲座，参与人数超500人，内容涵盖函数式编程到Rust生态
  - 带领100多名成员、6个部门，营造创业氛围和包容环境
]

#resume-entry(
  title: "首席助教",
  location: "中国人民大学",
  date: "2024年秋季",
  description: "计算机系统导论（ICS）课程",
)

#resume-item[
  - 领导6名助教，重新设计CacheLab实验，向200多名学生展示现代GPU内存合并技术
]

= 荣誉奖项

#resume-entry(
  title: "国家奖学金",
  date: "2024年9月",
  description: "教育部",
)

#resume-entry(
  title: "计算机综合能力大赛（系统方向）一等奖",
  date: "2024年5月",
  description: "中国人民大学",
)

#resume-entry(
  title: "社会工作与志愿服务一等奖学金",
  date: "2023年9月",
  description: "中国人民大学",
)

#resume-entry(
  title: "全国青少年信息学奥林匹克联赛一等奖",
  date: "2019年12月",
  description: "中国计算机学会",
)

= 项目经历

#resume-entry(
  title: "AI4Edu：芝士社区",
  location: github-link("SageSeekerSociety/cheese-backend"),
  date: "2023年9月 - 2024年10月",
  description: "知识问答与学术资源共享平台",
)

#resume-item[
  - 使用Vue.js、Nest.js和Spring Boot搭建可扩展的全栈平台，具备实时协作和大语言模型驱动的问答功能，日活用户超1000
]

= 发表论文

#label("checkpoint")
#resume-publication(
  title: "Checkpoint: A Tool for Supporting Terminal-Based Capture-the-Flag Assessments",
  authors: [Connor Bernard\*, Melissa Fabros\*, #strong("Zhifei Li*"), Narges Norouzi, Daniel Garcia, Armando Fox],
  venue: "ACM SIGCSE 2025 Poster",
)

#resume-item[
  - 开发基于教学理念的评估框架，通过交互式终端任务实现渐进式学习，采用Docker验证系统实现
]

= 专业技能

#resume-skill-item(
  "编程语言",
  (strong("C++"), strong("Python"), strong("CUDA"), "Rust", "TypeScript", "PyTorch"),
)
#resume-skill-item(
  "技术能力",
  (strong("分布式系统"), strong("并行计算"), "性能优化", "云基础设施", "开源项目开发")
)
#resume-skill-item(
  "实验室能力",
  ("研究原型开发", "研究团队领导", "项目进度管理", "同行研究指导")
)
#resume-skill-item(
  "语言能力",
  ("英语（托福104分）", "中文（母语）")
)

#resume-skill-item(
  "软实力",
  ("结构化思维", "创业生态系统洞察", "高效专注工作", "快速提炼见解")
)