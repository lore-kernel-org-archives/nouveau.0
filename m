From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90347] New: [NVE0+] Failure to insert texbar under
 some circumstances (causing bad colors in Terasology)
Date: Wed, 06 May 2015 18:38:07 +0000
Message-ID: <bug-90347-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0618139999=="
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


--===============0618139999==
Content-Type: multipart/alternative; boundary="1430937487.bFce4D850.31062"; charset="UTF-8"


--1430937487.bFce4D850.31062
Date: Wed, 6 May 2015 18:38:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90347

            Bug ID: 90347
           Summary: [NVE0+] Failure to insert texbar under some
                    circumstances (causing bad colors in Terasology)
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 115602
  --> https://bugs.freedesktop.org/attachment.cgi?id=115602&action=edit
terasology.tgsi

The problem is that the attached shader compiles to:

...
 34: mov u32 $r0 $r3 (8)
 35: mov u32 $r1 $r5 (8)
 36: tex 2D $r0 $s0 f32 $r0t $r0d (8)
 37: join mov u32 $r7 $r1 (8)
BB:3 (4 instructions) - idom = BB:0, df = { BB:4 }
 -> BB:4 (forward)
 38: mov u32 $r0 $r3 (8)
 39: mov u32 $r1 $r5 (8)
 40: tex 2D $r1 $s0 f32 $r0t $r0d (8)
 41: join mov u32 $r7 $r1 (8)
...

And there is no texbar before the mov happens. This causes funky rendering in
Terasology.

Somehow things get merged during RA s.t. the findFirstUses logic decides that
the tex itself is a use (it isn't!) and so it never picks up on the actual use
in that BB (since there's a check to make sure that we only pick the earliest
use in a BB). This much shorter shader reproduces a similar issue as well:

FRAG
DCL IN[0], COLOR, COLOR
DCL OUT[0], COLOR
DCL OUT[1], COLOR[1]
DCL SAMP[0]
DCL SAMP[1]
DCL TEMP[0..4], LOCAL
IMM[0] FLT32 {    0.0010,     1.0000,     0.0000,     2.5000}
  5: MOV TEMP[0].xy, IN[0].xyxx
  7: FSLT TEMP[2].x, IMM[0].yyyy, IN[0].xxxx
 10: UIF TEMP[2].xxxx :0
 30:   TEX TEMP[1], TEMP[0], SAMP[0], 2D
 32: ELSE :0
 34:   TEX TEMP[1], TEMP[0], SAMP[1], 2D
 36: ENDIF
 47: UIF TEMP[2].xxxx :0
 50:   MUL TEMP[1], TEMP[1], IMM[0].xyyy
 54: ENDIF
 84: MOV TEMP[0].xyz, TEMP[1].xyzx
 93: MOV TEMP[1].xyz, TEMP[0].wwww
 94: MOV OUT[0], TEMP[0]
 95: MOV OUT[1], TEMP[1]
 97: END

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1430937487.bFce4D850.31062
Date: Wed, 6 May 2015 18:38:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE0+] Failure to insert texbar under some circumstances (causing bad colors in Terasology)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90347">90347</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE0+] Failure to insert texbar under some circumstances (causing bad colors in Terasology)
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>imirkin&#64;alum.mit.edu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=115602" name="attach_115602" title="terasology.tgsi">attachment 115602</a> <a href="attachment.cgi?id=115602&amp;action=edit" title="terasology.tgsi">[details]</a></span>
terasology.tgsi

The problem is that the attached shader compiles to:

...
 34: mov u32 $r0 $r3 (8)
 35: mov u32 $r1 $r5 (8)
 36: tex 2D $r0 $s0 f32 $r0t $r0d (8)
 37: join mov u32 $r7 $r1 (8)
BB:3 (4 instructions) - idom = BB:0, df = { BB:4 }
 -&gt; BB:4 (forward)
 38: mov u32 $r0 $r3 (8)
 39: mov u32 $r1 $r5 (8)
 40: tex 2D $r1 $s0 f32 $r0t $r0d (8)
 41: join mov u32 $r7 $r1 (8)
...

And there is no texbar before the mov happens. This causes funky rendering in
Terasology.

Somehow things get merged during RA s.t. the findFirstUses logic decides that
the tex itself is a use (it isn't!) and so it never picks up on the actual use
in that BB (since there's a check to make sure that we only pick the earliest
use in a BB). This much shorter shader reproduces a similar issue as well:

FRAG
DCL IN[0], COLOR, COLOR
DCL OUT[0], COLOR
DCL OUT[1], COLOR[1]
DCL SAMP[0]
DCL SAMP[1]
DCL TEMP[0..4], LOCAL
IMM[0] FLT32 {    0.0010,     1.0000,     0.0000,     2.5000}
  5: MOV TEMP[0].xy, IN[0].xyxx
  7: FSLT TEMP[2].x, IMM[0].yyyy, IN[0].xxxx
 10: UIF TEMP[2].xxxx :0
 30:   TEX TEMP[1], TEMP[0], SAMP[0], 2D
 32: ELSE :0
 34:   TEX TEMP[1], TEMP[0], SAMP[1], 2D
 36: ENDIF
 47: UIF TEMP[2].xxxx :0
 50:   MUL TEMP[1], TEMP[1], IMM[0].xyyy
 54: ENDIF
 84: MOV TEMP[0].xyz, TEMP[1].xyzx
 93: MOV TEMP[1].xyz, TEMP[0].wwww
 94: MOV OUT[0], TEMP[0]
 95: MOV OUT[1], TEMP[1]
 97: END</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1430937487.bFce4D850.31062--

--===============0618139999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0618139999==--
