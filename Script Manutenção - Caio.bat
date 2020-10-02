@echo off
cls

:menu
cls
color 80

date /t

echo Computador: %computername%     Usuario: %username%

echo                       Menu
echo ================================================
echo * 1. Liberar espaco em disco                   *
echo * 2. Analise com Desfragmentador de Disco      *
echo * 3. Desfragmentar disco                       *
echo * 4. Verificar erros em disco                  *
echo * 5. Executar verificacao e correcao de Disco  *
echo * 6. Limpar cache DNS                          *
echo * 7. Sair                                      *
echo ================================================
echo -Script escrito por Caio - 17/09/2020

set /p opcao= Selecione uma opcao: 

if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% equ 7 goto opcao7
if %opcao% GEQ 8 goto opcao8

:opcao1
cls
echo Aguarde...
echo Carregando Limpeza de Disco...
cleanmgr
pause
goto menu

:opcao2
cls
defrag c: -a -u
pause
goto menu

:opcao3
cls
defrag c: -h -u
pause
goto menu

:opcao4
cls
chkdsk c:
pause
goto menu

:opcao5
cls
chkdsk /f /r
pause
goto menu

:opcao6
cls
ipconfig /release
ipconfig /renew
ipconfig /flushdns
ipconfig /registerdns
nbtstat -rr
netsh int ip reset all
netsh winsock reset

set /p response= Necessario reiniciar. Prosseguir? (S/n)
if %response%==Y goto reiniciar
if %response%==y goto reiniciar
if %response%==N goto menu
if %response%==n goto menu
pause

:reiniciar
shutdown /r
exit

:opcao7
cls
echo Saindo...
exit

:opcao8
cls
echo Opcao invalida! Selecione outra opcao.
pause
goto menu