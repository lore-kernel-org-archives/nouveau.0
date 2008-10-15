From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18071] New: Interlaced DVI on NV34M doesn't work
	properly.
Date: Wed, 15 Oct 2008 01:32:54 -0700 (PDT)
Message-ID: <bug-18071-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18071

           Summary: Interlaced DVI on NV34M doesn't work properly.
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: wouter-W3n8d9RvHYw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=19662)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=19662)
Xorg log with 'Option "ModeDebug" "on"' in xorg.conf

< malc0> Yoe: for now, I think you need to file a bug at bugs.freedesktop.org,
product xorg, component drivers/nouveau, saying we suck at interlaced modes on
digital, attach an xorg log, and note that simply allowing interlace doesn't
work.

When running nouveau with my laptop connected to my HD TV (Apple mini-DVI ->
DVI -> HDMI -> TV), xrandr detects two modes: one 640x480, one 720x480. When
using MacOS on the same configuration, it detects 1920x1080@50 (which is
reported by the TV as '1080i/50'), 1920x1080@60, and 1344x756@60 (both reported
as 1080i/60), though only the first (1920x1080@50) displays properly on the TV.

I should note that the 640x480 and 720x480 modes do create an image, although
it only uses the middle part of the TV and stretches the image vertically.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
