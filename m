From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14491] New: enabling randr-1. 2 support causes LVDS
 unknown config bits error when starting the X server
Date: Wed, 13 Feb 2008 17:04:15 -0800 (PST)
Message-ID: <bug-14491-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14491

           Summary: enabling randr-1.2 support causes LVDS unknown config
                    bits error when starting the X server
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: travisimo1993-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
            Blocks: 14405


Created an attachment (id=14298)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=14298)
Xorg.0.log

I am running Nouveau on a Dell Latitude C840 with an NVIDIA GeForce 4 440 Go
which has 64MB of VRAM and AGP 4x. I am the unlucky owner of a C840 with a
Samsung LCD that needs a hacked EDID to work properly with the nvidia driver
(attached). My Linux kernel version is 2.6.24.1 and I am running Debian Testing
(Lenny).

Nouveau was compiled on 02/13/08 (today), and I removed the nvidia driver
before installing it.

I get this after enabling randr-1.2 support in the output of startx when it
starts the X server:

Raw DCB entry 0: 03000223 00000004
(EE) NOUVEAU(0): Unknown LVDS configuration bits, please report

The X server fails to start because there are no valid video modes to pick
from, so all the screens have a invalid configuration. Attached is a detailed
Xorg log file that details the register dumps.

lspci | grep -i vga:

01:00.0 VGA compatible controller: nVidia Corporation NV17 [GeForce4 440 Go]
(rev a3)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
