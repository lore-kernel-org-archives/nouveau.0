From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107016] Gpio error only from kernel higher as 4.x
 (k2000m; 0x0e73b0a2; version 80.07.40.00.02)
Date: Mon, 25 Jun 2018 14:25:33 +0000
Message-ID: <bug-107016-8800-KQQ5WaWx4F@http.bugs.freedesktop.org/>
References: <bug-107016-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0316604651=="
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


--===============0316604651==
Content-Type: multipart/alternative; boundary="15299367330.FEC3.21002"
Content-Transfer-Encoding: 7bit


--15299367330.FEC3.21002
Date: Mon, 25 Jun 2018 14:25:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107016

--- Comment #13 from Roy <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org> ---
(In reply to atirage21 from comment #12)
> Created attachment 140326 [details]
> attachment-20771-0.html
>=20
> But also is question: Why i had only 405 Mhz of core under kernel 4.x,
> if under kernel 3.19 was more options to see (and same more options is
> with propretiary driver):
>=20
> [    4.311074] nouveau  [     CLK][0000:01:00.0] 07: core 270-405 MHz
> memory 810 MHz
> [    4.311090] nouveau  [     CLK][0000:01:00.0] 0f: core 270-745 MHz
> memory 1800 MHz
> [    4.311233] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memory =
648
> MHz
>=20

That's just reduced verbosity of the driver in newer kernels. There's no ne=
ed
to report that during boot, just clutters the log. You'll find all those
entries in /sys/kernel/debug/dri/<number>/pstate.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15299367330.FEC3.21002
Date: Mon, 25 Jun 2018 14:25:33 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107016#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Gpio error only from kernel higher as 4.x (k2000m; 0=
x0e73b0a2; version 80.07.40.00.02)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107016">bug 10701=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nouveau&#64;spliet.org" title=3D"Roy &lt;nouveau&#64;spliet.org&gt;"> <span=
 class=3D"fn">Roy</span></a>
</span></b>
        <pre>(In reply to atirage21 from <a href=3D"show_bug.cgi?id=3D10701=
6#c12">comment #12</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D140326" name=3D"attach_140326" title=3D"attachment-20771-0.html">at=
tachment 140326</a> <a href=3D"attachment.cgi?id=3D140326&amp;action=3Dedit=
" title=3D"attachment-20771-0.html">[details]</a></span>
&gt; attachment-20771-0.html
&gt;=20
&gt; But also is question: Why i had only 405 Mhz of core under kernel 4.x,
&gt; if under kernel 3.19 was more options to see (and same more options is
&gt; with propretiary driver):
&gt;=20
&gt; [    4.311074] nouveau  [     CLK][0000:01:00.0] 07: core 270-405 MHz
&gt; memory 810 MHz
&gt; [    4.311090] nouveau  [     CLK][0000:01:00.0] 0f: core 270-745 MHz
&gt; memory 1800 MHz
&gt; [    4.311233] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz memo=
ry 648
&gt; MHz
&gt; </span >

That's just reduced verbosity of the driver in newer kernels. There's no ne=
ed
to report that during boot, just clutters the log. You'll find all those
entries in /sys/kernel/debug/dri/&lt;number&gt;/pstate.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15299367330.FEC3.21002--

--===============0316604651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0316604651==--
