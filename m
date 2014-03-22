From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76483] New: [NV50, bisected,
 RFC patch] xset dpms force {on, off} does not work over DP
Date: Sat, 22 Mar 2014 17:17:25 +0000
Message-ID: <bug-76483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0344870039=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0344870039==
Content-Type: multipart/alternative; boundary="1395508646.dc6dA11.18167"; charset="us-ascii"


--1395508646.dc6dA11.18167
Date: Sat, 22 Mar 2014 17:17:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76483

          Priority: medium
            Bug ID: 76483
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV50, bisected, RFC patch] xset dpms force {on,off}
                    does not work over DP
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: dd-IPhqJjDoDR/z1n+OaKNE4w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 96206
  --> https://bugs.freedesktop.org/attachment.cgi?id=96206&action=edit
RFC patch on top of 34d59508 (drm/nouveau: fix TTM_PL_TT memtype on pre-nv50)

Commit 0a0afd28 (drm/nv50-/disp: move DP link training to core and
train from supervisor) removed a call to 'nouveau_dp_dpms' at the
bottom of nv50_display.c.

Without this call, 'xset dpms force {on,off}' does not have any effect
on my DP-attached monitor.

The attached proof-of-concept patch re-adds the call, as well as a partial
version of nouveau_dp_dpms which causes 'force off' to work again.

It is not clear to me how to trigger link training in the supervisor,
so nouveau_dp_dpms skips that step when handling DRM_MODE_DPMS_ON.
The result is that 'force on' does not cause the monitor to wake up,
and the connection is effectively dead.

Could somebody familiar with the driver could comment on the next
steps to undertake to restore the full {on,off} functionality?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395508646.dc6dA11.18167
Date: Sat, 22 Mar 2014 17:17:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483">76483</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>dd&#64;crosstwine.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=96206" name="attach_96206" title="RFC patch on top of 34d59508 (drm/nouveau: fix TTM_PL_TT memtype on pre-nv50)">attachment 96206</a> <a href="attachment.cgi?id=96206&amp;action=edit" title="RFC patch on top of 34d59508 (drm/nouveau: fix TTM_PL_TT memtype on pre-nv50)">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=76483&amp;attachment=96206'>[review]</a>
RFC patch on top of 34d59508 (drm/nouveau: fix TTM_PL_TT memtype on pre-nv50)

Commit 0a0afd28 (drm/nv50-/disp: move DP link training to core and
train from supervisor) removed a call to 'nouveau_dp_dpms' at the
bottom of nv50_display.c.

Without this call, 'xset dpms force {on,off}' does not have any effect
on my DP-attached monitor.

The attached proof-of-concept patch re-adds the call, as well as a partial
version of nouveau_dp_dpms which causes 'force off' to work again.

It is not clear to me how to trigger link training in the supervisor,
so nouveau_dp_dpms skips that step when handling DRM_MODE_DPMS_ON.
The result is that 'force on' does not cause the monitor to wake up,
and the connection is effectively dead.

Could somebody familiar with the driver could comment on the next
steps to undertake to restore the full {on,off} functionality?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395508646.dc6dA11.18167--

--===============0344870039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0344870039==--
