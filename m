From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23741] New: Driver pixmaps cause pushbuf validation
 failure on mode change (nv28, KMS)
Date: Sun,  6 Sep 2009 04:20:01 -0700 (PDT)
Message-ID: <bug-23741-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23741

           Summary: Driver pixmaps cause pushbuf validation failure on mode
                    change (nv28, KMS)
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: pq-X3B1VOXEql0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Roughly latest git of ddx, drm and libdrm. Xorg-server git version some weeks
old. Confirmed with a full nouveau/linux-2.6 git kernel.

NV28, KMS active. Issuing the command 'xrandr -s 800x600' resulted in a kernel
hang, a live lock one might say. This was worked around in nouveau/linux-2.6 in
the commit "drm/nouveau: bail out if validation fails repeatedly", which allows
the kernel to fail gracefully, killing only X instead of the whole system.

When 'xrandr -s 800x600' fails, monitor loses signal completely. With the
kernel workaround in place, X can be restarted and everything is good again.
Note, that sysRq force-fb does restore the mode, but not the virtual console
image.

Setting Option "EXAPixmaps" "false" in xorg.conf disables the bug, so it is
driver pixmap specific. Likely it does not affect NV50 family, or someone would
have noticed it.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
