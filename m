From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32855] New: Incorrect image stretching with Render
 in RepeatPad mode, NV50
Date: Wed,  5 Jan 2011 11:55:13 -0800 (PST)
Message-ID: <bug-32855-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=32855

           Summary: Incorrect image stretching with Render in RepeatPad
                    mode, NV50
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=41683)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=41683)
test program

Attached is a test program which attempts to stretch a two-pixel image
horizontally using Cairo.  It generates four files: r-image-24.png should be
pixel-identical to r-xlib-24.png and r-image-32.png should be pixel-identical
to r-xlib-32.png.

On my system (I don't remember the exact marketing name of the card, but the
driver identifies it as "NVIDIA NV94" and as "a NV50 generation card"), even
with the very latest version of the Nouveau driver (xf86-video-nouveau git
dc89dac734167bcbc667b39ca6ee2043871a60bf), the -xlib- files are not identical
to their respective -image- files.  (I will also attach the test results as
produced by my system.)

With the 24bpp image, the problem appears to be simply that Cairo's EXTEND_PAD
(Render's RepeatPad) is not doing its job, despite that I do see code in the
driver to implement that mode.  The upscale is happening as if there were black
pixels around the edges of the single-pixel source image, instead of green and
white pixels as EXTEND_PAD specifies.

With the 32bpp image, in addition to that problem, there are also garbage
pixels at intervals.

I am happy to provide more information as necessary and/or to test patches.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
