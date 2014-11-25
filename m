From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86115] [NV84] gpu hang on resume from suspend to ram
Date: Tue, 25 Nov 2014 21:35:59 +0000
Message-ID: <bug-86115-8800-16FImz7tmm@http.bugs.freedesktop.org/>
References: <bug-86115-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1340292540=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86115-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1340292540==
Content-Type: multipart/alternative; boundary="1416951359.257B72.16927"; charset="UTF-8"


--1416951359.257B72.16927
Date: Tue, 25 Nov 2014 21:35:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D86115

--- Comment #13 from Lars M=C3=BCller <lars-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org> ---
(In reply to Takashi Iwai from comment #11)
>=20
> Could you try to boot with nomodeset boot option in runlevel 3, and try S=
3,
> but without pm_async adjustment?  The graphics can be broken in this case
> after S3, but if the system alives, you should be able to remote-login.
>=20
> If S3 crashes even without nouveau, we can check the two issues above
> completely separately.  If S3 crash happens only with nouveau, it implies
> that the disk problem is somehow related with nouveau problem.

It crashes even without nouveau when booted with nomodeset set.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1416951359.257B72.16927
Date: Tue, 25 Nov 2014 21:35:59 +0000
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
   title=3D"NEW - [NV84] gpu hang on resume from suspend to ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D86115#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV84] gpu hang on resume from suspend to ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D86115">bug 86115<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lars&#64;samba.org" title=3D"Lars M=C3=BCller &lt;lars&#64;samba.org&gt;"> =
<span class=3D"fn">Lars M=C3=BCller</span></a>
</span></b>
        <pre>(In reply to Takashi Iwai from <a href=3D"show_bug.cgi?id=3D86=
115#c11">comment #11</a>)
<span class=3D"quote">&gt;=20
&gt; Could you try to boot with nomodeset boot option in runlevel 3, and tr=
y S3,
&gt; but without pm_async adjustment?  The graphics can be broken in this c=
ase
&gt; after S3, but if the system alives, you should be able to remote-login.
&gt;=20
&gt; If S3 crashes even without nouveau, we can check the two issues above
&gt; completely separately.  If S3 crash happens only with nouveau, it impl=
ies
&gt; that the disk problem is somehow related with nouveau problem.</span >

It crashes even without nouveau when booted with nomodeset set.</pre>
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

--1416951359.257B72.16927--

--===============1340292540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1340292540==--
