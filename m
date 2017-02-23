From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99922] New: [NVE4] [regression,
 bisected] 4.10 (atomic): X shows black screen with cursor after
 monitors turn off
Date: Thu, 23 Feb 2017 14:28:52 +0000
Message-ID: <bug-99922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1641998091=="
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


--===============1641998091==
Content-Type: multipart/alternative; boundary="14878601321.EDB8f6.31806";
 charset="UTF-8"


--14878601321.EDB8f6.31806
Date: Thu, 23 Feb 2017 14:28:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99922

            Bug ID: 99922
           Summary: [NVE4] [regression, bisected] 4.10 (atomic): X shows
                    black screen with cursor after monitors turn off
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Keywords: bisected
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: kevin-Fk+Xth6EFAKtEw7EPzjzzg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

On Linux 4.10, after waking monitors up from powersave mode, X displays onl=
y a
black screen with a movable cursor on all three monitors. Linux 4.9.11 does=
 not
exhibit this issue.

I initially noticed the issue with a triple-monitor setup, but it still occ=
urs
even if only one monitor is plugged in via HDMI.

I've bisected the issue to the following atomic-mode-setting commit (full g=
it
bisect log attached):

commit 839ca903f12ef8f09374e0b655456482536a733e
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Fri Nov 4 17:20:36 2016 +1000

    drm/nouveau/kms/nv50: transition to atomic interfaces internally

    This commit implements the atomic commit interfaces, and implements the
    legacy modeset and page flipping interfaces on top of them.

    There's two major changes in behavior from before:

    - We're now making use of interlocks between core and satellite EVO
      channels, which greatly improves our ability to keep their states
      synchronised.
    - DPMS is now implemented as a full modeset to either tear down the
      entire pipe (or bring it back up).  This choice was made mostly
      to ease the initial implementation, but I'm also not sure what we
      gain by bring backing the old behaviour.  We shall see.

    This does NOT currently expose the atomic ioctl by default, due to
    limited testing having been performed.

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Dmesgs and Xorg logs will be provided for the following configurations that
exhibit the issue:
 - 4.10, with one monitor attached
 - 4.10, with three monitors attached
 - A bisected revision that displays the issue (seems to have a bit more
information)

I'm using an MSI GTX 770 2GB; vbios will be attached.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14878601321.EDB8f6.31806
Date: Thu, 23 Feb 2017 14:28:52 +0000
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
   title=3D"NEW - [NVE4] [regression, bisected] 4.10 (atomic): X shows blac=
k screen with cursor after monitors turn off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99922">99922</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE4] [regression, bisected] 4.10 (atomic): X shows black sc=
reen with cursor after monitors turn off
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
          <th>Keywords</th>
          <td>bisected
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
          <td>kevin&#64;potatofrom.space
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>On Linux 4.10, after waking monitors up from powersave mode, X=
 displays only a
black screen with a movable cursor on all three monitors. Linux 4.9.11 does=
 not
exhibit this issue.

I initially noticed the issue with a triple-monitor setup, but it still occ=
urs
even if only one monitor is plugged in via HDMI.

I've bisected the issue to the following atomic-mode-setting commit (full g=
it
bisect log attached):

commit 839ca903f12ef8f09374e0b655456482536a733e
Author: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com">bskeggs&#6=
4;redhat.com</a>&gt;
Date:   Fri Nov 4 17:20:36 2016 +1000

    drm/nouveau/kms/nv50: transition to atomic interfaces internally

    This commit implements the atomic commit interfaces, and implements the
    legacy modeset and page flipping interfaces on top of them.

    There's two major changes in behavior from before:

    - We're now making use of interlocks between core and satellite EVO
      channels, which greatly improves our ability to keep their states
      synchronised.
    - DPMS is now implemented as a full modeset to either tear down the
      entire pipe (or bring it back up).  This choice was made mostly
      to ease the initial implementation, but I'm also not sure what we
      gain by bring backing the old behaviour.  We shall see.

    This does NOT currently expose the atomic ioctl by default, due to
    limited testing having been performed.

    Signed-off-by: Ben Skeggs &lt;<a href=3D"mailto:bskeggs&#64;redhat.com"=
>bskeggs&#64;redhat.com</a>&gt;

Dmesgs and Xorg logs will be provided for the following configurations that
exhibit the issue:
 - 4.10, with one monitor attached
 - 4.10, with three monitors attached
 - A bisected revision that displays the issue (seems to have a bit more
information)

I'm using an MSI GTX 770 2GB; vbios will be attached.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14878601321.EDB8f6.31806--

--===============1641998091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1641998091==--
