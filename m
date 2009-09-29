From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23847] kernel BUG when using nouveau
Date: Tue, 29 Sep 2009 10:32:26 -0700 (PDT)
Message-ID: <20090929173226.C8D04130058@annarchy.freedesktop.org>
References: <bug-23847-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23847-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23847





--- Comment #18 from a.radke-KvP5wT2u2U0@public.gmane.org  2009-09-29 10:32:25 PST ---
I have a x86_64 system and enabled DEBUG_SPINLOCK but it didn't solve anything
for me.

I enabled the debug option for the drm module and when udev starts it shows 

Sep 29 16:59:20 workstation64 kernel: BUG: unable to handle kernel NULL pointer
dereference at 00000000000000cc
Sep 29 16:59:20 workstation64 kernel: IP: [<ffffffff811f726b>]
_raw_spin_lock+0x2b/0x190
Sep 29 16:59:20 workstation64 kernel: PGD 22e59f067 PUD 22e60a067 PMD 0 
Sep 29 16:59:20 workstation64 kernel: Oops: 0000 [#1] PREEMPT SMP 
Sep 29 16:59:20 workstation64 kernel: last sysfs file:
/sys/module/evdev/initstate
Sep 29 16:59:20 workstation64 kernel: CPU 3 
Sep 29 16:59:20 workstation64 kernel: Modules linked in: ttm(+) serio_raw
drm_kms_helper thermal sg mii pcspkr soundcore snd_page_alloc evdev ehci_hcd(+)
drm i2c_i801 button iTCO_wdt i2c_algo_bit iTCO_vendor_su
pport i2c_core processor usbcore intel_agp rtc_cmos rtc_core rtc_lib ext4
mbcache jbd2 crc16 sd_mod ahci libata scsi_mod
Sep 29 16:59:20 workstation64 kernel: Pid: 601, comm: modprobe Not tainted
2.6.31-ARCH #1 OEM
Sep 29 16:59:20 workstation64 kernel: RIP: 0010:[<ffffffff811f726b>] 
[<ffffffff811f726b>] _raw_spin_lock+0x2b/0x190

more in the log


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
