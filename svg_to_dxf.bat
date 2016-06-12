@echo off

REM /*************************************************** 
REM
REM
REM   DESCRIPTION:
REM
REM   BY:
REM     MauMaker - Mauricio A. Jabur
REM     www.maumaker.com.br
REM
REM   HARDWARE:
REM     PC running Windows
REM     tested on Windows 10
REM
REM   REQUISITES:
REM     Inkscape 0.91
REM       http://inkscape.org/
REM     PStoEdit 3.70
REM       http://www.pstoedit.net/ 
REM       https://sourceforge.net/projects/pstoedit/files/pstoedit/3.70/
REM     GhostScript 9.19  
REM       http://ghostscript.com/download/gsdnld.html
REM
REM   Install PStoEdit with default options
REM   Make sure to add to the Windows PATH the folders for Inkscape, PStoEdit and GhostScript
REM
REM   LICENSE:
REM   Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
REM   http://creativecommons.org/licenses/by-sa/4.0/

REM ****************************************************/

IF "%~1"=="" GOTO error1
IF "%~2"=="" SET outfile=%~n1.dxf
IF NOT "%~2"=="" SET outfile=%~n2.dxf

inkscape -T -E %~n1.eps %1
pstoedit -dt -f dxf:"-polyaslines -mm" %~n1.eps %outfile%
REM del %~n1.eps

GOTO end

:error1
ECHO usage %~n0 input_file (output_file)
GOTO end

:end
