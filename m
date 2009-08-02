From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23086] TNT2 doesn't start with current nouveau
Date: Sun,  2 Aug 2009 01:37:07 -0700 (PDT)
Message-ID: <20090802083708.0BC27130058@annarchy.freedesktop.org>
References: <bug-23086-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23086-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23086





--- Comment #3 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org>  2009-08-02 01:37:05 PST ---
Bug present with both KMS and non-KMS cases. Option NoAccel "1" gives me
different segfault:



(II) Module shadowfb: vendor="X.Org Foundation"
        compiled for 1.6.99.1, module version = 1.0.0
        ABI class: X.Org ANSI C Emulation, version 0.4
(--) Depth 24 pixmap format is 32 bpp
(II) NOUVEAU(0): Saving VGA fonts
(II) NOUVEAU(0): Saving crtcs
(II) NOUVEAU(0): Saving encoders
(==) NOUVEAU(0): Backing store disabled
(==) NOUVEAU(0): Silken mouse enabled
(II) NOUVEAU(0): NVEnterVT is called.
(II) NOUVEAU(0): Saving VGA fonts
(II) NOUVEAU(0): Saving crtcs
(II) NOUVEAU(0): Saving encoders

Backtrace:
0: /usr/X11/bin/X(xorg_backtrace+0x34) [0x80a2134]
1: /usr/X11/bin/X [0x80a5614]
2: [0xffffe410]
3: /usr/X11R7/lib/xorg/modules/drivers/nouveau_drv.so [0xb7941fb2]
4: /usr/X11R7/lib/xorg/modules/drivers/nouveau_drv.so [0xb7942b50]
5: /usr/X11/bin/X(AddScreen+0x1a4) [0x8069784]
6: /usr/X11/bin/X(InitOutput+0x222) [0x80b4072]
7: /usr/X11/bin/X [0x806335c]
8: /lib/libc.so.6(__libc_start_main+0xe5) [0xb7a1e6a5]
9: /usr/X11/bin/X [0x8063101]
Segmentation fault at address 0x8

So, i'm using vesa driver right now.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
