From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104156] New: NVIDIA Corporation G96 [GeForce 9500
 GT] (rev a1) issue finding GPIO
Date: Thu, 07 Dec 2017 08:28:42 +0000
Message-ID: <bug-104156-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1561760195=="
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


--===============1561760195==
Content-Type: multipart/alternative; boundary="15126353220.e988c6cb.15037";
 charset="UTF-8"


--15126353220.e988c6cb.15037
Date: Thu, 7 Dec 2017 08:28:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104156

            Bug ID: 104156
           Summary: NVIDIA Corporation G96 [GeForce 9500 GT] (rev a1)
                    issue finding GPIO
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: agent.xp22-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

journalctl -b -p err
disp: conn 01:0130: func 08 lookup failed, -2

Sourced it to here:
http://elixir.free-electrons.com/linux/latest/source/drivers/gpu/drm/nouvea=
u/nvkm/engine/disp/conn.c#L124

Related issues:
https://unix.stackexchange.com/questions/219616/what-does-nouveaus-func-08-=
lookup-failed-2-mean


Kernel driver in use: nouveau

Name            : xf86-video-nouveau
Version         : 1.0.15-2

booted with kernel params: systemd.log_level=3Ddebug log_buf_len=3D1M
systemd.log_target=3Dkmsg printk.devkmsg=3Don

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15126353220.e988c6cb.15037
Date: Thu, 7 Dec 2017 08:28:42 +0000
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
   title=3D"NEW - NVIDIA Corporation G96 [GeForce 9500 GT] (rev a1) issue f=
inding GPIO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104156">104156</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NVIDIA Corporation G96 [GeForce 9500 GT] (rev a1) issue findi=
ng GPIO
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
          <td>agent.xp22&#64;googlemail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>journalctl -b -p err
disp: conn 01:0130: func 08 lookup failed, -2

Sourced it to here:
<a href=3D"http://elixir.free-electrons.com/linux/latest/source/drivers/gpu=
/drm/nouveau/nvkm/engine/disp/conn.c#L124">http://elixir.free-electrons.com=
/linux/latest/source/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.c#L124</=
a>

Related issues:
<a href=3D"https://unix.stackexchange.com/questions/219616/what-does-nouvea=
us-func-08-lookup-failed-2-mean">https://unix.stackexchange.com/questions/2=
19616/what-does-nouveaus-func-08-lookup-failed-2-mean</a>


Kernel driver in use: nouveau

Name            : xf86-video-nouveau
Version         : 1.0.15-2

booted with kernel params: systemd.log_level=3Ddebug log_buf_len=3D1M
systemd.log_target=3Dkmsg printk.devkmsg=3Don</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15126353220.e988c6cb.15037--

--===============1561760195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1561760195==--
