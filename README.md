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

The only file that needs to be manually edited is `resume.yaml`.

## Theme examples

Previews of each theme are shown below. Select a preview to open its full PDF.

<table>
	<tr>
		<th>Modern</th>
		<th>Classic</th>
	</tr>
	<tr>
		<td><a href="examples/modern.pdf"><img src="examples/modern.pdf.png" alt="Modern resume theme preview" width="360"></a></td>
		<td><a href="examples/classic.pdf"><img src="examples/classic.pdf.png" alt="Classic resume theme preview" width="360"></a></td>
	</tr>
	<tr>
		<th>Executive</th>
		<th>Silly</th>
	</tr>
	<tr>
		<td><a href="examples/executive.pdf"><img src="examples/executive.pdf.png" alt="Executive resume theme preview" width="360"></a></td>
		<td><a href="examples/silly.pdf"><img src="examples/silly.pdf.png" alt="Silly resume theme preview" width="360"></a></td>
	</tr>
</table>