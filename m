From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24295] New: No Boot With Nouveau DRM - C51
 misaligned reg 0x0000#### not verified
Date: Sun,  4 Oct 2009 00:02:39 -0700 (PDT)
Message-ID: <bug-24295-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24295

           Summary: No Boot With Nouveau DRM - C51 misaligned reg 0x0000####
                    not verified
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: highest
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: parwok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
                CC: parwok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


Created an attachment (id=30030)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=30030)
My kernel config file

I am using a custom (Zen - http://zen-sources.org, #zen-sources in freenode)
kernel, however I know that I have merged all of the nouveau DRM stuff from the
freedesktop git as a head into my kernel. That said, I have had these same
errors with the same addresses since version .30 and Zen is now on revision
.31-zen2, which means that this has gone on for 3 if not more kernel revisions
(even by mainline vanilla standards). Any chance of fixing this? Previously,
nouveau worked like a dream!

I'm using an NV40 (Geforce Go 6150) on an HP DV9205US laptop, with the
Archlinux distro. I'm sure I have everything setup correctly in .config, it's
the same as it always has been.

The exact errors go as follows:

C51 misaligned reg 0x00001305 not verified
C51 misaligned reg 0x00001401 not verified
C51 misaligned reg 0x00001405 not verified
C51 misaligned reg 0x00001409 not verified
C51 misaligned reg 0x0000140D not verified


Followed by nouveau detecting display outputs before crapping out and stopping
the boot process. I can't boot kernels unless I don't build nouveau...and I'm
using the nv driver now.

And...out of curiosity, is there any chance of separating nouveau to only build
the driver for the card that a person needs? Rather than building for all nv40,
50, 60, etc, have the user choose those he/she needs? I'd prefer that, it would
strip out unnecessary code and speed the build, shrink the kernel, and also
avoid needless bugs.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
