From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20168] nVIDIA 9600GT KMS Blank Screen
Date: Tue, 17 Feb 2009 12:56:17 -0800 (PST)
Message-ID: <20090217205617.64054130058@annarchy.freedesktop.org>
References: <bug-20168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20168





--- Comment #2 from Kamil Kaminski <kamilkss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-02-17 12:56:16 PST ---
Maarten, I think those modules got loaded because I passed vga=795 option to
the kernel. I'm using vanilla kernel and nvidia blob wasn't installed. Well I
removed vga=795, modprobe -r nvidiafb, and I still get the blank screen. When
ssh'ing to the machine dmesg seems to get overflowed with:

[drm:nv50_dac_detect] Using bios provided load_pattern of 520
[drm:nv50_dac_detect] Load was detected on output with or 1
[drm:nv50_connector_hpd_detect] Hotplug detect returned negative for bus 1
[drm:nouveau_nv50_i2c_irq_handler] NV50_PCONNECTOR_HOTPLUG_CTRL - 0x00100010
[drm:nv50_connector_hpd_detect] Hotplug detect returned positive for bus 0
[drm:nv50_dac_detect] Using bios provided load_pattern of 520
[drm:nv50_dac_detect] Load was detected on output with or 1
[drm:nv50_connector_hpd_detect] Hotplug detect returned negative for bus 1
[drm:nouveau_nv50_i2c_irq_handler] NV50_PCONNECTOR_HOTPLUG_CTRL - 0x00100010
[drm:nv50_connector_hpd_detect] Hotplug detect returned positive for bus 0
[drm:nv50_dac_detect] Using bios provided load_pattern of 520
[drm:nv50_dac_detect] Load was detected on output with or 1
[drm:nv50_connector_hpd_detect] Hotplug detect returned negative for bus 1
[drm:nouveau_nv50_i2c_irq_handler] NV50_PCONNECTOR_HOTPLUG_CTRL - 0x00100010
[drm:nv50_connector_hpd_detect] Hotplug detect returned positive for bus 0
....
....
....


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
