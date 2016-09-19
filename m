From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97620] [REGRESSION] KMS having issues after kernel
 upgrade (4.5.1-1 to 4.6.4-1)
Date: Mon, 19 Sep 2016 03:38:55 +0000
Message-ID: <bug-97620-8800-zHijZXdVmF@http.bugs.freedesktop.org/>
References: <bug-97620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0136749026=="
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


--===============0136749026==
Content-Type: multipart/alternative; boundary="14742563351.Cf3A0c.14841";
 charset="UTF-8"


--14742563351.Cf3A0c.14841
Date: Mon, 19 Sep 2016 03:38:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97620

--- Comment #16 from Luke Tidd <lukeisgreat-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #15)
> (In reply to Luke Tidd from comment #14)
> > kernel 4.7.4-1-ARCH
> > nomodeset single
> >=20
> > # nvapeek 2240c
> > ...
> >=20
> >=20
> > testing working kernel now.
>=20
> Hm, that means that the bit we're checking is 0, which indicates that the
> VBIOS hasn't run. This is, of course, patently false, since it seems like
> this is the only video card in the system, and it's working (right? you're
> at the console, the screen is on, etc?)
Yes, working, screen is on, this is the only video card.

>=20
> And, I'm guessing, in the new kernel we're now running the vbios whereas =
we
> previously didn't use to. And running it a second time destroys the unive=
rse
> for some reason.
>=20
> Separately, I just happened to notice that you have vesafb turned on. I
> wonder if this somehow upsets matters. Any chance you could flip that off?

Sure, just a sec

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14742563351.Cf3A0c.14841
Date: Mon, 19 Sep 2016 03:38:55 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620#c16">Commen=
t # 16</a>
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
20#c15">comment #15</a>)
<span class=3D"quote">&gt; (In reply to Luke Tidd from <a href=3D"show_bug.=
cgi?id=3D97620#c14">comment #14</a>)
&gt; &gt; kernel 4.7.4-1-ARCH
&gt; &gt; nomodeset single
&gt; &gt;=20
&gt; &gt; # nvapeek 2240c
&gt; &gt; ...
&gt; &gt;=20
&gt; &gt;=20
&gt; &gt; testing working kernel now.
&gt;=20
&gt; Hm, that means that the bit we're checking is 0, which indicates that =
the
&gt; VBIOS hasn't run. This is, of course, patently false, since it seems l=
ike
&gt; this is the only video card in the system, and it's working (right? yo=
u're
&gt; at the console, the screen is on, etc?)</span >
Yes, working, screen is on, this is the only video card.

<span class=3D"quote">&gt;=20
&gt; And, I'm guessing, in the new kernel we're now running the vbios where=
as we
&gt; previously didn't use to. And running it a second time destroys the un=
iverse
&gt; for some reason.
&gt;=20
&gt; Separately, I just happened to notice that you have vesafb turned on. I
&gt; wonder if this somehow upsets matters. Any chance you could flip that =
off?</span >

Sure, just a sec</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14742563351.Cf3A0c.14841--

--===============0136749026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0136749026==--
