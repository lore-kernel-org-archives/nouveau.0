From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20130] GT200: nv50 chipset 0xa0 lockup
Date: Sun, 15 Feb 2009 20:23:54 -0800 (PST)
Message-ID: <20090216042354.F3F2C130057@annarchy.freedesktop.org>
References: <bug-20130-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20130-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20130





--- Comment #1 from Kamil Kaminski <kamilkss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-02-15 20:23:54 PST ---
dmesg:

[drm] Initialized drm 1.1.0 20060810
pci 0000:01:00.0: BAR 3: can't reserve mem region [0xf8000000-0xf9ffffff]
pci 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
pci 0000:01:00.0: setting latency timer to 64
[drm] Detected an NV50 generation card (0x0a0100a2)
[drm] Initialized nouveau 0.0.12 libdrm-2.4.4-31-g084e143d0c82f5bf6 on minor 0
[drm] Used old pci detect: framebuffer loaded
mtrr: base(0xc0000000) is not aligned on a size(0x38000000) boundary
[drm] Allocating FIFO number 1
[drm] nouveau_fifo_alloc: initialised FIFO 1
[drm] Allocating FIFO number 2
[drm] nouveau_fifo_alloc: initialised FIFO 2
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x0184 Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x0188 Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x018c Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x0190 Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x0194 Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x0198 Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x019c Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x01a0 Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x01a4 Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x01a8 Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x01ac Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x01c0 Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x01c4 Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x01c8 Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x01cc Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x01d0 Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x01d4 Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x01d8 Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x01dc Data 0x00000000:0x00000e00
[drm] PGRAPH_ERROR - nSource: DATA_ERROR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x1520 Data 0x00000000:0x00000000
[drm] PGRAPH_ERROR - nSource: PROTECTION_ERROR LIMIT_COLOR, nStatus:
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x8397 Mthd 0x1520 Data 0x00000000:0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR* magic set 1:
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00408900: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00408904: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00408908: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x0040890c: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00408910: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00408e08: 0x3f00f4e1
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00408e0c: 0x40002177
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00408e10: 0xbe7d1cda
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00408e14: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00408e18: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00408e1c: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00408e20: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00408e24: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR* magic set 2:
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00409900: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00409904: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00409908: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x0040990c: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00409910: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00409e08: 0xefebeffd
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00409e0c: 0x40004e50
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00409e10: 0xfb7f3adf
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00409e14: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00409e18: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00409e1c: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00409e20: 0x00000000
[drm:nv50_pgraph_irq_handler] *ERROR*   0x00409e24: 0x00000000


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
