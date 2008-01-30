From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14305] New: X crash at start when virtual size
 exceeds the VRAM capacity
Date: Wed, 30 Jan 2008 08:05:12 -0800 (PST)
Message-ID: <bug-14305-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14305

           Summary: X crash at start when virtual size exceeds the VRAM
                    capacity
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: debian-E6TheL+NHo3k1uMJSBkQmQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


X crash at start when virtual size exceeds the VRAM capacity

Quoting marcheu who sort it out:

<marcheu> (EE) EXA(0): ExaDriverRec::offScreenBase must be <=
ExaDriverRec::memorySize 
<marcheu> bad bad bad bad
<marcheu> (--) NOUVEAU(0): VideoRAM: 16384 kBytes 
<marcheu> 2624*1200*4=12MB
<marcheu> we only use half of VRAM for 2D, and 16/2MB < 12MB
<marcheu> so you don't have the room to create that buffer<marcheu> in fact, X
should refuse to start if the thing was any sane

I had:

        SubSection "Display"
                Modes           "1024x768"
                Virtual 2624 1200
        EndSubSection

My intention was to combine with a 1600x1200 LCD panel.

Attaching the Xorg.0.log with a backtrace at the end, and the xorg.conf...


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
