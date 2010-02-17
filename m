From: Daniel Mack <daniel-rDUAYElUppE@public.gmane.org>
Subject: nouveau: [drm] failed to open device
Date: Wed, 17 Feb 2010 17:12:00 +0100
Message-ID: <20100217161200.GI9007@buzzloop.caiaq.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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
Cc: xorg-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

I'm trying to get the new nouveau kernel driver (2.6.33-rc8) to work
with X.Org 1.7.4 (Debian/unstable, all relevant packages updated). The
modules load just fine, and the kernel spits out the following upon
probe:

[    8.304602] nouveau 0000:06:00.0: PCI INT A -> Link[LNEB] -> GSI 18 (level, low) -> IRQ 18
[    8.304779] nouveau 0000:06:00.0: setting latency timer to 64
[    8.313364] [drm] nouveau 0000:06:00.0: Detected an NV40 generation card (0x044300a2)
[    8.313812] [drm] nouveau 0000:06:00.0: Attempting to load BIOS image from PROM
[    8.521142] [drm] nouveau 0000:06:00.0: ... appears to be valid
[    8.521148] [drm] nouveau 0000:06:00.0: BIT BIOS found
[    8.521151] [drm] nouveau 0000:06:00.0: Bios version 05.44.02.62
[    8.521156] [drm] nouveau 0000:06:00.0: BIT table 'd' not found
[    8.521159] [drm] nouveau 0000:06:00.0: Found Display Configuration Block version 3.0
...


However, when starting X.Org (installed from the Debian package), I get
this:


X.Org X Server 1.7.4
Release Date: 2010-01-08
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.32-trunk-686 i686 Debian
Current Operating System: Linux jup 2.6.33-rc8 #20 SMP PREEMPT Wed Feb 17 11:26:28 CET 2010 i686
Kernel command line: BOOT_IMAGE=/vmlinuz-2.6.git root=/dev/sda3 ro quiet
Build Date: 20 January 2010  10:52:55PM
xorg-server 2:1.7.4-2 (bgoglin-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org) 
Current version of pixman: 0.16.4
	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Wed Feb 17 17:00:25 2010
(==) Using config file: "/etc/X11/xorg.conf"
(EE) [drm] failed to open device
(EE) No devices detected.


From the strace output (http://pastebin.com/m12d5b19a) I cannot see what
the problem could possibly be, and searching the FAQs and archives
didn't help me either. I can't see any errors or warning anywhere
except for the one above.

The full X log is here: http://pastebin.com/m731c3561
And my xorg.conf is here: http://pastebin.com/m5f143408

Any pointers appreciated - I got the evil feeling to overlook the
obvious ;)

Daniel
