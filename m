From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107016] Gpio error only from kernel higher as 4.x
 (k2000m; 0x0e73b0a2; version 80.07.40.00.02)
Date: Mon, 25 Jun 2018 16:17:26 +0000
Message-ID: <bug-107016-8800-yV4Bon3bIQ@http.bugs.freedesktop.org/>
References: <bug-107016-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1106477912=="
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


--===============1106477912==
Content-Type: multipart/alternative; boundary="15299434461.2FdDBf.19415"
Content-Transfer-Encoding: 7bit


--15299434461.2FdDBf.19415
Date: Mon, 25 Jun 2018 16:17:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107016

--- Comment #16 from atirage21 <tothsoft-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to atirage21 from comment #15)
> Created attachment 140332 [details]
> attachment-14056-0.html
>=20
> In live ubuntu 18.04 with kernel 4.15
>=20
> Only boot frequency of core
> sudo cat /sys/kernel/debug/dri/0/pstate
>=20
>=20
>=20
> 07: core 405 MHz memory 810 MHz
> 0f: core 405 MHz memory 1800 MHz
> AC: core 405 MHz memory 648 MHz
>=20
>=20
> 2018-06-25 14:51 GMT+00:00 Attila T=C3=B3th <tothsoft-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>=20
> > Not truth!  I see only 405 MHz of core in newer kernel 4.x in
> >
> > /sys/kernel/debug/dri/<number>/pstate. It was first argument for me, th=
at something is not good compared to kernel 3.19.
> >
> >
> >
> > 2018-06-25 16:25 GMT+02:00 <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>:
> >
> >> *Comment # 13 <https://bugs.freedesktop.org/show_bug.cgi?id=3D107016#c=
13>
> >> on bug 107016 <https://bugs.freedesktop.org/show_bug.cgi?id=3D107016> =
from
> >> Roy <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org> *
> >>
> >> (In reply to atirage21 from comment #12 <https://bugs.freedesktop.org/=
show_bug.cgi?id=3D107016#c12>)> Created attachment 140326 [details] <https:=
//bugs.freedesktop.org/attachment.cgi?id=3D140326> [details] <https://bugs.=
freedesktop.org/attachment.cgi?id=3D140326&action=3Dedit>
> >> > attachment-20771-0.html
> >> >
> >> > But also is question: Why i had only 405 Mhz of core under kernel 4.=
x,
> >> > if under kernel 3.19 was more options to see (and same more options =
is
> >> > with propretiary driver):
> >> >
> >> > [    4.311074] nouveau  [     CLK][0000:01:00.0] 07: core 270-405 MHz
> >> > memory 810 MHz
> >> > [    4.311090] nouveau  [     CLK][0000:01:00.0] 0f: core 270-745 MHz
> >> > memory 1800 MHz
> >> > [    4.311233] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz me=
mory 648
> >> > MHz
> >> >
> >>
> >> That's just reduced verbosity of the driver in newer kernels. There's =
no need
> >> to report that during boot, just clutters the log. You'll find all tho=
se
> >> entries in /sys/kernel/debug/dri/<number>/pstate.
> >>



Nvidia xserver setting have clock from 135-405 and from 135 - 745 Mhz of cl=
ock
(see attachment)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15299434461.2FdDBf.19415
Date: Mon, 25 Jun 2018 16:17:26 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107016#c16">Comme=
nt # 16</a>
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
        <pre>(In reply to atirage21 from <a href=3D"show_bug.cgi?id=3D10701=
6#c15">comment #15</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D140332" name=3D"attach_140332" title=3D"attachment-14056-0.html">at=
tachment 140332</a> <a href=3D"attachment.cgi?id=3D140332&amp;action=3Dedit=
" title=3D"attachment-14056-0.html">[details]</a></span>
&gt; attachment-14056-0.html
&gt;=20
&gt; In live ubuntu 18.04 with kernel 4.15
&gt;=20
&gt; Only boot frequency of core
&gt; sudo cat /sys/kernel/debug/dri/0/pstate
&gt;=20
&gt;=20
&gt;=20
&gt; 07: core 405 MHz memory 810 MHz
&gt; 0f: core 405 MHz memory 1800 MHz
&gt; AC: core 405 MHz memory 648 MHz
&gt;=20
&gt;=20
&gt; 2018-06-25 14:51 GMT+00:00 Attila T=C3=B3th &lt;<a href=3D"mailto:toth=
soft&#64;gmail.com">tothsoft&#64;gmail.com</a>&gt;:
&gt;=20
&gt; &gt; Not truth!  I see only 405 MHz of core in newer kernel 4.x in
&gt; &gt;
&gt; &gt; /sys/kernel/debug/dri/&lt;number&gt;/pstate. It was first argumen=
t for me, that something is not good compared to kernel 3.19.
&gt; &gt;
&gt; &gt;
&gt; &gt;
&gt; &gt; 2018-06-25 16:25 GMT+02:00 &lt;<a href=3D"mailto:bugzilla-daemon&=
#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>&gt;:
&gt; &gt;
&gt; &gt;&gt; *<a href=3D"show_bug.cgi?id=3D107016#c13">Comment # 13</a> &l=
t;<a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Gpio error only from kernel higher as 4.x (k2000m; 0=
x0e73b0a2; version 80.07.40.00.02)"
   href=3D"show_bug.cgi?id=3D107016#c13">https://bugs.freedesktop.org/show_=
bug.cgi?id=3D107016#c13</a>&gt;
&gt; &gt;&gt; on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Gpio error only from kernel higher as 4.x (k2000m; 0=
x0e73b0a2; version 80.07.40.00.02)"
   href=3D"show_bug.cgi?id=3D107016">bug 107016</a> &lt;<a class=3D"bz_bug_=
link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Gpio error only from kernel higher as 4.x (k2000m; 0=
x0e73b0a2; version 80.07.40.00.02)"
   href=3D"show_bug.cgi?id=3D107016">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D107016</a>&gt; from
&gt; &gt;&gt; Roy &lt;<a href=3D"mailto:nouveau&#64;spliet.org">nouveau&#64=
;spliet.org</a>&gt; *
&gt; &gt;&gt;
&gt; &gt;&gt; (In reply to atirage21 from <a href=3D"show_bug.cgi?id=3D1070=
16#c12">comment #12</a> &lt;<a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Gpio error only from kernel higher as 4.x (k2000m; 0=
x0e73b0a2; version 80.07.40.00.02)"
   href=3D"show_bug.cgi?id=3D107016#c12">https://bugs.freedesktop.org/show_=
bug.cgi?id=3D107016#c12</a>&gt;)&gt; Created <span class=3D""><a href=3D"at=
tachment.cgi?id=3D140326" name=3D"attach_140326" title=3D"attachment-20771-=
0.html">attachment 140326</a> <a href=3D"attachment.cgi?id=3D140326&amp;act=
ion=3Dedit" title=3D"attachment-20771-0.html">[details]</a></span> &lt;<a h=
ref=3D"https://bugs.freedesktop.org/attachment.cgi?id=3D140326">https://bug=
s.freedesktop.org/attachment.cgi?id=3D140326</a>&gt; [details] &lt;<a href=
=3D"https://bugs.freedesktop.org/attachment.cgi?id=3D140326&amp;action=3Ded=
it">https://bugs.freedesktop.org/attachment.cgi?id=3D140326&amp;action=3Ded=
it</a>&gt;
&gt; &gt;&gt; &gt; attachment-20771-0.html
&gt; &gt;&gt; &gt;
&gt; &gt;&gt; &gt; But also is question: Why i had only 405 Mhz of core und=
er kernel 4.x,
&gt; &gt;&gt; &gt; if under kernel 3.19 was more options to see (and same m=
ore options is
&gt; &gt;&gt; &gt; with propretiary driver):
&gt; &gt;&gt; &gt;
&gt; &gt;&gt; &gt; [    4.311074] nouveau  [     CLK][0000:01:00.0] 07: cor=
e 270-405 MHz
&gt; &gt;&gt; &gt; memory 810 MHz
&gt; &gt;&gt; &gt; [    4.311090] nouveau  [     CLK][0000:01:00.0] 0f: cor=
e 270-745 MHz
&gt; &gt;&gt; &gt; memory 1800 MHz
&gt; &gt;&gt; &gt; [    4.311233] nouveau  [     CLK][0000:01:00.0] --: cor=
e 405 MHz memory 648
&gt; &gt;&gt; &gt; MHz
&gt; &gt;&gt; &gt;
&gt; &gt;&gt;
&gt; &gt;&gt; That's just reduced verbosity of the driver in newer kernels.=
 There's no need
&gt; &gt;&gt; to report that during boot, just clutters the log. You'll fin=
d all those
&gt; &gt;&gt; entries in /sys/kernel/debug/dri/&lt;number&gt;/pstate.
&gt; &gt;&gt;</span >



Nvidia xserver setting have clock from 135-405 and from 135 - 745 Mhz of cl=
ock
(see attachment)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15299434461.2FdDBf.19415--

--===============1106477912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1106477912==--
