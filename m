From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97505] X11 does not detect nouveau when using the
 linux kernel EFI Loader (GRUB loader works fine)
Date: Sun, 16 Oct 2016 06:07:41 +0000
Message-ID: <bug-97505-8800-5jz19vDsk8@http.bugs.freedesktop.org/>
References: <bug-97505-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2065978178=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97505-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2065978178==
Content-Type: multipart/alternative; boundary="14765980611.AceAFe.8111";
 charset="UTF-8"


--14765980611.AceAFe.8111
Date: Sun, 16 Oct 2016 06:07:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97505

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I think the important difference is

[    0.134526] vgaarb: setting as boot device: PCI:0000:01:00.0

without this, X doesn't pick up the device. To be honest, I don't remember =
the
details... it's somewhere deep in X or libdrm. And it only has to do with
auto-probing.

It does seem like in your EFI boot's xorg log you have

[   488.713] (--) PCI:*(0:1:0:0) 10de:0407:106b:00a0 rev 161, Mem @
0xd2000000/16777216, 0xc0000000/268435456, 0xd0000000/33554432, I/O @
0x00005000/128, BIOS @ 0x????????/131072

Which is a good sign. So ... not sure. I bet adding an xorg.conf that
explicitly references the BusID will fix it right up though.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14765980611.AceAFe.8111
Date: Sun, 16 Oct 2016 06:07:41 +0000
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
   title=3D"NEW - X11 does not detect nouveau when using the linux kernel E=
FI Loader (GRUB loader works fine)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97505#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X11 does not detect nouveau when using the linux kernel E=
FI Loader (GRUB loader works fine)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97505">bug 97505<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I think the important difference is

[    0.134526] vgaarb: setting as boot device: PCI:0000:01:00.0

without this, X doesn't pick up the device. To be honest, I don't remember =
the
details... it's somewhere deep in X or libdrm. And it only has to do with
auto-probing.

It does seem like in your EFI boot's xorg log you have

[   488.713] (--) PCI:*(0:1:0:0) 10de:0407:106b:00a0 rev 161, Mem &#64;
0xd2000000/16777216, 0xc0000000/268435456, 0xd0000000/33554432, I/O &#64;
0x00005000/128, BIOS &#64; 0x????????/131072

Which is a good sign. So ... not sure. I bet adding an xorg.conf that
explicitly references the BusID will fix it right up though.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14765980611.AceAFe.8111--

--===============2065978178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2065978178==--
