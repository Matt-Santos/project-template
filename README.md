# Project Template

This repository template is used to create projects with a standardized structure to allow for batch automated actions and structured releases. Said strucutre is also leveraged on my portfolio website as well as my LaTeX-Workshop to populate project information. Valid project categories include hardware, software, documentation or any combination of these. A checklist is provided outlining how to modify this template accordingly.

## Update Checklist

This list is a guide on how to utilize this template. You can delete files that are not applicable to the given project but the files in brackets are highly recommended.

#### Project Files
-  Add hardware files (hardware/)
	- [ ] Place KiCAD projects into independant subfolders
	- [ ] Place any pdf,stl,png,html files for display on website
-  Add software source code (software/)
	- [ ] Place Code projects into independant subfolders

#### Images
- [ ] Update project main image (documents/images/project.png)
- [ ] Update project logo (documents/images/logo.png)
- [ ] Update project banner (documents/images/banner.png)
- [ ] Add gallery images (documents/images/gallery/<descriptive Name>.jpg)

#### Documentation
- [ ] Update project description (documents/README.md)
- [ ] Update/delete hardware README (hardware/README.md)
- [ ] Update/delete firmware README (firmware/README.md)
- [ ] Check LaTeX datasheet and modify if needed (documents/Datasheet.tex)
- [ ] Add additional latex documents as needed (documents/)
- [ ] Replace this readme file with a project specific overview

#### Repo Settings
- [ ] Disable wiki, discussions, and projects sections
- [ ] Add appropriate topic(s)
- [ ] Add a short description (ie: tagline)
- [ ] Add Actions Secerts for signing documents
- [ ] Add homepage link to project page [Matt-Santos.github.io](https://github.com/Matt-Santos/Matt-Santos.github.io)
- [ ] Rerun workflow on [Matt-Santos.github.io](https://github.com/Matt-Santos/Matt-Santos.github.io) and [LaTex-Workshop](https://github.com/Matt-Santos/LaTeX-Workshop)

## Future Improvements

This list highlights current issues and areas for improvement.

- Improve/Update local workflow (KiFinalize.cmd)
	- Cross System Compatibility (linux, windows)
	- Support for Spice Simulation
- Improve Actions Workflow (build.yml)
	- Improve upon KiCAD build outputs
	- Add Support for Spice Simulation
	- Implement auto code detection + build
- Add additional kicad templates
- Add code templates for common mcu/mpu
- Create Readme template for firmware folder
- Create Readme template for hardware folder