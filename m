From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105173] [MCP79][Regression] Unhandled NULL pointer
 dereference in nvkm_object_unmap since kernel 4.15
Date: Wed, 21 Feb 2018 20:36:45 +0000
Message-ID: <bug-105173-8800-A7KbwGYvSW@http.bugs.freedesktop.org/>
References: <bug-105173-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0868064601=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105173-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0868064601==
Content-Type: multipart/alternative; boundary="15192454051.6eEaA8e3.18951"
Content-Transfer-Encoding: 7bit


--15192454051.6eEaA8e3.18951
Date: Wed, 21 Feb 2018 20:36:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105173

--- Comment #7 from Nick Lee <nvlbox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Suse:

xorg-x11-driver-video-7.6_1-17.1.x86_64
xorg-x11-server-1.19.6-3.1.x86_64
Mesa-18.0.0-187.1.x86_64
kernel-4.15.4-1-default

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15192454051.6eEaA8e3.18951
Date: Wed, 21 Feb 2018 20:36:45 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce in nvkm_object_unmap since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce in nvkm_object_unmap since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173">bug 10517=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nvlbox&#64;gmail.com" title=3D"Nick Lee &lt;nvlbox&#64;gmail.com&gt;"> <spa=
n class=3D"fn">Nick Lee</span></a>
</span></b>
        <pre>Suse:

xorg-x11-driver-video-7.6_1-17.1.x86_64
xorg-x11-server-1.19.6-3.1.x86_64
Mesa-18.0.0-187.1.x86_64
kernel-4.15.4-1-default</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15192454051.6eEaA8e3.18951--

--===============0868064601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0868064601==--
