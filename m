From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29685] New: DPMS does not turn off LCD backlight on
 NV18 [GeForce4 MX with AGP8X (Mac)]
Date: Thu, 19 Aug 2010 23:50:33 -0700 (PDT)
Message-ID: <bug-29685-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29685

           Summary: DPMS does not turn off LCD backlight on NV18 [GeForce4
                    MX with AGP8X (Mac)]
           Product: xorg
           Version: 7.5
          Platform: PowerPC
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: rechner-dLI15PoULosb1SvskN2V4Q@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I'm using bug #19356, which describes the same problem with a different iMac,
as an orientation for my bug description.

Expected:
$ xset dpms force standby;
should turn off LCD backlight.

Actual Result:
Screen is black, but LCD backlight stays on.

Workaround:
Use nv driver.

Some information on my system is already in bug #29455 (video bios dump,
register dump, "lspci -vvnn" output).

I downloaded, compiled, and ran radeontool, as was described in bug #19356:

nouveau driver:

DPMS on:
0x0060081c      0xa2565051 (-1571401647)
0x000010f0      0x84830535 (-2071788235)
DPMS off:
0x0060081c      0xa2565055 (-1571401643)
0x000010f0      0x84830535 (-2071788235)

nv driver:

DPMS on:
0x0060081c      0xa2565051 (-1571401647)
0x000010f0      0x84550535 (-2074802891)
DPMS off:
0x0060081c      0xa2565050 (-1571401648)
0x000010f0      0x04550535 (72680757)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
