From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23730] New: x11-base/nouveau-drm fails on
 drm_fb_helper.c with 'EINVAL' undeclared
Date: Sat,  5 Sep 2009 10:37:27 -0700 (PDT)
Message-ID: <bug-23730-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23730

           Summary: x11-base/nouveau-drm fails on drm_fb_helper.c with
                    'EINVAL' undeclared
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: maxim.britov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I have today on my Gentoo:
In file included from
/var/tmp/portage/x11-base/nouveau-drm-99999999/work/master-compat/drivers/gpu/drm/drm_fb_helper.c:30:
include/linux/sysrq.h: In function '__reterr':
include/linux/sysrq.h:66: error: 'EINVAL' undeclared (first use in this
function)
include/linux/sysrq.h:66: error: (Each undeclared identifier is reported only
once
include/linux/sysrq.h:66: error: for each function it appears in.)


With this patch it compiles fine

--- /master-compat/drivers/gpu/drm/drm_fb_helper.c        2009-09-01
22:50:00.000000000 +0300
+++ master-compat/drivers/gpu/drm/drm_fb_helper.c        2009-09-05
19:46:52.000000000 +0300
@@ -27,6 +27,7 @@
  *      Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
  *      Jesse Barnes <jesse.barnes-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
  */
+#include <linux/errno.h>
 #include <linux/sysrq.h>
 #include <linux/fb.h>
 #include "drmP.h"


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
