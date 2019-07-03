From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111044] Resume up from suspend sometimes freezes
 system (Optimus/Nouveau)
Date: Wed, 03 Jul 2019 00:16:11 +0000
Message-ID: <bug-111044-8800-qFee1XdYye@http.bugs.freedesktop.org/>
References: <bug-111044-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1839446590=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111044-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1839446590==
Content-Type: multipart/alternative; boundary="15621129711.c612E.9775"
Content-Transfer-Encoding: 7bit


--15621129711.c612E.9775
Date: Wed, 3 Jul 2019 00:16:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111044

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to JM9 from comment #0)
> I'm on an Optimus laptop. Every time, I resume from suspend, I get this
> message and the resume succeeds.=20
>=20
> tmp tpm0: tpm_try_transmit: send(): error -5

This is related to the TPM driver - Trusted Platform Module. No clue what i=
t's
for. Intel ME interactions perhaps?

>=20
> However, sometimes, I get this following messages and the system freezes:
>=20
> nouveau 0000:01: 00.0: disp: outp 03:0006:0f81: link rate unsupported by =
sink
> nouveau 0000:01: 00.0: disp: outp 03:0006:0f81: training failed
>=20
> Not sure if this is relevant, but I also have a external multi-monitor se=
tup.

Is the system actually frozen, or just the display is down? I suspect
disconnecting and reconnecting would "fix" the issue in such a situation.
Unfortunately I can't help much more than that, but perhaps someone else can
suggest something.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15621129711.c612E.9775
Date: Wed, 3 Jul 2019 00:16:11 +0000
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
   title=3D"NEW - Resume up from suspend sometimes freezes system (Optimus/=
Nouveau)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111044#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Resume up from suspend sometimes freezes system (Optimus/=
Nouveau)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111044">bug 11104=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to JM9 from <a href=3D"show_bug.cgi?id=3D111044#c0">=
comment #0</a>)
<span class=3D"quote">&gt; I'm on an Optimus laptop. Every time, I resume f=
rom suspend, I get this
&gt; message and the resume succeeds.=20
&gt;=20
&gt; tmp tpm0: tpm_try_transmit: send(): error -5</span >

This is related to the TPM driver - Trusted Platform Module. No clue what i=
t's
for. Intel ME interactions perhaps?

<span class=3D"quote">&gt;=20
&gt; However, sometimes, I get this following messages and the system freez=
es:
&gt;=20
&gt; nouveau 0000:01: 00.0: disp: outp 03:0006:0f81: link rate unsupported =
by sink
&gt; nouveau 0000:01: 00.0: disp: outp 03:0006:0f81: training failed
&gt;=20
&gt; Not sure if this is relevant, but I also have a external multi-monitor=
 setup.</span >

Is the system actually frozen, or just the display is down? I suspect
disconnecting and reconnecting would &quot;fix&quot; the issue in such a si=
tuation.
Unfortunately I can't help much more than that, but perhaps someone else can
suggest something.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15621129711.c612E.9775--

--===============1839446590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1839446590==--
