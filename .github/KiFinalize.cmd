@echo off
:: KiCAD Standard Workflow (Windows Version)

:: Global Varriables
::-------------------------
set logfile=finalize_log.txt
set "kicad_path=C:\Program Files\KiCad\8.0\bin\"
set "kicad_plugins=C:\Users\Administrator\Documents\KiCad\8.0\3rdparty\plugins\"
set "mf=pcbway"
:: Get Input Arguements
::-------------------------
set projectName=%1

:: use this <kicad-cmd.bat> to load varriables

:: Setup Stage (Get Resources)
::-----------------------
set schematic=%projectName%.kicad_sch
set pcb_board=%projectName%.kicad_pcb
set "kicad_cli=%kicad_path%kicad-cli.exe"
set "kicad_eeschema=%kicad_path%eeschema.exe
set "kicad_pcbnew=%kicad_path%pcbnew.exe
set "kicad_b2c=%kicad_path%bitmap2component.exe
set "kicad_gerberview=%kicad_path%gerbview.exe
set "kicad=%kicad_path%kicad.exe
set "kicad_pcbcalc=%kicad_path%pcb_calculator.exe
set "kicad_pl_editor=%kicad_path%pl_editor.exe
set "python=%kicad_path%python.exe"
set "htmlBOM=%kicad_plugins%org_openscopeproject_InteractiveHtmlBom/generate_interactive_bom.py"
for /f "delims=" %%i in ('"%kicad_cli%" -v') do set VERSION=%%i
echo KiCAD Version: %VERSION% > %logfile%
echo Project File: %projectName%.pro >> %logfile%
echo Schematic File: %schematic% >> %logfile%
echo PCB File: %pcb_board% >> %logfile%

:: Main
::-------------------------
call :Sch_Check
call :Sch_Anotate
call :Sch_ERC
call :Sch_Export_Netlist
call :Sch_Export_PDFs
call :Sch_Export_BOM
call :Sch_Spice_Simulate
call :Pcb_Update_from_Schematic
call :Pcb_Add_Characteristics
call :Pcb_Add_Stackup
call :Pcb_Cleanup
call :Pcb_DRC
call :Pcb_Export_PDFs
call :Pcb_Export_Gerber
call :Pcb_Export_Step
call :Pcb_Export_Stl
call :Plugin_HTMLBOM
call :Plugin_Export_Images
call :Finalize
exit /b

:: Functions
::-------------------------
:Sch_ERC
"%kicad_cli%" sch erc ^
--output %projectName%-ERC.rpt ^
--units "mm" ^
--format "report" ^
--severity-all ^
--exit-code-violations ^
%schematic% >> %logfile%
exit /b

:Sch_Export_Netlist
"%kicad_cli%" sch export netlist ^
--output %projectName%-netlist.cir ^
--format spice ^
%schematic% >> %logfile%
exit /b

:Sch_Export_PDFs
"%kicad_cli%" sch export pdf ^
--output %projectName%-schematic.pdf ^
--no-background-color ^
--black-and-white ^
--exclude-pdf-property-popups ^
%schematic% >> %logfile%
exit /b

:Sch_Export_BOM
"%kicad_cli%" sch export bom ^
--output %projectName%-BOM.csv ^
--preset "Grouped By Value" ^
--format-preset CSV ^
--fields "Reference,Value,Qty,Critical,,Footprint,${SYMBOL_DESCRIPTION},Source,Notes" ^
%schematic% >> %logfile%
::--fields "${REFERENCE},${VALUE},${QUANTITY},Critical,${SYMBOL_NAME},${FOOTPRINT},${SYMBOL_DESCRIPTION},Source,Notes" ^
exit /b

:Pcb_Add_Characteristics
exit /b

:Pcb_Add_Stackup
exit /b

:PCB_DRC
"%kicad_cli%" pcb drc ^
--output %projectName%-DRC.rpt ^
--units "mm" ^
--format "report" ^
--all-track-errors ^
--schematic-parity ^
--severity-all ^
--exit-code-violations ^
%pcb_board% >> %logfile%
exit /b

:Pcb_Export_PDFs
"%kicad_cli%" pcb export pdf ^
--output %projectName%-pcb-front.pdf ^
--define-var "LAYER=Front" ^
--layers "Edge.Cuts,F.Cu,F.Paste,F.Silkscreen,F.Mask,User.Drawings,User.Comments" ^
--include-border-title ^
--theme "KiCAD Default" ^
--drill-shape-opt "2" ^
%pcb_board% >> %logfile%
"%kicad_cli%" pcb export pdf ^
--output %projectName%-pcb-back.pdf ^
--define-var "LAYER=Back" ^
--mirror ^
--layers "Edge.Cuts,B.Cu,B.Paste,B.Silkscreen,B.Mask,User.Drawings,User.Comments" ^
--include-border-title ^
--theme "KiCAD Default" ^
--drill-shape-opt "2" ^
%pcb_board% >> %logfile%
exit /b

:Pcb_Export_Gerber
if not exist "%projectName%-gerber-%mf%" mkdir %projectName%-gerber-%mf%
"%kicad_cli%" pcb export gerbers ^
--output %projectName%-gerber-%mf% ^
--layers "F.Cu,B.Cu,In1.Cu,In2.Cu,In3.Cu,In4.Cu,F.Silkscreen,B.Silkscreen,F.Mask,B.Mask,Edge.Cuts" ^
--no-x2 ^
%pcb_board% >> %logfile%
"%kicad_cli%" pcb export drill ^
--output %projectName%-gerber-%mf% ^
--format "excellon" ^
--excellon-units "in" ^
--excellon-min-header ^
--excellon-zeros-format "suppressleading" ^
--generate-map ^
--map-format "ps" ^
%pcb_board% >> %logfile%
"%kicad_cli%" pcb export pos ^
--output %projectName%-gerber-%mf%/%projectName%-position.pos ^
--units "mm" ^
--use-drill-file-origin ^
%pcb_board% >> %logfile%
tar -acf "%projectName%-gerber-%mf%.zip" -C %projectName%-gerber-%mf% .
rmdir /s /q %projectName%-gerber-%mf%
exit /b

:Pcb_Export_Step
"%kicad_cli%" pcb export step ^
--output %projectName%-pcb.step ^
--grid-origin ^
--force ^
--board-only ^
--include-tracks ^
--include-zones ^
%pcb_board% >> %logfile%
"%kicad_cli%" pcb export step ^
--output %projectName%-3D.step ^
--grid-origin ^
--force ^
--include-tracks ^
--include-zones ^
%pcb_board% >> %logfile%
exit /b

:Pcb_Export_Stl
::todo
exit /b

:Plugin_HTMLBOM
"%python%" %htmlBOM% ^
--no-browser ^
--dark-mode ^
--include-nets ^
--highlight-pin1 "all" ^
--checkboxes "Placed,Sourced" ^
--layer-view "F" ^
--name-format "%projectName%-BOM" ^
--dest-dir . ^
--show-fields "Value,Footprint,Source,Critical,DNP" ^
--dnp-field "DNP" ^
%pcb_board% >> %logfile%
exit /b

:Stencil_3D_Print

:Plugin_Export_Images
::todo


exit /b

:Finalize
tar -acf "%projectName%-KiCAD.zip" -a ^
%projectName%.kicad_sch ^
%projectName%.kicad_pcb ^
%projectName%.kicad_pro
exit /b