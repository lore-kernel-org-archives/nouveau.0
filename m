From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111868] New: xorg with nouveau crash when starting
 mate-session in debian 10
Date: Mon, 30 Sep 2019 11:57:03 +0000
Message-ID: <bug-111868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1171630443=="
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


--===============1171630443==
Content-Type: multipart/alternative; boundary="15698446231.2a84C562f.9265"
Content-Transfer-Encoding: 7bit


--15698446231.2a84C562f.9265
Date: Mon, 30 Sep 2019 11:57:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111868

            Bug ID: 111868
           Summary: xorg with nouveau crash when starting mate-session in
                    debian 10
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: alain.prignet-oQvnLCQn66E@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 145592
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145592&action=3Dedit
xorg.0.log with xorg backtrace

Geforce 2 since debian 10 crash when starting mate-session (but not with
xfce4-session or showing gdm3 or lightdm).

I have also downgrade xorg-server-core to debian 9 and I get the same crash.
All was working with debian 9 (and 4.9 kernel).

I have tried 4.19 and 4.9 kernel : both crash.

If I launch mate-session from command line in a xfce4-session, mate-session
works.

The backtrace of Xorg.0.log is the same as
https://termbin.com/7avc
I put it in attachment since I have not the non working computer with me. L=
ater
I will give a working Xorg.0.log (with xfce4) and the non working (with mat=
e).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15698446231.2a84C562f.9265
Date: Mon, 30 Sep 2019 11:57:03 +0000
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
   title=3D"NEW - xorg with nouveau crash when starting mate-session in deb=
ian 10"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111868">111868</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>xorg with nouveau crash when starting mate-session in debian =
10
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
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
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
          <td>alain.prignet&#64;u-pem.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145592=
" name=3D"attach_145592" title=3D"xorg.0.log with xorg backtrace">attachmen=
t 145592</a> <a href=3D"attachment.cgi?id=3D145592&amp;action=3Dedit" title=
=3D"xorg.0.log with xorg backtrace">[details]</a></span>
xorg.0.log with xorg backtrace

Geforce 2 since debian 10 crash when starting mate-session (but not with
xfce4-session or showing gdm3 or lightdm).

I have also downgrade xorg-server-core to debian 9 and I get the same crash.
All was working with debian 9 (and 4.9 kernel).

I have tried 4.19 and 4.9 kernel : both crash.

If I launch mate-session from command line in a xfce4-session, mate-session
works.

The backtrace of Xorg.0.log is the same as
<a href=3D"https://termbin.com/7avc">https://termbin.com/7avc</a>
I put it in attachment since I have not the non working computer with me. L=
ater
I will give a working Xorg.0.log (with xfce4) and the non working (with mat=
e).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15698446231.2a84C562f.9265--

--===============1171630443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1171630443==--
