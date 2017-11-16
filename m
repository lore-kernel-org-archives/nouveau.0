From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103780] New: Nouveau causes lockup - fifo: read
 fault at 00005ac000 engine 00 [GR] client 02 [GPC1/PE_0] reason 02 [PTE] on
 channel 24 [103b5b2000 Xwayland[1507]]
Date: Thu, 16 Nov 2017 15:44:20 +0000
Message-ID: <bug-103780-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1170315656=="
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


--===============1170315656==
Content-Type: multipart/alternative; boundary="15108470600.4c4a.16125";
 charset="UTF-8"


--15108470600.4c4a.16125
Date: Thu, 16 Nov 2017 15:44:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103780

            Bug ID: 103780
           Summary: Nouveau causes lockup - fifo: read fault at 00005ac000
                    engine 00 [GR] client 02 [GPC1/PE_0] reason 02 [PTE]
                    on channel 24 [103b5b2000 Xwayland[1507]]
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: n.honnef-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 135521
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D135521&action=3Dedit
Journalctl log

This is on a fresh Fedora 27 installation with Gnome 3.26 on Wayland. It se=
ems
to happen randomly about 5-30 min after login.

CPU: Intel Core i5-3570K
GPU: NVIDIA Corporation GM204 [GeForce GTX 970]
Kernel: 4.13.12-300.fc27.x86_64

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15108470600.4c4a.16125
Date: Thu, 16 Nov 2017 15:44:20 +0000
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
   title=3D"NEW - Nouveau causes lockup - fifo: read fault at 00005ac000 en=
gine 00 [GR] client 02 [GPC1/PE_0] reason 02 [PTE] on channel 24 [103b5b200=
0 Xwayland[1507]]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103780">103780</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau causes lockup - fifo: read fault at 00005ac000 engine=
 00 [GR] client 02 [GPC1/PE_0] reason 02 [PTE] on channel 24 [103b5b2000 Xw=
ayland[1507]]
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
          <td>n.honnef&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D135521=
" name=3D"attach_135521" title=3D"Journalctl log">attachment 135521</a> <a =
href=3D"attachment.cgi?id=3D135521&amp;action=3Dedit" title=3D"Journalctl l=
og">[details]</a></span>
Journalctl log

This is on a fresh Fedora 27 installation with Gnome 3.26 on Wayland. It se=
ems
to happen randomly about 5-30 min after login.

CPU: Intel Core i5-3570K
GPU: NVIDIA Corporation GM204 [GeForce GTX 970]
Kernel: 4.13.12-300.fc27.x86_64</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15108470600.4c4a.16125--

--===============1170315656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1170315656==--
