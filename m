From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91779] Pure EFI: MacBookPro3,
 1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents
Date: Sun, 14 Aug 2016 01:10:54 +0000
Message-ID: <bug-91779-8800-uy3Xj9NmKI@http.bugs.freedesktop.org/>
References: <bug-91779-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0697112662=="
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


--===============0697112662==
Content-Type: multipart/alternative; boundary="14711370531.5a9af.7474";
 charset="UTF-8"


--14711370531.5a9af.7474
Date: Sun, 14 Aug 2016 01:10:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D91779

--- Comment #13 from Jeremy Huddleston Sequoia <jeremyhu-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> -=
--
After upgrading to Ubuntu 16.04.1, something seems off, and I'm having trou=
ble
locking it down.  I'm still using the exact same kernel that I was before t=
he
upgrade (4.4.6), and I've got the firmware in /lib/firmware/vbios.rom with =
the
following module options set in /etc/modprobe/nouveau.conf:

    options nouveau config=3DNvBios=3Dvbios.rom,NvForcePost=3D1 debug=3DVBI=
OS=3Ddebug

When nouveau loads in pure EFI mode, it logs the following:

[    1.948618] fb: switching to nouveaufb from EFI VGA
[    1.953188] nouveau 0000:01:00.0: enabling device (0002 -> 0003)
[    1.953230] nouveau 0000:01:00.0: NVIDIA G84 (084700a2)
[    1.953353] nouveau 0000:01:00.0: Direct firmware load for vbios.rom fai=
led
with error -2
[    1.953362] nouveau 0000:01:00.0: Falling back to user helper
[   61.952174] nouveau 0000:01:00.0: bios: vbios.rom invalid
[   61.953062] nouveau 0000:01:00.0: Invalid ROM contents
[   61.953079] nouveau 0000:01:00.0: bios: unable to locate usable image
[   61.953087] nouveau 0000:01:00.0: bios ctor failed, -22
[   61.953097] nouveau: probe of 0000:01:00.0 failed with error -22

When nouveau loads in BIOS emulation mode, it logs the following:

[    1.797074] nouveau 0000:01:00.0: NVIDIA G84 (084700a2)
[    1.797257] nouveau 0000:01:00.0: Direct firmware load for vbios.rom fai=
led
with error -2
[    1.797342] nouveau 0000:01:00.0: Falling back to user helper
[   61.796123] nouveau 0000:01:00.0: bios: vbios.rom invalid
[   61.813299] nouveau 0000:01:00.0: bios: version 60.84.49.03.00
[   61.875766] nouveau 0000:01:00.0: fb: 128 MiB GDDR3
[   61.926834] nouveau 0000:01:00.0: DRM: VRAM: 128 MiB
[   61.926922] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   61.927012] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   61.927101] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   61.927189] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000123 00010034
[   61.927279] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011210 00000028
[   61.927369] nouveau 0000:01:00.0: DRM: DCB outp 02: 02011212 00010030
[   61.927459] nouveau 0000:01:00.0: DRM: DCB outp 03: 01011211 0080c070
[   61.927547] nouveau 0000:01:00.0: DRM: DCB conn 00: 0040
[   61.927636] nouveau 0000:01:00.0: DRM: DCB conn 01: 1120
[   61.936343] nouveau 0000:01:00.0: DRM: unknown connector type 20
[   61.936495] nouveau 0000:01:00.0: DRM: failed to create encoder 0/1/0: -=
19
[   61.953987] nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer copies
[   62.001097] nouveau 0000:01:00.0: DRM: allocated 1440x900 fb: 0x50000, bo
ffff880036c5a800
[   62.001309] fbcon: nouveaufb (fb0) is primary device
[   62.091280] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   62.096133] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

As you can see, the loading of /lib/firmware/vbios.rom fails with ENOENT, b=
ut
it's certainly there.  I verified that /lib/firmware/vbios.rom is exactly t=
he
same as /sys/kernel/debug/dri/0/vbios.rom in BIOS-emulation mode.

Odd... gonna have to dig into it a bit more later, but if you have any idea=
s,
I'd appreciate them.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14711370531.5a9af.7474
Date: Sun, 14 Aug 2016 01:10:53 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91779#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on l=
inux 4.1 -- Invalid ROM contents"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91779">bug 91779<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jeremyhu&#64;freedesktop.org" title=3D"Jeremy Huddleston Sequoia &lt;jeremy=
hu&#64;freedesktop.org&gt;"> <span class=3D"fn">Jeremy Huddleston Sequoia</=
span></a>
</span></b>
        <pre>After upgrading to Ubuntu 16.04.1, something seems off, and I'=
m having trouble
locking it down.  I'm still using the exact same kernel that I was before t=
he
upgrade (4.4.6), and I've got the firmware in /lib/firmware/vbios.rom with =
the
following module options set in /etc/modprobe/nouveau.conf:

    options nouveau config=3DNvBios=3Dvbios.rom,NvForcePost=3D1 debug=3DVBI=
OS=3Ddebug

When nouveau loads in pure EFI mode, it logs the following:

[    1.948618] fb: switching to nouveaufb from EFI VGA
[    1.953188] nouveau 0000:01:00.0: enabling device (0002 -&gt; 0003)
[    1.953230] nouveau 0000:01:00.0: NVIDIA G84 (084700a2)
[    1.953353] nouveau 0000:01:00.0: Direct firmware load for vbios.rom fai=
led
with error -2
[    1.953362] nouveau 0000:01:00.0: Falling back to user helper
[   61.952174] nouveau 0000:01:00.0: bios: vbios.rom invalid
[   61.953062] nouveau 0000:01:00.0: Invalid ROM contents
[   61.953079] nouveau 0000:01:00.0: bios: unable to locate usable image
[   61.953087] nouveau 0000:01:00.0: bios ctor failed, -22
[   61.953097] nouveau: probe of 0000:01:00.0 failed with error -22

When nouveau loads in BIOS emulation mode, it logs the following:

[    1.797074] nouveau 0000:01:00.0: NVIDIA G84 (084700a2)
[    1.797257] nouveau 0000:01:00.0: Direct firmware load for vbios.rom fai=
led
with error -2
[    1.797342] nouveau 0000:01:00.0: Falling back to user helper
[   61.796123] nouveau 0000:01:00.0: bios: vbios.rom invalid
[   61.813299] nouveau 0000:01:00.0: bios: version 60.84.49.03.00
[   61.875766] nouveau 0000:01:00.0: fb: 128 MiB GDDR3
[   61.926834] nouveau 0000:01:00.0: DRM: VRAM: 128 MiB
[   61.926922] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   61.927012] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   61.927101] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   61.927189] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000123 00010034
[   61.927279] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011210 00000028
[   61.927369] nouveau 0000:01:00.0: DRM: DCB outp 02: 02011212 00010030
[   61.927459] nouveau 0000:01:00.0: DRM: DCB outp 03: 01011211 0080c070
[   61.927547] nouveau 0000:01:00.0: DRM: DCB conn 00: 0040
[   61.927636] nouveau 0000:01:00.0: DRM: DCB conn 01: 1120
[   61.936343] nouveau 0000:01:00.0: DRM: unknown connector type 20
[   61.936495] nouveau 0000:01:00.0: DRM: failed to create encoder 0/1/0: -=
19
[   61.953987] nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer copies
[   62.001097] nouveau 0000:01:00.0: DRM: allocated 1440x900 fb: 0x50000, bo
ffff880036c5a800
[   62.001309] fbcon: nouveaufb (fb0) is primary device
[   62.091280] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   62.096133] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

As you can see, the loading of /lib/firmware/vbios.rom fails with ENOENT, b=
ut
it's certainly there.  I verified that /lib/firmware/vbios.rom is exactly t=
he
same as /sys/kernel/debug/dri/0/vbios.rom in BIOS-emulation mode.

Odd... gonna have to dig into it a bit more later, but if you have any idea=
s,
I'd appreciate them.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14711370531.5a9af.7474--

--===============0697112662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0697112662==--
