From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31120] New: Backlight off after suspend-to-disk on
	Powerbook
Date: Mon, 25 Oct 2010 19:15:13 -0700 (PDT)
Message-ID: <bug-31120-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31120

           Summary: Backlight off after suspend-to-disk on Powerbook
           Product: xorg
           Version: unspecified
          Platform: PowerPC
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: jk-KVH6KZ/iFWQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


After waking up from the hibernate (software suspend), the LCD backlight turns
off.  The machine wakes up correctly otherwise, you can even see the contents
of the screen if you look very carefully.

The backlight *does* turn off correctly with DPMS, probably due to the fix in
bug #29685.

I examined the contents of the registers mentioned in the above report using
radeontool. Before hibernate I get:

  0x0060081c      0x86066055
  0x000010f0      0x83e60535

And after hibernate:

  0x0060081c      0x86066055
  0x000010f0      0x80007fff

Restoring 0x10f0 to the previous value turns the backlight back on.

The machine is a PowerBook6,2 12", with an

  nVidia Corporation NV34M [GeForce FX Go5200] [10de:0329] (rev a1).

It is running Debian xserver-xorg-video-nouveau 1:0.0.16+git20100825+390f1c8-1
and vanilla Linux 2.6.36.

I'm going to file another bug for the backlight control, which also does not
work, but works fine with nv.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
