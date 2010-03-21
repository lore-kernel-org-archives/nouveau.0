From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18286] [nouveau] GeForce 8200 and 8300 not supported
 (10de:0848/0849/C77/MCP77/MCP78S)
Date: Sun, 21 Mar 2010 16:15:07 -0700 (PDT)
Message-ID: <20100321231507.5E33D130098@annarchy.freedesktop.org>
References: <bug-18286-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-18286-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18286





--- Comment #36 from Josh Saddler <nightmorph-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>  2010-03-21 16:15:04 PST ---
(In reply to comment #35)
> There's a possibility NVAA is now fixed in current nouveau git.

I think it is. I'm doing things on my Geforce 8200 I could never do before.

While I *very occasionally* see graphical corruption when rolling over Xfce
startmenus, or the "File Edit View Help" bars in application windows, accel
seems to be working okay.

$ glxinfo

direct rendering: Yes
server glx vendor string: SGI
server glx version string: 1.4
client glx vendor string: Mesa Project and SGI
client glx version string: 1.4
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVAA
OpenGL version string: 2.1 Mesa 7.9-devel
OpenGL shading language version string: 1.20

This is with kernel 2.6.34_rc2, 1-hour-old checkouts of
Mesa/libdrm/xf86-video-nouveau, and nouveau-firmware-20091212. Mesa is built
with gallium3d, since apparently that's required for nouveau these days. I
dunno if there are any other software versions or xorg.conf settings that would
be better, but the above stack is what works for me. Nice'n'stable; no lockups.

No, I can't run ioQuake3-based games like Urban Terror at native 1440x900 with
all settings maxed (the way I can with my RadeonHD 4550 and xf86-video-ati),
but it is kinda playable. That's big progress.

So whatever ya'll have done in the last month, keep it up -- it's yielding
amazing results. Thanks a bunch!


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
