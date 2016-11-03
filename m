From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98577] New: Graphical issues with the game SOMA
Date: Thu, 03 Nov 2016 17:13:48 +0000
Message-ID: <bug-98577-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1465486661=="
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


--===============1465486661==
Content-Type: multipart/alternative; boundary="14781932280.804c.17829";
 charset="UTF-8"


--14781932280.804c.17829
Date: Thu, 3 Nov 2016 17:13:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98577

            Bug ID: 98577
           Summary: Graphical issues with the game SOMA
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ovariegata-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 127730
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D127730&action=3Dedit
Incorrectly rendered steam with GK110B

In the proprietary game SOMA (GOG version) the steam (Hot air) will render
incorrectly. Otherwise the game will run correctly with nouveau. Unfortunat=
ely
llvmpipe will blackscreen when trying to replay the trace and it will occur
with both DRI3 and DRI2. So I sent the trace to a friend using amd (R9 290)=
 and
he was not able to reproduce it.

Here is the trace -
http://ks392457.kimsufi.com/orbea/stuff/trace/Soma.bin.x86_64.trace.xz
(Size: 652M)

I am testing this with a GTX 780 Ti (GK110B).

libdrm-2016.10.21_2d8c01f_master-x86_64-1_git
mesa-2016.11.02_d2861d6_master-x86_64-1_git

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14781932280.804c.17829
Date: Thu, 3 Nov 2016 17:13:48 +0000
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
   title=3D"NEW - Graphical issues with the game SOMA"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98577">98577</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Graphical issues with the game SOMA
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D127730=
" name=3D"attach_127730" title=3D"Incorrectly rendered steam with GK110B">a=
ttachment 127730</a> <a href=3D"attachment.cgi?id=3D127730&amp;action=3Dedi=
t" title=3D"Incorrectly rendered steam with GK110B">[details]</a></span>
Incorrectly rendered steam with GK110B

In the proprietary game SOMA (GOG version) the steam (Hot air) will render
incorrectly. Otherwise the game will run correctly with nouveau. Unfortunat=
ely
llvmpipe will blackscreen when trying to replay the trace and it will occur
with both DRI3 and DRI2. So I sent the trace to a friend using amd (R9 290)=
 and
he was not able to reproduce it.

Here is the trace -
<a href=3D"http://ks392457.kimsufi.com/orbea/stuff/trace/Soma.bin.x86_64.tr=
ace.xz">http://ks392457.kimsufi.com/orbea/stuff/trace/Soma.bin.x86_64.trace=
.xz</a>
(Size: 652M)

I am testing this with a GTX 780 Ti (GK110B).

libdrm-2016.10.21_2d8c01f_master-x86_64-1_git
mesa-2016.11.02_d2861d6_master-x86_64-1_git</pre>
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

--14781932280.804c.17829--

--===============1465486661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1465486661==--
