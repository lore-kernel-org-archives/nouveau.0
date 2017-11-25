From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82835] [NV92] GeForce 8800 GS VDPAU h264 decoding
	hang
Date: Sat, 25 Nov 2017 12:24:46 +0000
Message-ID: <bug-82835-8800-bNXg7RRTvQ@http.bugs.freedesktop.org/>
References: <bug-82835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2019055876=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2019055876==
Content-Type: multipart/alternative; boundary="15116126861.2f7F2aA2.22335";
 charset="UTF-8"


--15116126861.2f7F2aA2.22335
Date: Sat, 25 Nov 2017 12:24:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D82835

--- Comment #24 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
In kernel 4.14 workaround was added for disabling h264 decoding until root
cause of this bug will be uncovered and fixed (may be never):

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv4.14&id=3D194d68dd051c2dd5ac2b522ae16100e774e8d869

drm/nouveau/bsp/g92: disable by default

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15116126861.2f7F2aA2.22335
Date: Sat, 25 Nov 2017 12:24:46 +0000
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D82835#c24">Commen=
t # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D82835">bug 82835<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
randrik&#64;mail.ru" title=3D"Andrew Randrianasulu &lt;randrik&#64;mail.ru&=
gt;"> <span class=3D"fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>In kernel 4.14 workaround was added for disabling h264 decodin=
g until root
cause of this bug will be uncovered and fixed (may be never):

<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?h=3Dv4.14&amp;id=3D194d68dd051c2dd5ac2b522ae16100e774e8d869">htt=
ps://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=
=3Dv4.14&amp;id=3D194d68dd051c2dd5ac2b522ae16100e774e8d869</a>

drm/nouveau/bsp/g92: disable by default</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15116126861.2f7F2aA2.22335--

--===============2019055876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2019055876==--
