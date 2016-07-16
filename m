From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96952] New: Noveau driver doesn't working well when
	in Kdenlive
Date: Sat, 16 Jul 2016 00:24:55 +0000
Message-ID: <bug-96952-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1991622488=="
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


--===============1991622488==
Content-Type: multipart/alternative; boundary="14686286950.1dE2.25619";
 charset="UTF-8"


--14686286950.1dE2.25619
Date: Sat, 16 Jul 2016 00:24:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96952

            Bug ID: 96952
           Summary: Noveau driver doesn't working well when in Kdenlive
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: rafaelantoniofavero-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Recently I'm having dificulties with Kdenlive, in the logs os Ubuntu 15.10,
there was a issue involving the noveau driver. Log in next.

Log:

Jul 10 19:09:06 Rafael-desktop gnome-session[1605]: QXcbConnection: XCB err=
or:
8 (BadMatch), sequence: 7899, resource id: 60817680, major code: 130 (Unkno=
wn),
minor code: 3
Jul 10 19:09:06 Rafael-desktop gnome-session[1605]: QXcbConnection: XCB err=
or:
8 (BadMatch), sequence: 7947, resource id: 60817680, major code: 130 (Unkno=
wn),
minor code: 3
Jul 10 19:09:10 Rafael-desktop gnome-session[1605]: QXcbConnection: XCB err=
or:
8 (BadMatch), sequence: 19520, resource id: 60817680, major code: 130
(Unknown), minor code: 3
Jul 10 19:09:10 Rafael-desktop gnome-session[1605]: QXcbConnection: XCB err=
or:
8 (BadMatch), sequence: 19548, resource id: 60817680, major code: 130
(Unknown), minor code: 3
Jul 10 19:09:10 Rafael-desktop gnome-session[1605]: QXcbConnection: XCB err=
or:
8 (BadMatch), sequence: 19639, resource id: 60817680, major code: 130
(Unknown), minor code: 3
Jul 10 19:09:11 Rafael-desktop gnome-session[1605]: nouveau: kernel rejected
pushbuf: Arquivo ou diret=C3=B3rio n=C3=A3o encontrado
Jul 10 19:09:11 Rafael-desktop gnome-session[1605]: nouveau: ch0: krec 0 pu=
shes
0 bufs 2 relocs 0
Jul 10 19:09:11 Rafael-desktop gnome-session[1605]: nouveau: ch0: buf 00000=
000
00000002 00000004 00000004 00000000
Jul 10 19:09:11 Rafael-desktop gnome-session[1605]: nouveau: ch0: buf 00000=
001
00000006 00000004 00000000 00000004
Jul 10 19:09:11 Rafael-desktop kernel: [ 8475.196277] nouveau E[kdenlive[58=
04]]
Unknown handle 0x0000001d
Jul 10 19:09:11 Rafael-desktop kernel: [ 8475.196286] nouveau E[kdenlive[58=
04]]
validate_init
Jul 10 19:09:11 Rafael-desktop kernel: [ 8475.196287] nouveau E[kdenlive[58=
04]]
validate: -2
Jul 10 19:09:12 Rafael-desktop kernel: [ 8476.033404] show_signal_msg: 45
callbacks suppressed
Jul 10 19:09:12 Rafael-desktop kernel: [ 8476.033411] FrameRenderer[5821]:
segfault at 8 ip 00007f967805f58c sp 00007f96477fd680 error 4 in
libdrm_nouveau.so.2.0.0[7f967805c000+6000]

I have a NVidia 210 GeForce.
It's my first time here and if I made a mistake sorry, wasn't my pretention.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14686286950.1dE2.25619
Date: Sat, 16 Jul 2016 00:24:55 +0000
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
   title=3D"NEW - Noveau driver doesn't working well when in Kdenlive"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96952">96952</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Noveau driver doesn't working well when in Kdenlive
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
          <td>rafaelantoniofavero&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Recently I'm having dificulties with Kdenlive, in the logs os =
Ubuntu 15.10,
there was a issue involving the noveau driver. Log in next.

Log:

Jul 10 19:09:06 Rafael-desktop gnome-session[1605]: QXcbConnection: XCB err=
or:
8 (BadMatch), sequence: 7899, resource id: 60817680, major code: 130 (Unkno=
wn),
minor code: 3
Jul 10 19:09:06 Rafael-desktop gnome-session[1605]: QXcbConnection: XCB err=
or:
8 (BadMatch), sequence: 7947, resource id: 60817680, major code: 130 (Unkno=
wn),
minor code: 3
Jul 10 19:09:10 Rafael-desktop gnome-session[1605]: QXcbConnection: XCB err=
or:
8 (BadMatch), sequence: 19520, resource id: 60817680, major code: 130
(Unknown), minor code: 3
Jul 10 19:09:10 Rafael-desktop gnome-session[1605]: QXcbConnection: XCB err=
or:
8 (BadMatch), sequence: 19548, resource id: 60817680, major code: 130
(Unknown), minor code: 3
Jul 10 19:09:10 Rafael-desktop gnome-session[1605]: QXcbConnection: XCB err=
or:
8 (BadMatch), sequence: 19639, resource id: 60817680, major code: 130
(Unknown), minor code: 3
Jul 10 19:09:11 Rafael-desktop gnome-session[1605]: nouveau: kernel rejected
pushbuf: Arquivo ou diret=C3=B3rio n=C3=A3o encontrado
Jul 10 19:09:11 Rafael-desktop gnome-session[1605]: nouveau: ch0: krec 0 pu=
shes
0 bufs 2 relocs 0
Jul 10 19:09:11 Rafael-desktop gnome-session[1605]: nouveau: ch0: buf 00000=
000
00000002 00000004 00000004 00000000
Jul 10 19:09:11 Rafael-desktop gnome-session[1605]: nouveau: ch0: buf 00000=
001
00000006 00000004 00000000 00000004
Jul 10 19:09:11 Rafael-desktop kernel: [ 8475.196277] nouveau E[kdenlive[58=
04]]
Unknown handle 0x0000001d
Jul 10 19:09:11 Rafael-desktop kernel: [ 8475.196286] nouveau E[kdenlive[58=
04]]
validate_init
Jul 10 19:09:11 Rafael-desktop kernel: [ 8475.196287] nouveau E[kdenlive[58=
04]]
validate: -2
Jul 10 19:09:12 Rafael-desktop kernel: [ 8476.033404] show_signal_msg: 45
callbacks suppressed
Jul 10 19:09:12 Rafael-desktop kernel: [ 8476.033411] FrameRenderer[5821]:
segfault at 8 ip 00007f967805f58c sp 00007f96477fd680 error 4 in
libdrm_nouveau.so.2.0.0[7f967805c000+6000]

I have a NVidia 210 GeForce.
It's my first time here and if I made a mistake sorry, wasn't my pretention=
.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14686286950.1dE2.25619--

--===============1991622488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1991622488==--
