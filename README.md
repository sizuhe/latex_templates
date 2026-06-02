# LaTeX Templates repository
A collection of customizable LaTeX templates designed for various use cases, ranging from university reports to resumes, letters, or general use documents. Whether you're a student, researcher, or professional, this repository provides well-structured and easy-to-use templates. The `.cls` files must not be modified directly; instead, users should create their own `.tex` files that utilize these classes to ensure proper formatting and functionality.



## Template types
- **Resumes/CVs**: 2 Modern and professional templates for creating CVs. 1 ATS-friendly version.
- **Academic document**: 2 Templates for articles, reports or general use documents with APA formatting.
- **Letters**: Elegant, simple and customizable letter templates.
- **Reports**: Template for technical reports with APA formatting.
- **Workshop**: Template for workshop reports with APA formatting.

<div align="center">
    <table width="100%" margin-left="auto" margin-right="auto">
        <tbody>
            <th colspan="2">CVs</th>
           	<tr>
                <th>CV 01</th>
               	<th>CV 02</th>
           	</tr>
           	<tr>
               	<td width="50%">
                    <img src="examples/cv01.png" />
               	</td>
               	<td width="50%">
                    <img src="examples/cv02.png" />
                </td>
           	</tr>
        </tbody>
    </table>
    <table width="100%" margin-left="auto" margin-right="auto">
        <tbody>
            <th colspan="2">Academic</th>
           	<tr>
                <th>APA 01</th>
               	<th>APA 02</th>
           	</tr>
           	<tr>
               	<td width="50%">
                    <img src="examples/apa01.png" />
               	</td>
               	<td width="50%">
                    <img src="examples/apa02.png" />
                </td>
           	</tr>
        </tbody>
    </table>
    <table width="100%" margin-left="auto" margin-right="auto">
        <tbody>
            <th colspan="3">Others</th>
           	<tr>
                <th>Letter</th>
               	<th>Report</th>
                <th>Workshop</th>
           	</tr>
           	<tr>
               	<td width="33%">
                    <img src="examples/letter.png" />
               	</td>
               	<td width="33%">
                    <img src="examples/report.png" />
                </td>
                <td width="33%">
                    <img src="examples/workshop.png" />
                </td>
           	</tr>
        </tbody>
    </table>
</div>



## How to use
All templates are fully compatible with both local LaTeX editors and online editors like *Overleaf*. To use a template, simply create a new `.tex` file and include the corresponding class file using the `\documentclass{}` command. Customize the content as needed while maintaining the structure and functions provided by the class files.

- If you are using *Overleaf* you must download the entire repository, convert the desired template folder to a zip file and upload it to your project. This way you will have access to all the necessary files for the template to work properly.
- Another recommended workflow is to use a local installed TinyTex-2 and VSCode with the LaTeX Workshop extension.


### Docker
A `Dockerfile` and a `Justfile` are provided for an easy containerize compilation of the templates using Docker. 

- To build the Docker image, run the `just build` command. This will create a Docker image with all the necessary LaTeX packages installed.
- To compile a template, you must run the `just compile` command in the terminal inside the desired template folder. This will compile the `main.tex` file and return the resulting PDF.

If `Just` is not installed, you can run the `Docker` commands directly inside the template you want to compile:

```bash
# Build the Docker image
docker build -t latex-env .

# Compile the main.tex file
docker run --rm -v "$(pwd):/workspace" latex-env sh -c "latexmk -pdf main.tex && latexmk -c"    # Returns only the .pdf file
docker run --rm -v "$(pwd):/workspace" latex-env pdflatex main.tex    # Returns the .pdf file and all the auxiliary files
```

> The image size should be around 1 GB and should take around 1 min to build.
