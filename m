From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97620] New: [REGRESSION] KMS having issues after
 kernel upgrade (4.5.1-1 to 4.6.4-1)
Date: Wed, 07 Sep 2016 03:39:04 +0000
Message-ID: <bug-97620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0800331463=="
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


--===============0800331463==
Content-Type: multipart/alternative; boundary="14732195440.9FA3C1c9.26064";
 charset="UTF-8"


--14732195440.9FA3C1c9.26064
Date: Wed, 7 Sep 2016 03:39:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97620

            Bug ID: 97620
           Summary: [REGRESSION] KMS having issues after kernel upgrade
                    (4.5.1-1 to 4.6.4-1)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: lukeisgreat-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 126259
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D126259&action=3Dedit
working kernel version

Originally diagnosed in https://bbs.archlinux.org/viewtopic.php?id=3D216364

distro is Arch. Music studio machine with an nvidia GeForce GTX 460 and
"ACHIEVA Shimian QH270-Lite 27" Wide QHD PC Monitor DVI-D 2560x1440" connec=
ted
via DVI.

Have been using nouveau without issue since 2012. Kernel update from 4.5.1-=
1 to
(4.6.4-1 or 4.6.7-rt11-2-rt) causes a lower than standard resolution during
kernel messages then no video once X attempts to start. Reverting to 4.5.1-1
works perfectly. "nomodeset single" kernel options allow me to get to a
terminal.

some package versions that don't change between kernels:
extra/mesa 12.0.2-1 [installed]
extra/xf86-video-nouveau 1.0.12-2 (xorg-drivers xorg) [installed]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14732195440.9FA3C1c9.26064
Date: Wed, 7 Sep 2016 03:39:04 +0000
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
   title=3D"NEW - [REGRESSION] KMS having issues after kernel upgrade (4.5.=
1-1 to 4.6.4-1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620">97620</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[REGRESSION] KMS having issues after kernel upgrade (4.5.1-1 =
to 4.6.4-1)
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
          <td>lukeisgreat&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D126259=
" name=3D"attach_126259" title=3D"working kernel version">attachment 126259=
</a> <a href=3D"attachment.cgi?id=3D126259&amp;action=3Dedit" title=3D"work=
ing kernel version">[details]</a></span>
working kernel version

Originally diagnosed in <a href=3D"https://bbs.archlinux.org/viewtopic.php?=
id=3D216364">https://bbs.archlinux.org/viewtopic.php?id=3D216364</a>

distro is Arch. Music studio machine with an nvidia GeForce GTX 460 and
&quot;ACHIEVA Shimian QH270-Lite 27&quot; Wide QHD PC Monitor DVI-D 2560x14=
40&quot; connected
via DVI.

Have been using nouveau without issue since 2012. Kernel update from 4.5.1-=
1 to
(4.6.4-1 or 4.6.7-rt11-2-rt) causes a lower than standard resolution during
kernel messages then no video once X attempts to start. Reverting to 4.5.1-1
works perfectly. &quot;nomodeset single&quot; kernel options allow me to ge=
t to a
terminal.

some package versions that don't change between kernels:
extra/mesa 12.0.2-1 [installed]
extra/xf86-video-nouveau 1.0.12-2 (xorg-drivers xorg) [installed]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14732195440.9FA3C1c9.26064--

--===============0800331463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0800331463==--
