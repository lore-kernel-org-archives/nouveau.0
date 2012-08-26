From: Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org>
Subject: 3.6-rc3 DP I2C timeout after switcherood...
Date: Sun, 26 Aug 2012 22:18:33 +0800
Message-ID: <CAMVG2svB4AFuGN1vDO+7PXdJSkG5VZ4Hig6N7w9Lw6E5Y06s=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On my MacbookPro Retina, when disabling the discrete Nvidia GPU via
the switcheroo [1], the disablement is correctly executed [2], I
restart X etc.

After some time, upowerd reads from the noveau's sysfs files, causing
(expected) displayport I2C timeouts, as the hardware is in D3 [3] (I
added a call to dump_stack to see the context).

Does it make sense we deregister the sysfs files when the hardware is
placed in D3 or return EIO or such?

Hardware info at [4].

Thanks,
   Daniel

--- [1]

echo IGD >/sys/kernel/debug/vgaswitcheroo/switch
echo OFF >/sys/kernel/debug/vgaswitcheroo/switch

--- [2]

hda-intel: Disabling 0000:01:00.1 via VGA-switcheroo
VGA switcheroo: switched nouveau off
[drm] nouveau 0000:01:00.0: Disabling display...
[drm] nouveau 0000:01:00.0: Disabling fbcon...
[drm] nouveau 0000:01:00.0: Unpinning framebuffer(s)...
[drm] nouveau 0000:01:00.0: Evicting buffers...
[drm] nouveau 0000:01:00.0: Idling channels...
[drm] nouveau 0000:01:00.0: Suspending GPU objects...
[drm] nouveau 0000:01:00.0: And we're gone!

--- [3]

[drm] nouveau 0000:01:00.0: AUXCH(3): begin idle timeout 0xffffffff
Pid: 2051, comm: upowerd Not tainted 3.6.0-rc3-expert+ #8
Call Trace:
 [<ffffffffa00599c2>] auxch_tx+0x3b2/0x610 [nouveau]
 [<ffffffffa005a9b5>] nouveau_dp_auxch+0x25/0x30 [nouveau]
 [<ffffffffa005aa58>] nouveau_dp_i2c_xfer+0x98/0xd0 [nouveau]
 [<ffffffff81363fbc>] __i2c_transfer+0x5c/0x80
 [<ffffffff8136530a>] i2c_transfer+0x5a/0xa0
 [<ffffffffa0055336>] nouveau_probe_i2c_addr+0x46/0x50 [nouveau]
 [<ffffffffa005769d>] nouveau_connector_detect+0xdd/0x2c0 [nouveau]
 [<ffffffff812b9dd1>] status_show+0x41/0x90
 [<ffffffff812cfcfb>] dev_attr_show+0x1b/0x60
 [<ffffffff810b1259>] ? __get_free_pages+0x9/0x40
 [<ffffffff811548e4>] sysfs_read_file+0xa4/0x190
 [<ffffffff810f5760>] vfs_read+0xa0/0x180
 [<ffffffff810f5885>] sys_read+0x45/0xa0
 [<ffffffff814df4a2>] system_call_fastpath+0x16/0x1b

--- [4]

nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[drm] nouveau 0000:01:00.0: Detected an NVe0 generation card (0x0e7150a2)
[drm] nouveau 0000:01:00.0: acceleration disabled by default, pass
noaccel=0 to force enable
[drm] nouveau 0000:01:00.0: Checking PRAMIN for VBIOS
[drm] nouveau 0000:01:00.0: ... appears to be valid
[drm] nouveau 0000:01:00.0: Using VBIOS from PRAMIN
[drm] nouveau 0000:01:00.0: BIT BIOS found
[drm] nouveau 0000:01:00.0: Bios version 80.07.26.04
[drm] nouveau 0000:01:00.0: TMDS table version 2.0
[drm] nouveau 0000:01:00.0: MXM: no VBIOS data, nothing to do
[drm] nouveau 0000:01:00.0: DCB version 4.0
[drm] nouveau 0000:01:00.0: DCB outp 00: 048101b6 0f230010
[drm] nouveau 0000:01:00.0: DCB outp 01: 018212d6 0f220020
[drm] nouveau 0000:01:00.0: DCB outp 02: 01021212 00020020
[drm] nouveau 0000:01:00.0: DCB outp 03: 088324c6 0f220010
[drm] nouveau 0000:01:00.0: DCB outp 04: 08032402 00020010
[drm] nouveau 0000:01:00.0: DCB outp 05: 02843862 00020010
[drm] nouveau 0000:01:00.0: DCB conn 00: 00020047
[drm] nouveau 0000:01:00.0: DCB conn 01: 02208146
[drm] nouveau 0000:01:00.0: DCB conn 02: 01104246
[drm] nouveau 0000:01:00.0: DCB conn 03: 00410361
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0x86B5
[drm] nouveau 0000:01:00.0: 0x853A: Condition still not met after
20ms, skipping following opcodes
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0x8EFC
[drm] nouveau 0000:01:00.0: 0x8F0A: Condition still not met after
20ms, skipping following opcodes
[drm] nouveau 0000:01:00.0: 0x8F9B: Condition still not met after
20ms, skipping following opcodes
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0x66E1
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xAAA0
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xAAA1
[drm] nouveau 0000:01:00.0: 0x85E7: Condition still not met after
20ms, skipping following opcodes
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 5 at offset 0xAB59
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset 0xABBE
[drm] nouveau 0000:01:00.0: Detected 1024MiB VRAM (GDDR5)
[drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
nouveau 0000:01:00.0: irq 54 for MSI/MSI-X
[drm] nouveau 0000:01:00.0: enabled MSI
[drm] nouveau 0000:01:00.0: ACPI backlight interface available, not
registering our own
[drm] nouveau 0000:01:00.0: voltage table 0x50 unknown
[drm] nouveau 0000:01:00.0: 4 available performance level(s)
[drm] nouveau 0000:01:00.0: 1: core 209MHz shader 419MHz memory 405MHz
voltage 520mV
[drm] nouveau 0000:01:00.0: 2: core 390MHz shader 780MHz memory
1080MHz voltage 610mV
[drm] nouveau 0000:01:00.0: 3: core 1000MHz shader 2000MHz memory
1080MHz voltage 630mV
[drm] nouveau 0000:01:00.0: 4: core 1254MHz shader 2508MHz memory
1080MHz voltage 630mV
[drm] nouveau 0000:01:00.0: c:
[drm] nouveau 0000:01:00.0: allocated 1024x768 fb: 0xe0000, bo ffff88026308c000
fb1: nouveaufb frame buffer device
[drm] Initialized nouveau 1.0.0 20120316 for 0000:01:00.0 on minor 1
-- 
Daniel J Blueman
