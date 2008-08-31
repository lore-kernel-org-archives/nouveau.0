From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 17377] NV50 failure on MacBook Pro.
Date: Sun, 31 Aug 2008 05:25:23 -0700 (PDT)
Message-ID: <20080831122524.56D1113234E@annarchy.freedesktop.org>
References: <bug-17377-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-17377-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=17377





--- Comment #1 from David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>  2008-08-31 05:25:21 PST ---
Using mesa and nouveau from git as of today (commits cd7d71f1 and 6dd8ad4e
resp.), it manages a little better, but still doesn't start up correctly.

When starting manually, it initialises the screen which what looks like the
familiar stipple pattern, except that there are about 100 almost horizontal
black lines across the it. They're a single pixel high, and run for about 128
pixels along before dropping down by one pixel. And then it locks up, eating
CPU in nouveau_dma_wait():

0x0000000002234c2c in nouveau_dma_wait (
    userchan=0x263ab70, size=13) at nouveau_dma.c:99
99                                                      get = READ_GET(chan);
Missing separate debuginfos, use: debuginfo-install xorg-x11-server.x86_64
(gdb) bt
#0  0x0000000002234c2c in nouveau_dma_wait (userchan=0x263ab70, size=13) at
nouveau_dma.c:99
#1  0x000000000226e9fd in NV50EXACopy (pdpix=<value optimized out>, srcX=0,
srcY=0, dstX=1764, dstY=0, width=4, height=4) at nouveau_dma.h:118
#2  0x000000000717b4e0 in exaFillRegionTiled () from
/usr/lib64/xorg/modules//libexa.so


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
