From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37922] NV86: too high power usage.
Date: Fri, 29 Jul 2011 07:07:35 -0700 (PDT)
Message-ID: <20110729140735.5B4AD1301D7@annarchy.freedesktop.org>
References: <bug-37922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-37922-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37922

--- Comment #9 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-07-29 07:07:35 PDT ---
So thats it, I reduced and more or less understood the involved register
writes, the end result is about 0.150W higher wattage that blob and this trace:


# enable everything in PMC.ENABLE - VPE bit decreases power usage dramaticly
[0] 1226.455757 MMIO32 W 0x000200 0xffffffff PMC.ENABLE <= everything

# some power magic
[0] 1226.458120 MMIO32 W 0x001098 0x21ca003c PBUS+0x98 <= 0x21ca003c
[0] 1226.458192 MMIO32 W 0x001604 0x00020804 PBUS+0x604 <= 0x20804
[0] 1226.458299 MMIO32 W 0x001588 0x00000001 PBUS+0x588 <= 0x1

#disable VC2 xtensa clock
[0] 1226.471062 MMIO32 W 0x00c040 0x2ee01233 0xc040 <= 0x2ee01233

# disable secondary DAC 
[0] 1226.425262 MMIO32 W 0x61a010 0x80000002 PDISPLAY.DAC_REGS[0].CLK_CTRL1 <=
{ CONNECTED = 0 | 0x80000002 }
[0] 1226.425394 MMIO32 W 0x61a004 0xd0150000 PDISPLAY.DAC_REGS[0].DPMS_CTRL <=
{ PENDING | 0x50150000 }
[0] 1226.425610 MMIO32 W 0x61a810 0x00000003 PDISPLAY.DAC_REGS[0x1].CLK_CTRL1
<= { CONNECTED = 0 | 0x3 }
[0] 1226.425717 MMIO32 W 0x61a804 0xd0150000 PDISPLAY.DAC_REGS[0x1].DPMS_CTRL
<= { PENDING | 0x50150000 }

#PFB magic - some dram optimization ???
[0] 1226.423318 MMIO32 W 0x100000 0x0000c042 PFB+0 <= 0xc042
[0] 1226.423388 MMIO32 W 0x100004 0x0000c042 PFB+0x4 <= 0xc042
[0] 1226.423457 MMIO32 W 0x100008 0x0000c042 PFB+0x8 <= 0xc042
[0] 1226.423527 MMIO32 W 0x100b78 0x0000c042 PFB+0xb78 <= 0xc042
[0] 1226.423596 MMIO32 W 0x100c0c 0x0000c042 PFB+0xc0c <= 0xc042
[0] 1226.423735 MMIO32 W 0x100d04 0x0000c042 PFB+0xd04 <= 0xc042
[0] 1226.423804 MMIO32 W 0x100e0c 0x0000c042 PFB+0xe0c <= 0xc042

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
