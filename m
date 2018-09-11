From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100228] [NV137] bus: MMIO read of 00000000 FAULT at
 409800 [ TIMEOUT ]
Date: Tue, 11 Sep 2018 14:40:29 +0000
Message-ID: <bug-100228-8800-lk0zTP4iHk@http.bugs.freedesktop.org/>
References: <bug-100228-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0285167143=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100228-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0285167143==
Content-Type: multipart/alternative; boundary="15366768306.0BfB.10711"
Content-Transfer-Encoding: 7bit


--15366768306.0BfB.10711
Date: Tue, 11 Sep 2018 14:40:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100228

--- Comment #26 from Boris Vinogradov <no111u3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Boris Vinogradov from comment #25)
> Created attachment 141455 [details]
> Kernel log with new firmware after some boot
>=20
> But I have some boot with reproduce error.

I have many experiments with boot and create stable reproduce way:

1)Instalation new version of kernel,
2)Reboot, or cold boot
3)Successefull boot with short time initialization. Sleep/suspend usally wo=
rk.
4)Reboot, or cold boot
5)Reproduce error again.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15366768306.0BfB.10711
Date: Tue, 11 Sep 2018 14:40:30 +0000
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
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228#c26">Comme=
nt # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">bug 10022=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
no111u3&#64;gmail.com" title=3D"Boris Vinogradov &lt;no111u3&#64;gmail.com&=
gt;"> <span class=3D"fn">Boris Vinogradov</span></a>
</span></b>
        <pre>(In reply to Boris Vinogradov from <a href=3D"show_bug.cgi?id=
=3D100228#c25">comment #25</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D141455" name=3D"attach_141455" title=3D"Kernel log with new firmwar=
e after some boot">attachment 141455</a> <a href=3D"attachment.cgi?id=3D141=
455&amp;action=3Dedit" title=3D"Kernel log with new firmware after some boo=
t">[details]</a></span>
&gt; Kernel log with new firmware after some boot
&gt;=20
&gt; But I have some boot with reproduce error.</span >

I have many experiments with boot and create stable reproduce way:

1)Instalation new version of kernel,
2)Reboot, or cold boot
3)Successefull boot with short time initialization. Sleep/suspend usally wo=
rk.
4)Reboot, or cold boot
5)Reproduce error again.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15366768306.0BfB.10711--

--===============0285167143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0285167143==--
