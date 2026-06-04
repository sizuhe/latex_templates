set windows-shell := ["cmd.exe", "/c"]





# Show available commands
help:
	@just --list


# Build the Docker image -- Docker must be installed and running --.
@build:
  docker build -t latex-env .


# Compiles the main.tex file and returns the PDF.
@compile:
  docker run --rm -v "$(pwd):/workspace" latex-env sh -c "latexmk -pdf main.tex && latexmk -c"
  # docker run --rm -v "$(pwd):/workspace" latex-env pdflatex main.tex
