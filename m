From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103284] New: Unable to handle kernel NULL pointer
 dereference on 4.13.0-1-sparc64-smp
Date: Sun, 15 Oct 2017 21:59:18 +0000
Message-ID: <bug-103284-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1547287885=="
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


--===============1547287885==
Content-Type: multipart/alternative; boundary="15081047580.11Bd.4681";
 charset="UTF-8"


--15081047580.11Bd.4681
Date: Sun, 15 Oct 2017 21:59:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103284

            Bug ID: 103284
           Summary: Unable to handle kernel NULL pointer dereference on
                    4.13.0-1-sparc64-smp
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: theholyettlz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 134850
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D134850&action=3Dedit
dmesg with oops

dmesg output attached.

I'll admit this is a somewhat bizarre hardware combination (PC GeForce 210 =
card
in a Sun Ultra 45), but it probably shouldn't Oops on a null pointer.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15081047580.11Bd.4681
Date: Sun, 15 Oct 2017 21:59:18 +0000
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
   title=3D"NEW - Unable to handle kernel NULL pointer dereference on 4.13.=
0-1-sparc64-smp"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103284">103284</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Unable to handle kernel NULL pointer dereference on 4.13.0-1-=
sparc64-smp
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
          <td>theholyettlz&#64;googlemail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D134850=
" name=3D"attach_134850" title=3D"dmesg with oops">attachment 134850</a> <a=
 href=3D"attachment.cgi?id=3D134850&amp;action=3Dedit" title=3D"dmesg with =
oops">[details]</a></span>
dmesg with oops

dmesg output attached.

I'll admit this is a somewhat bizarre hardware combination (PC GeForce 210 =
card
in a Sun Ultra 45), but it probably shouldn't Oops on a null pointer.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15081047580.11Bd.4681--

--===============1547287885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1547287885==--
