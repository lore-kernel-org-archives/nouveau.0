From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102648] New: unable to use nvidia gpu after suspend
Date: Mon, 11 Sep 2017 03:13:04 +0000
Message-ID: <bug-102648-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1335122806=="
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


--===============1335122806==
Content-Type: multipart/alternative; boundary="15050995840.7c8c.15061";
 charset="UTF-8"


--15050995840.7c8c.15061
Date: Mon, 11 Sep 2017 03:13:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102648

            Bug ID: 102648
           Summary: unable to use nvidia gpu after suspend
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: razorsis100-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 134145
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D134145&action=3Dedit
dmesg with the problem before and after suspend

Os: Arch X86_64 Updated regularly
System : Notebook Asus X556UR

Tried with bumblebee nvidia:
Works perefectly after boot
but after a suspend/wake optirun output: Failed to initialize secondary GPU

only way to make it work again is:=20
reboot or pci bus remove/rescan(doesn't work sometimes)

So I consulted with Lekensteyn and did numerous testings
checked nvidia card powermanagement, parent bus power mangement
PM is on for both but it just doesn't work after suspend/wake

switched to nouveau (removed bumblebee nvidia)
tested with lspci, no errors after boot
but after suspend/wake: DRM: failed to idle channel 0 [DRM]

So he suggested to file a bug for nouveau with kernel log and acpidump

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15050995840.7c8c.15061
Date: Mon, 11 Sep 2017 03:13:04 +0000
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
   title=3D"NEW - unable to use nvidia gpu after suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102648">102648</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>unable to use nvidia gpu after suspend
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
          <td>critical
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
          <td>razorsis100&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D134145=
" name=3D"attach_134145" title=3D"dmesg with the problem before and after s=
uspend">attachment 134145</a> <a href=3D"attachment.cgi?id=3D134145&amp;act=
ion=3Dedit" title=3D"dmesg with the problem before and after suspend">[deta=
ils]</a></span>
dmesg with the problem before and after suspend

Os: Arch X86_64 Updated regularly
System : Notebook Asus X556UR

Tried with bumblebee nvidia:
Works perefectly after boot
but after a suspend/wake optirun output: Failed to initialize secondary GPU

only way to make it work again is:=20
reboot or pci bus remove/rescan(doesn't work sometimes)

So I consulted with Lekensteyn and did numerous testings
checked nvidia card powermanagement, parent bus power mangement
PM is on for both but it just doesn't work after suspend/wake

switched to nouveau (removed bumblebee nvidia)
tested with lspci, no errors after boot
but after suspend/wake: DRM: failed to idle channel 0 [DRM]

So he suggested to file a bug for nouveau with kernel log and acpidump</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15050995840.7c8c.15061--

--===============1335122806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1335122806==--
