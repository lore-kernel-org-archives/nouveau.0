From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96924] New: NVD7: new warnings on kernel 4.6.3 using
	nouveau
Date: Thu, 14 Jul 2016 00:41:02 +0000
Message-ID: <bug-96924-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1136187308=="
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


--===============1136187308==
Content-Type: multipart/alternative; boundary="14684568610.CF682e.28710";
 charset="UTF-8"


--14684568610.CF682e.28710
Date: Thu, 14 Jul 2016 00:41:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96924

            Bug ID: 96924
           Summary: NVD7: new warnings on kernel 4.6.3 using nouveau
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: marcos.souza.org-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 125062
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125062&action=3Dedit
dmesg

After upgrading to Fedora 24 (to kernel 4.6.3) nouveau shows new warnings. =
By
looking at nouveau driver, these messages happens on nouveau_bios.c file. T=
hese
are the new warnings:

[    2.670324] nouveau 0000:04:00.0: DRM: Pointer to TMDS table invalid
[    2.670326] nouveau 0000:04:00.0: DRM: Pointer to flat panel table inval=
id

I'm attaching here the full dmesg when the related warnings.

Thanks,

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14684568610.CF682e.28710
Date: Thu, 14 Jul 2016 00:41:01 +0000
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
   title=3D"NEW - NVD7: new warnings on kernel 4.6.3 using nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96924">96924</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NVD7: new warnings on kernel 4.6.3 using nouveau
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
          <td>marcos.souza.org&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D125062=
" name=3D"attach_125062" title=3D"dmesg">attachment 125062</a> <a href=3D"a=
ttachment.cgi?id=3D125062&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

After upgrading to Fedora 24 (to kernel 4.6.3) nouveau shows new warnings. =
By
looking at nouveau driver, these messages happens on nouveau_bios.c file. T=
hese
are the new warnings:

[    2.670324] nouveau 0000:04:00.0: DRM: Pointer to TMDS table invalid
[    2.670326] nouveau 0000:04:00.0: DRM: Pointer to flat panel table inval=
id

I'm attaching here the full dmesg when the related warnings.

Thanks,</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14684568610.CF682e.28710--

--===============1136187308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1136187308==--
