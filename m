From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20848] New: Nouveau crashes on rotation
Date: Tue, 24 Mar 2009 15:08:12 -0700 (PDT)
Message-ID: <bug-20848-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20848

           Summary: Nouveau crashes on rotation
           Product: xorg
           Version: 7.4
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: luizluca-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=24214)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=24214)
Xorg log

Hello,

I'm in a multimonitor setup. One with 22' and another with 15' rotated. I used
to setup my screens with xrandr only. However, after updating drm and nouveau
from git and build, It crashes on rotation. I run xinit and run: 

xrandr --output DVI-I-0 --rotate left

And X server crashes with:

Backtrace:
0: X(xf86SigHandler+0x65) [0x47eca5]
1: /lib64/libc.so.6 [0x7f28268026e0]
2: /lib64/libc.so.6(memcpy+0x15b) [0x7f282684fe8b]
3: /usr/lib64/libpixman-1.so.0 [0x7f2827526633]
4: /usr/lib64/libpixman-1.so.0 [0x7f282752af54]
5: /usr/lib64/libpixman-1.so.0(pixman_image_composite+0x79f) [0x7f282752abbf]
6: /usr/lib64/xorg/modules//libfb.so(fbComposite+0x1ba) [0x7f28231b1c8a]
7: /usr/lib64/xorg/modules//libexa.so(ExaCheckComposite+0x312) [0x7f2822f96a72]
8: /usr/lib64/xorg/modules//libexa.so(exaComposite+0x245) [0x7f2822f955e5]
9: X [0x52f9f8]
10: X [0x4af96b]
11: X(BlockHandler+0x50) [0x44fe80]
12: X(WaitForSomething+0x152) [0x4e9192]
13: X(Dispatch+0x7f) [0x44c15f]
14: X(main+0x45d) [0x43260d]
15: /lib64/libc.so.6(__libc_start_main+0xe6) [0x7f28267ee586]
16: X [0x4319e9]

If I use:

 xrandr --output DVI-I-1 --rotate left

It simply freeze. I'll attach the logs for the first case.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
