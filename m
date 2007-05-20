From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10858] glxgears with mesa-git on PCI 10de0322 (NV34)
	GeForce FX 5200 crashes X
Date: Sat, 19 May 2007 17:53:34 -0700 (PDT)
Message-ID: <20070520005334.3884013006A@annarchy.freedesktop.org>
References: <bug-10858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-10858-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=10858





------- Comment #21 from mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org  2007-05-19 17:53 PST -------
additional data point comment 14 is the result of running glxgears after having
run glxgears with the nvidia driver (see dmesg output in comment 16), then;
shutting down X, apt-get remove nvidia-glx, insmod drm.ko debug=1, insmod
nouveau.ko, startx, exporting LD_LIBRARY_PATH, LIBGL_DRIVERS_PATH and
re-running glxgears.

If I reboot the machine, but not halt/power off (tested through 3 cycles), then
the behaviour is repeatable (i.e running gears does not crash X, but no gears
are drawn).

If I halt/power off the machine, wait 20s, power back on, then the same
drm/xf86-video-nouveau/mesa combination crashes X.

When X crashes, I get nothing abnormal in syslog, I do get a FIFO dump in
Xorg.log (will attach both)

Does this mean that the nvidia driver (blob) is doing something to initialise
(?) the card that we are not? I think yes, it appears to persist across reboots
but not powering off.

I think darktama suggested something like this on IRC at some stage ...

Can I reproduce this behaviour - yes (all I have to do is reinstall
nvidia-glx-dev and cycle through the steps outlined in this comment), how do I
track down the configuration stuff that nvidia is doing that nouveau is not yet
doing to stop the crash?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
