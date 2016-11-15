From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98736] New: Resume after hibernate results in a
 black screen. Emergency keys does not work
Date: Tue, 15 Nov 2016 13:05:40 +0000
Message-ID: <bug-98736-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1562527735=="
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


--===============1562527735==
Content-Type: multipart/alternative; boundary="14792151410.9ab9A11E.8331";
 charset="UTF-8"


--14792151410.9ab9A11E.8331
Date: Tue, 15 Nov 2016 13:05:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98736

            Bug ID: 98736
           Summary: Resume after hibernate results in a black screen.
                    Emergency keys does not work
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: dikiy_evrej-S0/GAf8tV78@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 127978
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D127978&action=3Dedit
Dmesg output

1. Hibernate
2. resume
3. Black screen, SysRq keys dos not work. Need to turn off the Notebook.

This happens with a tuxonice-kernel too. With proprietary nvidia-driver the
resume sometimes (25-30% of all reumes) hangs up too.

With the old 2.6.*-kernel and proprietary driver there where any problems on
this hardware.

With the turned off video-driver and with an active vesa-driver the resume
success with a heavy distort of the screen. But it could be seen, that all
other hardware functions ok. There is the possibility to input the commands,
etc.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14792151410.9ab9A11E.8331
Date: Tue, 15 Nov 2016 13:05:41 +0000
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
   title=3D"NEW - Resume after hibernate results in a black screen. Emergen=
cy keys does not work"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98736">98736</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Resume after hibernate results in a black screen. Emergency k=
eys does not work
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
          <td>dikiy_evrej&#64;web.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D127978=
" name=3D"attach_127978" title=3D"Dmesg output">attachment 127978</a> <a hr=
ef=3D"attachment.cgi?id=3D127978&amp;action=3Dedit" title=3D"Dmesg output">=
[details]</a></span>
Dmesg output

1. Hibernate
2. resume
3. Black screen, SysRq keys dos not work. Need to turn off the Notebook.

This happens with a tuxonice-kernel too. With proprietary nvidia-driver the
resume sometimes (25-30% of all reumes) hangs up too.

With the old 2.6.*-kernel and proprietary driver there where any problems on
this hardware.

With the turned off video-driver and with an active vesa-driver the resume
success with a heavy distort of the screen. But it could be seen, that all
other hardware functions ok. There is the possibility to input the commands,
etc.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14792151410.9ab9A11E.8331--

--===============1562527735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1562527735==--
