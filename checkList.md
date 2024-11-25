# Project Initialization Checklist

Fundamental Template Requirements
	-Working Website (ie: Product Page)
	-Fix the Repo Updating Github action (Requires personal access token)
	-Latex Documentation (specifications and report)
	-Hardware files (KiCAD)
	-firmware files (c++ generally)
	-automation via github actions
	-specify a github topic
	-provide a product image (maybe automate this via kibot?)

## New Project Checklist

- [ ] Update README.md with 1-3 paragraphs describing the project (the long description)
- [ ] Update the .github/site/_config.yml file


- [ ] Manually enable the github pages functionality in the repo (automation cant doe this atm)


- [ ] Add a project image > .github/project.jpg
- [ ] Create a project logo > documents/images/logo.png
- [ ] Add images to the gallery > documents/images/gallery/


- [ ] Create a list of features > ...
- [ ] Add Hardware files >
- [ ] Add Software files >
- [ ] Write documentation >
- [ ] update resume + website repos (maybe trigger via this project's action)

## Project Repo Folder Structure

main:
- .github
	- project.jpg
	- site (Jekyll Site Content)
		- index.html
	- workflows
		- build.yml (all in one)
- documents
	-
- firmware
	-
- hardware
	-
- README.md


