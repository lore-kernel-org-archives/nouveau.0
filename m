From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35441] New: header files (at least nouveau_device.h
 and nouveau_grojb.h) missing from git
Date: Fri, 18 Mar 2011 20:43:27 -0700 (PDT)
Message-ID: <bug-35441-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35441

           Summary: header files (at least nouveau_device.h and
                    nouveau_grojb.h) missing from git
           Product: Mesa
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: rwhite-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org


The current git repository as of this date is missing at least two header files
referenced by src/mesa/drivers/dri/nouveau/nouveau_driver.h

The file nouveau_device.h is missing and when I just experimentally commented
that out then nouveau_gobj.h cropped up missing so I stopped.

All the other header files in the same block of includes that I could locate
are all apparently local to this directory. They are also all local includes
(e.g. in "" not <> quotes) so I figure they are all from here.

spot checking I think

nouveau_device.h, nouveau_grobj.h, nouveau_channel.h, and nouveau_notifier.h
and any .c files they front for are suspiciously missing or live somewhere
inobvious to me.

This was first observed about two weeks ago but I didn't realize this was the
right place to report it. /doh.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
