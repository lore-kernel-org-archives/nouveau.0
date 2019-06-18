From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110931] New: Timeout initializing Falcon after cold
 boot
Date: Tue, 18 Jun 2019 00:42:38 +0000
Message-ID: <bug-110931-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1784026564=="
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


--===============1784026564==
Content-Type: multipart/alternative; boundary="15608185582.4Ee3.19990"
Content-Transfer-Encoding: 7bit


--15608185582.4Ee3.19990
Date: Tue, 18 Jun 2019 00:42:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110931

            Bug ID: 110931
           Summary: Timeout initializing Falcon after cold boot
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: taranov.andrey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 144579
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144579&action=3Dedit
Failing kernel log

I've got a fairly recent Dell/Alienware GTX 1080. It fails on
initializing/resetting the Falcon during boot, and is not usable by Xorg
subsequently. See *-bad.log attachments.

Workaround: boot into Windows, and reboot into Linux. Everything works fine
after that. See *-good.log attachments.

Initialization timeout happens in acr_ls_sec2_post_run(), in
ls_ucode_msgqueue.c. The corresponding Xorg driver error message is "Failed=
 to
initialise context object: 2D_NVC0 (0)"

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15608185582.4Ee3.19990
Date: Tue, 18 Jun 2019 00:42:38 +0000
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
   title=3D"NEW - Timeout initializing Falcon after cold boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110931">110931</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Timeout initializing Falcon after cold boot
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
          <td>taranov.andrey&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144579=
" name=3D"attach_144579" title=3D"Failing kernel log">attachment 144579</a>=
 <a href=3D"attachment.cgi?id=3D144579&amp;action=3Dedit" title=3D"Failing =
kernel log">[details]</a></span>
Failing kernel log

I've got a fairly recent Dell/Alienware GTX 1080. It fails on
initializing/resetting the Falcon during boot, and is not usable by Xorg
subsequently. See *-bad.log attachments.

Workaround: boot into Windows, and reboot into Linux. Everything works fine
after that. See *-good.log attachments.

Initialization timeout happens in acr_ls_sec2_post_run(), in
ls_ucode_msgqueue.c. The corresponding Xorg driver error message is &quot;F=
ailed to
initialise context object: 2D_NVC0 (0)&quot;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15608185582.4Ee3.19990--

--===============1784026564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1784026564==--
