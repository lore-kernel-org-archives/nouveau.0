From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] NVA3 / NVA5 / NVA8 / NVAF (GT2xx/GT3xx) with
 nouveau: random GPU lockups
Date: Sat, 12 Feb 2011 15:31:47 -0800 (PST)
Message-ID: <20110212233147.C778B13004D@annarchy.freedesktop.org>
References: <bug-26980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=26980

--- Comment #44 from Reartes Guillermo <rtguille-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-02-12 15:31:46 PST ---
I have a GT220 and sometimes freezes randomly:

[  3675.146] 
Backtrace:
[  3675.153] 0: /usr/bin/X (xorg_backtrace+0x28) [0x460d18]
[  3675.153] 1: /usr/bin/X (0x400000+0x63509) [0x463509]
[  3675.153] 2: /lib64/libc.so.6 (0x34eca00000+0x32a20) [0x34eca32a20]
[  3675.153] 3: /usr/lib64/xorg/modules/extensions/libdri2.so
(DRI2CloseScreen+0x24) [0x7fb95ba39a14]
[  3675.153] 4: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(0x7fb95b809000+0xd6ab) [0x7fb95b8166ab]
[  3675.154] 5: /usr/bin/X (0x400000+0xa3b49) [0x4a3b49]
[  3675.154] 6: /usr/bin/X (0x400000+0x15daec) [0x55daec]
[  3675.154] 7: /usr/bin/X (0x400000+0x2193c) [0x42193c]
[  3675.154] 8: /lib64/libc.so.6 (__libc_start_main+0xfd) [0x34eca1ec5d]
[  3675.154] 9: /usr/bin/X (0x400000+0x21449) [0x421449]
[  3675.154] Segmentation fault at address 0x10
[  3675.154] 
Fatal server error:
[  3675.154] Caught signal 11 (Segmentation fault). Server aborting
[  3675.154] 
[  3675.154] 
Please consult the Fedora Project support 
         at http://bodhi.fedoraproject.org/
 for help. 
[  3675.154] Please also check the log file at "/var/log/Xorg.0.log" for
additional information.
[  3675.154] 
[  3675.157] (II) NOUVEAU(0): NVLeaveVT is called.

That error is a bit old.
Ok, i read about the random lockus some time ago.

The interesting thing is that at some point i started to use (i still do) use
the nVIDIA (P)drivers, and to my surprise, it also has random gpu lockus
(granted, it is another piece of software)
But when i put my new ati HD5670 and found to also random freeze...

I run F13.
I never had issues with Slackware 13.1 and nvidia(P).
The OtherOS never freezed. with any card.

For F13 i must use pcie_aspm=off, because of issues with the sata controller.
But pcie_aspm=off also seems to set the pcie bus into gen1, (it halves the
link speed and the de-emphasys, and also changes. I do not know if it is normal
to pcie_aspm=off to do that and other thins that do. 

For example the nvidia(p) report that the card is at gen1 speed. (the mb is
Gen2 and the card is also Gen2) M4N72-E

Is expected for the nouvau driver to work with any pcie configuration,
different link/speed aspm/no_aspm/ ? 

I know that it may not be related, but i do not know if subtle different pcie
configurations (or pcie driver bugs) may lead to the vga to behave in that way.

Thanks in advance.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
