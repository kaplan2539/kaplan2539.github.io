---
title: Beautiful PDFs from Markdown using Pandoc, LaTeX and Eisvogel
tags: pdf latex eisvogel pandoc
---

Make sure Pandoc, LaTeX and all necesserary extras are installed (takes up some diskspace...)
```
sudo apt install pandoc texlive texlive-latex-extra texlive-fonts-extra
```

Install the Eisvogel Template:
```
git clone https://github.com/Wandmalfarbe/pandoc-latex-template.git
mkdir -p ~/.pandoc/templates
cp pandoc-latex-template/eisvogel.tex ~/.pandoc/templates/eisvogel.latex
```
NOTE: the extension of the template must be `.latex` not `.tex`


