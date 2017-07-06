From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101708] New: 'shader translation failed: -4' with
 dolphin-emu ubershaders
Date: Thu, 06 Jul 2017 13:40:21 +0000
Message-ID: <bug-101708-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1532905024=="
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


--===============1532905024==
Content-Type: multipart/alternative; boundary="14993484210.CC33F63.15628";
 charset="UTF-8"


--14993484210.CC33F63.15628
Date: Thu, 6 Jul 2017 13:40:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101708

            Bug ID: 101708
           Summary: 'shader translation failed: -4' with dolphin-emu
                    ubershaders
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ovariegata-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 132481
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D132481&action=3Dedit
Apitrace

When using the new ubershaders branch with dolphin-emu and nouveau it will
print this error:=20

nvc0_program_translate:610 - shader translation failed: -4

I have attached an apitrace showing the issue.

Note:

The exclusive ubershaders perform poorly with nouveau while the hybrid shad=
ers
perform well. Also a later commit in the ubershaders branch will crash with
nouveau as described here.

https://github.com/dolphin-emu/dolphin/pull/5702#issuecomment-313301072

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14993484210.CC33F63.15628
Date: Thu, 6 Jul 2017 13:40:21 +0000
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
   title=3D"NEW - 'shader translation failed: -4' with dolphin-emu ubershad=
ers"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101708">101708</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>'shader translation failed: -4' with dolphin-emu ubershaders
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ovariegata&#64;yahoo.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D132481=
" name=3D"attach_132481" title=3D"Apitrace">attachment 132481</a> <a href=
=3D"attachment.cgi?id=3D132481&amp;action=3Dedit" title=3D"Apitrace">[detai=
ls]</a></span>
Apitrace

When using the new ubershaders branch with dolphin-emu and nouveau it will
print this error:=20

nvc0_program_translate:610 - shader translation failed: -4

I have attached an apitrace showing the issue.

Note:

The exclusive ubershaders perform poorly with nouveau while the hybrid shad=
ers
perform well. Also a later commit in the ubershaders branch will crash with
nouveau as described here.

<a href=3D"https://github.com/dolphin-emu/dolphin/pull/5702#issuecomment-31=
3301072">https://github.com/dolphin-emu/dolphin/pull/5702#issuecomment-3133=
01072</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14993484210.CC33F63.15628--

--===============1532905024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1532905024==--
