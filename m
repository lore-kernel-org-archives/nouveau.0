From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96258] New: [NVC0] Hang when running compute program
Date: Sat, 28 May 2016 13:49:36 +0000
Message-ID: <bug-96258-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1333624163=="
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


--===============1333624163==
Content-Type: multipart/alternative; boundary="14644433760.8BEa6A01d.32082";
 charset="UTF-8"


--14644433760.8BEa6A01d.32082
Date: Sat, 28 May 2016 13:49:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96258

            Bug ID: 96258
           Summary: [NVC0] Hang when running compute program
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

Created attachment 124145
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D124145&action=3Dedit
compute shader dump

This happened on GK208, but I assume it'll happen everywhere. This is with =
the
trace from bug 94858.

[259564.842264] nouveau 0000:02:00.0: fifo: read fault at 0000000000 engine=
 00
[GR] client 03 [GPC0/L1_1] reason 02 [PTE] on channel 6 [007f940000 X[1608]]
[259564.842268] nouveau 0000:02:00.0: fifo: gr engine fault on channel 6,
recovering...
[259595.772036] nouveau 0000:02:00.0: X[1608]: failed to idle channel 6
[X[1608]]
[259610.772211] nouveau 0000:02:00.0: X[1608]: failed to idle channel 6
[X[1608]]

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14644433760.8BEa6A01d.32082
Date: Sat, 28 May 2016 13:49:36 +0000
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
   title=3D"NEW - [NVC0] Hang when running compute program"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96258">96258</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVC0] Hang when running compute program
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D124145=
" name=3D"attach_124145" title=3D"compute shader dump">attachment 124145</a=
> <a href=3D"attachment.cgi?id=3D124145&amp;action=3Dedit" title=3D"compute=
 shader dump">[details]</a></span>
compute shader dump

This happened on GK208, but I assume it'll happen everywhere. This is with =
the
trace from <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - McNopper Compute Shader Example40 broken on In=
tel"
   href=3D"show_bug.cgi?id=3D94858">bug 94858</a>.

[259564.842264] nouveau 0000:02:00.0: fifo: read fault at 0000000000 engine=
 00
[GR] client 03 [GPC0/L1_1] reason 02 [PTE] on channel 6 [007f940000 X[1608]]
[259564.842268] nouveau 0000:02:00.0: fifo: gr engine fault on channel 6,
recovering...
[259595.772036] nouveau 0000:02:00.0: X[1608]: failed to idle channel 6
[X[1608]]
[259610.772211] nouveau 0000:02:00.0: X[1608]: failed to idle channel 6
[X[1608]]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14644433760.8BEa6A01d.32082--

--===============1333624163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1333624163==--
