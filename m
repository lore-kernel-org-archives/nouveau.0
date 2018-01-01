From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104442] New: Vive causes "modeset fail"
Date: Mon, 01 Jan 2018 23:48:29 +0000
Message-ID: <bug-104442-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1092259354=="
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


--===============1092259354==
Content-Type: multipart/alternative; boundary="15148505080.baDb.1531";
 charset="UTF-8"


--15148505080.baDb.1531
Date: Mon, 1 Jan 2018 23:48:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104442

            Bug ID: 104442
           Summary: Vive causes "modeset fail"
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: simber2-FhtRXb7CoQBt1OO0OYaSVA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 136477
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136477&action=3Dedit
edid file for the vive

https://pastebin.com/Lipk1eVw dmesg from boot, error starts at line 327

In this case I attached the vive while the PC was running which caused a li=
ttle
freakout with my main display getting heavily distorted for a short time an=
d my
second monitor losing signal

https://pastebin.com/75Xb0UEi this is a continuation of the last dmesg, this
was when I tried to move displays in the display settings. Note the vive sh=
ows
up there while on windows it doesn't

Specs: Linux mint 18.2=20
GTX 1070
i5-3570k
16gb Ram
2 other monitors attached (note monitor 2 stopped receiving signal when vive
was attached)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15148505080.baDb.1531
Date: Mon, 1 Jan 2018 23:48:28 +0000
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
   title=3D"NEW - Vive causes &quot;modeset fail&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104442">104442</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Vive causes &quot;modeset fail&quot;
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
          <td>simber2&#64;btinternet.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136477=
" name=3D"attach_136477" title=3D"edid file for the vive">attachment 136477=
</a> <a href=3D"attachment.cgi?id=3D136477&amp;action=3Dedit" title=3D"edid=
 file for the vive">[details]</a></span>
edid file for the vive

<a href=3D"https://pastebin.com/Lipk1eVw">https://pastebin.com/Lipk1eVw</a>=
 dmesg from boot, error starts at line 327

In this case I attached the vive while the PC was running which caused a li=
ttle
freakout with my main display getting heavily distorted for a short time an=
d my
second monitor losing signal

<a href=3D"https://pastebin.com/75Xb0UEi">https://pastebin.com/75Xb0UEi</a>=
 this is a continuation of the last dmesg, this
was when I tried to move displays in the display settings. Note the vive sh=
ows
up there while on windows it doesn't

Specs: Linux mint 18.2=20
GTX 1070
i5-3570k
16gb Ram
2 other monitors attached (note monitor 2 stopped receiving signal when vive
was attached)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15148505080.baDb.1531--

--===============1092259354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1092259354==--
