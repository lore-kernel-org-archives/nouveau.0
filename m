From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98656] New: [NVE6] Nouveau hangs after opening
 Chromium on GNOME 3
Date: Wed, 09 Nov 2016 11:13:18 +0000
Message-ID: <bug-98656-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1563582155=="
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


--===============1563582155==
Content-Type: multipart/alternative; boundary="14786899980.FfEa28A.16333";
 charset="UTF-8"


--14786899980.FfEa28A.16333
Date: Wed, 9 Nov 2016 11:13:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98656

            Bug ID: 98656
           Summary: [NVE6] Nouveau hangs after opening Chromium on GNOME 3
           Product: Mesa
           Version: 13.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pgkos.bugzilla-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 127865
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D127865&action=3Dedit
dmesg output

A few seconds after opening Chromium web browser on GNOME 3 Desktop everyth=
ing
hangs, keyboard and mouse stop working, mouse pointer is not movable.

Graphics card: NVIDIA GK106 [GeForce GTX 660]

Chromium: version 54.0.2840.90
GNOME 3 Desktop: version 3.22.2
Xorg server: version 1.18.4
Linux kernel: version 4.8.6
libdrm: version 2.4.71
Nouveau: version 1.0.13
Mesa: version 13.0.0

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14786899980.FfEa28A.16333
Date: Wed, 9 Nov 2016 11:13:18 +0000
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
   title=3D"NEW - [NVE6] Nouveau hangs after opening Chromium on GNOME 3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98656">98656</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE6] Nouveau hangs after opening Chromium on GNOME 3
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>13.0
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
          <td>pgkos.bugzilla&#64;yahoo.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D127865=
" name=3D"attach_127865" title=3D"dmesg output">attachment 127865</a> <a hr=
ef=3D"attachment.cgi?id=3D127865&amp;action=3Dedit" title=3D"dmesg output">=
[details]</a></span>
dmesg output

A few seconds after opening Chromium web browser on GNOME 3 Desktop everyth=
ing
hangs, keyboard and mouse stop working, mouse pointer is not movable.

Graphics card: NVIDIA GK106 [GeForce GTX 660]

Chromium: version 54.0.2840.90
GNOME 3 Desktop: version 3.22.2
Xorg server: version 1.18.4
Linux kernel: version 4.8.6
libdrm: version 2.4.71
Nouveau: version 1.0.13
Mesa: version 13.0.0</pre>
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

--14786899980.FfEa28A.16333--

--===============1563582155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1563582155==--
