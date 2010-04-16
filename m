From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27706] Blank screen and "Error referencing VRAM
 ctxdma: -12" on NV44A with ubuntu lucid beta 2 (worked in alpha 3)
Date: Fri, 16 Apr 2010 14:42:47 -0700 (PDT)
Message-ID: <20100416214247.A915D13005E@annarchy.freedesktop.org>
References: <bug-27706-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27706-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

https://bugs.freedesktop.org/show_bug.cgi?id=27706

--- Comment #4 from Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-04-16 14:42:47 PDT ---
Ok first, I noticed these strange differences :
dmesg-beta2:[    6.686828] Linux agpgart interface v0.103
dmesg-beta2:[    6.709693] agpgart: Detected NVIDIA nForce2 chipset
dmesg-beta2:[    6.725012] agpgart-nvidia 0000:00:00.0: AGP aperture is 64M @
0xe0000000
dmesg-beta2:[    8.814073] agpgart-nvidia 0000:00:00.0: AGP 3.0 bridge
dmesg-beta2:[    8.814090] agpgart: modprobe tried to set rate=x12. Setting to
AGP3 x8 mode.
dmesg-beta2:[    8.814097] agpgart-nvidia 0000:00:00.0: putting AGP V3 device
into 8x mode
dmesg-alpha3:[    4.397083] Linux agpgart interface v0.103
dmesg-alpha3:[    5.005571] agpgart: Detected NVIDIA nForce2 chipset
dmesg-alpha3:[    5.012047] agpgart-nvidia 0000:00:00.0: AGP aperture is 64M @
0xe0000000

It might be worth to understand why that changed first, before looking at the
rest. Unless someone tells you otherwise :)

(In reply to comment #3)
> Here are the different versions of libraries used by ubuntu (I don't know which
> ones are relevant in this case) :
> 
> On beta 2 (with all current updates) :
> xorg 1:7.5+5ubuntu1
> libdrmnouveau1 2.4.18-1ubuntu3
> xserver-xorg-video-nouveau 1:0.0.15+git20100219+9b4118d-0ubuntu5
> kernel 2.6.32-21-generic (on x86)
> 
> On alpha 3 liveCD :
> xorg 1:7.5+1ubuntu8
> libdrmnouveau1 2.4.18-1ubuntu2
> xserver-xorg-video-nouveau 1:0.0.15+git20100219+9b4118d-0ubuntu2
> kernel 2.6.32-14-generic (on x86)

I suppose you can exclude xorg and xorg nouveau driver, since you apparently
get that problem right when nouveau initializes, before touching X.

There remains libdrm nouveau and the kernel. The problem is that these are
ubuntu packages, and to people external to ubuntu (like all nouveau developers,
and many users, like me), it's not easy to know exactly what code that is
using.

If you could point out the equivalent upstream code, it would help.
For libdrm : http://cgit.freedesktop.org/mesa/drm/
For drm/ttm :
http://git.kernel.org/?p=linux/kernel/git/airlied/drm-2.6.git;a=shortlog;h=drm-next
For nouveau drm : http://cgit.freedesktop.org/nouveau/linux-2.6/

More importantly, how do we know that this latest upstream code would not work
for you ?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
