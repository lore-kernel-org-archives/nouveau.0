From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58087] New: [-next] nouveau corrupts kernel mm
	allocator
Date: Mon, 10 Dec 2012 14:55:27 +0000
Message-ID: <bug-58087-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1485948980=="
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


--===============1485948980==
Content-Type: multipart/alternative; boundary="1355151328.4cEEeB4a1.2232"; charset="us-ascii"


--1355151328.4cEEeB4a1.2232
Date: Mon, 10 Dec 2012 14:55:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58087

          Priority: medium
            Bug ID: 58087
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [-next] nouveau corrupts kernel mm allocator
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 71269
  --> https://bugs.freedesktop.org/attachment.cgi?id=71269&action=edit
kernel log showing BUG triggered by nouveau

If nouveau_vm_new() fails in nouveau_drm_open(), the cleanup triggered corrupts
the kernel slab allocator (in this case, SLUB).

Attached is the kernel log showing the page allocation failure and the
subsequent BUG in mm/slub.c

A similar corruption had previously occurred which triggered a GP fault in the
mm allocator from the same code path. This was reported as kernel bug #51291
here
https://bugzilla.kernel.org/show_bug.cgi?id=51291

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1355151328.4cEEeB4a1.2232
Date: Mon, 10 Dec 2012 14:55:28 +0000
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
   title="NEW --- - [-next] nouveau corrupts kernel mm allocator"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58087">58087</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[-next] nouveau corrupts kernel mm allocator
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>peter&#64;hurleysoftware.com
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
          <td>unspecified
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
        <pre>Created <span class=""><a href="attachment.cgi?id=71269" name="attach_71269" title="kernel log showing BUG triggered by nouveau">attachment 71269</a> <a href="attachment.cgi?id=71269&amp;action=edit" title="kernel log showing BUG triggered by nouveau">[details]</a></span>
kernel log showing BUG triggered by nouveau

If nouveau_vm_new() fails in nouveau_drm_open(), the cleanup triggered corrupts
the kernel slab allocator (in this case, SLUB).

Attached is the kernel log showing the page allocation failure and the
subsequent BUG in mm/slub.c

A similar corruption had previously occurred which triggered a GP fault in the
mm allocator from the same code path. This was reported as kernel <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Segfault with mplayer -vo vdpau: vlVdpVideoSurfaceClear at surface.c:366"
   href="show_bug.cgi?id=51291">bug #51291</a>
here
<a href="https://bugzilla.kernel.org/show_bug.cgi?id=51291">https://bugzilla.kernel.org/show_bug.cgi?id=51291</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1355151328.4cEEeB4a1.2232--

--===============1485948980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1485948980==--
