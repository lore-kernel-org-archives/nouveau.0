From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37922] New: NV86: too high power usage.
Date: Sat,  4 Jun 2011 06:38:05 -0700 (PDT)
Message-ID: <bug-37922-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37922

           Summary: NV86: too high power usage.
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I want to track all the progress I made on reverse-engineering power-management
on my NV86 card.

First, the statistics that should give us the idea about what to expect.
(All measurements done using acpi counters, in more or less controlled
environment. 0% brightness, using vga console and X server running on other VT.
VGA console were running powertop).
The measurement is what appeared to be minimum value.
Wireless was on, and no special knobs to decrease power usage were applied
(like unloading the ethernet driver).

following suggestion of Emil Velikov I changed the vbios slightly so it shows 0
available power levels, thus nvidia driver wasn't able to reclock the card.
(unless I say otherwice)

no drivers loaded..........:  22.6W
nouveau....................:  22.6W
nouveau, pm level 0........:  20.9W

nvidia (no reclock)........:  19.4W
no driver + mmiotrace
replay of above............:  19.4W

nvidia + reclocking........:  15.8W


I was able to reduce the mmiotrace to very small list
and with it I can bring power level to 19.4 (or even less sometimes)
I will attach it here.
Note that trace consists of 6 parts. If I concat them, power usage seems to
increase. Removal of many commands of above traces also increases power usage a
bit, so the conclusion is that traces contain many many commands that each
turns down that or other part of the card.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
