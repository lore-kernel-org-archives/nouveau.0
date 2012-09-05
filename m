From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54512] xrandr does not detect HDMI screen
Date: Wed, 05 Sep 2012 06:44:46 +0000
Message-ID: <bug-54512-8800-6zAJ1RilFe@http.bugs.freedesktop.org/>
References: <bug-54512-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54512-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=54512

Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |NOTABUG

--- Comment #8 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-09-05 06:44:46 UTC ---
(In reply to comment #5)
> Now I booted my system without HDMI cable in. When I insert the cable after
> bootup:
> 
> dmesg:
> Sep  5 07:43:53 laptop-jl kernel: [   69.233511] [drm] nouveau 0000:01:00.0: no
> native mode, forcing panel scaling\
This is probably a bug in nouveau I'd say, but it deserves a new report.

I'm closing this bug due to it not actually being a bug :)

> 
> Xorg.0.log:
> [    68.990] removing GPU device
> /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card1 1889035200
> [    68.990] xf86: remove device 0
> /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card1
> [    68.990] (II) config/udev: Adding drm device (/dev/dri/card1)
> 
> 
> xrandr still:
> HDMI1 disconnected (normal left inverted right x axis y axis)
> 
> (notice its HDMI1 again)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
