From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90626] HP ZBook 15 nouveau driver hangup for kernel
	>= 4.1
Date: Tue, 03 Nov 2015 17:02:48 +0000
Message-ID: <bug-90626-8800-Km9DuthEup@http.bugs.freedesktop.org/>
References: <bug-90626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0635768082=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0635768082==
Content-Type: multipart/alternative; boundary="1446570170.Be4ee2Ec3.24164"; charset="UTF-8"


--1446570170.Be4ee2Ec3.24164
Date: Tue, 3 Nov 2015 17:02:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D90626

--- Comment #35 from Ortwin Gl=C3=BCck <odi-L693kI9kcNY@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #34)
> Hmmm... did you see a "hw bug workaround enabled" line? Are you using Lin=
ux
> 4.3? [4.2 and older didn't have the workaround logic.]

Ok works fine in 4.3!

$ dmesg | grep workaround
[    4.082516] nouveau 0000:01:00.0: pmu: hw bug workaround enabled
[    4.194475] nouveau 0000:01:00.0: pmu: hw bug workaround enabled

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1446570170.Be4ee2Ec3.24164
Date: Tue, 3 Nov 2015 17:02:50 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626#c35">Commen=
t # 35</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626">bug 90626<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
odi&#64;odi.ch" title=3D"Ortwin Gl=C3=BCck &lt;odi&#64;odi.ch&gt;"> <span c=
lass=3D"fn">Ortwin Gl=C3=BCck</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D906=
26#c34">comment #34</a>)
<span class=3D"quote">&gt; Hmmm... did you see a &quot;hw bug workaround en=
abled&quot; line? Are you using Linux
&gt; 4.3? [4.2 and older didn't have the workaround logic.]</span >

Ok works fine in 4.3!

$ dmesg | grep workaround
[    4.082516] nouveau 0000:01:00.0: pmu: hw bug workaround enabled
[    4.194475] nouveau 0000:01:00.0: pmu: hw bug workaround enabled</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446570170.Be4ee2Ec3.24164--

--===============0635768082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0635768082==--
