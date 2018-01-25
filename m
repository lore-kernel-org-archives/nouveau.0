From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104784] Unable to do reclocking manually
Date: Thu, 25 Jan 2018 10:40:44 +0000
Message-ID: <bug-104784-8800-9Ce94g1jyX@http.bugs.freedesktop.org/>
References: <bug-104784-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1881321064=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104784-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1881321064==
Content-Type: multipart/alternative; boundary="15168768440.EA52C7f42.24843"
Content-Transfer-Encoding: 7bit


--15168768440.EA52C7f42.24843
Date: Thu, 25 Jan 2018 10:40:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104784

--- Comment #2 from Max <berillions-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Pierre Moreau from comment #1)
> Hello,
>=20
> > AC: core 0 MHz memory 0 MHz
>=20
> means your GPU is actually suspended: since you have an Optimus
> configuration, the NVIDIA GPU will suspend automatically if it hasn=E2=80=
=99t
> received any work to do in a short while. Try for example to run
> `DRI_PRIME=3D1 glxgears`, keep it running and reissue the cat command: you
> should not see actual clocks for on the AC line.
> Have a look at https://nouveau.freedesktop.org/wiki/Optimus/ to learn how=
 to
> configure Prime.
>=20
> As for the system hang when trying to reclock a suspended GPU, patches ha=
ve
> been sent to the Nouveau mailing list, but haven=E2=80=99t been merged ye=
t. You can
> find them here:
> https://github.com/karolherbst/nouveau/commits/clk_cleanup_for_real

I added to my ~/.xinitrc this line =C2=AB xrandr --setprovideroffloadsink n=
ouveau
Intel=C2=A0=C2=BB
I see correctly the Intel GPU when i launch =C2=AB=C2=A0glxinfo | grep =C2=
=AB=C2=A0OpenGL vendor
string=C2=A0=C2=BB=C2=A0=C2=BB and the Nvidia GPU if i add DRI_PRIME=3D1.

> > And when i launch a game (Tyranny), it does not work.
>=20
> What is not working? If you didn=E2=80=99t specify anything, the game sho=
uld run on
> the =E2=80=9Cprimary=E2=80=9D GPU by default, which quite often tends to =
be the Intel GPU.

In fact the games runs with Nouveau and DRI_PRIME=3D1.
It does not work after to do the reclocking =3D> the game=E2=80=99s process=
 exist but the
game=E2=80=99s window does not appear.

Are you French, if yes it=E2=80=99s easiest to explain :
Lorsque je lance la commande pour faire le reclocking, je n=E2=80=99ai plus=
 acc=C3=A8s au
prompt, comme si la commande continue de travailler en arri=C3=A8re plan. S=
i je
verifie l=E2=80=99=C3=A9tat de pstate dans une autre commande, le reclockin=
g a l=E2=80=99air d=E2=80=99avoir
=C3=A9t=C3=A9  fait.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15168768440.EA52C7f42.24843
Date: Thu, 25 Jan 2018 10:40:44 +0000
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
   title=3D"NEW - Unable to do reclocking manually"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104784#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unable to do reclocking manually"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104784">bug 10478=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
berillions&#64;gmail.com" title=3D"Max &lt;berillions&#64;gmail.com&gt;"> <=
span class=3D"fn">Max</span></a>
</span></b>
        <pre>(In reply to Pierre Moreau from <a href=3D"show_bug.cgi?id=3D1=
04784#c1">comment #1</a>)
<span class=3D"quote">&gt; Hello,
&gt;=20
&gt; &gt; AC: core 0 MHz memory 0 MHz
&gt;=20
&gt; means your GPU is actually suspended: since you have an Optimus
&gt; configuration, the NVIDIA GPU will suspend automatically if it hasn=E2=
=80=99t
&gt; received any work to do in a short while. Try for example to run
&gt; `DRI_PRIME=3D1 glxgears`, keep it running and reissue the cat command:=
 you
&gt; should not see actual clocks for on the AC line.
&gt; Have a look at <a href=3D"https://nouveau.freedesktop.org/wiki/Optimus=
/">https://nouveau.freedesktop.org/wiki/Optimus/</a> to learn how to
&gt; configure Prime.
&gt;=20
&gt; As for the system hang when trying to reclock a suspended GPU, patches=
 have
&gt; been sent to the Nouveau mailing list, but haven=E2=80=99t been merged=
 yet. You can
&gt; find them here:
&gt; <a href=3D"https://github.com/karolherbst/nouveau/commits/clk_cleanup_=
for_real">https://github.com/karolherbst/nouveau/commits/clk_cleanup_for_re=
al</a></span >

I added to my ~/.xinitrc this line =C2=AB xrandr --setprovideroffloadsink n=
ouveau
Intel=C2=A0=C2=BB
I see correctly the Intel GPU when i launch =C2=AB=C2=A0glxinfo | grep =C2=
=AB=C2=A0OpenGL vendor
string=C2=A0=C2=BB=C2=A0=C2=BB and the Nvidia GPU if i add DRI_PRIME=3D1.

<span class=3D"quote">&gt; &gt; And when i launch a game (Tyranny), it does=
 not work.
&gt;=20
&gt; What is not working? If you didn=E2=80=99t specify anything, the game =
should run on
&gt; the =E2=80=9Cprimary=E2=80=9D GPU by default, which quite often tends =
to be the Intel GPU.</span >

In fact the games runs with Nouveau and DRI_PRIME=3D1.
It does not work after to do the reclocking =3D&gt; the game=E2=80=99s proc=
ess exist but the
game=E2=80=99s window does not appear.

Are you French, if yes it=E2=80=99s easiest to explain :
Lorsque je lance la commande pour faire le reclocking, je n=E2=80=99ai plus=
 acc=C3=A8s au
prompt, comme si la commande continue de travailler en arri=C3=A8re plan. S=
i je
verifie l=E2=80=99=C3=A9tat de pstate dans une autre commande, le reclockin=
g a l=E2=80=99air d=E2=80=99avoir
=C3=A9t=C3=A9  fait.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15168768440.EA52C7f42.24843--

--===============1881321064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1881321064==--
