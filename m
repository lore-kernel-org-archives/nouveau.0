From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: =?utf-8?q?=5BBug_100167=5D_New=3A__nouveau_sometimes_do?=
 =?utf-8?q?esn=E2=80=99t_resume_properly_from_suspend?=
Date: Sun, 12 Mar 2017 14:09:59 +0000
Message-ID: <bug-100167-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1616436985=="
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


--===============1616436985==
Content-Type: multipart/alternative; boundary="14893277991.858b3.31969";
 charset="UTF-8"


--14893277991.858b3.31969
Date: Sun, 12 Mar 2017 14:09:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100167

            Bug ID: 100167
           Summary: nouveau sometimes doesn=E2=80=99t resume properly from =
suspend
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: silverunicorn2011-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 130172
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D130172&action=3Dedit
dmesg output

It happens after resume; sometimes it does not happen. It seems to be more
likely if RAM is full, although I have enough swap space.

The symptom is that X applications refuse to start, hanging in `drm_stub_op=
en`
(WCHAN column in `top`; status is `D` =E2=80=94 =E2=80=9Cuninterruptible sl=
eep=E2=80=9D). I can=E2=80=99t even
`kill -9` them: the command succeeds but nothing happens.

The first app to hang seems to be the screen locker; it locks the session b=
ut
fails to present anything on the screen, so I have to go to VT2 and use
`loginctl`. But VT switch becomes unreliable: switching from X to console
succeeds at second attempt (while switching back seems to succeed always).

Also I just found one app hanging in `nouveau_drm_preclose` (`D` too),
consuming zero RAM. (pid=3D6455, noticed in the log)

It=E2=80=99s strange but already running applications usually continue to w=
ork
properly.

I=E2=80=99ve noticed several Oopses in the dmesg output, hope that data wil=
l be
helpful.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14893277991.858b3.31969
Date: Sun, 12 Mar 2017 14:09:59 +0000
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
   title=3D"NEW - nouveau sometimes doesn=E2=80=99t resume properly from su=
spend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100167">100167</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau sometimes doesn=E2=80=99t resume properly from suspend
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
          <td>silverunicorn2011&#64;yandex.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D130172=
" name=3D"attach_130172" title=3D"dmesg output">attachment 130172</a> <a hr=
ef=3D"attachment.cgi?id=3D130172&amp;action=3Dedit" title=3D"dmesg output">=
[details]</a></span>
dmesg output

It happens after resume; sometimes it does not happen. It seems to be more
likely if RAM is full, although I have enough swap space.

The symptom is that X applications refuse to start, hanging in `drm_stub_op=
en`
(WCHAN column in `top`; status is `D` =E2=80=94 =E2=80=9Cuninterruptible sl=
eep=E2=80=9D). I can=E2=80=99t even
`kill -9` them: the command succeeds but nothing happens.

The first app to hang seems to be the screen locker; it locks the session b=
ut
fails to present anything on the screen, so I have to go to VT2 and use
`loginctl`. But VT switch becomes unreliable: switching from X to console
succeeds at second attempt (while switching back seems to succeed always).

Also I just found one app hanging in `nouveau_drm_preclose` (`D` too),
consuming zero RAM. (pid=3D6455, noticed in the log)

It=E2=80=99s strange but already running applications usually continue to w=
ork
properly.

I=E2=80=99ve noticed several Oopses in the dmesg output, hope that data wil=
l be
helpful.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14893277991.858b3.31969--

--===============1616436985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1616436985==--
