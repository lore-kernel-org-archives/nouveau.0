From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15131] New: After a short period there is a lockup
	(fifo)
Date: Wed, 19 Mar 2008 10:11:27 -0700 (PDT)
Message-ID: <bug-15131-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15131

           Summary: After a short period there is a lockup (fifo)
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: debian-c6jxCJM9TyuJnvDnx1genB2eb7JE58TQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=15304)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=15304)
The X.org-log

As I was asked on IRC by marcheu to file a bug, I'll do it. attached you'll
find my Xorg.0.log and my kern.log. The xorg.conf looked like:

Section "Module"
        #Load   "GLcore"
        Load    "bitmap"
        Load    "dbe"
        Load    "ddc"
        #Load   "dri"
        Load    "extmod"
        Load    "freetype"
        Load    "glx"
        Load    "int10"
        Load    "record"
        Load    "speedo"
        #Load   "type1"
        Load    "vbe"
EndSection

Section "Device"
        Identifier      "nVidia Corporation NV10DDR [GeForce 256 DDR]"
        Driver          "nouveau"
        BusID           "PCI:1:0:0"
EndSection

First everthing was fine and X started. But after a while it started to switch
back and forth between tty1 and tty7 (on which the X server is running) and I
could glimpse at the things logged to kern.log. This cycle could only be broken
by Ctrl+Alt+Del or a hard reset. The first time I noticed that, was with
Randr12 enabled, but after I deactivated it and started again without Randr12
it lockedup also.

Please feel free to askt for any information, test or the like you'd like to
have. It's very likley that I haven't provided every information you might need
because it's my first bug for nouveau/randr12.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
