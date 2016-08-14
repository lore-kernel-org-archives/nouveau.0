From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91779] Pure EFI: MacBookPro3,
 1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents
Date: Sun, 14 Aug 2016 02:00:55 +0000
Message-ID: <bug-91779-8800-6jPkiAseTY@http.bugs.freedesktop.org/>
References: <bug-91779-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0086429054=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91779-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0086429054==
Content-Type: multipart/alternative; boundary="14711400551.96Ba7FEcE.14762";
 charset="UTF-8"


--14711400551.96Ba7FEcE.14762
Date: Sun, 14 Aug 2016 02:00:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D91779

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Jeremy Huddleston Sequoia from comment #13)
> As you can see, the loading of /lib/firmware/vbios.rom fails with ENOENT,
> but it's certainly there.  I verified that /lib/firmware/vbios.rom is
> exactly the same as /sys/kernel/debug/dri/0/vbios.rom in BIOS-emulation m=
ode.
>=20
> Odd... gonna have to dig into it a bit more later, but if you have any
> ideas, I'd appreciate them.

The usual situation is that it's not there, and so ENOENT is returned. Note
that it has to be there when nouveau loads, not at some later point in time,
when, say, the real root partition is mounted. To maximize confusion, distro
kernel builds like to load modules from initrd, and if nouveau is loaded th=
ere,
you'll want to ensure that your vbios.rom is available from there as well.

If you build your own kernel and don't plan on soldering in random hardware
(esp not new disk controllers) into your laptop without first doing a rebui=
ld,
you can stick the vbios.rom directly into the kernel and avoid this frustra=
tion
via CONFIG_EXTRA_FIRMWARE or something similar.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14711400551.96Ba7FEcE.14762
Date: Sun, 14 Aug 2016 02:00:55 +0000
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
   title=3D"NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on l=
inux 4.1 -- Invalid ROM contents"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91779#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on l=
inux 4.1 -- Invalid ROM contents"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91779">bug 91779<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Jeremy Huddleston Sequoia from <a href=3D"show_bu=
g.cgi?id=3D91779#c13">comment #13</a>)
<span class=3D"quote">&gt; As you can see, the loading of /lib/firmware/vbi=
os.rom fails with ENOENT,
&gt; but it's certainly there.  I verified that /lib/firmware/vbios.rom is
&gt; exactly the same as /sys/kernel/debug/dri/0/vbios.rom in BIOS-emulatio=
n mode.
&gt;=20
&gt; Odd... gonna have to dig into it a bit more later, but if you have any
&gt; ideas, I'd appreciate them.</span >

The usual situation is that it's not there, and so ENOENT is returned. Note
that it has to be there when nouveau loads, not at some later point in time,
when, say, the real root partition is mounted. To maximize confusion, distro
kernel builds like to load modules from initrd, and if nouveau is loaded th=
ere,
you'll want to ensure that your vbios.rom is available from there as well.

If you build your own kernel and don't plan on soldering in random hardware
(esp not new disk controllers) into your laptop without first doing a rebui=
ld,
you can stick the vbios.rom directly into the kernel and avoid this frustra=
tion
via CONFIG_EXTRA_FIRMWARE or something similar.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14711400551.96Ba7FEcE.14762--

--===============0086429054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0086429054==--
