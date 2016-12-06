From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94727] nouveau/pushbuf.c:238: pushbuf_krel:
 Assertion `bkref` failed.
Date: Tue, 06 Dec 2016 19:22:39 +0000
Message-ID: <bug-94727-8800-34Wzps3HW0@http.bugs.freedesktop.org/>
References: <bug-94727-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0757203863=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94727-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0757203863==
Content-Type: multipart/alternative; boundary="14810521591.bDfa2c.17718";
 charset="UTF-8"


--14810521591.bDfa2c.17718
Date: Tue, 6 Dec 2016 19:22:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94727

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Olivier Fourdan from comment #5)
> This is affecting Xwayland as well, as reported downstream in Fedora 25:
>=20
>     https://bugzilla.redhat.com/show_bug.cgi?id=3D1372878
>=20
> wrt comment 1, Xwayland is not using multithreaded GL, even through glamo=
r,
> is it?

Oh dear. That's using glamor on a nv30 (or nv40) board. The nv30 driver is =
...
erm ... imperfect.

And looking back at the first comments, the Quadro 1500M appears to be a G7=
1,
and the 6600LE is obviously some nv4x as well.

In which case these issues are just as likely to not be caused by the
multithreading stuff at all.

But you're in (limited) luck - I have a NV34 plugged in. If you can send me=
 an
apitrace I can replay to cause this to happen, I can investigate [and the N=
V34
doesn't support as much stuff as a NV4x, but I can fake it]. I'll also star=
e at
the nv30_resource_copy_region code to see what it's missing.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14810521591.bDfa2c.17718
Date: Tue, 6 Dec 2016 19:22:39 +0000
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
   title=3D"NEW - nouveau/pushbuf.c:238: pushbuf_krel: Assertion `bkref` fa=
iled."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94727#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau/pushbuf.c:238: pushbuf_krel: Assertion `bkref` fa=
iled."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94727">bug 94727<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Olivier Fourdan from <a href=3D"show_bug.cgi?id=
=3D94727#c5">comment #5</a>)
<span class=3D"quote">&gt; This is affecting Xwayland as well, as reported =
downstream in Fedora 25:
&gt;=20
&gt;     <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1372878">=
https://bugzilla.redhat.com/show_bug.cgi?id=3D1372878</a>
&gt;=20
&gt; wrt <a href=3D"show_bug.cgi?id=3D94727#c1">comment 1</a>, Xwayland is =
not using multithreaded GL, even through glamor,
&gt; is it?</span >

Oh dear. That's using glamor on a nv30 (or nv40) board. The nv30 driver is =
...
erm ... imperfect.

And looking back at the first comments, the Quadro 1500M appears to be a G7=
1,
and the 6600LE is obviously some nv4x as well.

In which case these issues are just as likely to not be caused by the
multithreading stuff at all.

But you're in (limited) luck - I have a NV34 plugged in. If you can send me=
 an
apitrace I can replay to cause this to happen, I can investigate [and the N=
V34
doesn't support as much stuff as a NV4x, but I can fake it]. I'll also star=
e at
the nv30_resource_copy_region code to see what it's missing.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14810521591.bDfa2c.17718--

--===============0757203863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0757203863==--
