From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99464] New: openmw - Segfault with the nouveau ddx +
	DRI3
Date: Thu, 19 Jan 2017 23:45:53 +0000
Message-ID: <bug-99464-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1807973749=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1807973749==
Content-Type: multipart/alternative; boundary="14848695530.5E094da.9460";
 charset="UTF-8"


--14848695530.5E094da.9460
Date: Thu, 19 Jan 2017 23:45:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99464

            Bug ID: 99464
           Summary: openmw - Segfault with the nouveau ddx + DRI3
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ovariegata-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 129055
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D129055&action=3Dedit
Apitrace.

When starting openmw which is the free engine re-implementation of the game
morrowind it will segfault. This may be a mesa core bug, but it will only
happen with the nouveau DDX + DRI3. It will not crash with modesetting + DR=
I3,
DRI2 or the llvmpipe.

Here is a backtrace.
http://pastebin.com/HMdv4iWb

Apitrace log.
http://pastebin.com/FzZVyGqW

Here is a workaround as reported to the the mesa mailing list by Tobias
Klausmann. It successfully hides the crash, but potentially breaking the
hardware cursor used by openmw which works correctly with DRI2, modesetting=
 or
the llvmpipe. It also was not intended as a real fix.

"OpenMW tries to upload a new surface (mouse pointer) which fails in the now
guarded update_framebuffer_size() as the surface is NULL.

This is not inteded as a real "fix", as it would just hide the immediate cr=
ash.

So if somebody could take a look at this...

Reported-by: <ovariegata-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
---
src/mesa/state_tracker/st_atom_framebuffer.c | 6 ++++--
1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/mesa/state_tracker/st_atom_framebuffer.c
b/src/mesa/state_tracker/st_atom_framebuffer.c
index ea41d9d..3ee4ea5 100644
--- a/src/mesa/state_tracker/st_atom_framebuffer.c
+++ b/src/mesa/state_tracker/st_atom_framebuffer.c
@@ -177,8 +177,10 @@ update_framebuffer_state( struct st_context *st )
          /* rendering to a GL texture, may have to update surface */
          st_update_renderbuffer_surface(st, strb);
      }
-      pipe_surface_reference(&framebuffer->zsbuf, strb->surface);
-      update_framebuffer_size(framebuffer, strb->surface);
+      if (strb->surface) {
+        pipe_surface_reference(&framebuffer->zsbuf, strb->surface);
+        update_framebuffer_size(framebuffer, strb->surface);
+      }
    }
    else {
      strb =3D st_renderbuffer(fb->Attachment[BUFFER_STENCIL].Renderbuffer);
--=20
2.9.2"

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14848695530.5E094da.9460
Date: Thu, 19 Jan 2017 23:45:53 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - openmw - Segfault with the nouveau ddx + DRI3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99464">99464</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>openmw - Segfault with the nouveau ddx + DRI3
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ovariegata&#64;yahoo.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D129055=
" name=3D"attach_129055" title=3D"Apitrace.">attachment 129055</a> <a href=
=3D"attachment.cgi?id=3D129055&amp;action=3Dedit" title=3D"Apitrace.">[deta=
ils]</a></span>
Apitrace.

When starting openmw which is the free engine re-implementation of the game
morrowind it will segfault. This may be a mesa core bug, but it will only
happen with the nouveau DDX + DRI3. It will not crash with modesetting + DR=
I3,
DRI2 or the llvmpipe.

Here is a backtrace.
<a href=3D"http://pastebin.com/HMdv4iWb">http://pastebin.com/HMdv4iWb</a>

Apitrace log.
<a href=3D"http://pastebin.com/FzZVyGqW">http://pastebin.com/FzZVyGqW</a>

Here is a workaround as reported to the the mesa mailing list by Tobias
Klausmann. It successfully hides the crash, but potentially breaking the
hardware cursor used by openmw which works correctly with DRI2, modesetting=
 or
the llvmpipe. It also was not intended as a real fix.

&quot;OpenMW tries to upload a new surface (mouse pointer) which fails in t=
he now
guarded update_framebuffer_size() as the surface is NULL.

This is not inteded as a real &quot;fix&quot;, as it would just hide the im=
mediate crash.

So if somebody could take a look at this...

Reported-by: &lt;<a href=3D"mailto:ovariegata&#64;yahoo.com">ovariegata&#64=
;yahoo.com</a>&gt;
Signed-off-by: Tobias Klausmann &lt;<a href=3D"mailto:tobias.johannes.klaus=
mann&#64;mni.thm.de">tobias.johannes.klausmann&#64;mni.thm.de</a>&gt;
---
src/mesa/state_tracker/st_atom_framebuffer.c | 6 ++++--
1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/mesa/state_tracker/st_atom_framebuffer.c
b/src/mesa/state_tracker/st_atom_framebuffer.c
index ea41d9d..3ee4ea5 100644
--- a/src/mesa/state_tracker/st_atom_framebuffer.c
+++ b/src/mesa/state_tracker/st_atom_framebuffer.c
&#64;&#64; -177,8 +177,10 &#64;&#64; update_framebuffer_state( struct st_co=
ntext *st )
          /* rendering to a GL texture, may have to update surface */
          st_update_renderbuffer_surface(st, strb);
      }
-      pipe_surface_reference(&amp;framebuffer-&gt;zsbuf, strb-&gt;surface);
-      update_framebuffer_size(framebuffer, strb-&gt;surface);
+      if (strb-&gt;surface) {
+        pipe_surface_reference(&amp;framebuffer-&gt;zsbuf, strb-&gt;surfac=
e);
+        update_framebuffer_size(framebuffer, strb-&gt;surface);
+      }
    }
    else {
      strb =3D st_renderbuffer(fb-&gt;Attachment[BUFFER_STENCIL].Renderbuff=
er);
--=20
2.9.2&quot;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14848695530.5E094da.9460--

--===============1807973749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1807973749==--
