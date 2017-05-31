From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101220] xorg-server-1.19.3 crashes when trying to
 enable HDMI output
Date: Wed, 31 May 2017 06:46:42 +0000
Message-ID: <bug-101220-8800-PrwjB7EpYn@http.bugs.freedesktop.org/>
References: <bug-101220-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0272506870=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101220-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0272506870==
Content-Type: multipart/alternative; boundary="14962132021.B9048.6248";
 charset="UTF-8"


--14962132021.B9048.6248
Date: Wed, 31 May 2017 06:46:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101220

--- Comment #13 from Pacho Ramos <pachoramos1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #12)
> (In reply to Pacho Ramos from comment #11)
> > I don't use any initrd... I could rely on CONFIG_EXTRA_FIRMWARE... but I
> > thought I didn't need that as nouveau is compiled as a module and not i=
nto
> > the kernel :|
>=20
> OK, well if modules are loaded off the FS and not initrd, then you're good
> on that front, assuming you really do have the updated linux-firwmare (Ap=
ril
> 4 or later --
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.g=
it/
> commit/?id=3Db14134583c2a15d4404695f72cb523daedb877ab). Lots of people use
> initrd without understanding how it works.

Yeah, my linux-firmware snapshot is the one up to
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git=
/commit/?id=3Ddf40d15d6ad617e72ce7ea00b91d9117d92dcccc

>=20
> So there are two issues here...
>=20
> #1: we should probably disable reverse prime if you don't have accelerati=
on
> (or figure out how to make it work without accel... should just be a very
> slow memcpy away... not great, but better than a non-working screen)
>=20
> #2: we should figure out what's going on with accel on your GP107 -- looks
> like stuff is just hanging (that's the "timeout" messages you see, we're
> waiting for some condition to become true, and it never does).
>=20
> I can help with the former, and hopefully Ben Skeggs can investigate the
> latter.

Great, thanks a lot:)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14962132021.B9048.6248
Date: Wed, 31 May 2017 06:46:42 +0000
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
   title=3D"NEW - xorg-server-1.19.3 crashes when trying to enable HDMI out=
put"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101220#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - xorg-server-1.19.3 crashes when trying to enable HDMI out=
put"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101220">bug 10122=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pachoramos1&#64;gmail.com" title=3D"Pacho Ramos &lt;pachoramos1&#64;gmail.c=
om&gt;"> <span class=3D"fn">Pacho Ramos</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D101=
220#c12">comment #12</a>)
<span class=3D"quote">&gt; (In reply to Pacho Ramos from <a href=3D"show_bu=
g.cgi?id=3D101220#c11">comment #11</a>)
&gt; &gt; I don't use any initrd... I could rely on CONFIG_EXTRA_FIRMWARE..=
. but I
&gt; &gt; thought I didn't need that as nouveau is compiled as a module and=
 not into
&gt; &gt; the kernel :|
&gt;=20
&gt; OK, well if modules are loaded off the FS and not initrd, then you're =
good
&gt; on that front, assuming you really do have the updated linux-firwmare =
(April
&gt; 4 or later --
&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/firmware/li=
nux-firmware.git/">https://git.kernel.org/pub/scm/linux/kernel/git/firmware=
/linux-firmware.git/</a>
&gt; commit/?id=3Db14134583c2a15d4404695f72cb523daedb877ab). Lots of people=
 use
&gt; initrd without understanding how it works.</span >

Yeah, my linux-firmware snapshot is the one up to
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-f=
irmware.git/commit/?id=3Ddf40d15d6ad617e72ce7ea00b91d9117d92dcccc">https://=
git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/=
?id=3Ddf40d15d6ad617e72ce7ea00b91d9117d92dcccc</a>

<span class=3D"quote">&gt;=20
&gt; So there are two issues here...
&gt;=20
&gt; #1: we should probably disable reverse prime if you don't have acceler=
ation
&gt; (or figure out how to make it work without accel... should just be a v=
ery
&gt; slow memcpy away... not great, but better than a non-working screen)
&gt;=20
&gt; #2: we should figure out what's going on with accel on your GP107 -- l=
ooks
&gt; like stuff is just hanging (that's the &quot;timeout&quot; messages yo=
u see, we're
&gt; waiting for some condition to become true, and it never does).
&gt;=20
&gt; I can help with the former, and hopefully Ben Skeggs can investigate t=
he
&gt; latter.</span >

Great, thanks a lot:)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14962132021.B9048.6248--

--===============0272506870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0272506870==--
