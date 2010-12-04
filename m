From: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Display goes off when framebuffer enabled and Kernel
	Panic with fbset
Date: Fri, 3 Dec 2010 22:28:03 -0900
Message-ID: <20101204072803.GA4170@localhost2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

Kernel 2.6.35 (gentoo sources)

I get a LCD Display with initial console output, but when Nouveau starts and
framebuffer is initiated, the LCD display powers off.


I then get the following panic when using fbset -i/-a:
# cat /proc/kmsg
<1>BUG: unable to handle kernel NULL pointer dereference at (null)
<1>IP: [<c126e717>] fb_open+0x67/0x140
<4>*pde = 00000000
<0>Oops: 0000 [#1] PREEMPT SMP
<0>last sysfs file: /sys/devices/platform/microcode/firmware/microcode/loading
<4>Modules linked in: ipv6 nouveau hid_microsoft ttm usbhid drm_kms_helper drm i2c_algo_bit rtc_cmos rtc_core intel_agp rtc_lib video uhci_hcd output agpgart [last unloaded: microcode]
<4>
<4>Pid: 3949, comm: fbset Not tainted 2.6.35-gentoo-r12 #11 i440BX-FD/
<4>EIP: 0060:[<c126e717>] EFLAGS: 00010292 CPU: 0
<4>EIP is at fb_open+0x67/0x140
<4>EAX: 00000000 EBX: d68e8800 ECX: c126e6b0 EDX: d672bd80
<4>ESI: d68e8808 EDI: d7862640 EBP: 00000000 ESP: d6751e38
<4> DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
<0>Process fbset (pid: 3949, ti=d6750000 task=d66594a0 task.ti=d6750000)
<0>Stack:
<4> 0000001d d7862640 d6751e5c d672bd80 d70b1920 d672bd80 d7862640 00000000
<4><0> c10a420a 00000000 d7ba1700 d672bd80 d70b1920 d7516198 c109fa7f c10a9747
<4><0> 00000000 d7516198 d672bd80 00000000 00000000 c109fd11 c10a4130 d672bf00
<0>Call Trace:
<4> [<c10a420a>] ? chrdev_open+0xda/0x1b0
<4> [<c109fa7f>] ? __dentry_open+0xcf/0x270
<4> [<c10a9747>] ? generic_permission+0x17/0xa0
<4> [<c109fd11>] ? nameidata_to_filp+0x51/0x70
<4> [<c10a4130>] ? chrdev_open+0x0/0x1b0
<4> [<c10ab79f>] ? do_last+0x31f/0x5b0
<4> [<c10ad4b2>] ? do_filp_open+0x1d2/0x550
<4> [<c109f818>] ? do_sys_open+0x58/0x130
<4> [<c109f96c>] ? sys_open+0x2c/0x40
<4> [<c1002b90>] ? sysenter_do_call+0x12/0x26
<0>Code: 8d 74 26 00 8b 1c b5 a0 e3 67 c1 85 db 0f 84 99 00 00 00 8d 73 08 89 f0 89 54 24 0c e8 c3 9b 24 00 8b 83 c4 02 00 00 8b 54 24 0c <8b> 00 85 c0 74 4b 89 e1 81 e1 00 e0 ff ff 83 41 14 01 83 38 02
<0>EIP: [<c126e717>] fb_open+0x67/0x140 SS:ESP 0068:d6751e38
<0>CR2: 0000000000000000



Here's some grepped log output grepping for nouveau:
 # dmesg | grep nouveau
nouveau 0000:01:00.0: PCI INT A -> Link[LNKA] -> GSI 12 (level, low) -> IRQ 12
[drm] nouveau 0000:01:00.0: Detected an NV20 generation card (0x025300a3)
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:01:00.0: ... appears to be valid
[drm] nouveau 0000:01:00.0: BMP BIOS found
[drm] nouveau 0000:01:00.0: BMP version 5.21
[drm] nouveau 0000:01:00.0: Bios version 04.25.00.29
[drm] nouveau 0000:01:00.0: Found Display Configuration Block version 2.0
[drm] nouveau 0000:01:00.0: Raw DCB entry 0: 02010110 000088b8
[drm] nouveau 0000:01:00.0: Raw DCB entry 1: 02100202 00000000
[drm] nouveau 0000:01:00.0: Raw DCB entry 2: 01000200 000088b8
[drm] nouveau 0000:01:00.0: Raw DCB entry 3: 02100102 00000000
[drm] nouveau 0000:01:00.0: Raw DCB entry 4: 01120121 00000002
[drm] nouveau 0000:01:00.0: Raw DCB entry 5: 01120221 00000002
[drm] nouveau 0000:01:00.0: Merging DCB entries 1 and 3
[drm] nouveau 0000:01:00.0: Merging DCB entries 4 and 5
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xC608
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xCA09
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xC6FD
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xD029
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xC804
[drm] nouveau 0000:01:00.0: Detected 64MiB VRAM
nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
[drm] nouveau 0000:01:00.0: 4 MiB GART (aperture)
[drm] nouveau 0000:01:00.0: Saving VGA fonts
[drm] nouveau 0000:01:00.0: TV-1 has no encoders, removing
[drm] nouveau 0000:01:00.0: Allocating FIFO number 0
[drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 0
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 1)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 2)
[drm] nouveau 0000:01:00.0: allocated 1680x1050 fb: 0x48000, bo d7190600
[drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0


Initial posting, let me know if you need more info.

-- 
Roger
http://rogerx.freeshell.org/
