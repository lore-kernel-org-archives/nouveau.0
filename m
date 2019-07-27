From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111230] New: core dumped while using Rstudio
Date: Sat, 27 Jul 2019 11:20:24 +0000
Message-ID: <bug-111230-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0372264192=="
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


--===============0372264192==
Content-Type: multipart/alternative; boundary="15642264261.42fBdD.12117"
Content-Transfer-Encoding: 7bit


--15642264261.42fBdD.12117
Date: Sat, 27 Jul 2019 11:20:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111230

            Bug ID: 111230
           Summary: core dumped while using Rstudio
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bdurette.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 144881
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144881&action=3Dedit
kernel log file

I used Rstudio for professional use. When using the xorg nouveau driver on
Ubuntu 18, Rstudio "crashes" after a while producing a core dumped error (s=
ee
console output below). The bus has allready been filed in the Rstudio webpa=
ge :
 https://github.com/rstudio/rstudio/issues/3781. Kernel-log file is attached

nouveau: kernel rejected pushbuf: Aucun fichier ou dossier de ce type
nouveau: ch4: krec 0 pushes 0 bufs 2 relocs 0
nouveau: ch4: buf 00000000 00000003 00000004 00000004 00000000
nouveau: ch4: buf 00000001 00000006 00000004 00000000 00000004
nouveau: kernel rejected pushbuf: Aucun fichier ou dossier de ce type
nouveau: ch4: krec 0 pushes 0 bufs 2 relocs 0
nouveau: ch4: buf 00000000 00000005 00000004 00000004 00000000
nouveau: ch4: buf 00000001 00000006 00000004 00000000 00000004
nouveau: ch4: buf 00000002 00000022 00000004 00000004 00000000
nouveau: kernel rejected pushbuf: Aucun fichier ou dossier de ce type
nouveau: ch4: krec 0 pushes 0 bufs 2 relocs 0
nouveau: ch4: buf 00000000 00000003 00000004 00000004 00000000
nouveau: ch4: buf 00000001 00000006 00000004 00000000 00000004
Received signal 11 SEGV_MAPERR 7fd01f32c000
Erreur de segmentation (core dumped)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15642264261.42fBdD.12117
Date: Sat, 27 Jul 2019 11:20:26 +0000
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
   title=3D"NEW - core dumped while using Rstudio"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111230">111230</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>core dumped while using Rstudio
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>critical
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
          <td>bdurette.pro&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144881=
" name=3D"attach_144881" title=3D"kernel log file">attachment 144881</a> <a=
 href=3D"attachment.cgi?id=3D144881&amp;action=3Dedit" title=3D"kernel log =
file">[details]</a></span>
kernel log file

I used Rstudio for professional use. When using the xorg nouveau driver on
Ubuntu 18, Rstudio &quot;crashes&quot; after a while producing a core dumpe=
d error (see
console output below). The bus has allready been filed in the Rstudio webpa=
ge :
 <a href=3D"https://github.com/rstudio/rstudio/issues/3781">https://github.=
com/rstudio/rstudio/issues/3781</a>. Kernel-log file is attached

nouveau: kernel rejected pushbuf: Aucun fichier ou dossier de ce type
nouveau: ch4: krec 0 pushes 0 bufs 2 relocs 0
nouveau: ch4: buf 00000000 00000003 00000004 00000004 00000000
nouveau: ch4: buf 00000001 00000006 00000004 00000000 00000004
nouveau: kernel rejected pushbuf: Aucun fichier ou dossier de ce type
nouveau: ch4: krec 0 pushes 0 bufs 2 relocs 0
nouveau: ch4: buf 00000000 00000005 00000004 00000004 00000000
nouveau: ch4: buf 00000001 00000006 00000004 00000000 00000004
nouveau: ch4: buf 00000002 00000022 00000004 00000004 00000000
nouveau: kernel rejected pushbuf: Aucun fichier ou dossier de ce type
nouveau: ch4: krec 0 pushes 0 bufs 2 relocs 0
nouveau: ch4: buf 00000000 00000003 00000004 00000004 00000000
nouveau: ch4: buf 00000001 00000006 00000004 00000000 00000004
Received signal 11 SEGV_MAPERR 7fd01f32c000
Erreur de segmentation (core dumped)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15642264261.42fBdD.12117--

--===============0372264192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0372264192==--
