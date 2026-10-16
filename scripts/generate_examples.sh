#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd -- "$SCRIPT_DIR/.." && pwd)"
EXAMPLES_DIR="$ROOT_DIR/examples"
CONFIG_FILE="$ROOT_DIR/resume.yaml"

if [[ -n "${PYTHON:-}" ]]; then
  PYTHON_BIN="$PYTHON"
elif [[ -x "$ROOT_DIR/venv/bin/python" ]]; then
  PYTHON_BIN="$ROOT_DIR/venv/bin/python"
elif [[ -x "$ROOT_DIR/.venv/bin/python" ]]; then
  PYTHON_BIN="$ROOT_DIR/.venv/bin/python"
else
  PYTHON_BIN="$(command -v python3 || true)"
fi

if [[ -z "$PYTHON_BIN" ]]; then
  echo "Error: Python 3 was not found. Set PYTHON to the Python executable." >&2
  exit 1
fi

if command -v qlmanage >/dev/null 2>&1; then
  PREVIEW_TOOL="qlmanage"
elif command -v pdftoppm >/dev/null 2>&1; then
  PREVIEW_TOOL="pdftoppm"
else
  echo "Error: PDF preview generation requires macOS qlmanage or pdftoppm." >&2
  exit 1
fi

mkdir -p "$EXAMPLES_DIR"

for style in modern classic executive silly; do
  pdf_path="$EXAMPLES_DIR/$style.pdf"
  echo "Generating $style PDF..."
  "$PYTHON_BIN" "$ROOT_DIR/resume_generator.py" "$CONFIG_FILE" \
    --format pdf --style "$style" --output "$pdf_path"

  if [[ "$PREVIEW_TOOL" == "qlmanage" ]]; then
    qlmanage -t -s 1000 -o "$EXAMPLES_DIR" "$pdf_path" >/dev/null
  else
    pdftoppm -f 1 -singlefile -png -scale-to 1000 \
      "$pdf_path" "$pdf_path"
  fi
done

echo "Regenerated example PDFs and preview images in $EXAMPLES_DIR."
