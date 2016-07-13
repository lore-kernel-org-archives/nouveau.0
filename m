From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Error handling in drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
Date: Wed, 13 Jul 2016 07:08:22 +0200
Message-ID: <019b9d28-491d-2b6d-eb7a-33c48bd6dc3c@wanadoo.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0218536493=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============0218536493==
Content-Type: multipart/alternative;
 boundary="------------FC30F85593598382A8B0B603"

This is a multi-part message in MIME format.
--------------FC30F85593598382A8B0B603
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

in file 'drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c', error 
handling in 'gm20b_tegra_read_wpr()' seams to be broken.

The code used is:

     mc = ioremap(TEGRA_MC_BASE, 0xd00);
     if (!mc) {
         nvkm_error(&sb->subdev, "...");
         return PTR_ERR(mc);
     }

so we always return '0', which means success.


Best regards,

CJ

--------------FC30F85593598382A8B0B603
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <div class=3D"moz-text-flowed" style=3D"font-family: -moz-fixed;
      font-size: 14px;" lang=3D"x-unicode">Hi,
      <br>
      <br>
      in file 'drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c',
      error handling in 'gm20b_tegra_read_wpr()' seams to be broken.
      <br>
      <br>
      The code used is:
      <br>
      <br>
      =C2=A0=C2=A0=C2=A0 mc =3D ioremap(TEGRA_MC_BASE, 0xd00);<br>
      =C2=A0=C2=A0=C2=A0 if (!mc) {<br>
      =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 nvkm_error(&amp;sb-&gt;subdev=
, "...");<br>
      =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return PTR_ERR(mc);<br>
      =C2=A0 =C2=A0 }
      <br>
      <br>
      so we always return '0', which means success.
      <br>
      <br>
      <br>
      Best regards,
      <br>
      <br>
      CJ
      <br>
    </div>
  </body>
</html>

--------------FC30F85593598382A8B0B603--

--===============0218536493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0218536493==--
