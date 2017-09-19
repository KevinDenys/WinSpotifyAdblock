@echo off
CLS

:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::
echo   _____             _   _  __                   _ _     _            _    
echo  / ____l           l l (_)/ _l         /\      l l l   l l          l l   
echo l (___  _ __   ___ l l_ _l l_ _   _   /  \   __l l l__ l l ___   ___l l __
echo  \___ \l '_ \ / _ \l __l l  _l l l l / /\ \ / _` l '_ \l l/ _ \ / __l l/ /
echo  ____) l l_) l (_) l l_l l l l l_l l/ ____ \ (_l l l_) l l (_) l (__l   l 
echo l_____/l .__/ \___/ \__l_l_l  \__, /_/    \_\__,_l_.__/l_l\___/ \___l_l\_\
echo        l l                     __/ l                                      
echo        l_l                    l___/   
echo Press button to block ads in Spotify player
pause
SET NEWLINE=^& echo.

FIND /C /I "media-match.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 media-match.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 adclick.g.doublecklick.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 adclick.g.doublecklick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 www.googleadservices.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 www.googleadservices.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 open.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 open.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 pagead2.googlesyndication.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 pagead2.googlesyndication.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 desktop.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 desktop.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 googleads.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 googleads.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 pubads.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 pubads.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 audio2.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 audio2.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 www.omaze.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 www.omaze.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 omaze.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 omaze.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 bounceexchange.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 bounceexchange.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "0.0.0.0 pubads.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pubads.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "0.0.0.0 securepubads.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 securepubads.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 media-match.com " %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 media-match.com >>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 adclick.g.doublecklick.net " %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 adclick.g.doublecklick.net >>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 googleads.g.doubleclick.net " %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 googleads.g.doubleclick.net >>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 http://www.googleadservices.com " %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 http://www.googleadservices.com >>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 pagead2.googlesyndication.com " %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 pagead2.googlesyndication.com >>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 desktop.spotify.com " %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 desktop.spotify.com >>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 pubads.g.doubleclick.net " %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 pubads.g.doubleclick.net >>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 audio2.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 audio2.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 pagead46.l.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 pagead46.l.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 pagead.l.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 pagead.l.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 googlehosted.l.googleusercontent.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 googlehosted.l.googleusercontent.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 video-ad-stats.googlesyndication.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 video-ad-stats.googlesyndication.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 pagead-googlehosted.l.google.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 pagead-googlehosted.l.google.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 partnerad.l.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 partnerad.l.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 prod.spotify.map.fastlylb.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 prod.spotify.map.fastlylb.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 adserver.adtechus.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 adserver.adtechus.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 na.gmtdmp.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 na.gmtdmp.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 anycast.pixel.adsafeprotected.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 anycast.pixel.adsafeprotected.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 d361oi6ppvq2ym.cloudfront.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 d361oi6ppvq2ym.cloudfront.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 gads.pubmatic.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 gads.pubmatic.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 idsync-ext.rlcdn.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 idsync-ext.rlcdn.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 anycast.pixel.adsafeprotected.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 anycast.pixel.adsafeprotected.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 ads-west-colo.adsymptotic.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 ads-west-colo.adsymptotic.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 geo3.ggpht.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 geo3.ggpht.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 showads33000.pubmatic.com " %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 showads33000.pubmatic.com >>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 media-match.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 media-match.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 adclick.g.doublecklick.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 adclick.g.doublecklick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 www.googleadservices.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 www.googleadservices.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 open.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 open.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 pagead2.googlesyndication.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 pagead2.googlesyndication.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 desktop.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 desktop.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 googleads.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 googleads.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 pubads.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 pubads.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 securepubads.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 securepubads.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 audio2.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 audio2.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 http://audio2.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 http://audio2.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 www.audio2.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 www.audio2.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 www.omaze.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 www.omaze.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 omaze.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 omaze.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 bounceexchange.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 bounceexchange.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 core.insightexpressai.com " %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 core.insightexpressai.com >>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 content.bitsontherun.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 content.bitsontherun.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 s0.2mdn.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 s0.2mdn.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 v.jwpcdn.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 v.jwpcdn.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 d2gi7ultltnc2u.cloudfront.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 d2gi7ultltnc2u.cloudfront.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 crashdump.spotify.com " %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 crashdump.spotify.com >>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 adeventtracker.spotify.com " %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 adeventtracker.spotify.com >>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 log.spotify.com " %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 log.spotify.com >>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 analytics.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 analytics.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 ads-fa.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 ads-fa.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 cs283.wpc.teliasoneracdn.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 cs283.wpc.teliasoneracdn.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 audio-ec.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 audio-ec.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 cs126.wpc.teliasoneracdn.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 cs126.wpc.teliasoneracdn.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 heads-ec.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 heads-ec.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 u.scdn.co" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 u.scdn.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 cs126.wpc.edgecastcdn.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 cs126.wpc.edgecastcdn.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 pagead46.l.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 pagead46.l.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 pagead.l.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 pagead.l.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 video-ad-stats.googlesyndication.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 video-ad-stats.googlesyndication.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 pagead-googlehosted.l.google.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 pagead-googlehosted.l.google.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 partnerad.l.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 partnerad.l.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 prod.spotify.map.fastlylb.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 prod.spotify.map.fastlylb.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 adserver.adtechus.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 adserver.adtechus.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 na.gmtdmp.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 na.gmtdmp.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 anycast.pixel.adsafeprotected.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 anycast.pixel.adsafeprotected.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 ads.pubmatic.com  " %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 ads.pubmatic.com  >>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 idsync-ext.rlcdn.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 idsync-ext.rlcdn.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 www.googletagservices.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 www.googletagservices.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 sto3.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 sto3.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 googlehosted.l.googleusercontent.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 googlehosted.l.googleusercontent.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 spclient.wg.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 spclient.wg.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 d361oi6ppvq2ym.cloudfront.net" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 d361oi6ppvq2ym.cloudfront.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 gads.pubmatic.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 gads.pubmatic.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 ads-west-colo.adsymptotic.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 ads-west-colo.adsymptotic.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 geo3.ggpht.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 geo3.ggpht.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "127.0.0.1 showads33000.pubmatic.com " %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 showads33000.pubmatic.com >>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "spclient.wg.spotify.com" %WINDIR%\system32\drivers\etc\hosts
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^127.0.0.1 spclient.wg.spotify.com>>%WINDIR%\System32\drivers\etc\hosts
CLS
echo  _____                       _                        __             _ 
echo l  __ \                     l l                      / _l           l l
echo l l  l l ___  _ __   ___    l l__   __ ___   _____  l l_ _   _ _ __ l l
echo l l  l l/ _ \l '_ \ / _ \   l '_ \ / _` \ \ / / _ \ l  _l l l l '_ \l l
echo l l__l l (_) l l l l  __/_  l l l l (_l l\ V /  __/ l l l l_l l l l l_l
echo l_____/ \___/l_l l_l\___( ) l_l l_l\__,_l \_/ \___l l_l  \__,_l_l l_(_)
echo                         l/                                                                                                                   
pause
