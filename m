From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96737] New: G98: LightDM 1 : 0 Nouveau
Date: Wed, 29 Jun 2016 23:36:34 +0000
Message-ID: <bug-96737-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0606733457=="
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


--===============0606733457==
Content-Type: multipart/alternative; boundary="14672433943.56b9dd49.21869";
 charset="UTF-8"


--14672433943.56b9dd49.21869
Date: Wed, 29 Jun 2016 23:36:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96737

            Bug ID: 96737
           Summary: G98: LightDM 1 : 0 Nouveau
           Product: xorg
           Version: git
          Hardware: All
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
                CC: eric.koegel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robert.ancell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

Created attachment 124789
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D124789&action=3Dedit
nouveau log

LightDM - Light Display Manager -breaks- Nouveau - Linux kernel KMS driver

Breakage starts with:
https://bazaar.launchpad.net/~lightdm-team/lightdm/1.18/revision/2319
preventing the use of upgrades - lightdm 1.18.2, 1.19.1, 1.19.2, ...

Also tested with:
4.7.0-0.rc5.git1.1.fc25.x86_64
and
https://github.com/skeggsb/nouveau.git
commit bd320d9b0ee2f2443f7568e06bdc33a35cfb24ea
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Jun 27 16:49:24 2016 +1000
...

How to reproduce:
Re-log
or
Swith User, afterwards Re-log
via Xfce session manager

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14672433943.56b9dd49.21869
Date: Wed, 29 Jun 2016 23:36:34 +0000
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
   title=3D"NEW - G98: LightDM 1 : 0 Nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96737">96737</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>G98: LightDM 1 : 0 Nouveau
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
          <td>All
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
          <td>pomidorabelisima&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>CC</th>
          <td>eric.koegel&#64;gmail.com, robert.ancell&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D124789=
" name=3D"attach_124789" title=3D"nouveau log">attachment 124789</a> <a hre=
f=3D"attachment.cgi?id=3D124789&amp;action=3Dedit" title=3D"nouveau log">[d=
etails]</a></span>
nouveau log

LightDM - Light Display Manager -breaks- Nouveau - Linux kernel KMS driver

Breakage starts with:
<a href=3D"https://bazaar.launchpad.net/~lightdm-team/lightdm/1.18/revision=
/2319">https://bazaar.launchpad.net/~lightdm-team/lightdm/1.18/revision/231=
9</a>
preventing the use of upgrades - lightdm 1.18.2, 1.19.1, 1.19.2, ...

Also tested with:
4.7.0-0.rc5.git1.1.fc25.x86_64
and
<a href=3D"https://github.com/skeggsb/nouveau.git">https://github.com/skegg=
sb/nouveau.git</a>
commit bd320d9b0ee2f2443f7568e06bdc33a35cfb24ea
Author: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com">bskeggs&#6=
4;redhat.com</a>&gt;
Date:   Mon Jun 27 16:49:24 2016 +1000
...

How to reproduce:
Re-log
or
Swith User, afterwards Re-log
via Xfce session manager</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14672433943.56b9dd49.21869--

--===============0606733457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0606733457==--
