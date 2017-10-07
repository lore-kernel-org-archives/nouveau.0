From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103132] New: GTX 1060 6GB corrupts screen drawing in
 Kconsole and other apps
Date: Sat, 07 Oct 2017 10:18:39 +0000
Message-ID: <bug-103132-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0325433888=="
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


--===============0325433888==
Content-Type: multipart/alternative; boundary="15073715191.efF94dCA.12363";
 charset="UTF-8"


--15073715191.efF94dCA.12363
Date: Sat, 7 Oct 2017 10:18:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103132

            Bug ID: 103132
           Summary: GTX 1060 6GB corrupts screen drawing in Kconsole and
                    other apps
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: barry-LJgwZTY9oXz8xeUnPfcrCQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 134723
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D134723&action=3Dedit
dmesg output

After updating to fedora kernel 4.12.5-300 from 4.11.11-300 screen is drawn
with
corrupt areas.

For example login using KDE and start a new Konsole and start typing at the
bash prompt to see the problem.

Text is not drawn cleanly, it is overlayed with blobs that come and go.

Also seen in PyQt apps and firefix.

Problem is still present in 4.13.4-200.fc26.x86_64.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15073715191.efF94dCA.12363
Date: Sat, 7 Oct 2017 10:18:39 +0000
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
   title=3D"NEW - GTX 1060 6GB corrupts screen drawing in Kconsole and othe=
r apps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103132">103132</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GTX 1060 6GB corrupts screen drawing in Kconsole and other ap=
ps
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
          <td>barry&#64;barrys-emacs.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D134723=
" name=3D"attach_134723" title=3D"dmesg output">attachment 134723</a> <a hr=
ef=3D"attachment.cgi?id=3D134723&amp;action=3Dedit" title=3D"dmesg output">=
[details]</a></span>
dmesg output

After updating to fedora kernel 4.12.5-300 from 4.11.11-300 screen is drawn
with
corrupt areas.

For example login using KDE and start a new Konsole and start typing at the
bash prompt to see the problem.

Text is not drawn cleanly, it is overlayed with blobs that come and go.

Also seen in PyQt apps and firefix.

Problem is still present in 4.13.4-200.fc26.x86_64.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15073715191.efF94dCA.12363--

--===============0325433888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0325433888==--
