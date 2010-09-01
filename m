From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29934] New: X locks up when hotplugging second
	monitor
Date: Wed,  1 Sep 2010 05:13:13 -0700 (PDT)
Message-ID: <bug-29934-8800@http.bugs.freedesktop.org/>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=29934

           Summary: X locks up when hotplugging second monitor
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


(Version is 1:0.0.16+git20100518+4b8f1a0-1)

When I hotplug or hotunplug my external monitor (DVI on displayport), X
frequently, but not always, locks up with a completely corrupted screen.


(--) NOUVEAU(0): Chipset: "NVIDIA NVac"
(==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(==) NOUVEAU(0): Using HW cursor
(II) NOUVEAU(0): Output LVDS-1 using monitor section Configured Monitor
(II) NOUVEAU(0): Output DP-1 has no monitor section
(II) NOUVEAU(0): EDID for output LVDS-1
(II) NOUVEAU(0): Manufacturer: APP  Model: 9c8c  Serial#: 16843009
(II) NOUVEAU(0): Year: 2008  Week: 5
(II) NOUVEAU(0): EDID Version: 1.3

(II) NOUVEAU(0): EDID for output DP-1
(II) NOUVEAU(0): Manufacturer: SAM  Model: 194  Serial#: 1112092985
(II) NOUVEAU(0): Year: 2005  Week: 52
(II) NOUVEAU(0): EDID Version: 1.3
(II) NOUVEAU(0): Digital Display Input
(II) NOUVEAU(0): Max Image Size [cm]: horiz.: 38  vert.: 30
(II) NOUVEAU(0): Gamma: 2.20
(II) NOUVEAU(0): DPMS capabilities: Off

I'm wary to reproduce, but if you tell me what information is needed I will do
so.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
