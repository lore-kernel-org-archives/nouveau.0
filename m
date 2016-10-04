From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98039] KMail crash on starting (nouveau-related)
Date: Tue, 04 Oct 2016 08:20:54 +0000
Message-ID: <bug-98039-8800-aU13ilxszY@http.bugs.freedesktop.org/>
References: <bug-98039-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2074670570=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98039-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2074670570==
Content-Type: multipart/alternative; boundary="14755692541.cD5B100.32628";
 charset="UTF-8"


--14755692541.cD5B100.32628
Date: Tue, 4 Oct 2016 08:20:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98039

ianseeks <bingmybong-FhtRXb7CoQBt1OO0OYaSVA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Priority|medium                      |high

--- Comment #2 from ianseeks <bingmybong-FhtRXb7CoQBt1OO0OYaSVA@public.gmane.org> ---
I'm suffering the same situation, all worked fine until kmail 5.3.0 came al=
ong
with qtwebengine.
Crashes at random times, from as soon as the application is up, to clicking=
 on
a new folder or just when it feels like.
I can never get anything from drkonqui as it always crashes when it tries to
load after kmail crashing.=20
Here is one of the crashes when i launched kmail from cli

kmail
Pass a valid window to KWallet::Wallet::openWallet().
 void AdblockManager::reloadConfig() false=20=20=20=20
AdBlock::AdblockManager(0xfa2ce0)
this does not work on a KActionCollection containing actions!
org.kde.akonadi.ETM: GEN true false false
org.kde.akonadi.ETM: collection: QVector()
org.kde.akonadi.ETM:=20
org.kde.akonadi.ETM: Subtree:  2 QSet(3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, =
14,=20
15, 2)
org.kde.akonadi.ETM: collection: "inbox"
org.kde.akonadi.ETM: Fetch job took  275 msec
org.kde.akonadi.ETM: was collection fetch job: collections: 14
org.kde.akonadi.ETM: first fetched collection: "Local Folders"
org.kde.akonadi.ETM: collection: QVector()
org.kde.akonadi.ETM: Fetch job took  357 msec
org.kde.akonadi.ETM: was collection fetch job: collections: 2
org.kde.akonadi.ETM: first fetched collection: "Search"
org.kde.akonadi.ETM: Fetch job took  187 msec
org.kde.akonadi.ETM: was item fetch job: items: 12
org.kde.akonadi.ETM: Fetch job took  125 msec
org.kde.akonadi.ETM: was collection fetch job: collections: 0
org.kde.akonadi.ETM: collection: "opensuse.org"
org.kde.akonadi.ETM: Fetch job took  343 msec
org.kde.akonadi.ETM: was item fetch job: items: 3464
*** Error in `kmail': double free or corruption (fasttop): 0x00000000028ba3=
f0=20
***
=3D=3D=3D=3D=3D=3D=3D Backtrace: =3D=3D=3D=3D=3D=3D=3D=3D=3D
/lib64/libc.so.6(+0x7012b)[0x7f3280a2312b]
/lib64/libc.so.6(+0x75936)[0x7f3280a28936]
/lib64/libc.so.6(+0x7610e)[0x7f3280a2910e]
/usr/lib64/dri/nouveau_dri.so(+0x46234f)[0x7f3255cb934f]
/usr/lib64/dri/nouveau_dri.so(+0x46258e)[0x7f3255cb958e]
/usr/lib64/dri/nouveau_dri.so(+0x462892)[0x7f3255cb9892]
/usr/lib64/dri/nouveau_dri.so(+0x1d4adb)[0x7f3255a2badb]
/usr/lib64/dri/nouveau_dri.so(+0x1d4b20)[0x7f3255a2bb20]
/usr/lib64/libQt5WebEngineCore.so.5(+0x237be21)[0x7f326d55fe21]
/usr/lib64/libQt5WebEngineCore.so.5(+0x237be56)[0x7f326d55fe56]
/usr/lib64/libQt5WebEngineCore.so.5(+0x2383bea)[0x7f326d567bea]
/usr/lib64/libQt5WebEngineCore.so.5(+0x23ca53a)[0x7f326d5ae53a]
/usr/lib64/libQt5WebEngineCore.so.5(+0x239ac92)[0x7f326d57ec92]
/usr/lib64/libQt5WebEngineCore.so.5(+0x186ffe9)[0x7f326ca53fe9]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1874c74)[0x7f326ca58c74]
/usr/lib64/libQt5WebEngineCore.so.5(+0x185469f)[0x7f326ca3869f]
/usr/lib64/libQt5WebEngineCore.so.5(+0x186ec13)[0x7f326ca52c13]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1c3e510)[0x7f326ce22510]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1bee4d4)[0x7f326cdd24d4]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1beecc9)[0x7f326cdd2cc9]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1bef182)[0x7f326cdd3182]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1bf1429)[0x7f326cdd5429]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1c020ba)[0x7f326cde60ba]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1beda55)[0x7f326cdd1a55]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1c19ae6)[0x7f326cdfdae6]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1c1623d)[0x7f326cdfa23d]
/lib64/libpthread.so.0(+0x7454)[0x7f327692a454]
/lib64/libc.so.6(clone+0x6d)[0x7f3280a9b15d]
=3D=3D=3D=3D=3D=3D=3D Memory map: =3D=3D=3D=3D=3D=3D=3D=3D
00400000-00406000 r-xp 00000000 08:02 1596314                            /u=
sr/
bin/kmail
00606000-00607000 r--p 00006000 08:02 1596314                            /u=
sr/
bin/kmail
00607000-00608000 rw-p 00007000 08:02 1596314                            /u=
sr/
bin/kmail
00b4e000-02990000 rw-p 00000000 00:00 0=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[heap]
7f316af20000-7f316af21000 ---p 00000000 00:00 0=20
7f316af21000-7f316b721000 rw-p 00000000 00:00 0=20
7f316b721000-7f316b821000 rw-s 00000000 00:12 1527902                    /d=
ev/
shm/.org.chromium.Chromium.l5blEH (deleted)
7f316b821000-7f316b921000 rw-s 00000000 00:12 1527901                    /d=
ev/
shm/.org.chromium.Chromium.dG6u9f (deleted)
7f316bb21000-7f316bb28000 r-xp 00000000 08:02 1713782                    /u=
sr/
lib64/grantlee/5.1/kde_grantlee_plugin.so
7f316bb28000-7f316bd27000 ---p 00007000 08:02 1713782                    /u=
sr/
lib64/grantlee/5.1/kde_grantlee_plugin.so
7f316bd27000-7f316bd28000 r--p 00006000 08:02 1713782                    /u=
sr/
lib64/grantlee/5.1/kde_grantlee_plugin.so
7f316bd28000-7f316bd29000 rw-p 00007000 08:02 1713782                    /u=
sr/
lib64/grantlee/5.1/kde_grantlee_plugin.so
7f316bd29000-7f316bd3e000 r-xp 00000000 08:02 1733307                    /u=
sr/
lib64/grantlee/5.1/grantlee_i18ntags.so
7f316bd3e000-7f316bf3d000 ---p 00015000 08:02 1733307                    /u=
sr/
lib64/grantlee/5.1/grantlee_i18ntags.so
7f316bf3d000-7f316bf3f000 r--p 00014000 08:02 1733307                    /u=
sr/
lib64/grantlee/5.1/grantlee_i18ntags.so
7f316bf3f000-7f316bf40000 rw-p 00016000 08:02 1733307                    /u=
sr/
lib64/grantlee/5.1/grantlee_i18ntags.so
7f316bf40000-7f316bf80000 rw-p 00000000 00:00 0=20
7f316bfaa000-7f316c3ba000 rw-p 00000000 00:00 0=20
7f316c3ba000-7f31ec3ba000 rwxp 00000000 00:00 0=20
7f31ec3ba000-7f31ec3bb000 ---p 00000000 00:00 0=20
7f31ec3bb000-7f31ecbbb000 rw-p 00000000 00:00 0=20
7f31ecbbb000-7f31ecbbe000 r-xp 00000000 08:02 1732589                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_xdiff.so
7f31ecbbe000-7f31ecdbd000 ---p 00003000 08:02 1732589                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_xdiff.so
7f31ecdbd000-7f31ecdbe000 r--p 00002000 08:02 1732589                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_xdiff.so
7f31ecdbe000-7f31ecdbf000 rw-p 00003000 08:02 1732589                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_xdiff.so
7f31ecdbf000-7f31ecdce000 r-xp 00000000 08:02 1733487                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_vcard.so
7f31ecdce000-7f31ecfcd000 ---p 0000f000 08:02 1733487                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_vcard.so
7f31ecfcd000-7f31ecfce000 r--p 0000e000 08:02 1733487                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_vcard.so
7f31ecfce000-7f31ecfcf000 rw-p 0000f000 08:02 1733487                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_vcard.so
7f31ecfcf000-7f31ecff7000 r-xp 00000000 08:02 1732525                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_calendar.so
7f31ecff7000-7f31ed1f6000 ---p 00028000 08:02 1732525                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_calendar.so
7f31ed1f6000-7f31ed1f8000 r--p 00027000 08:02 1732525                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_calendar.so
7f31ed1f8000-7f31ed1f9000 rw-p 00029000 08:02 1732525                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_calendar.so
7f31ed1f9000-7f31ed21d000 r-xp 00000000 08:02 1585782                    /u=
sr/
lib64/libKF5Tnef.so.5.3.0
7f31ed21d000-7f31ed41c000 ---p 00024000 08:02 1585782                    /u=
sr/
lib64/libKF5Tnef.so.5.3.0
7f31ed41c000-7f31ed41d000 r--p 00023000 08:02 1585782                    /u=
sr/
lib64/libKF5Tnef.so.5.3.0
7f31ed41d000-7f31ed41e000 rw-p 00024000 08:02 1585782                    /u=
sr/
lib64/libKF5Tnef.so.5.3.0
7f31ed41e000-7f31ed425000 r-xp 00000000 08:02 1732645                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_application_mstnef.so
7f31ed425000-7f31ed624000 ---p 00007000 08:02 1732645                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_application_mstnef.so
7f31ed624000-7f31ed625000 r--p 00006000 08:02 1732645                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_application_mstnef.so
7f31ed625000-7f31ed626000 rw-p 00007000 08:02 1732645                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_application_mstnef.so
7f31ed626000-7f31ed627000 ---p 00000000 00:00 0=20
7f31ed627000-7f31ede27000 rw-p 00000000 00:00 0=20
7f31ede27000-7f31ede4f000 r-xp 00000000 08:02 1708215                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaultfilters.so
7f31ede4f000-7f31ee04e000 ---p 00028000 08:02 1708215                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaultfilters.so
7f31ee04e000-7f31ee050000 r--p 00027000 08:02 1708215                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaultfilters.so
7f31ee050000-7f31ee051000 rw-p 00029000 08:02 1708215                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaultfilters.so
7f31ee051000-7f31ee062000 r-xp 00000000 08:02 1733464                    /u=
sr/
lib64/grantlee/5.1/grantlee_loadertags.so
7f31ee062000-7f31ee262000 ---p 00011000 08:02 1733464                    /u=
sr/
lib64/grantlee/5.1/grantlee_loadertags.so
7f31ee262000-7f31ee263000 r--p 00011000 08:02 1733464                    /u=
sr/
lib64/grantlee/5.1/grantlee_loadertags.so
7f31ee263000-7f31ee264000 rw-p 00012000 08:02 1733464                    /u=
sr/
lib64/grantlee/5.1/grantlee_loadertags.so
7f31ee264000-7f31ee297000 r-xp 00000000 08:02 1706087                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaulttags.so
7f31ee297000-7f31ee496000 ---p 00033000 08:02 1706087                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaulttags.so
7f31ee496000-7f31ee499000 r--p 00032000 08:02 1706087                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaulttags.so
7f31ee499000-7f31ee49a000 rw-p 00035000 08:02 1706087                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaulttags.so
7f31ee49a000-7f31ee49b000 ---p 00000000 00:00 0=20
7f31ee49b000-7f31eec9b000 rw-p 00000000 00:00 0=20
7f31eef9b000-7f31eefa9000 r-xp 00000000 08:02 1708305                    /u=
sr/
lib64/qt5/plugins/akonadi_serializer_mail.so
7f31eefa9000-7f31ef1a8000 ---p 0000e000 08:02 1708305                    /u=
sr/
lib64/qt5/plugins/akonadi_serializer_mail.so
7f31ef1a8000-7f31ef1a9000 r--p 0000d000 08:02 1708305                    /u=
sr/
lib64/qt5/plugins/akonadi_serializer_mail.so
7f31ef1a9000-7f31ef1aa000 rw-p 0000e000 08:02 1708305                    /u=
sr/
lib64/qt5/plugins/akonadi_serializer_mail.so
7f31ef1aa000-7f31ef7e4000 rw-s 119802000 00:06 11743                     /d=
ev/
dri/card0
7f31ef7e4000-7f31f01e4000 rwxp 00000000 00:00 0=20
7f31f01e4000-7f31f081e000 rw-s 00000000 00:05 2293761                    /
SYSV00000000 (deleted)
7f31f081e000-7f31f081f000 ---p 00000000 00:00 0=20
7f31f081f000-7f31f101f000 rw-p 00000000 00:00 0=20
7f31f101f000-7f31f1020000 ---p 00000000 00:00 0=20
7f31f1020000-7f31f1820000 rw-p 00000000 00:00 0=20
7f31f1820000-7f31f1825000 r-xp 00000000 08:02 1732299                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_grantleeheaderstyleplugin.so
7f31f1825000-7f31f1a25000 ---p 00005000 08:02 1732299                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_grantleeheaderstyleplugin.so
7f31f1a25000-7f31f1a26000 r--p 00005000 08:02 1732299                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_grantleeheaderstyleplugin.so
7f31f1a26000-7f31f1a27000 rw-p 00006000 08:02 1732299                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_grantleeheaderstyleplugin.so
7f31f1a27000-7f31f1a2e000 r-xp 00000000 08:02 1714866                    /u=
sr/
lib64/qt5/plugins/messageviewer/
messageviewer_defaultgrantleeheaderstyleplugin.so
7f31f1a2e000-7f31f1c2e000 ---p 00007000 08:02 1714866                    /u=
sr/
lib64/qt5/plugins/messageviewer/
messageviewer_defaultgrantleeheaderstyleplugin.so
7f31f1c2e000-7f31f1c2f000 r--p 00007000 08:02 1714866                    /u=
sr/
lib64/qt5/plugins/messageviewer/
messageviewer_defaultgrantleeheaderstyleplugin.so
7f31f1c2f000-7f31f1c30000 rw-p 00008000 08:02 1714866                    /u=
sr/
lib64/qt5/plugins/messageviewer/
messageviewer_defaultgrantleeheaderstyleplugin.so
7f31f1c30000-7f31f1c35000 r-xp 00000000 08:02 1732714                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_longheaderstyleplugin.so
7f31f1c35000-7f31f1e34000 ---p 00005000 08:02 1732714                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_longheaderstyleplugin.so
7f31f1e34000-7f31f1e35000 r--p 00004000 08:02 1732714                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_longheaderstyleplugin.so
7f31f1e35000-7f31f1e36000 rw-p 00005000 08:02 1732714                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_longheaderstyleplugin.so
7f31f1e36000-7f31f1e41000 r-xp 00000000 08:02 1711876                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_enterpriseheaderstyleplugin.so
7f31f1e41000-7f31f2041000 ---p 0000b000 08:02 1711876                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_enterpriseheaderstyleplugin.so
7f31f2041000-7f31f2042000 r--p 0000b000 08:02 1711876                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_enterpriseheaderstyleplugin.so
7f31f2042000-7f31f2043000 rw-p 0000c000 08:02 1711876                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_enterpriseheaderstyleplugin.so
7f31f2043000-7f31f2048000 r-xp 00000000 08:02 1727636                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_allheaderstyleplugin.so
7f31f2048000-7f31f2248000 ---p 00005000 08:02 1727636                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_allheaderstyleplugin.so
7f31f2248000-7f31f2249000 r--p 00005000 08:02 1727636                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_allheaderstyleplugin.so
7f31f2249000-7f31f224a000 rw-p 00006000 08:02 1727636                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_allheaderstyleplugin.so
7f31f224a000-7f31f2253000 r-xp 00000000 08:02 1730162                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_briefheaderstyleplugin.so
7f31f2253000-7f31f2452000 ---p 00009000 08:02 1730162                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_briefheaderstyleplugin.so
7f31f2452000-7f31f2453000 r--p 00008000 08:02 1730162                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_briefheaderstyleplugin.so
7f31f2453000-7f31f2454000 rw-p 00009000 08:02 1730162                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_briefheaderstyleplugin.so
7f31f2454000-7f31f245f000 r-xp 00000000 08:02 1731783                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_fancyheaderstyleplugin.so
7f31f245f000-7f31f265f000 ---p 0000b000 08:02 1731783                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_fancyheaderstyleplugin.so
7f31f265f000-7f31f2660000 r--p 0000b000 08:02 1731783                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_fancyheaderstyleplugin.so
7f31f2660000-7f31f2661000 rw-p 0000c000 08:02 1731783                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_fancyheaderstyleplugin.so
7f31f2661000-7f31f2667000 r-xp 00000000 08:02 1721699                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_standardsheaderstyleplugin.so
7f31f2667000-7f31f2866000 ---p 00006000 08:02 1721699                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_standardsheaderstyleplugin.so
7f31f2866000-7f31f2867000 r--p 00005000 08:02 1721699                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_standardsheaderstyleplugin.so
7f31f2867000-7f31f2868000 rw-p 00006000 08:02 1721699                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_standardsheaderstyleplugin.so
7f31f2868000-7f31f287c000 r-xp 00000000 08:02 1731256                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_createeventplugin.so
7f31f287c000-7f31f2a7c000 ---p 00014000 08:02 1731256                    /*=
**=20
KMail got signal 6 (Exiting)
*** Dead letters dumped.
[0908/162153:FATAL:scoped_file.cc(29)] Check failed: 0 =3D=3D=20
IGNORE_EINTR(close(fd)). : Bad file descriptor
Unable to start Dr. Konqi

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14755692541.cD5B100.32628
Date: Tue, 4 Oct 2016 08:20:54 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:bingmybon=
g&#64;btinternet.com" title=3D"ianseeks &lt;bingmybong&#64;btinternet.com&g=
t;"> <span class=3D"fn">ianseeks</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039">bug 98039<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Priority</td>
           <td>medium
           </td>
           <td>high
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039">bug 98039<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bingmybong&#64;btinternet.com" title=3D"ianseeks &lt;bingmybong&#64;btinter=
net.com&gt;"> <span class=3D"fn">ianseeks</span></a>
</span></b>
        <pre>I'm suffering the same situation, all worked fine until kmail =
5.3.0 came along
with qtwebengine.
Crashes at random times, from as soon as the application is up, to clicking=
 on
a new folder or just when it feels like.
I can never get anything from drkonqui as it always crashes when it tries to
load after kmail crashing.=20
Here is one of the crashes when i launched kmail from cli

kmail
Pass a valid window to KWallet::Wallet::openWallet().
 void AdblockManager::reloadConfig() false=20=20=20=20
AdBlock::AdblockManager(0xfa2ce0)
this does not work on a KActionCollection containing actions!
org.kde.akonadi.ETM: GEN true false false
org.kde.akonadi.ETM: collection: QVector()
org.kde.akonadi.ETM:=20
org.kde.akonadi.ETM: Subtree:  2 QSet(3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, =
14,=20
15, 2)
org.kde.akonadi.ETM: collection: &quot;inbox&quot;
org.kde.akonadi.ETM: Fetch job took  275 msec
org.kde.akonadi.ETM: was collection fetch job: collections: 14
org.kde.akonadi.ETM: first fetched collection: &quot;Local Folders&quot;
org.kde.akonadi.ETM: collection: QVector()
org.kde.akonadi.ETM: Fetch job took  357 msec
org.kde.akonadi.ETM: was collection fetch job: collections: 2
org.kde.akonadi.ETM: first fetched collection: &quot;Search&quot;
org.kde.akonadi.ETM: Fetch job took  187 msec
org.kde.akonadi.ETM: was item fetch job: items: 12
org.kde.akonadi.ETM: Fetch job took  125 msec
org.kde.akonadi.ETM: was collection fetch job: collections: 0
org.kde.akonadi.ETM: collection: &quot;opensuse.org&quot;
org.kde.akonadi.ETM: Fetch job took  343 msec
org.kde.akonadi.ETM: was item fetch job: items: 3464
*** Error in `kmail': double free or corruption (fasttop): 0x00000000028ba3=
f0=20
***
=3D=3D=3D=3D=3D=3D=3D Backtrace: =3D=3D=3D=3D=3D=3D=3D=3D=3D
/lib64/libc.so.6(+0x7012b)[0x7f3280a2312b]
/lib64/libc.so.6(+0x75936)[0x7f3280a28936]
/lib64/libc.so.6(+0x7610e)[0x7f3280a2910e]
/usr/lib64/dri/nouveau_dri.so(+0x46234f)[0x7f3255cb934f]
/usr/lib64/dri/nouveau_dri.so(+0x46258e)[0x7f3255cb958e]
/usr/lib64/dri/nouveau_dri.so(+0x462892)[0x7f3255cb9892]
/usr/lib64/dri/nouveau_dri.so(+0x1d4adb)[0x7f3255a2badb]
/usr/lib64/dri/nouveau_dri.so(+0x1d4b20)[0x7f3255a2bb20]
/usr/lib64/libQt5WebEngineCore.so.5(+0x237be21)[0x7f326d55fe21]
/usr/lib64/libQt5WebEngineCore.so.5(+0x237be56)[0x7f326d55fe56]
/usr/lib64/libQt5WebEngineCore.so.5(+0x2383bea)[0x7f326d567bea]
/usr/lib64/libQt5WebEngineCore.so.5(+0x23ca53a)[0x7f326d5ae53a]
/usr/lib64/libQt5WebEngineCore.so.5(+0x239ac92)[0x7f326d57ec92]
/usr/lib64/libQt5WebEngineCore.so.5(+0x186ffe9)[0x7f326ca53fe9]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1874c74)[0x7f326ca58c74]
/usr/lib64/libQt5WebEngineCore.so.5(+0x185469f)[0x7f326ca3869f]
/usr/lib64/libQt5WebEngineCore.so.5(+0x186ec13)[0x7f326ca52c13]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1c3e510)[0x7f326ce22510]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1bee4d4)[0x7f326cdd24d4]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1beecc9)[0x7f326cdd2cc9]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1bef182)[0x7f326cdd3182]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1bf1429)[0x7f326cdd5429]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1c020ba)[0x7f326cde60ba]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1beda55)[0x7f326cdd1a55]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1c19ae6)[0x7f326cdfdae6]
/usr/lib64/libQt5WebEngineCore.so.5(+0x1c1623d)[0x7f326cdfa23d]
/lib64/libpthread.so.0(+0x7454)[0x7f327692a454]
/lib64/libc.so.6(clone+0x6d)[0x7f3280a9b15d]
=3D=3D=3D=3D=3D=3D=3D Memory map: =3D=3D=3D=3D=3D=3D=3D=3D
00400000-00406000 r-xp 00000000 08:02 1596314                            /u=
sr/
bin/kmail
00606000-00607000 r--p 00006000 08:02 1596314                            /u=
sr/
bin/kmail
00607000-00608000 rw-p 00007000 08:02 1596314                            /u=
sr/
bin/kmail
00b4e000-02990000 rw-p 00000000 00:00 0=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[heap]
7f316af20000-7f316af21000 ---p 00000000 00:00 0=20
7f316af21000-7f316b721000 rw-p 00000000 00:00 0=20
7f316b721000-7f316b821000 rw-s 00000000 00:12 1527902                    /d=
ev/
shm/.org.chromium.Chromium.l5blEH (deleted)
7f316b821000-7f316b921000 rw-s 00000000 00:12 1527901                    /d=
ev/
shm/.org.chromium.Chromium.dG6u9f (deleted)
7f316bb21000-7f316bb28000 r-xp 00000000 08:02 1713782                    /u=
sr/
lib64/grantlee/5.1/kde_grantlee_plugin.so
7f316bb28000-7f316bd27000 ---p 00007000 08:02 1713782                    /u=
sr/
lib64/grantlee/5.1/kde_grantlee_plugin.so
7f316bd27000-7f316bd28000 r--p 00006000 08:02 1713782                    /u=
sr/
lib64/grantlee/5.1/kde_grantlee_plugin.so
7f316bd28000-7f316bd29000 rw-p 00007000 08:02 1713782                    /u=
sr/
lib64/grantlee/5.1/kde_grantlee_plugin.so
7f316bd29000-7f316bd3e000 r-xp 00000000 08:02 1733307                    /u=
sr/
lib64/grantlee/5.1/grantlee_i18ntags.so
7f316bd3e000-7f316bf3d000 ---p 00015000 08:02 1733307                    /u=
sr/
lib64/grantlee/5.1/grantlee_i18ntags.so
7f316bf3d000-7f316bf3f000 r--p 00014000 08:02 1733307                    /u=
sr/
lib64/grantlee/5.1/grantlee_i18ntags.so
7f316bf3f000-7f316bf40000 rw-p 00016000 08:02 1733307                    /u=
sr/
lib64/grantlee/5.1/grantlee_i18ntags.so
7f316bf40000-7f316bf80000 rw-p 00000000 00:00 0=20
7f316bfaa000-7f316c3ba000 rw-p 00000000 00:00 0=20
7f316c3ba000-7f31ec3ba000 rwxp 00000000 00:00 0=20
7f31ec3ba000-7f31ec3bb000 ---p 00000000 00:00 0=20
7f31ec3bb000-7f31ecbbb000 rw-p 00000000 00:00 0=20
7f31ecbbb000-7f31ecbbe000 r-xp 00000000 08:02 1732589                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_xdiff.so
7f31ecbbe000-7f31ecdbd000 ---p 00003000 08:02 1732589                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_xdiff.so
7f31ecdbd000-7f31ecdbe000 r--p 00002000 08:02 1732589                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_xdiff.so
7f31ecdbe000-7f31ecdbf000 rw-p 00003000 08:02 1732589                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_xdiff.so
7f31ecdbf000-7f31ecdce000 r-xp 00000000 08:02 1733487                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_vcard.so
7f31ecdce000-7f31ecfcd000 ---p 0000f000 08:02 1733487                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_vcard.so
7f31ecfcd000-7f31ecfce000 r--p 0000e000 08:02 1733487                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_vcard.so
7f31ecfce000-7f31ecfcf000 rw-p 0000f000 08:02 1733487                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_vcard.so
7f31ecfcf000-7f31ecff7000 r-xp 00000000 08:02 1732525                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_calendar.so
7f31ecff7000-7f31ed1f6000 ---p 00028000 08:02 1732525                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_calendar.so
7f31ed1f6000-7f31ed1f8000 r--p 00027000 08:02 1732525                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_calendar.so
7f31ed1f8000-7f31ed1f9000 rw-p 00029000 08:02 1732525                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_text_calendar.so
7f31ed1f9000-7f31ed21d000 r-xp 00000000 08:02 1585782                    /u=
sr/
lib64/libKF5Tnef.so.5.3.0
7f31ed21d000-7f31ed41c000 ---p 00024000 08:02 1585782                    /u=
sr/
lib64/libKF5Tnef.so.5.3.0
7f31ed41c000-7f31ed41d000 r--p 00023000 08:02 1585782                    /u=
sr/
lib64/libKF5Tnef.so.5.3.0
7f31ed41d000-7f31ed41e000 rw-p 00024000 08:02 1585782                    /u=
sr/
lib64/libKF5Tnef.so.5.3.0
7f31ed41e000-7f31ed425000 r-xp 00000000 08:02 1732645                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_application_mstnef.so
7f31ed425000-7f31ed624000 ---p 00007000 08:02 1732645                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_application_mstnef.so
7f31ed624000-7f31ed625000 r--p 00006000 08:02 1732645                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_application_mstnef.so
7f31ed625000-7f31ed626000 rw-p 00007000 08:02 1732645                    /u=
sr/
lib64/qt5/plugins/messageviewer_bodypartformatter_application_mstnef.so
7f31ed626000-7f31ed627000 ---p 00000000 00:00 0=20
7f31ed627000-7f31ede27000 rw-p 00000000 00:00 0=20
7f31ede27000-7f31ede4f000 r-xp 00000000 08:02 1708215                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaultfilters.so
7f31ede4f000-7f31ee04e000 ---p 00028000 08:02 1708215                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaultfilters.so
7f31ee04e000-7f31ee050000 r--p 00027000 08:02 1708215                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaultfilters.so
7f31ee050000-7f31ee051000 rw-p 00029000 08:02 1708215                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaultfilters.so
7f31ee051000-7f31ee062000 r-xp 00000000 08:02 1733464                    /u=
sr/
lib64/grantlee/5.1/grantlee_loadertags.so
7f31ee062000-7f31ee262000 ---p 00011000 08:02 1733464                    /u=
sr/
lib64/grantlee/5.1/grantlee_loadertags.so
7f31ee262000-7f31ee263000 r--p 00011000 08:02 1733464                    /u=
sr/
lib64/grantlee/5.1/grantlee_loadertags.so
7f31ee263000-7f31ee264000 rw-p 00012000 08:02 1733464                    /u=
sr/
lib64/grantlee/5.1/grantlee_loadertags.so
7f31ee264000-7f31ee297000 r-xp 00000000 08:02 1706087                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaulttags.so
7f31ee297000-7f31ee496000 ---p 00033000 08:02 1706087                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaulttags.so
7f31ee496000-7f31ee499000 r--p 00032000 08:02 1706087                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaulttags.so
7f31ee499000-7f31ee49a000 rw-p 00035000 08:02 1706087                    /u=
sr/
lib64/grantlee/5.1/grantlee_defaulttags.so
7f31ee49a000-7f31ee49b000 ---p 00000000 00:00 0=20
7f31ee49b000-7f31eec9b000 rw-p 00000000 00:00 0=20
7f31eef9b000-7f31eefa9000 r-xp 00000000 08:02 1708305                    /u=
sr/
lib64/qt5/plugins/akonadi_serializer_mail.so
7f31eefa9000-7f31ef1a8000 ---p 0000e000 08:02 1708305                    /u=
sr/
lib64/qt5/plugins/akonadi_serializer_mail.so
7f31ef1a8000-7f31ef1a9000 r--p 0000d000 08:02 1708305                    /u=
sr/
lib64/qt5/plugins/akonadi_serializer_mail.so
7f31ef1a9000-7f31ef1aa000 rw-p 0000e000 08:02 1708305                    /u=
sr/
lib64/qt5/plugins/akonadi_serializer_mail.so
7f31ef1aa000-7f31ef7e4000 rw-s 119802000 00:06 11743                     /d=
ev/
dri/card0
7f31ef7e4000-7f31f01e4000 rwxp 00000000 00:00 0=20
7f31f01e4000-7f31f081e000 rw-s 00000000 00:05 2293761                    /
SYSV00000000 (deleted)
7f31f081e000-7f31f081f000 ---p 00000000 00:00 0=20
7f31f081f000-7f31f101f000 rw-p 00000000 00:00 0=20
7f31f101f000-7f31f1020000 ---p 00000000 00:00 0=20
7f31f1020000-7f31f1820000 rw-p 00000000 00:00 0=20
7f31f1820000-7f31f1825000 r-xp 00000000 08:02 1732299                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_grantleeheaderstyleplugin.so
7f31f1825000-7f31f1a25000 ---p 00005000 08:02 1732299                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_grantleeheaderstyleplugin.so
7f31f1a25000-7f31f1a26000 r--p 00005000 08:02 1732299                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_grantleeheaderstyleplugin.so
7f31f1a26000-7f31f1a27000 rw-p 00006000 08:02 1732299                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_grantleeheaderstyleplugin.so
7f31f1a27000-7f31f1a2e000 r-xp 00000000 08:02 1714866                    /u=
sr/
lib64/qt5/plugins/messageviewer/
messageviewer_defaultgrantleeheaderstyleplugin.so
7f31f1a2e000-7f31f1c2e000 ---p 00007000 08:02 1714866                    /u=
sr/
lib64/qt5/plugins/messageviewer/
messageviewer_defaultgrantleeheaderstyleplugin.so
7f31f1c2e000-7f31f1c2f000 r--p 00007000 08:02 1714866                    /u=
sr/
lib64/qt5/plugins/messageviewer/
messageviewer_defaultgrantleeheaderstyleplugin.so
7f31f1c2f000-7f31f1c30000 rw-p 00008000 08:02 1714866                    /u=
sr/
lib64/qt5/plugins/messageviewer/
messageviewer_defaultgrantleeheaderstyleplugin.so
7f31f1c30000-7f31f1c35000 r-xp 00000000 08:02 1732714                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_longheaderstyleplugin.so
7f31f1c35000-7f31f1e34000 ---p 00005000 08:02 1732714                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_longheaderstyleplugin.so
7f31f1e34000-7f31f1e35000 r--p 00004000 08:02 1732714                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_longheaderstyleplugin.so
7f31f1e35000-7f31f1e36000 rw-p 00005000 08:02 1732714                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_longheaderstyleplugin.so
7f31f1e36000-7f31f1e41000 r-xp 00000000 08:02 1711876                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_enterpriseheaderstyleplugin.so
7f31f1e41000-7f31f2041000 ---p 0000b000 08:02 1711876                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_enterpriseheaderstyleplugin.so
7f31f2041000-7f31f2042000 r--p 0000b000 08:02 1711876                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_enterpriseheaderstyleplugin.so
7f31f2042000-7f31f2043000 rw-p 0000c000 08:02 1711876                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_enterpriseheaderstyleplugin.so
7f31f2043000-7f31f2048000 r-xp 00000000 08:02 1727636                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_allheaderstyleplugin.so
7f31f2048000-7f31f2248000 ---p 00005000 08:02 1727636                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_allheaderstyleplugin.so
7f31f2248000-7f31f2249000 r--p 00005000 08:02 1727636                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_allheaderstyleplugin.so
7f31f2249000-7f31f224a000 rw-p 00006000 08:02 1727636                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_allheaderstyleplugin.so
7f31f224a000-7f31f2253000 r-xp 00000000 08:02 1730162                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_briefheaderstyleplugin.so
7f31f2253000-7f31f2452000 ---p 00009000 08:02 1730162                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_briefheaderstyleplugin.so
7f31f2452000-7f31f2453000 r--p 00008000 08:02 1730162                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_briefheaderstyleplugin.so
7f31f2453000-7f31f2454000 rw-p 00009000 08:02 1730162                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_briefheaderstyleplugin.so
7f31f2454000-7f31f245f000 r-xp 00000000 08:02 1731783                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_fancyheaderstyleplugin.so
7f31f245f000-7f31f265f000 ---p 0000b000 08:02 1731783                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_fancyheaderstyleplugin.so
7f31f265f000-7f31f2660000 r--p 0000b000 08:02 1731783                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_fancyheaderstyleplugin.so
7f31f2660000-7f31f2661000 rw-p 0000c000 08:02 1731783                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_fancyheaderstyleplugin.so
7f31f2661000-7f31f2667000 r-xp 00000000 08:02 1721699                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_standardsheaderstyleplugin.so
7f31f2667000-7f31f2866000 ---p 00006000 08:02 1721699                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_standardsheaderstyleplugin.so
7f31f2866000-7f31f2867000 r--p 00005000 08:02 1721699                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_standardsheaderstyleplugin.so
7f31f2867000-7f31f2868000 rw-p 00006000 08:02 1721699                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_standardsheaderstyleplugin.so
7f31f2868000-7f31f287c000 r-xp 00000000 08:02 1731256                    /u=
sr/
lib64/qt5/plugins/messageviewer/messageviewer_createeventplugin.so
7f31f287c000-7f31f2a7c000 ---p 00014000 08:02 1731256                    /*=
**=20
KMail got signal 6 (Exiting)
*** Dead letters dumped.
[0908/162153:FATAL:scoped_file.cc(29)] Check failed: 0 =3D=3D=20
IGNORE_EINTR(close(fd)). : Bad file descriptor
Unable to start Dr. Konqi</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14755692541.cD5B100.32628--

--===============2074670570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2074670570==--
