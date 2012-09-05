From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54512] xrandr does not detect HDMI screen
Date: Wed, 05 Sep 2012 06:43:38 +0000
Message-ID: <bug-54512-8800-WJGUS7EB9B@http.bugs.freedesktop.org/>
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

--- Comment #7 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-09-05 06:43:38 UTC ---
(In reply to comment #4)
> When I pull out my HDMI cable, dmesg outputs the following also:
> Sep  5 07:33:01 laptop-jl kernel: [  496.934150] [drm:drm_edid_block_valid]
> *ERROR* EDID checksum is invalid, remainder is 179
> Sep  5 07:33:01 laptop-jl kernel: [  496.934158] Raw EDID:
> Sep  5 07:33:01 laptop-jl kernel: [  496.934163]      00 ff ff ff ff ff ff 00
> 4c 2d 86 04 00 00 00 00
> Sep  5 07:33:01 laptop-jl kernel: [  496.934167]      06 13 01 03 80 10 09 78
> 0a ee 91 a3 54 4c 99 26
> Sep  5 07:33:01 laptop-jl kernel: [  496.934169]      0f 50 54 bf ef 80 71 4f
> 81 40 81 80 a9 40 00 00
> Sep  5 07:33:01 laptop-jl kernel: [  496.934172]      00 ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff
> Sep  5 07:33:01 laptop-jl kernel: [  496.934175]      ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff
> Sep  5 07:33:01 laptop-jl kernel: [  496.934178]      ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff
> Sep  5 07:33:01 laptop-jl kernel: [  496.934181]      ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff
> Sep  5 07:33:01 laptop-jl kernel: [  496.934183]      ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff
> Sep  5 07:33:01 laptop-jl kernel: [  496.935274] [drm] nouveau 0000:01:00.0:
> DDC responded, but no EDID for HDMI-A-1
> Sep  5 07:33:01 laptop-jl kernel: [  496.991554] [drm] nouveau 0000:01:00.0: no
> native mode, forcing panel scaling
This is expected if the unplug happens while the driver is in the middle of
fetching the EDID.

> 
> And plugin:
> Sep  5 07:33:21 laptop-jl kernel: [  517.132141] [drm] nouveau 0000:01:00.0: no
> native mode, forcing panel scaling
> 
> 
> Xorg.0.log:
> Remove cable:
> [   496.925] removing GPU device
> /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0 838326512
> [   496.925] xf86: remove device 0
> /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0
> [   496.925] (II) config/udev: Adding drm device (/dev/dri/card0)
> 
> 
> Insert cable:
> [   517.017] removing GPU device
> /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0 838070656
> [   517.017] xf86: remove device 0
> /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0
> [   517.017] (II) config/udev: Adding drm device (/dev/dri/card0)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
