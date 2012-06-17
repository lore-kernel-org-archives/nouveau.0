From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46557] nouveau: nv4E 2D acceleration broken on
 64-bit kernel; works on 32-bit
Date: Sun, 17 Jun 2012 13:10:59 +0000
Message-ID: <bug-46557-8800-0EUN6KTlgD@http.bugs.freedesktop.org/>
References: <bug-46557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-46557-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=46557

--- Comment #8 from D. Hugh Redelmeier <hugh-pmF8o41NoarQT0dZR+AlfA@public.gmane.org> 2012-06-17 06:10:59 PDT ---
I experience something similar on my notebook.

- AMD Turion CPU; 3GiB RAM; nVidia GeForce Go 6100 video controller

- was working fine with 64 bit Ubuntu 10.04 using nv X video driver

- problems on 64 bit Ubuntu 12.04 with nouveau driver (VESA driver works but
does not support native resolution)

Symptoms are various.  Simplest, on fully updated system: LightDM seems to work
to allow login but Unity desktop does not show up except for background.

dmesg shows a lot of messages like this (and variants):
 [drm] nouveau 0000:00:05.0: PFIFO_DMA_PUSHER - Ch 3 Get 0x01256038 Put
0x011c60b0 State 0x4ffe0004 (err: INVALID_MTHD) Push 0x00000000

/var/log/Xorg.0.log shows lots of mayhem after this message:
 [mi] EQ overflowing.  Additional events will be discarded until existing
events are processed.

Adding mem=2g to kernel seems to fix the problem!

Thanks Salah for this discovery!  Thanks xexaxo on #nouveau for recognizing my
problem and pointing me here!

I will attach logs.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
