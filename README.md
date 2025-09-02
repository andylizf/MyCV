# MyCV

My modern academic CV built with [typst](https://github.com/typst/typst), using a customized [modern-cv](https://github.com/DeveloperPaul123/modern-cv) template.

## Setup Requirements

### Required Tools
- [typst](https://github.com/typst/typst) - The core typesetting system
- [just](https://github.com/casey/just) - For simplifying command running

### Required Fonts
- [Roboto](https://fonts.google.com/specimen/Roboto)
- [Source Sans Pro](https://github.com/adobe-fonts/source-sans-pro)
- [FontAwesome](https://fontawesome.com/download) (Free version is sufficient)

## Usage

1. After cloning the repo, install the dependencies:
```bash
cd modern-cv
just dev     # For development (editable install, like pip install -e)
# OR
just install # For production (copies files)
```

2. Compile the CV:
```bash
typst compile resume.typ
```

3. For development with auto-recompilation:
```bash
typst watch resume.typ
```

## Credits
This template is based on [modern-cv](https://github.com/DeveloperPaul123/modern-cv), which is a port of [Awesome-CV](https://github.com/posquit0/Awesome-CV).