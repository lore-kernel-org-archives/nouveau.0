From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64858] Nouveau sees invalid EDID for eDP-1 whenever
 that display is turned off
Date: Sat, 25 May 2013 14:46:18 +0000
Message-ID: <bug-64858-8800-VsCuYED3Xg@http.bugs.freedesktop.org/>
References: <bug-64858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0092001029=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64858-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0092001029==
Content-Type: multipart/alternative; boundary="1369493178.6F3E1.14002"; charset="us-ascii"


--1369493178.6F3E1.14002
Date: Sat, 25 May 2013 14:46:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64858

--- Comment #3 from gspr <gspreemann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I've finished a git bisect (log attached). It concludes with commit
69787f7da6b2adc4054357a661aaa1701a9ca76f:

69787f7da6b2adc4054357a661aaa1701a9ca76f is the first bad commit
commit 69787f7da6b2adc4054357a661aaa1701a9ca76f
Author: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Date:   Tue Oct 23 18:23:34 2012 +0000

    drm: run the hpd irq event code directly

    All drivers already have a work item to run the hpd code, so we don't
    need to launch a new one in the helper code. Dave Airlie mentioned
    that the cancel+re-queue might paper over DP related hpd ping-pongs,
    hence why this is split out.

    Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
    Reviewed-by: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
    Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 34387171acedcebba1e05d10b819c9363833650b
2476d15ff51e66eec241d6ab5e8943c4c46c4360 M drivers
:040000 040000 e0c4edaf7c42932ee64d431177244b7000e93fb3
138f6ab2e8c8e5d3985ddaa6610f0e95f241ee59 M include

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369493178.6F3E1.14002
Date: Sat, 25 May 2013 14:46:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau sees invalid EDID for eDP-1 whenever that display is turned off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64858#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau sees invalid EDID for eDP-1 whenever that display is turned off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64858">bug 64858</a>
              from <span class="vcard"><a class="email" href="mailto:gspreemann&#64;gmail.com" title="gspr &lt;gspreemann&#64;gmail.com&gt;"> <span class="fn">gspr</span></a>
</span></b>
        <pre>I've finished a git bisect (log attached). It concludes with commit
69787f7da6b2adc4054357a661aaa1701a9ca76f:

69787f7da6b2adc4054357a661aaa1701a9ca76f is the first bad commit
commit 69787f7da6b2adc4054357a661aaa1701a9ca76f
Author: Daniel Vetter &lt;<a href="mailto:daniel.vetter&#64;ffwll.ch">daniel.vetter&#64;ffwll.ch</a>&gt;
Date:   Tue Oct 23 18:23:34 2012 +0000

    drm: run the hpd irq event code directly

    All drivers already have a work item to run the hpd code, so we don't
    need to launch a new one in the helper code. Dave Airlie mentioned
    that the cancel+re-queue might paper over DP related hpd ping-pongs,
    hence why this is split out.

    Signed-off-by: Daniel Vetter &lt;<a href="mailto:daniel.vetter&#64;ffwll.ch">daniel.vetter&#64;ffwll.ch</a>&gt;
    Reviewed-by: Alex Deucher &lt;<a href="mailto:alexander.deucher&#64;amd.com">alexander.deucher&#64;amd.com</a>&gt;
    Signed-off-by: Dave Airlie &lt;<a href="mailto:airlied&#64;redhat.com">airlied&#64;redhat.com</a>&gt;

:040000 040000 34387171acedcebba1e05d10b819c9363833650b
2476d15ff51e66eec241d6ab5e8943c4c46c4360 M drivers
:040000 040000 e0c4edaf7c42932ee64d431177244b7000e93fb3
138f6ab2e8c8e5d3985ddaa6610f0e95f241ee59 M include</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369493178.6F3E1.14002--

--===============0092001029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0092001029==--
