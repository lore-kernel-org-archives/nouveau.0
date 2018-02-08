From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105014] New: Freeze every 5 seconds on any action.
 Long time bug
Date: Thu, 08 Feb 2018 07:45:43 +0000
Message-ID: <bug-105014-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1347790355=="
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


--===============1347790355==
Content-Type: multipart/alternative; boundary="15180759430.d5d4B.18231"
Content-Transfer-Encoding: 7bit


--15180759430.d5d4B.18231
Date: Thu, 8 Feb 2018 07:45:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105014

            Bug ID: 105014
           Summary: Freeze every 5 seconds on any action. Long time bug
           Product: Mesa
           Version: 17.2
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: uralzima-GaUfNO9RBHfsrOwW+9ziJQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Hi. My system is very slow and unusable. I am tired of this nvidia card, but
this bug appeared since version 17. After reboot all seems to work well, but
after sometime, system freezes every few seconds for a few seconds.=20

When you type in console, there is a noticeable delay when typing, when you
watch vidoes, every few seccnds screen freezes. Totally unusable, until reb=
oot.
After reboot system works well for a few hours. This happens long time, aft=
er
mesa 17 was releases and mesa 13 was disappeared from gentoo portage. Mesa =
13
was the only well-working setup. 17 was in beta, I tried it and then revert=
ed
back. Now I don't know what to do... nvidia drivers also don't work well.

I tried mesa 18 but sddm does not start.

My setup:=20
mesa 17.2.8 (considered latest stable in gentoo)
Gentoo hardened 4.9.24-grsec
Nvidia GTX 660 (GK106)
nouveau.config=3D"NvGrUseFw=3D1" (and a few blobs, without this system free=
ze and
image is damaged)
everything else is updated to latest ~amd64 versions.
4 monitors

Please help.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15180759430.d5d4B.18231
Date: Thu, 8 Feb 2018 07:45:43 +0000
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
   title=3D"NEW - Freeze every 5 seconds on any action. Long time bug"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105014">105014</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Freeze every 5 seconds on any action. Long time bug
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>17.2
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
          <td>uralzima&#64;autistici.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi. My system is very slow and unusable. I am tired of this nv=
idia card, but
this bug appeared since version 17. After reboot all seems to work well, but
after sometime, system freezes every few seconds for a few seconds.=20

When you type in console, there is a noticeable delay when typing, when you
watch vidoes, every few seccnds screen freezes. Totally unusable, until reb=
oot.
After reboot system works well for a few hours. This happens long time, aft=
er
mesa 17 was releases and mesa 13 was disappeared from gentoo portage. Mesa =
13
was the only well-working setup. 17 was in beta, I tried it and then revert=
ed
back. Now I don't know what to do... nvidia drivers also don't work well.

I tried mesa 18 but sddm does not start.

My setup:=20
mesa 17.2.8 (considered latest stable in gentoo)
Gentoo hardened 4.9.24-grsec
Nvidia GTX 660 (GK106)
nouveau.config=3D&quot;NvGrUseFw=3D1&quot; (and a few blobs, without this s=
ystem freeze and
image is damaged)
everything else is updated to latest ~amd64 versions.
4 monitors

Please help.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15180759430.d5d4B.18231--

--===============1347790355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1347790355==--
