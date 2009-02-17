From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20142] black horizontal line on 9600M GT, KMS issue
Date: Tue, 17 Feb 2009 00:38:00 -0800 (PST)
Message-ID: <20090217083800.384BB130058@annarchy.freedesktop.org>
References: <bug-20142-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20142-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20142





--- Comment #3 from Kamil Kaminski <kamilkss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-02-17 00:37:58 PST ---
My 9600GT with modeset=1 turns my monitor off, no lockups or anything but I
can't see anything. Here's a dmesg when issuing modeset=1 from console (vc/1):

[drm] Initialized drm 1.1.0 20060810
pci 0000:05:00.0: BAR 3: can't reserve mem region [0xf8000000-0xf9ffffff]
pci 0000:05:00.0: setting latency timer to 64
[drm] Detected an NV50 generation card (0x094100a1)
[drm] Allocating FIFO number 1
[drm] nouveau_fifo_alloc: initialised FIFO 1
[drm] Unhandled PFIFO_INTR - 0x00000010
[drm] BIT BIOS found
[drm] Display Configuration Block version 4.0 found
[drm] DCB header length 27, with 15 possible entries
[drm] Raw DCB entry 0: 02000300 00000028
[drm] Raw DCB entry 1: 01000302 00020030
[drm] Raw DCB entry 2: 02011312 00020010
[drm] Raw DCB entry 3: 010223f1 00c0c080
[drm] Found 4 entries in DCB
[drm] Detected a DAC output
[drm] Detected a TMDS output
[drm] Detected a TMDS output
[drm] Detected a DVI-I connector
[drm] Creating i2c bus with index 0
[drm] Detected a DVI-D connector
[drm] Creating i2c bus with index 1
[drm:nv50_display_command] *ERROR* You probably need a reboot now
[drm:edid_is_valid] *ERROR* Raw EDID:
<3>82 ff ff ff ff 08 ff 00 4d d9 80 0a 01 01 01 01  ........M.......
<3>04 0d 01 03 0e 24 1d 78 ea 0a 25 a2 57 4b 99 24  .....$.x..%.WK.$
<3>18 48 4c a1 08 00 81 80 81 40 01 01 01 01 01 01  .HL......@......
<3>01 01 01 01 01 01 30 2a 00 98 51 00 2a 40 30 70  ......0*..Q.*@0p
<3>13 00 65 1e 11 00 00 1e 00 00 00 fd 00 30 41 1c  ..e..........0A.
<3>41 0b 00 0a 20 20 20 20 20 20 00 00 00 fc 00 53  A...      .....S
<3>44 4d 2d 53 38 31 52 0a 20 20 20 20 00 00 00 ff  DM-S81R.    ....
<3>00 39 30 30 37 32 32 36 0a 20 20 20 20 20 00 cf  .9007226.     ..

pci 0000:05:00.0: DVI-I-1: EDID invalid.
[drm:nv50_fbcon_initial_config] *ERROR* Can't determine framebuffer size!
[drm:nv50_fbcon_init] *ERROR* nv50_fbcon_initial_config failed
DRM: drm_get_dev failed.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
