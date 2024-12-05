# Project Template

This repository template is used to create projects with a standardized structure to allow for batch automated actions and structured releases. Said strucutre is also leveraged on my portfolio website as well as my LaTeX-Workshop to populate project information. Valid project categories include hardware, software, documentation or any combination of these. A checklist is provided outlining how to modify this template accordingly.

## Update Checklist

This list is a guide on how to utilize this template. You can delete files that are not applicable to the given project but the files in brackets are highly recommended.

- Project Source Files
- [ ] Add system diagram (hardware/<descriptive Name>.png
- [ ] Add hardware project files (hardware/)
	- [ ] If KiCAD based project then include the following
		- [ ] HTML BOM
		- [ ] Schematic + PCB plots
		- [ ] 3D Render jpg and STL files
		- [ ] DRC Report + ERC Report + Netlist
		- [ ] Gerber Files with drill and position files
- [ ] Add software source code (software/)

- Images
- [ ] Update project main image (documents/images/project.png)
- [ ] Update project logo (documents/images/logo.png)
- [ ] Update project banner (documents/images/banner.png)
- [ ] Add gallery images (documents/images/gallery/<descriptive Name>.jpg)

- Documentation
- [ ] Update project description (documents/README.md)
- [ ] Update hardware README (hardware/README.md)
- [ ] Update software README (software/README.md)
- [ ] Check LaTeX datasheet and modify if needed (documents/Datasheet.tex)
- [ ] Optionally add additional latex documents
- [ ] Replace this readme file with a detailed project overview

- Repo Settings
- [ ] Disable wiki, discussions, and projects sections
- [ ] Add appropriate topic(s)
- [ ] Add a short description (ie: tagline)
- [ ] Add homepage link to project page [Matt-Santos.github.io](https://github.com/Matt-Santos/Matt-Santos.github.io)
- [ ] Rerun workflow on [Matt-Santos.github.io](https://github.com/Matt-Santos/Matt-Santos.github.io) and [LaTex-Workshop](https://github.com/Matt-Santos/LaTeX-Workshop)

## Future Improvements

This list highlights current issues and areas for improvement.

- [ ] Create standardized Datasheet Template (LaTex inclues of following)
	- [ ] Create README template for documentation (description)
	- [ ] Create Readme template for software
	- [ ] Create Readme template for hardware
	- [ ] Create System Diagram Template
- [ ] Create kicad workflow to automate the following then update above checklist to reflect it
	- [ ] HTML BOM
	- [ ] Schematic + PCB plots
	- [ ] Prezipped gerbers with drill files
	- [ ] DRC Report
	- [ ] 3D Render jpg and STL files
- [ ] Create workflow to automate release creation
	- [ ] Gerbers in zip format
	- [ ] Schematic + PCB pdfs
	- [ ] 3D models (Step + STL)
	- [ ] Interactive BOM HTML
	- [ ] Zipped KICAD Archive
	- [ ] Zipped Code
	- [ ] Binary and/or built Hex Code
- [ ] Update root README.md and documents/README.md