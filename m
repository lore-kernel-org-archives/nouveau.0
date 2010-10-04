From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30603] New: X crash in NVAccelDownloadM2MF with KDE
 desktop effects enabled.
Date: Mon,  4 Oct 2010 13:26:56 -0700 (PDT)
Message-ID: <bug-30603-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=30603

           Summary: X crash in NVAccelDownloadM2MF with KDE desktop
                    effects enabled.
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: orion-CVdf0l11yl+B+jHODAdFcQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=39158)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=39158)
Xorg.0.log

Logging into KDE with desktop effects enabled results in an X crash:

#0  0x000000377b634065 in raise (sig=6) at
../nptl/sysdeps/unix/sysv/linux/raise.c:64
#1  0x000000377b635a16 in abort () at abort.c:92
#2  0x000000000046346e in OsAbort () at utils.c:1274
#3  0x000000000046ee07 in ddxGiveUp () at xf86Init.c:951
#4  0x000000000045f96d in AbortServer () at log.c:424
#5  0x000000000045fb7e in FatalError (f=0x578d10 "Caught signal %d (%s). Server
aborting\n")
    at log.c:552
#6  0x0000000000460bde in OsSigHandler (signo=11, sip=<value optimized out>, 
    unused=<value optimized out>) at osinit.c:156
#7  <signal handler called>
#8  0x00007fe0566c6961 in NVAccelDownloadM2MF (pspix=0xe15980, x=0, y=0,
w=1920, h=1080, 
    dst=0x0, dst_pitch=7680) at /usr/include/bits/string3.h:52
#9  nouveau_exa_download_from_screen (pspix=0xe15980, x=0, y=0, w=1920, h=1080,
dst=0x0, 
    dst_pitch=7680) at nouveau_exa.c:415
#10 0x00007fe055a58013 in exaGetImage (pDrawable=0xe15980, x=0, y=0, w=1920,
h=1080, format=2, 
    planeMask=18446744073709551615, d=0x0) at exa_accel.c:1294
#11 0x0000000000555ac8 in miSpriteGetImage (pDrawable=0xe15980, sx=0, sy=0,
w=1920, h=1080, 
    format=2, planemask=18446744073709551615, pdstLine=0x0) at misprite.c:423
#12 0x00007fe056f40e4a in swrastGetImage (draw=<value optimized out>, x=<value
optimized out>, 
    y=<value optimized out>, w=<value optimized out>, h=<value optimized out>, 
    data=<value optimized out>, loaderPrivate=0x1336880) at glxdriswrast.c:391
#13 0x00007fe054bd564a in ?? () from /usr/lib64/dri/swrast_dri.so
#14 0x00007fe056f40de8 in __glXDRIbindTexImage (baseContext=<value optimized
out>, 
    buffer=<value optimized out>, glxPixmap=<value optimized out>) at
glxdriswrast.c:205
#15 0x00007fe056f3d9ce in __glXDisp_BindTexImageEXT (cl=<value optimized out>, 
    pc=<value optimized out>) at glxcmds.c:1603
#16 0x00007fe056f3e812 in __glXDisp_VendorPrivate (cl=0x1084bc8, pc=<value
optimized out>)
    at glxcmds.c:2314
#17 0x00007fe056f40483 in __glXDispatch (client=0x1084ab0) at glxext.c:601
#18 0x000000000042d431 in Dispatch () at dispatch.c:432
#19 0x000000000042148e in main (argc=5, argv=<value optimized out>, envp=<value
optimized out>)
    at main.c:291

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
