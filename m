From: bugzilla-daemon-C9EPM1l/obmE5N/NCR/djmD2FQJk+8+b@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Wed, 11 May 2016 04:46:14 +0000
Message-ID: <bug-93629-8800-VTEmWTup8p@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1839302910=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1839302910==
Content-Type: multipart/alternative; boundary="14629419730.5dEbAA01.9254";
 charset="UTF-8"


--14629419730.5dEbAA01.9254
Date: Wed, 11 May 2016 04:46:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93629

--- Comment #19 from Roy <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org> ---
Created attachment 123609
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D123609&action=3Dedit
Race condition fix for nouveau firmware

For anyone who experiences random hangs using the nouveau firmware and have
spotted "SCHED_ERROR [ CTXSW_TIMEOUT ]" in the logs, please build a kernel =
with
the attached patch and run using the nouveau firmware. Minimum kernel requi=
red
is 4.6.

I've tested this on one machine of my own and have a strong indication that
this improves the situation, but unfortunately it is difficult to distingui=
sh
random infrequent hangs from no hangs.

--- Comment #20 from Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Roy, NVE6 is rock-stable on my end using your patch. Feel free to add my

Tested-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14629419730.5dEbAA01.9254
Date: Wed, 11 May 2016 04:46:13 +0000
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
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629#c20">Commen=
t # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629">bug 93629<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gnurou&#64;gmail.com" title=3D"Alexandre Courbot &lt;gnurou&#64;gmail.com&g=
t;"> <span class=3D"fn">Alexandre Courbot</span></a>
</span></b>
        <pre>Roy, NVE6 is rock-stable on my end using your patch. Feel free=
 to add my

Tested-by: Alexandre Courbot &lt;<a href=3D"mailto:acourbot&#64;nvidia.com"=
>acourbot&#64;nvidia.com</a>&gt;</pre>
        </div>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629#c19">Commen=
t # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629">bug 93629<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rspliet&#64;eclipso.eu" title=3D"Roy &lt;rspliet&#64;eclipso.eu&gt;"> <span=
 class=3D"fn">Roy</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D123609=
" name=3D"attach_123609" title=3D"Race condition fix for nouveau firmware">=
attachment 123609</a> <a href=3D"attachment.cgi?id=3D123609&amp;action=3Ded=
it" title=3D"Race condition fix for nouveau firmware">[details]</a></span> =
<a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D93629&amp;attachment=3D123=
609'>[review]</a>
Race condition fix for nouveau firmware

For anyone who experiences random hangs using the nouveau firmware and have
spotted &quot;SCHED_ERROR [ CTXSW_TIMEOUT ]&quot; in the logs, please build=
 a kernel with
the attached patch and run using the nouveau firmware. Minimum kernel requi=
red
is 4.6.

I've tested this on one machine of my own and have a strong indication that
this improves the situation, but unfortunately it is difficult to distingui=
sh
random infrequent hangs from no hangs.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14629419730.5dEbAA01.9254--

--===============1839302910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1839302910==--
