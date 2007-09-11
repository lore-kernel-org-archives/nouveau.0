From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 12368] No valid modes on a QUADRO NVS 140M
Date: Tue, 11 Sep 2007 13:33:15 -0700 (PDT)
Message-ID: <20070911203316.2336613005D@annarchy.freedesktop.org>
References: <bug-12368-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-12368-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=12368


elias.naur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |elias.naur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org




------- Comment #4 from elias.naur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org  2007-09-11 13:33 PST -------
I uploaded a new log from the latest nouveau_drv.so. The new crash is:

/usr/lib/xorg/modules/drivers//nouveau_drv.so(nv30UpdateArbitrationSettings+0x23)
[0x2ac7262f1823]
4: /usr/lib/xorg/modules/drivers//nouveau_drv.so(NVCalcStateExt+0x41c)
[0x2ac7262f277c]
5: /usr/lib/xorg/modules/drivers//nouveau_drv.so(NVDACInit+0x44f)
[0x2ac7262ea60f]
6: /usr/lib/xorg/modules/drivers//nouveau_drv.so [0x2ac7262ee5d5]
7: /usr/lib/xorg/modules/drivers//nouveau_drv.so [0x2ac7262f002c]
8: /usr/lib/xorg/modules/drivers//nouveau_drv.so [0x2ac7262f050a]
9: /usr/bin/X11/X(AddScreen+0x222) [0x439522]
10: /usr/bin/X11/X(InitOutput+0x268) [0x468a48]
11: /usr/bin/X11/X(main+0x275) [0x439d25]
12: /lib/libc.so.6(__libc_start_main+0xf4) [0x2ac72413bb44]
13: /usr/bin/X11/X(FontFileCompleteXLFD+0x229) [0x439209]

it seems to involve the nvGetClocks call in line 694 in nv_hw.c.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
