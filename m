From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16269] New: NV47 DVI DPMS scary loop
Date: Sun,  8 Jun 2008 05:10:23 -0700 (PDT)
Message-ID: <bug-16269-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16269

           Summary: NV47 DVI DPMS scary loop
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: vallesroc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=16997)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=16997)
Xorg.0.log

in short, behaviour of xset dpms force suspend/standby/off
blob: TFT turns off
nouveau: TFT turns off, then on "no signal", then off (repeat forever)

The TFT is a ViewSonic VP930, connected by DVI.
I attach xorg.conf and Xorg.0.log.

Nouveau was build a few hours ago (20080608, 2am GMT aprox)

It's scary enough! It would help to know how to entirelly disable DPMS in
xorg.conf so that I can use nouveau without fear of destroying the screen,
while the problem is identified and a solution is found.

Interestingly, a really old blob version did behave like that with my old NV11
card and this screen, a pair of years ago. Nvidia fixed it eventually.

Interesting part of dmesg (not much to see there):
[   12.124804] agpgart: Found an AGP 3.5 compliant device at 0000:00:00.0.
[   12.124825] agpgart: Putting AGP V3 device at 0000:00:00.0 into 8x mode
[   12.124925] agpgart: Putting AGP V3 device at 0000:01:00.0 into 8x mode
[ 1354.480303] [drm] Initialized drm 1.1.0 20060810
[ 1354.484501] [drm] Detected an NV40 generation card (0x047300a1)
[ 1354.484507] [drm] Initialized nouveau 0.0.10
drm-2.3.0-1274-g6905c7a29d2a3bc0e on minor 0
[ 1356.530920] agpgart: Found an AGP 3.5 compliant device at 0000:00:00.0.
[ 1356.530943] agpgart: X tried to set rate=x12. Setting to AGP3 x8 mode.
[ 1356.530953] agpgart: Putting AGP V3 device at 0000:00:00.0 into 8x mode
[ 1356.531066] agpgart: Putting AGP V3 device at 0000:01:00.0 into 8x mode
[ 1356.810550] [drm] Allocating FIFO number 0
[ 1356.812848] [drm] nouveau_fifo_alloc: initialised FIFO 0
[ 1356.813176] [drm] Allocating FIFO number 1
[ 1356.815370] [drm] nouveau_fifo_alloc: initialised FIFO 1


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
