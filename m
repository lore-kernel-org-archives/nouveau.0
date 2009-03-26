From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20878] New: Xorg server does not properly autodetect
 dual nVidia graphics cards
Date: Thu, 26 Mar 2009 05:42:53 -0700 (PDT)
Message-ID: <bug-20878-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20878

           Summary: Xorg server does not properly autodetect dual nVidia
                    graphics cards
           Product: xorg
           Version: 7.4
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Server/general
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: sgallagh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=24273)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=24273)
X.org log demonstrating the error

When starting the X server, it detects that there are "More than one possible
primary device found"

(!!) More than one possible primary device found
(--) PCI: (0@3:0:0) nVidia Corporation G94 [GeForce 9600 GT] rev 161, Mem @
0xf4000000/16777216, 0xc0000000/268435456, 0xf2000000/33554432, I/O @
0x0000ac00/128, BIOS @ 0x????????/524288
(--) PCI: (0@5:0:0) nVidia Corporation G94 [GeForce 9600 GT] rev 161, Mem @
0xf8000000/16777216, 0xd0000000/268435456, 0xf6000000/33554432, I/O @
0x00008c00/128, BIOS @ 0x????????/524288


The X server will then attempt to invoke the VESA driver instead of the Nouveau
driver (this is on the Fedora 11 Nouveau Test Day LiveCD)

Ultimately it will fail with:
Fatal server error:
AddScreen/ScreenInit failed for driver 0


However, if I manually add the following to an xorg.conf file, it loads
correctly.
Section "Device"
        Identifier  "Videocard0"
        BusID       "PCI:3:0:0"
        Driver      "nouveau"
EndSection

Section "Device"
        Identifier      "Videocard1"
        BusID           "PCI:5:0:0"
        Driver          "nouveau"
EndSection


The correct behavior of the X server should be to automatically generate these
entries for each card.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
