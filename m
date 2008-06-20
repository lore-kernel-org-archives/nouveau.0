From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15206] [dualhead, randr12,
	ppc] Second head displays nothing
Date: Thu, 19 Jun 2008 22:52:08 -0700 (PDT)
Message-ID: <20080620055212.22BDD13005B@annarchy.freedesktop.org>
References: <bug-15206-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15206-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15206





--- Comment #8 from Robin Johnson <robbat2-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>  2008-06-19 22:52:06 PST ---
Created an attachment (id=17245)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=17245)
Xorg.0.log

(In reply to comment #5)
> You might like to try again with an up-to-date checkout. Off-ship dvi is now
> fixed for nv2x and nv3x x86, but I've no idea about nv4x and PPC :) It will
> probably help to boot with both monitors plugged so the open firmware stuff can
> set up as much as possible.
Sorry about the delay, but I was busy, and didn't get a chance to test it until
now.

It's not moved forward, in fact it's even worse now. X doesn't even start on a
single display, let alone get two of them up. Here's the kernel log, and I'll
attach the Xorg.log in a moment.

From the kernel:
[   73.994279] [drm] Initialized drm 1.1.0 20060810
[   74.003382] PCI: Unable to reserve mem region #2:10000000@90000000 for
device 0000:0b:00.0
[   74.003933] [drm] Detected an NV40 generation card (0x043100a4)
[   74.003940] [drm] Initialized nouveau 0.0.10
drm-2.3.0-1298-g8712f0a17bb135d4a on minor 0
[   74.003974] [drm] Used old pci detect: framebuffer loaded
[   74.004972] [drm] OF bios successfully copied (6447 bytes)

Versions:
xf86-video-nouveau df52dc4664df11d57fcf8a6c9ae3f87a149e5392
x11-drm 8712f0a17bb135d4ad3eb85b30f47c561cf9c148
libdrm 8712f0a17bb135d4ad3eb85b30f47c561cf9c148
mesa d785a0c8b2ff45d07a8d2992d089eb96c04658db (gallium-0.1 branch)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
