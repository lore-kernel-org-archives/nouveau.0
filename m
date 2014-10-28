From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81136] [NV92] Regression in Linux 3.15: GPU lockup
 after suspend
Date: Tue, 28 Oct 2014 01:59:56 +0000
Message-ID: <bug-81136-8800-ilnkiaTMsV@http.bugs.freedesktop.org/>
References: <bug-81136-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0366358081=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81136-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0366358081==
Content-Type: multipart/alternative; boundary="1414461595.62EBEfC42.6196"; charset="UTF-8"


--1414461595.62EBEfC42.6196
Date: Tue, 28 Oct 2014 01:59:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D81136

--- Comment #10 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Ed,
Considering that the workarounds mentioned do not work in your case and that
you have a different card (reporter has nv92, while yours is gk106) we can
safely conclude that you're having a different issue.
Please open another bug report and let us know if it is a regression, and i=
f so
which commit broke it.


Agust=C3=ADn,
These two should be non-fatal and the fix for them is in 3.18. Should end u=
p in
3.16, 3.17 as well.
> FAULT at 0x00e070
> FAULT at 0x00e074

Now this one, I have no idea. Do you get this error with 3.14 and dual moni=
tors
?
> FAULT at 0x00e180

Linux 3.17 includes quite a few fixes in the area of s/r, can you give it a
try.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1414461595.62EBEfC42.6196
Date: Tue, 28 Oct 2014 01:59:55 +0000
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
   title=3D"NEW - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D81136#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D81136">bug 81136<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
emil.l.velikov&#64;gmail.com" title=3D"Emil Velikov &lt;emil.l.velikov&#64;=
gmail.com&gt;"> <span class=3D"fn">Emil Velikov</span></a>
</span></b>
        <pre>Ed,
Considering that the workarounds mentioned do not work in your case and that
you have a different card (reporter has nv92, while yours is gk106) we can
safely conclude that you're having a different issue.
Please open another bug report and let us know if it is a regression, and i=
f so
which commit broke it.


Agust=C3=ADn,
These two should be non-fatal and the fix for them is in 3.18. Should end u=
p in
3.16, 3.17 as well.
<span class=3D"quote">&gt; FAULT at 0x00e070
&gt; FAULT at 0x00e074</span >

Now this one, I have no idea. Do you get this error with 3.14 and dual moni=
tors
?
<span class=3D"quote">&gt; FAULT at 0x00e180</span >

Linux 3.17 includes quite a few fixes in the area of s/r, can you give it a
try.</pre>
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

--1414461595.62EBEfC42.6196--

--===============0366358081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0366358081==--
