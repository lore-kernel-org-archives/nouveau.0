From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99400] [nouveau] garbled rendering with glamor on G71
Date: Tue, 17 Jan 2017 11:03:27 +0000
Message-ID: <bug-99400-8800-gBq5uQctWz@http.bugs.freedesktop.org/>
References: <bug-99400-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0743073867=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99400-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0743073867==
Content-Type: multipart/alternative; boundary="14846510070.06DcCeb.6755";
 charset="UTF-8"


--14846510070.06DcCeb.6755
Date: Tue, 17 Jan 2017 11:03:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99400

--- Comment #11 from Olivier Fourdan <fourdan-eaOCjQ5FDoY@public.gmane.org> ---
(In reply to Olivier Fourdan from comment #10)
> (In reply to Olivier Fourdan from comment #9)
> >   glamor_composite_choose_shader:       Unsupported source picture form=
at.
> >     glamor_composite_with_shader:       glamor_composite_choose_shader =
failed
>=20
> I see the same with intel and yet rendering is correct there, so it's not
> that.

Unless the issue is with the fallback code in glamor, i.e.:

https://cgit.freedesktop.org/xorg/xserver/tree/glamor/glamor_render.c#n1699

Calling the fallback code unconditionally (i.e. "goto fail;" at the beginni=
ng
of glamor_composite() ) still exhibits the issue on nvidia/nouveau and not =
on
intel, but then it doesn't seem to be specific to nouveau... I am confused =
now.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14846510070.06DcCeb.6755
Date: Tue, 17 Jan 2017 11:03:27 +0000
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
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400">bug 99400<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fourdan&#64;xfce.org" title=3D"Olivier Fourdan &lt;fourdan&#64;xfce.org&gt;=
"> <span class=3D"fn">Olivier Fourdan</span></a>
</span></b>
        <pre>(In reply to Olivier Fourdan from <a href=3D"show_bug.cgi?id=
=3D99400#c10">comment #10</a>)
<span class=3D"quote">&gt; (In reply to Olivier Fourdan from <a href=3D"sho=
w_bug.cgi?id=3D99400#c9">comment #9</a>)
&gt; &gt;   glamor_composite_choose_shader:       Unsupported source pictur=
e format.
&gt; &gt;     glamor_composite_with_shader:       glamor_composite_choose_s=
hader failed
&gt;=20
&gt; I see the same with intel and yet rendering is correct there, so it's =
not
&gt; that.</span >

Unless the issue is with the fallback code in glamor, i.e.:

<a href=3D"https://cgit.freedesktop.org/xorg/xserver/tree/glamor/glamor_ren=
der.c#n1699">https://cgit.freedesktop.org/xorg/xserver/tree/glamor/glamor_r=
ender.c#n1699</a>

Calling the fallback code unconditionally (i.e. &quot;goto fail;&quot; at t=
he beginning
of glamor_composite() ) still exhibits the issue on nvidia/nouveau and not =
on
intel, but then it doesn't seem to be specific to nouveau... I am confused =
now.</pre>
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

--14846510070.06DcCeb.6755--

--===============0743073867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0743073867==--
