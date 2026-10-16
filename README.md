# Resume Generator
Generate a polished resume from a simple YAML configuration file—no HTML editing required.

# Usage
Create a virtual environment and install the dependencies:

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
playwright install chromium
```

Generate HTML:
```bash
python resume_generator.py resume.yaml --format html
```

Choose a visual style (`modern`, `classic`, `executive`, or `silly`; defaults to `modern`):
```bash
python resume_generator.py resume.yaml --style classic
```

Generate PDF:
```bash
python resume_generator.py resume.yaml --format pdf
```

The selected stylesheet is embedded in generated HTML, so each HTML resume remains a standalone file.

Specify an output file:
```bash
python resume_generator.py resume.yaml --format pdf --output resume.pdf
```

The only file that normally needs to be edited is `resume.yaml`.
Shared layout and pagination rules live in `themes/base.css`; visual tokens and theme-specific presentation live in `themes/modern.css`, `themes/classic.css`, `themes/executive.css`, and `themes/silly.css`. The generator combines the base with the selected theme and embeds the CSS into the generated HTML, so it can be transferred as a standalone file. The template controls document structure, while the YAML file contains resume content.