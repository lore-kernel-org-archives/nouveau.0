From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35889] New: Screen of Geforce4 440 GO NV17 corrupts
 while booting
Date: Fri,  1 Apr 2011 17:26:42 -0700 (PDT)
Message-ID: <bug-35889-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35889

           Summary: Screen of Geforce4 440 GO NV17 corrupts while booting
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: stefan.langenmaier+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=45150)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=45150)
The used config file for the creation of the kernel.

Hello

the machine is a Toshiba Satellite 5100-S201
with a nVidia GeForce4 440 Go 10de:0174 (rev a3)
I'm running the kernel 2.6.38 with kms enabled.

When I start the pc it boots normal for one or two seconds and I can see the
typical lines, but then the screen freezes and it starts to show strange
artifacts. They are almost always different sometimes horizontal bars in black
in white. Sometimes the screen fades slowly to black, sometimes to bright
white.
In the background the pc boots normal and I can ssh into the box.

When I add nouveau.modeset=0 to the boot parameters the systems boots without
any artifacts. But I cannot start the xserver.

When I add another monitor to the external vga connector. The internal monitor
stays black and the external monitor displays the content just fine and I can
also launch the xserver.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
