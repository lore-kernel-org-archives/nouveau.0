From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99922] [NVE4] [regression,
 bisected] 4.10 (atomic): X shows black screen with cursor after
 monitors turn off
Date: Sun, 16 Apr 2017 17:45:37 +0000
Message-ID: <bug-99922-8800-oJSreCNPaH@http.bugs.freedesktop.org/>
References: <bug-99922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1540155340=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99922-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1540155340==
Content-Type: multipart/alternative; boundary="14923647372.B0CbB.32646";
 charset="UTF-8"


--14923647372.B0CbB.32646
Date: Sun, 16 Apr 2017 17:45:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99922

--- Comment #12 from Stefan Becker <chemobejk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I can also confirm that the DPMS problem with kernel 4.10.x is gone after
installing xorg-x11-drv-nouveau-1.0.14-1.fc25.x86_64.

1.0.14 includes the patch:
https://cgit.freedesktop.org/nouveau/xf86-video-nouveau/log/?id=3Db71de83b7=
fae0abeb311251e6144294d319062cf

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14923647372.B0CbB.32646
Date: Sun, 16 Apr 2017 17:45:37 +0000
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
   title=3D"NEW - [NVE4] [regression, bisected] 4.10 (atomic): X shows blac=
k screen with cursor after monitors turn off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99922#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE4] [regression, bisected] 4.10 (atomic): X shows blac=
k screen with cursor after monitors turn off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99922">bug 99922<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chemobejk&#64;gmail.com" title=3D"Stefan Becker &lt;chemobejk&#64;gmail.com=
&gt;"> <span class=3D"fn">Stefan Becker</span></a>
</span></b>
        <pre>I can also confirm that the DPMS problem with kernel 4.10.x is=
 gone after
installing xorg-x11-drv-nouveau-1.0.14-1.fc25.x86_64.

1.0.14 includes the patch:
<a href=3D"https://cgit.freedesktop.org/nouveau/xf86-video-nouveau/log/?id=
=3Db71de83b7fae0abeb311251e6144294d319062cf">https://cgit.freedesktop.org/n=
ouveau/xf86-video-nouveau/log/?id=3Db71de83b7fae0abeb311251e6144294d319062c=
f</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14923647372.B0CbB.32646--

--===============1540155340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1540155340==--
