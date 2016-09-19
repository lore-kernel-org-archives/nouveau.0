From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97620] [REGRESSION] KMS having issues after kernel
 upgrade (4.5.1-1 to 4.6.4-1)
Date: Mon, 19 Sep 2016 03:43:46 +0000
Message-ID: <bug-97620-8800-8tNT9mK4Kz@http.bugs.freedesktop.org/>
References: <bug-97620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1319865545=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1319865545==
Content-Type: multipart/alternative; boundary="14742566260.e3D43cF6.15103";
 charset="UTF-8"


--14742566260.e3D43cF6.15103
Date: Mon, 19 Sep 2016 03:43:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97620

--- Comment #18 from Luke Tidd <lukeisgreat-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #12)
> (In reply to Luke Tidd from comment #11)
> > # first bad commit: [a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816]
> > drm/nouveau/devinit/gf100-: detect if BIOS invoked devinit
>=20
> That's interesting. It either used to run init tables and now doesn't, or
> conversely didn't use to and now does.
>=20
> Would you mind running a "working" kernel with nouveau.debug=3Ddebug and =
see
> if it ever says "bios: running init tables"? If it does, you can probably
> make the new kernels work by adding nouveau.config=3DNvForcePost=3D1 . If=
 it
> previously didn't run the tables and now does, there's no config-line way=
 of
> overriding it.


https://bugs.freedesktop.org/attachment.cgi?id=3D126609
I don't see "bios: running init tables" but here is the entire dmesg.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14742566260.e3D43cF6.15103
Date: Mon, 19 Sep 2016 03:43:46 +0000
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
   title=3D"NEW - [REGRESSION] KMS having issues after kernel upgrade (4.5.=
1-1 to 4.6.4-1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620#c18">Commen=
t # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION] KMS having issues after kernel upgrade (4.5.=
1-1 to 4.6.4-1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620">bug 97620<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukeisgreat&#64;gmail.com" title=3D"Luke Tidd &lt;lukeisgreat&#64;gmail.com=
&gt;"> <span class=3D"fn">Luke Tidd</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D976=
20#c12">comment #12</a>)
<span class=3D"quote">&gt; (In reply to Luke Tidd from <a href=3D"show_bug.=
cgi?id=3D97620#c11">comment #11</a>)
&gt; &gt; # first bad commit: [a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816]
&gt; &gt; drm/nouveau/devinit/gf100-: detect if BIOS invoked devinit
&gt;=20
&gt; That's interesting. It either used to run init tables and now doesn't,=
 or
&gt; conversely didn't use to and now does.
&gt;=20
&gt; Would you mind running a &quot;working&quot; kernel with nouveau.debug=
=3Ddebug and see
&gt; if it ever says &quot;bios: running init tables&quot;? If it does, you=
 can probably
&gt; make the new kernels work by adding nouveau.config=3DNvForcePost=3D1 .=
 If it
&gt; previously didn't run the tables and now does, there's no config-line =
way of
&gt; overriding it.</span >


<a href=3D"https://bugs.freedesktop.org/attachment.cgi?id=3D126609">https:/=
/bugs.freedesktop.org/attachment.cgi?id=3D126609</a>
I don't see &quot;bios: running init tables&quot; but here is the entire dm=
esg.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14742566260.e3D43cF6.15103--

--===============1319865545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1319865545==--
