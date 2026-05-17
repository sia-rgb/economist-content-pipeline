![Economist Content Pipeline](assets/banner.png)

## 1. 项目概览 (Project Overview)

Economist Content Pipeline 是一个面向《经济学人》内容再加工场景的自动化生产管线。项目的核心目标不是做一个通用的 EPUB 阅读器，也不是简单地把英文文本直译为中文，而是围绕固定来源、固定输入格式和固定交付目标，快速完成从英文杂志内容到中文口播稿 Word 文档的转换闭环。

项目当前聚焦最小可运行版本。输入端接收 `.epub` 文件，处理端完成文章提取、正文清洗、长度筛选、翻译处理和文档组织，输出端生成可直接查看、分发或继续编辑的 `.docx` 文件。整体链路可以概括为：

```text
EPUB 输入 → 文章提取 → 正文清洗 → 长度筛选 → 翻译处理 → Word 文档生成
```

该项目的实际价值在于减少内容生产中的重复劳动。对于需要长期阅读《经济学人》文章的个人，筛选合适篇章、阅读具体内容会消耗较多时间。通过自动化管线，这些步骤被压缩为一次文件输入和一次结果输出，使使用者可以把精力集中在感兴趣的主题检索和快速阅读上。

项目的核心亮点包括：

- **面向固定内容来源优化**：围绕《经济学人》EPUB 的内容结构设计处理流程，优先解决真实输入文件的可用性问题。
- **强调内容生产闭环**：从原始 EPUB 到 Word 成稿形成完整链路，而不是停留在单一步骤工具。
- **输出目标清晰**：生成的是适合继续加工的中文口播稿文档，服务于音频稿。
- **保持 MVP 优先**：当前阶段优先保证能跑通、能测试、能演示核心价值，避免在核心链路验证完成前引入过度复杂的设计。

适用场景包括英文杂志内容整理、中文解读稿生成、音视频口播初稿准备、固定来源内容批处理，以及作为后续内容自动化系统的基础模块。本 README 仅作为入口控制器使用，用于限定阅读顺序、执行路径和冲突裁决基准。具体业务规则、输出生成逻辑和运行参数以对应真源文件为准。


## 2. 快速开始 (Quick Start)

### 在线使用

项目已部署到公网，可直接访问：

[立即打开 Economist Content Pipeline](http://8.133.178.210)

### 本地一键启动

Windows 用户在项目根目录双击或运行：

```powershell
start.bat
```

### 手动启动

如需手动启动服务，可运行：

```powershell
pip install -r requirements.txt
python -m uvicorn app:APP --app-dir src --host 127.0.0.1 --port 8000
```

### 命令行处理

```powershell
python src\pipeline.py 输入示例：TE20260509.epub
```


## 3. 真源表 (Source of Truth)

冲突时按下表裁决：

| 内容 | 唯一真源 |
| :--- | :--- |
| 主流程顺序 | `src/pipeline.py` |
| 输出文档生成 | `src/docx_builder.py` |
| EPUB 提取、正文筛选与文本清洗 | `src/article_processor.py` |
| 翻译调用与并发参数 | `src/translate_articles.py` |
| 服务接口、任务状态与下载行为 | `src/app.py` |
| 前端页面 | `frontend/index.html` |
| Python 依赖 | `requirements.txt` |
| 本地一键启动 | `start.bat` / `start.ps1` |
| 本地运行配置 | `.env` |
| 开发约束 | `AGENTS.md` |
