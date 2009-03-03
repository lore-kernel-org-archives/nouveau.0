From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18286] GeForce 8300 not supported
	(10de:0848/C77/MCP77)
Date: Tue,  3 Mar 2009 14:16:46 -0800 (PST)
Message-ID: <20090303221646.9970D130057@annarchy.freedesktop.org>
References: <bug-18286-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-18286-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18286





--- Comment #10 from Sebastian Brandt <sbrandt-Mmb7MZpHnFY@public.gmane.org>  2009-03-03 14:16:46 PST ---
Created an attachment (id=23487)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=23487)
dmesg - removed most of the Stack Trace

[drm] Initialized drm 1.1.0 20060810
ACPI: PCI Interrupt Link [AIGP] enabled at IRQ 20
nouveau 0000:02:00.0: PCI INT A -> Link[AIGP] -> GSI 20 (level, low) -> IRQ 20
nouveau 0000:02:00.0: setting latency timer to 64
[drm] Detected an NV50 generation card (0x0aa400a2)
[drm] Initialized nouveau 0.0.12 libdrm-2.4.5-22-ga6dd0afa87558a670 on minor 0
mtrr: base(0xd8000000) is not aligned on a size(0x10000000) boundary
[drm] Allocating FIFO number 1
[drm] nouveau_fifo_alloc: initialised FIFO 1
[drm] Unhandled PFIFO_INTR - 0x00000010
[drm] Allocating FIFO number 2
[drm] nouveau_fifo_alloc: initialised FIFO 2
## now, X seems to be hanging ...
SysRq : Show State
[...]
X             R  running task        0  4023   3994
 ffff8800c5d9ff70 ffffffff8049b0a9 0000000000000296 ffff8800c5d9ff00
 ffffffff80a27000 ffffffff80a31600 ffffffff80a2e3f0 ffffffff80a31600
 ffffffff80a27000 ffffffff80a31600 ffffffff80a31600 ffffffff80a31600
Call Trace:
 [<ffffffff8020c5a7>] retint_careful+0xd/0x21
 [<00007f0ab955b478>] 0x7f0ab955b478
[...]
## killall -9 X
[drm] nouveau_fifo_free: freeing fifo 2
[drm:nouveau_fifo_free] *ERROR* Failed to idle channel 2 before destroy.Prepare
for strangeness..
[drm] nouveau_fifo_free: freeing fifo 1


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
