From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107016] Gpio error only from kernel higher as 4.x
 (k2000m; 0x0e73b0a2; version 80.07.40.00.02)
Date: Mon, 25 Jun 2018 17:12:41 +0000
Message-ID: <bug-107016-8800-cl6Teernpb@http.bugs.freedesktop.org/>
References: <bug-107016-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1359371229=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107016-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1359371229==
Content-Type: multipart/alternative; boundary="15299467610.DC1Fcf.1738"
Content-Transfer-Encoding: 7bit


--15299467610.DC1Fcf.1738
Date: Mon, 25 Jun 2018 17:12:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107016

--- Comment #19 from atirage21 <tothsoft-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Roy from comment #1)
> To debug this, I'd like you to attach to this bug report:
> - A better description of what you're trying to do. I suspect you're tryi=
ng
> to set a pstate, but please be clear about the steps that you follow to g=
et
> the result you claim to get.
> - A copy of your video BIOS (/sys/kernel/debug/dri/<number>/vbios.rom
> - A peek of the strap register (nvapeek 0x101000)
> - A full unfiltered dmesg from kernel 4.17 after failure like you did for
> the 3.19 kernel, preferably booted with the nouveau.debug=3D"PMU=3Ddebug"
> parameter.
>=20
> (In reply to atirage21 from comment #0)
> > Maybe it is connected on your changes from 2016:
> > https://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/
> > ?id=3Da24ded627e42d453546c553d609edc073f59cd57
>=20
> This patch... no, this whole repository is unrelated to your problems.

nvapeek 0x101000
00101000: df40ac9a

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15299467610.DC1Fcf.1738
Date: Mon, 25 Jun 2018 17:12:41 +0000
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
   title=3D"NEEDINFO - Gpio error only from kernel higher as 4.x (k2000m; 0=
x0e73b0a2; version 80.07.40.00.02)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107016#c19">Comme=
nt # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Gpio error only from kernel higher as 4.x (k2000m; 0=
x0e73b0a2; version 80.07.40.00.02)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107016">bug 10701=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tothsoft&#64;gmail.com" title=3D"atirage21 &lt;tothsoft&#64;gmail.com&gt;">=
 <span class=3D"fn">atirage21</span></a>
</span></b>
        <pre>(In reply to Roy from <a href=3D"show_bug.cgi?id=3D107016#c1">=
comment #1</a>)
<span class=3D"quote">&gt; To debug this, I'd like you to attach to this bu=
g report:
&gt; - A better description of what you're trying to do. I suspect you're t=
rying
&gt; to set a pstate, but please be clear about the steps that you follow t=
o get
&gt; the result you claim to get.
&gt; - A copy of your video BIOS (/sys/kernel/debug/dri/&lt;number&gt;/vbio=
s.rom
&gt; - A peek of the strap register (nvapeek 0x101000)
&gt; - A full unfiltered dmesg from kernel 4.17 after failure like you did =
for
&gt; the 3.19 kernel, preferably booted with the nouveau.debug=3D&quot;PMU=
=3Ddebug&quot;
&gt; parameter.
&gt;=20
&gt; (In reply to atirage21 from <a href=3D"show_bug.cgi?id=3D107016#c0">co=
mment #0</a>)
&gt; &gt; Maybe it is connected on your changes from 2016:
&gt; &gt; <a href=3D"https://cgit.freedesktop.org/nouveau/xf86-video-nouvea=
u/commit/">https://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/<=
/a>
&gt; &gt; ?id=3Da24ded627e42d453546c553d609edc073f59cd57
&gt;=20
&gt; This patch... no, this whole repository is unrelated to your problems.=
</span >

nvapeek 0x101000
00101000: df40ac9a</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15299467610.DC1Fcf.1738--

--===============1359371229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1359371229==--
