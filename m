From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25260] New: Screen corruption in top left corner on
	NV50
Date: Tue, 24 Nov 2009 09:04:19 -0800 (PST)
Message-ID: <bug-25260-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25260

           Summary: Screen corruption in top left corner on NV50
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: tavianator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=31446)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31446)
Screenshot of corruption in top-left corner

I'm seeing corruption in the top left corner of the screen on my 9800M.  It
happened when I updated the xorg driver and libdrm, and I couldn't quite bisect
it or even find which one caused it because the relevant commits involve a
libdrm API change (commit f4c50630269df4201b89a538cbf8e11646f17d82).  The age
of the DRM module doesn't seem to matter.

It's hard to get a screenshot of because it's transient and goes away whenever
that corner gets redrawn, but I got a decent one which is attached.  It shows
basically all the symptoms: random black rectangles, random colors, and other
parts of the screen being drawn there.  For example, scrolling in firefox often
causes parts of the scrollbar to be drawn there (that's what the vertical
stripes in the screenshot are).  I've also seen an animated image that was off
the screen in firefox show up there, fully animated and zoomed in for some
reason.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
