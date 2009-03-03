From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18286] GeForce 8300 not supported
	(10de:0848/C77/MCP77)
Date: Tue,  3 Mar 2009 13:28:39 -0800 (PST)
Message-ID: <20090303212839.1F9E1130058@annarchy.freedesktop.org>
References: <bug-18286-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-18286-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18286





--- Comment #4 from Sebastian Brandt <sbrandt-Mmb7MZpHnFY@public.gmane.org>  2009-03-03 13:28:34 PST ---
Sorry, but current git crashes ...
short version below, more info in the attachments.
Took some time to get that far, I still had too many versions of glx, drm,
nouveau, etc. lying around ...

[...]
(II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled
message.
(II) NOUVEAU(0): nv50_crtc_gamma_set is called for CRTC0.
(II) NOUVEAU(0): NV50CrtcGammaSet is called for CRTC0.

Backtrace:
0: X(xf86SigHandler+0x65) [0x47e715]
1: /lib64/libc.so.6 [0x7fe7331666e0]
2: /usr/lib64/xorg/modules//drivers/nouveau_drv.so [0x7fe7302f02a7]
3: X [0x4acdf2]
4: /usr/lib64/xorg/modules//drivers/nouveau_drv.so [0x7fe7302d0613]
5: X [0x485ef2]
6: X [0x486028]
7: X(xf86HandleColormaps+0x281) [0x487021]
8: /usr/lib64/xorg/modules//drivers/nouveau_drv.so [0x7fe7302d00cb]
9: X(AddScreen+0x1c9) [0x4319a9]
10: X(InitOutput+0x241) [0x466f71]
11: X(main+0x286) [0x432146]
12: /lib64/libc.so.6(__libc_start_main+0xe6) [0x7fe733152586]
13: X [0x4316f9]

Fatal server error:
Caught signal 11.  Server aborting

(II) NOUVEAU(0): NVLeaveVT is called.
(II) NOUVEAU(0): NV50DispShutdown is called.
[...]


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
