From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106324] New: Sporadic freezes under load with
 Chromium
Date: Mon, 30 Apr 2018 11:15:53 +0000
Message-ID: <bug-106324-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1517764267=="
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


--===============1517764267==
Content-Type: multipart/alternative; boundary="15250869561.EdB21.4197"
Content-Transfer-Encoding: 7bit


--15250869561.EdB21.4197
Date: Mon, 30 Apr 2018 11:15:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106324

            Bug ID: 106324
           Summary: Sporadic freezes under load with Chromium
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 139226
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D139226&action=3Dedit
errors logged by the kernel

Occasionally when using the Chromium browser, X will freeze. This is
accompanied by various errors in the kernel log (see attachment). I can
reliably reproduce this by opening the following websites in Chromium:

  * https://www.youtube.com/
  * http://www.ardmediathek.de/tv
  *
https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial/Lightin=
g_in_WebGL

This is with X server 1.19.6 and xf86-video-nouveau 1.0.15.

I originally saw this with Linux v4.16 and then reverted back to v4.14.35 L=
TS
which didn't seem to exhibit the same problems at first. Also, with v4.16 t=
he
freezes seem to be more extensive, often requiring a reboot. With v4.14.35 =
the
freezes are temporary and often even non-existent despite the errors logged=
 by
the kernel.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15250869561.EdB21.4197
Date: Mon, 30 Apr 2018 11:15:56 +0000
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
   title=3D"NEW - Sporadic freezes under load with Chromium"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106324">106324</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Sporadic freezes under load with Chromium
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
          <td>thierry.reding&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D139226=
" name=3D"attach_139226" title=3D"errors logged by the kernel">attachment 1=
39226</a> <a href=3D"attachment.cgi?id=3D139226&amp;action=3Dedit" title=3D=
"errors logged by the kernel">[details]</a></span>
errors logged by the kernel

Occasionally when using the Chromium browser, X will freeze. This is
accompanied by various errors in the kernel log (see attachment). I can
reliably reproduce this by opening the following websites in Chromium:

  * <a href=3D"https://www.youtube.com/">https://www.youtube.com/</a>
  * <a href=3D"http://www.ardmediathek.de/tv">http://www.ardmediathek.de/tv=
</a>
  *
<a href=3D"https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutor=
ial/Lighting_in_WebGL">https://developer.mozilla.org/en-US/docs/Web/API/Web=
GL_API/Tutorial/Lighting_in_WebGL</a>

This is with X server 1.19.6 and xf86-video-nouveau 1.0.15.

I originally saw this with Linux v4.16 and then reverted back to v4.14.35 L=
TS
which didn't seem to exhibit the same problems at first. Also, with v4.16 t=
he
freezes seem to be more extensive, often requiring a reboot. With v4.14.35 =
the
freezes are temporary and often even non-existent despite the errors logged=
 by
the kernel.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15250869561.EdB21.4197--

--===============1517764267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1517764267==--
