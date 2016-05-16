From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95429] New: NV46 G72M picture is always distorted on
	VGA output
Date: Mon, 16 May 2016 14:48:59 +0000
Message-ID: <bug-95429-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0302049668=="
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


--===============0302049668==
Content-Type: multipart/alternative; boundary="14634101391.49Bf6.16728";
 charset="UTF-8"


--14634101391.49Bf6.16728
Date: Mon, 16 May 2016 14:48:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95429

            Bug ID: 95429
           Summary: NV46 G72M picture is always distorted on VGA output
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: russianneuromancer-k+OT61UuxXo@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 123785
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D123785&action=3Dedit
photo

On laptops with G72M picture on VGA output is always wavy (please look into
attached photo). That was tested with two laptops (with 7300 Go and 7400 Go)
couple of projectors (800x600) and few displays (up to 1920x1080) - issue is
reproducible with any combination with any Linux that was released for late=
st
~three years (with Linux 4.6 too). Other issue is that VGA output is always
mirror of internal laptop screen, no matter what settings I set (again, as =
you
can see on attached photo).

01:00.0 VGA compatible controller: NVIDIA Corporation G72M [GeForce Go 7400]
(rev a1)

Issue is not reproducible with proprietary driver (however this driver have
other issues, like lack of proper V-Sync, and latest KWin is crash on nvidia
304 driver even if all effects disabled).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14634101391.49Bf6.16728
Date: Mon, 16 May 2016 14:48:59 +0000
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
   title=3D"NEW - NV46 G72M picture is always distorted on VGA output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95429">95429</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV46 G72M picture is always distorted on VGA output
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
          <td>russianneuromancer&#64;ya.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D123785=
" name=3D"attach_123785" title=3D"photo">attachment 123785</a> <a href=3D"a=
ttachment.cgi?id=3D123785&amp;action=3Dedit" title=3D"photo">[details]</a><=
/span>
photo

On laptops with G72M picture on VGA output is always wavy (please look into
attached photo). That was tested with two laptops (with 7300 Go and 7400 Go)
couple of projectors (800x600) and few displays (up to 1920x1080) - issue is
reproducible with any combination with any Linux that was released for late=
st
~three years (with Linux 4.6 too). Other issue is that VGA output is always
mirror of internal laptop screen, no matter what settings I set (again, as =
you
can see on attached photo).

01:00.0 VGA compatible controller: NVIDIA Corporation G72M [GeForce Go 7400]
(rev a1)

Issue is not reproducible with proprietary driver (however this driver have
other issues, like lack of proper V-Sync, and latest KWin is crash on nvidia
304 driver even if all effects disabled).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14634101391.49Bf6.16728--

--===============0302049668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0302049668==--
