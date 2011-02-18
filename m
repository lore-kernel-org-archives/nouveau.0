From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34430] New: nouveau driver does not return VGA
 connector status breaking upower
Date: Fri, 18 Feb 2011 01:25:45 -0800 (PST)
Message-ID: <bug-34430-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34430

           Summary: nouveau driver does not return VGA connector status
                    breaking upower
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: nuada-hjuaS3B0pPfVItvQsEIGlw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


My laptop (Asus UL80VT) has hybrid graphics: intel+nvidia. After switching
nvidia card off using vgaswitcheroo, upower CPU consumption goes to 100%. If
nvidia card is switched back on, problem dissapeares.

This is caused by nouveau driver not returning VGA connector status properly.
When upowerd tries to read status of all connectors, it hangs waiting for VGA.

Gentoo Linux
kernel: 2.6.38-rc*
xorg-server: 1.9.4
upower: 0.9.8
KDE: 4.6.0

Steps to reproduce:
1. Log in to KDE
2. switch off nvidia:
    echo OFF > /sys/kernel/debug/vgaswitcheroo/switch
3. cannot read VGA connector status:
    cat
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card1/card1-VGA-1/status

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
