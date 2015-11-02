From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90626] HP ZBook 15 nouveau driver hangup for kernel
	>= 4.1
Date: Mon, 02 Nov 2015 09:19:57 +0000
Message-ID: <bug-90626-8800-9XJy6NlDsp@http.bugs.freedesktop.org/>
References: <bug-90626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1725511899=="
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


--===============1725511899==
Content-Type: multipart/alternative; boundary="1446455998.D644bBF4.7457"; charset="UTF-8"


--1446455998.D644bBF4.7457
Date: Mon, 2 Nov 2015 09:19:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D90626

--- Comment #30 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #28)
> (In reply to Ren=C3=A9 Krell from comment #27)
> > (In reply to Ilia Mirkin from comment #26)
> > > FTR, the _ROM function from both dumps (same thing):
> > > ...
> > >                              0x00=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
> > > /* . */
> > > ...
> >=20
> > Shouldn't this be also reported to HP? What do you think?
>=20
> This bit is fine, it handles the out-of-bounds case. The sad bit is
>=20
>                     OperationRegion (OROM, SystemMemory, Local0, 0x1000)
>=20
> Which hard-codes a 4K-sized region instead of taking it from Arg1. Feel f=
ree
> to give your contact at HP a call :)

Actually judging from the comments in nouveau, the spec calls for precisely=
 the
behavior they implement. However most manufacturers just expose the full bi=
os
anyways, not a 4K-sized chunk.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1446455998.D644bBF4.7457
Date: Mon, 2 Nov 2015 09:19:58 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626#c30">Commen=
t # 30</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626">bug 90626<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D906=
26#c28">comment #28</a>)
<span class=3D"quote">&gt; (In reply to Ren=C3=A9 Krell from <a href=3D"sho=
w_bug.cgi?id=3D90626#c27">comment #27</a>)
&gt; &gt; (In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D90626#=
c26">comment #26</a>)
&gt; &gt; &gt; FTR, the _ROM function from both dumps (same thing):
&gt; &gt; &gt; ...
&gt; &gt; &gt;                              0x00=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
&gt; &gt; &gt; /* . */
&gt; &gt; &gt; ...
&gt; &gt;=20
&gt; &gt; Shouldn't this be also reported to HP? What do you think?
&gt;=20
&gt; This bit is fine, it handles the out-of-bounds case. The sad bit is
&gt;=20
&gt;                     OperationRegion (OROM, SystemMemory, Local0, 0x100=
0)
&gt;=20
&gt; Which hard-codes a 4K-sized region instead of taking it from Arg1. Fee=
l free
&gt; to give your contact at HP a call :)</span >

Actually judging from the comments in nouveau, the spec calls for precisely=
 the
behavior they implement. However most manufacturers just expose the full bi=
os
anyways, not a 4K-sized chunk.</pre>
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

--1446455998.D644bBF4.7457--

--===============1725511899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1725511899==--
