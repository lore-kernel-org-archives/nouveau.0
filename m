From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30369] nvidia 8400GS G98 chip Nouveau GPU lockup -
 switching to software fbcon
Date: Sat, 25 Sep 2010 17:55:28 -0700 (PDT)
Message-ID: <20100926005528.6B22C130124@annarchy.freedesktop.org>
References: <bug-30369-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30369-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30369

--- Comment #4 from Dan Smith <mrplowdan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-09-25 17:55:27 PDT ---
running the latest daily fedora live cd desktop-x86_64-20100924.16.iso it
freezes hard lockup


t2
mount used greatest stack depth: 5680 bytes left
dracut: dracut-006-2.fc14
dracut: rd_NO_LUKS: removing cryptoluks activation
dracut: root was live:/dev/disk/by-uuid/0036-3339, liveroot is now
live:UUID=0036-3339
udev[74]: starting version 161
udevadm used greatest stack depth: 5648 bytes left
[drm] Initialized drm 1.1.0 20060810
do_IRQ: 0.68 No irq handler for vector (irq -1)
  alloc irq_desc for 24 on node -1
  alloc kstat_irqs on node -1
nouveau 0000:02:00.0: PCI INT A -> GSI 24 (level, low) -> IRQ 24
nouveau 0000:02:00.0: setting latency timer to 64
do_IRQ: 0.68 No irq handler for vector (irq -1)
do_IRQ: 0.68 No irq handler for vector (irq -1)
do_IRQ: 0.68 No irq handler for vector (irq -1)
do_IRQ: 0.68 No irq handler for vector (irq -1)
do_IRQ: 0.68 No irq handler for vector (irq -1)
do_IRQ: 0.68 No irq handler for vector (irq -1)
do_IRQ: 0.68 No irq handler for vector (irq -1)
do_IRQ: 0.68 No irq handler for vector (irq -1)
[drm] nouveau 0000:02:00.0: Detected an NV50 generation card (0x298200a2)
[drm] nouveau 0000:02:00.0: Attempting to load BIOS image from PRAMIN
_

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
