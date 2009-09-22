From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24092] New: X with nouveau hangs in
 nouveau_bo_map_range when doing anything
Date: Tue, 22 Sep 2009 12:31:25 -0700 (PDT)
Message-ID: <bug-24092-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24092

           Summary: X with nouveau hangs in nouveau_bo_map_range when doing
                    anything
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: alexerion-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=29769)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=29769)
lspci -vv output for the video card

When eg. moving cursor over kde menu, or moving a window, X hangs, and starts
using 100% cpu. Sometimes it even hangs before kde has finished loading. It
pretty much hangs in under a minute if i do anything at all.
The cursor still moves, but nothing else works.

More specific info, as obtained from "gdb --pid `pidof X`", follows.
The hanged X sometimes shuts down after i detach from it, the odds seem to rise
the more i have used stepi in gdb.

Backtrace: (gdb's parameter string expansions removed, as they contained
garbage. They are visible in the attached gdb-full.log, though)
#0  0x00007fc4c3af5127 in ioctl () from /lib/libc.so.6
#1  0x00007fc4c2d8bb26 in drmIoctl (fd=9, request=1074291845,
arg=0x7fffec89f5c0) at xf86drm.c:188
#2  0x00007fc4c2d8bd3f in drmCommandWrite (fd=9, drmCommandIndex=<value
optimized out>, data=0x7fffec89f5c0, size=18446744073709551615) at
xf86drm.c:2402
#3  0x00007fc4c2930011 in nouveau_bo_wait (bo=0x2397790, cpu_write=0,
no_wait=0, no_block=0) at nouveau_bo.c:399
#4  0x00007fc4c29301d5 in nouveau_bo_map_range (bo=0x2397790, delta=0,
size=<value optimized out>, flags=0) at nouveau_bo.c:442
#5  0x00007fc4c2b43ce5 in NVAccelDownloadM2MF (pspix=0x2614d70, x=<value
optimized out>, y=0, w=156, h=102,
    dst=0x2614db0, dst_pitch=624) at nouveau_exa.c:125
#6  0x00007fc4c2b44d1e in nouveau_exa_download_from_screen (pspix=0x2614d70,
x=0, y=0, w=156, h=102,
    dst=0x2614db0, dst_pitch=624) at nouveau_exa.c:480
#7  0x00007fc4c10d271a in exaCopyDirty (migrate=0x7fffec89f950,
pValidDst=0x2517ee8, pValidSrc=<value optimized out>, transfer=0x7fc4c2b44ca7
<nouveau_exa_download_from_screen>,
    fallback_src=0x7fc4b9000b00 <Address 0x7fc4b9000b00 out of bounds>,
--
#8  0x00007fc4c10d2a69 in exaDoMoveOutPixmap (migrate=0x7fffec89f950) at
exa_migration.c:256
#9  0x00007fc4c10d30b5 in exaDoMigration (pixmaps=0x7fffec89f950, npixmaps=1,
can_accel=0) at exa_migration.c:677
#10 0x00007fc4c10cf329 in exaGetImage (pDrawable=0x2614d70, x=0, y=0, w=156,
h=102, format=2, planeMask=4294967295, d=0x2624660) at exa_accel.c:1331
#11 0x00000000004cc141 in miSpriteGetImage (pDrawable=0x2614d70, sx=0, sy=0,
w=156, h=102, format=2, planemask=4294967295, pdstLine=0x2624660) at
misprite.c:281
#12 0x0000000000446116 in ProcGetImage (client=0x2528750) at dispatch.c:2067
#13 0x0000000000447c4a in Dispatch () at dispatch.c:454
#14 0x000000000043069d in main (argc=9, argv=0x7fffec89fc78, envp=<value
optimized out>) at main.c:438

I've gotten the above(ish) backtrace multiple times, the last few functions are
always the same:
ioctl()
drmIoctl()
drmCommandWrite()
nouveau_bo_wait() (was "?? ()" before i compiled everything with -ggdb, but
probably same)
nouveau_bo_map_range()

Right next in the stack trace after these, i have seen NVAccelDownloadM2MF and
NVAccelUploadM2MF thus far. (again before recompile with -ggdb, it was always
"?? ()", so i might've missed some callers, but probably mostly the same
functions)

If i step the code one instruction at a time with 'stepi', the execution loops
these:

ioctl () from /lib/libc.so.6
0x7fc4c3af5127 <ioctl+7>:       cmp    $0xfffffffffffff001,%rax

utils.c
0x4df396 <SmartScheduleTimer>:  mov    0x2b47a3(%rip),%rax        # 0x793b40
<_DYNAMIC+3496>
0x4df39d <SmartScheduleTimer+7>:        mov    0x2b4b54(%rip),%rdx        #
0x793ef8 <_DYNAMIC+4448>
0x4df3a4 <SmartScheduleTimer+14>:       mov    (%rdx),%rdx
0x4df3a7 <SmartScheduleTimer+17>:       add    %rdx,(%rax)
0x4df3aa <SmartScheduleTimer+20>:       retq

<signal handler called>
0x7fc4c5b8ea10 <__restore_rt>:  mov    $0xf,%rax
0x7fc4c5b8ea17 <__restore_rt+7>:        syscall

So the line in ioctl() never seems to get executed. The assembly lines looped
have so far been the same every time i have looked at X with gdb after a hang.

I am using 64bit gentoo, the git revisions of the installed packages are:
xf86-video-nouveau df94ebdbcd89c1678ac243217e7f5b20cbbe857c
nouveau-drm 3d6747a2b1576782fe74975a353b356cfc936505
libdrm ac71f0849928f4b2fbb69c01304ac6f9df8916a1

Like i said, it's very easy to trigger the hang, so on the positive side, i'm
able to test patches quickly (as soon as i figure out how to tell emerge to use
them :)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
