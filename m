From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51798] New: Cannot enable second video card on
 nvidia quadro NVS420
Date: Fri, 06 Jul 2012 19:32:34 +0000
Message-ID: <bug-51798-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51798

             Bug #: 51798
           Summary: Cannot enable second video card on nvidia quadro
                    NVS420
    Classification: Unclassified
           Product: xorg
           Version: 7.7 (2011)
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: ilyin-qar0IOKqGHQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 63903
  --> https://bugs.freedesktop.org/attachment.cgi?id=63903
lspci

With nouveau module I can only see two monitors working which are connected to
the first video card out of two cards of NVS420, connected via PCI bridge
pci 03:00 and 04:00:

-[0000:00]-+-00.0  Intel Corporation 4 Series Chipset DRAM Controller
           +-01.0-[01-04]----00.0-[02-04]--+-00.0-[03]----00.0 G98 Quadro
NVS420
           |                               \-02.0-[04]----00.0 G98 Quadro
NVS420

Full list of PCIs are in the attachment.

DRI status is given here and shows that the second video card (card1) is not
set to any PCI bus: 

dristat -a

/dev/dri/card0
  Busid: pci:0000:03:00.0
  Version information:
    Name: nouveau
    Version: 1.0.0
    Date: 20120316
    Desc: nVidia Riva/TNT/GeForce
  VM map information:
  flags: (R)estricted (r)ead/(w)rite (l)ocked (k)ernel (W)rite-combine (L)ock:
    slot     offset       size type flags    address mtrr
       0 0x11839000 0x00002000 SHM  w   L 0x1b7ff000 none
  DRI client information:
    a   pid   uid      magic     ioctls   prog
    y  1482     0          0          7   dristat
    y   761     0          0       3824   /usr/bin/Xorg
  System statistics:
    Lock                 0x00000000
    Opens                         2
    Closes                        1
    Ioctls                     3834
    Locks                         0
    Unlocks                       0

/dev/dri/card1
  Busid: (not set)
  Version information:
    Name: nouveau
    Version: 1.0.0
    Date: 20120316
    Desc: nVidia Riva/TNT/GeForce
  VM map information:
  flags: (R)estricted (r)ead/(w)rite (l)ocked (k)ernel (W)rite-combine (L)ock:
    slot     offset       size type flags    address mtrr
  DRI client information:
    a   pid   uid      magic     ioctls   prog
    y  1482     0          0          6   dristat
  System statistics:
    Lock                 0x00000000
    Opens                         0
    Closes                        0
    Ioctls                        8
    Locks                         0
    Unlocks                       0




Though all the DisplayPorts are connected:

ls /sys/class/drm/*/status | xargs -I {} -i bash -c "echo -n {}: ; cat {}"

/sys/class/drm/card0-DP-1/status:connected
/sys/class/drm/card0-DP-2/status:connected
/sys/class/drm/card1-DP-3/status:connected
/sys/class/drm/card1-DP-4/status:connected

BUT

ls /sys/bus/pci/devices/*/drm/*/card*/enabled | xargs -I {} -i bash -c "echo -n
{}: ; cat {}"

/sys/bus/pci/devices/0000:03:00.0/drm/card0/card0-DP-1/enabled:enabled
/sys/bus/pci/devices/0000:03:00.0/drm/card0/card0-DP-2/enabled:enabled

/sys/bus/pci/devices/0000:04:00.0/drm/card1/card1-DP-3/enabled:disabled
/sys/bus/pci/devices/0000:04:00.0/drm/card1/card1-DP-4/enabled:disabled

i.e. the last two ports of card1 are disabled.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
