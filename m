From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106592] New: 2nd GPU / screen not detected after
 driver / xorg update
Date: Mon, 21 May 2018 10:55:01 +0000
Message-ID: <bug-106592-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0078187807=="
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


--===============0078187807==
Content-Type: multipart/alternative; boundary="15269001010.4fd2E75.24833"
Content-Transfer-Encoding: 7bit


--15269001010.4fd2E75.24833
Date: Mon, 21 May 2018 10:55:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106592

            Bug ID: 106592
           Summary: 2nd GPU / screen not detected after driver / xorg
                    update
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: atila.neves-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

This is on Arch Linux. After an update, my 2nd monitor was no longer detect=
ed.
I downgraded nouveau to the Arch package version 1.0.15-2 (from 1.0.15-3) a=
nd
the problem went away. I also had to downgrade xorg-server due to dependency
issues, so it's possible the problem could be there and not in nouveau itse=
lf.
My xorg-server package is now xorg-server-1.19.6+13+gd0d1a694f-2, down from
xorg-server-1.20.0-2.

Both monitors work fine in the downgraded configuration, but only one works
with the latest updates.

When things weren't working, /var/log/Xorg.0.log showed the message "failed=
 to
find screen to remove" for one of the GPUs. This is no longer the case after
the downgrade.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15269001010.4fd2E75.24833
Date: Mon, 21 May 2018 10:55:01 +0000
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
   title=3D"NEW - 2nd GPU / screen not detected after driver / xorg update"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106592">106592</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>2nd GPU / screen not detected after driver / xorg update
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
          <td>blocker
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
          <td>atila.neves&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>This is on Arch Linux. After an update, my 2nd monitor was no =
longer detected.
I downgraded nouveau to the Arch package version 1.0.15-2 (from 1.0.15-3) a=
nd
the problem went away. I also had to downgrade xorg-server due to dependency
issues, so it's possible the problem could be there and not in nouveau itse=
lf.
My xorg-server package is now xorg-server-1.19.6+13+gd0d1a694f-2, down from
xorg-server-1.20.0-2.

Both monitors work fine in the downgraded configuration, but only one works
with the latest updates.

When things weren't working, /var/log/Xorg.0.log showed the message &quot;f=
ailed to
find screen to remove&quot; for one of the GPUs. This is no longer the case=
 after
the downgrade.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15269001010.4fd2E75.24833--

--===============0078187807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0078187807==--
