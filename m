From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26194] New: nouveau reports DPI correctly in
 Xorg.0.log, but value reported by X incorrect
Date: Sun, 24 Jan 2010 06:22:45 -0800 (PST)
Message-ID: <bug-26194-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26194

           Summary: nouveau reports DPI correctly in Xorg.0.log, but value
                    reported by X incorrect
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bjt23-HmMyXyqgL2CVc3sceRu5cw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


A bit odd:

$ grep -E 'DPI|dimensions' /var/log/Xorg.0.log
(**) NOUVEAU(0): Display dimensions: (290, 180) mm
(**) NOUVEAU(0): DPI set to (112, 112)

290mm x 180mm and 112x112 DPI are indeed correct (1280x800, 13.3" widescreen),
however:

$ xdpyinfo | grep -E 'dimensions|resolution'
  dimensions:    1280x800 pixels (338x211 millimeters)
  resolution:    96x96 dots per inch

X appears to be getting bogus data, which screws up font sizing.

I'm on a MacBook Pro 13" with GeForce 9400M (NVac).  Using nouveau-drm from the
kernel tree with git rev eeec3a1ecd703d3a32fe223274d2a77686030d78 (built out of
tree for kernel 2.6.32-gentoo-r2), and xf86-video-nouveau git rev
2630a1553d560ce2c7391bc103d4a543f7d3d0da.

If there's any more data or info I can provide, please let me know.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
