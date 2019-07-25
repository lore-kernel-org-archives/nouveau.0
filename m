From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111110] Nvidia quadro + nouveau : second terminal
 wake up but doesn't more display
Date: Thu, 25 Jul 2019 06:36:08 +0000
Message-ID: <bug-111110-8800-2JOzi4hAVu@http.bugs.freedesktop.org/>
References: <bug-111110-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1343218947=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111110-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1343218947==
Content-Type: multipart/alternative; boundary="15640365670.e3eB.17584"
Content-Transfer-Encoding: 7bit


--15640365670.e3eB.17584
Date: Thu, 25 Jul 2019 06:36:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111110

--- Comment #1 from Philippe Cond=C3=A9 <conde.philippe-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org> ---
Hello,

with the last Mesa from OpenSUSE factory this regression is still present
# rpm -qa Mesa*
Mesa-32bit-19.1.2-225.1.x86_64
Mesa-dri-19.1.2-225.1.x86_64
Mesa-libglapi0-19.1.2-225.1.x86_64
Mesa-demo-x-8.4.0-1.7.x86_64
Mesa-libGLESv2-2-19.1.2-225.1.x86_64
Mesa-libEGL1-19.1.2-225.1.x86_64
Mesa-dri-nouveau-19.1.2-225.1.x86_64
Mesa-libGL1-19.1.2-225.1.x86_64
Mesa-libva-19.1.2-225.1.x86_64
Mesa-libGL1-32bit-19.1.2-225.1.x86_64
Mesa-19.1.2-225.1.x86_64
Mesa-libglapi0-32bit-19.1.2-225.1.x86_64
Mesa-gallium-32bit-19.1.2-225.1.x86_64
Mesa-dri-32bit-19.1.2-225.1.x86_64
Mesa-gallium-19.1.2-225.1.x86_64
Mesa-KHR-devel-19.1.2-225.1.x86_64
Mesa-libEGL-devel-19.1.2-225.1.x86_64
Mesa-libGL-devel-19.1.2-225.1.x86_64
Mesa-libEGL1-32bit-19.1.2-225.1.x86_64

# rpm -qa xf86-video-nouveau
xf86-video-nouveau-1.0.15-40.12.x86_64

# uname -a
Linux hpprol2 5.2.1-1-default #1 SMP Mon Jul 15 05:32:47 UTC 2019 (bf5c01b)
x86_64 x86_64 x86_64 GNU/Linux

the same error is present in journalctl.
Jul 25 08:29:02 hpprol2 kernel: nouveau 0000:0a:00.0: disp: outp 03:0006:0f=
42:
training failed

Not sure if Mesa is involved or alone nouveau?

Regards

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15640365670.e3eB.17584
Date: Thu, 25 Jul 2019 06:36:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nvidia quadro + nouveau : second terminal wake up but doe=
sn't more display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111110#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nvidia quadro + nouveau : second terminal wake up but doe=
sn't more display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111110">bug 11111=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
conde.philippe&#64;skynet.be" title=3D"Philippe Cond=C3=A9 &lt;conde.philip=
pe&#64;skynet.be&gt;"> <span class=3D"fn">Philippe Cond=C3=A9</span></a>
</span></b>
        <pre>Hello,

with the last Mesa from OpenSUSE factory this regression is still present
# rpm -qa Mesa*
Mesa-32bit-19.1.2-225.1.x86_64
Mesa-dri-19.1.2-225.1.x86_64
Mesa-libglapi0-19.1.2-225.1.x86_64
Mesa-demo-x-8.4.0-1.7.x86_64
Mesa-libGLESv2-2-19.1.2-225.1.x86_64
Mesa-libEGL1-19.1.2-225.1.x86_64
Mesa-dri-nouveau-19.1.2-225.1.x86_64
Mesa-libGL1-19.1.2-225.1.x86_64
Mesa-libva-19.1.2-225.1.x86_64
Mesa-libGL1-32bit-19.1.2-225.1.x86_64
Mesa-19.1.2-225.1.x86_64
Mesa-libglapi0-32bit-19.1.2-225.1.x86_64
Mesa-gallium-32bit-19.1.2-225.1.x86_64
Mesa-dri-32bit-19.1.2-225.1.x86_64
Mesa-gallium-19.1.2-225.1.x86_64
Mesa-KHR-devel-19.1.2-225.1.x86_64
Mesa-libEGL-devel-19.1.2-225.1.x86_64
Mesa-libGL-devel-19.1.2-225.1.x86_64
Mesa-libEGL1-32bit-19.1.2-225.1.x86_64

# rpm -qa xf86-video-nouveau
xf86-video-nouveau-1.0.15-40.12.x86_64

# uname -a
Linux hpprol2 5.2.1-1-default #1 SMP Mon Jul 15 05:32:47 UTC 2019 (bf5c01b)
x86_64 x86_64 x86_64 GNU/Linux

the same error is present in journalctl.
Jul 25 08:29:02 hpprol2 kernel: nouveau 0000:0a:00.0: disp: outp 03:0006:0f=
42:
training failed

Not sure if Mesa is involved or alone nouveau?

Regards</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15640365670.e3eB.17584--

--===============1343218947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1343218947==--
