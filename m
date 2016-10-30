From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98506] New: Pagefault in gf100_vm_flush
Date: Sun, 30 Oct 2016 17:34:12 +0000
Message-ID: <bug-98506-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0849577833=="
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


--===============0849577833==
Content-Type: multipart/alternative; boundary="14778488521.8f6fb84.31354";
 charset="UTF-8"


--14778488521.8f6fb84.31354
Date: Sun, 30 Oct 2016 17:34:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98506

            Bug ID: 98506
           Summary: Pagefault in gf100_vm_flush
           Product: xorg
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 127629
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D127629&action=3Dedit
kernel oops

got a pagefault today, attached below

gf100_vm_flush+0xc8 is
https://github.com/karolherbst/nouveau/blob/caab1df6e3b32d2eca7e82819a7dd4c=
b99911d71/drm/nouveau/nvkm/subdev/mmu/gf100.c#L183
-+ gdb mistake

was running chromium prime offloaded and civilisation 5 with mareks gl
threading branch

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14778488521.8f6fb84.31354
Date: Sun, 30 Oct 2016 17:34:12 +0000
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
   title=3D"NEW - Pagefault in gf100_vm_flush"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98506">98506</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Pagefault in gf100_vm_flush
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
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
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>karolherbst&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D127629=
" name=3D"attach_127629" title=3D"kernel oops">attachment 127629</a> <a hre=
f=3D"attachment.cgi?id=3D127629&amp;action=3Dedit" title=3D"kernel oops">[d=
etails]</a></span>
kernel oops

got a pagefault today, attached below

gf100_vm_flush+0xc8 is
<a href=3D"https://github.com/karolherbst/nouveau/blob/caab1df6e3b32d2eca7e=
82819a7dd4cb99911d71/drm/nouveau/nvkm/subdev/mmu/gf100.c#L183">https://gith=
ub.com/karolherbst/nouveau/blob/caab1df6e3b32d2eca7e82819a7dd4cb99911d71/dr=
m/nouveau/nvkm/subdev/mmu/gf100.c#L183</a>
-+ gdb mistake

was running chromium prime offloaded and civilisation 5 with mareks gl
threading branch</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14778488521.8f6fb84.31354--

--===============0849577833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0849577833==--
