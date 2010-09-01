From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nv50: initialize ramht_refs list for
 faked 0 channel
Date: Wed, 01 Sep 2010 12:53:25 +0300
Message-ID: <1283334805.2741.2.camel@maxim-laptop>
References: <20100822185408.GA2883@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100822185408.GA2883-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jason Wessel <jason.wessel-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi,

I just tried that patch, but unfortunately nether with nor without it
kdb seems not to work.
It could be id10t error from my side, but I did test the kdb in the past
with few KMS patches, and it seemed to work.

Now I can't even get its prompt on the console.

This is what I do:

echo kbd | sudo tee /sys/module/kgdboc/parameters/kgdboc
(also tried booting with kgdboc=kbd)

Both seems to start kdb, because

maxim@maxim-laptop:~$ cat /sys/module/kgdboc/parameters/kgdboc 
kbd

maxim@maxim-laptop:~$ dmesg | grep kgdb
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-2.6.36-rc3+ root=UUID=52341b68-74f3-4c96-aaf8-7586a06c4b4e ro splash video=nouveau nmi_watchdog=lapic kgdboc=kbd
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-2.6.36-rc3+ root=UUID=52341b68-74f3-4c96-aaf8-7586a06c4b4e ro splash video=nouveau nmi_watchdog=lapic kgdboc=kbd
[    2.671914] kgdb: Registered I/O driver kgdboc.


Now when I first switch to console and then press Alt+SysRQ+G, I just get SYSRQ: DEBUG, and system hangs.
It could be printk level, but that should be ok, no?

maxim@maxim-laptop:~$ cat /proc/sys/kernel/printk
7	4	1	7


Also if I remember correct inputting 'g' then ENTER should resume the system, but it doesn't.

So I think kdb doesn't work at all here

Best regards,
	Maxim Levitsky
