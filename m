From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 19860] New: xv texture adaptor kills X
Date: Sat, 31 Jan 2009 13:38:27 -0800 (PST)
Message-ID: <bug-19860-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=19860

           Summary: xv texture adaptor kills X
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: mjulien.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hi,

card : Geforce 7600GS ; NV4B 10de:02e1 ; X server 1.4.0.90

The problem appeared between commits 1eb8b8778037336e530e113b8bbd61d724b1cc52
and 786dd366474006b10c740c5012630ff5f1cd2a0fnd.

When I try to play a video using a texture adapter, X is killed and VT display
is completely messed up.



gdm log :

X.Org X Server 1.4.0.90
Release Date: 5 September 2007
X Protocol Version 11, Revision 0
Build Operating System: Linux_2.6.24.5-server-2mnb Mandriva
Current Operating System: Linux tue-amour 2.6.24.7-desktop-2mnb #1 SMP Thu Oct
30 14:31:33 EDT 2008 x86_64
Build Date: 16 September 2008  04:56:13PM

        Before reporting problems, check http://qa.mandriva.com
        to make sure that you have the latest version.
Module Loader present
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Sat Jan 31 21:56:17 2009
(==) Using config file: "/etc/X11/xorg.conf"
(II) Module "i2c" already built-in
(II) Module "ddc" already built-in
(II) Module "ramdac" already built-in
0x806b30 0x806e10 0x8070c0 0x807b50
expected keysym, got XF86Info: line 959 of inet
expected keysym, got XF86Info: line 959 of inet
The XKEYBOARD keymap compiler (xkbcomp) reports:
> Warning:          Type "ONE_LEVEL" has 1 levels, but <RALT> has 2 symbols
>                   Ignoring extra symbols
Errors from xkbcomp are not fatal to the X server
SetClientVersion: 0 9
SetKbdSettings - type: 23658688 rate: 30 delay: 500 snumlk: 0
X: nouveau_bo.c:169: nouveau_bo_validate: Assertion `!r->bo->base.map' failed.




gdb backtrace :

Program received signal SIGABRT, Aborted.
[Switching to Thread 47802344089392 (LWP 15759)]
0x00002b79d98ada55 in raise () from /lib64/libc.so.6
(gdb) bt
#0  0x00002b79d98ada55 in raise () from /lib64/libc.so.6
#1  0x00002b79d98af1e0 in abort () from /lib64/libc.so.6
#2  0x00002b79d98a6d6f in __assert_fail () from /lib64/libc.so.6
#3  0x00002b79db180b30 in nouveau_bo_validate (userchan=<value optimized out>)
    at nouveau_bo.c:169
#4  0x00002b79db1806d9 in nouveau_dma_kickoff (userchan=0x3d8f)
    at nouveau_dma.c:157
#5  0x00002b79db1b60e0 in NV40PutTextureImage (pScrn=0x0, src=0x17cc700, 
    src_offset=0, src_offset2=691200, id=<value optimized out>, 
    src_pitch=<value optimized out>, dstBox=0x7fffd2c324c0, x1=0, y1=0, 
    x2=62914560, y2=47185920, width=960, height=720, src_w=480, src_h=360, 
    drw_w=960, drw_h=720, clipBoxes=0x7fffd2c325c0, ppix=0x1c412f0, 
    pPriv=0x8213b8) at nv40_xv_tex.c:356
#6  0x00002b79db187d64 in NVPutImage (pScrn=0x7fb940, src_x=0, src_y=0, 
    drw_x=32, drw_y=51, src_w=960, src_h=720, drw_w=960, drw_h=720, 
    id=842094169, buf=0x2b79e6015000 "", width=960, height=720, Sync=0, 
    clipBoxes=0x7fffd2c325c0, data=0x8213b8, pDraw=0x17b9330)
    at nouveau_xv.c:1465
#7  0x0000000000487d02 in ?? ()
#8  0x00002b79da0b4746 in BitOrderInvert ()
   from /usr/lib64/xorg/modules/extensions//libextmod.so
#9  0x0000000000448d2f in Dispatch ()
#10 0x0000000000430ead in main ()

thx


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
