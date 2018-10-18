From: Jaejoong Kim <climbbb.kim@gmail.com>
Subject: kmemleak in nvkm_iccsense_oneinit
Date: Thu, 18 Oct 2018 19:07:48 +0900
Message-ID: <CAL6iAaLNRFK1OgKfHBHXQ4ht42jPyzTxehanqF9fEn_Hba3b9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1611874946=="
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
To: bskeggs@redhat.com, airlied@linux.ie
Cc: nouveau@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============1611874946==
Content-Type: multipart/alternative; boundary="00000000000065bbe005787df617"

--00000000000065bbe005787df617
Content-Type: text/plain; charset="UTF-8"

Hi

I got a kmemleak and it is pointing to nvkm_iccsense_oneinit().
Please refer to the below kmemleak message.

# uname -a
Linux climb 4.19.0-rc1+ #4 SMP Thu Sep 20 11:48:55 KST 2018 x86_64 x86_64
x86_64 GNU/Linux

# HW
LG Notebook. (Model Name:lg15n54)

# kmemleak mesage
unreferenced object 0xffff8801e9c58388 (size 96):
  comm "systemd-udevd", pid 130, jiffies 4294895052 (age 295965.560s)
  hex dump (first 32 bytes):
    02 05 00 6b 6b 6b 6b 6b 6b 6b 10 00 02 15 6b 6b  ...kkkkkkk....kk
    6b 6b 6b 6b 6b 6b 6b 6b 00 00 00 6b 6b 6b 6b 6b  kkkkkkkk...kkkkk
  backtrace:
    [<000000000f9caea9>] nvkm_iccsense_oneinit+0x231/0x1cf0 [nouveau]
    [<00000000d7f5cb68>] nvkm_subdev_init+0x155/0x9a0 [nouveau]
    [<00000000b2b0e9d8>] nvkm_device_init+0x332/0x5a0 [nouveau]
    [<000000003b736a7c>] nvkm_udevice_init+0x93/0xe0 [nouveau]
    [<00000000cc1011dc>] nvkm_object_init+0xcb/0x610 [nouveau]
    [<0000000006253ff8>] nvkm_ioctl_new+0x412/0x9a0 [nouveau]
    [<00000000db03ae9a>] nvkm_ioctl+0x3b4/0xbe0 [nouveau]
    [<00000000ac40bf7e>] nvif_object_init+0x2df/0x530 [nouveau]
    [<00000000e98baaae>] nvif_device_init+0x12/0xe0 [nouveau]
    [<000000006d050b26>] nouveau_cli_init+0x4e7/0x15b0 [nouveau]
    [<00000000d3f314bc>] nouveau_drm_load+0x118/0x1380 [nouveau]
    [<000000009823b666>] drm_dev_register+0x2c5/0x5a0 [drm]
    [<000000001a870888>] drm_get_pci_dev+0x16d/0x4b0 [drm]
    [<000000004d6e667f>] nouveau_drm_probe+0x459/0x620 [nouveau]
    [<00000000ad85fd78>] local_pci_probe+0xde/0x1a0
    [<00000000c07cf5fe>] pci_device_probe+0x419/0x590

Jaejoong

--00000000000065bbe005787df617
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr">Hi<div><br></div><div>I got a kmemleak and it is=
 pointing to=C2=A0nvkm_iccsense_oneinit().</div><div>Please refer to the be=
low kmemleak message.</div><div><br></div><div># uname -a</div><div><div>Li=
nux climb 4.19.0-rc1+ #4 SMP Thu Sep 20 11:48:55 KST 2018 x86_64 x86_64 x86=
_64 GNU/Linux</div></div><div><br></div><div># HW</div><div>LG Notebook. (M=
odel Name:lg15n54)</div><div><br></div><div># kmemleak mesage</div><div><di=
v>unreferenced object 0xffff8801e9c58388 (size 96):</div><div>=C2=A0 comm &=
quot;systemd-udevd&quot;, pid 130, jiffies 4294895052 (age 295965.560s)</di=
v><div>=C2=A0 hex dump (first 32 bytes):</div><div>=C2=A0 =C2=A0 02 05 00 6=
b 6b 6b 6b 6b 6b 6b 10 00 02 15 6b 6b=C2=A0 ...kkkkkkk....kk</div><div>=C2=
=A0 =C2=A0 6b 6b 6b 6b 6b 6b 6b 6b 00 00 00 6b 6b 6b 6b 6b=C2=A0 kkkkkkkk..=
.kkkkk</div><div>=C2=A0 backtrace:</div><div>=C2=A0 =C2=A0 [&lt;000000000f9=
caea9&gt;] nvkm_iccsense_oneinit+0x231/0x1cf0 [nouveau]</div><div>=C2=A0 =
=C2=A0 [&lt;00000000d7f5cb68&gt;] nvkm_subdev_init+0x155/0x9a0 [nouveau]</d=
iv><div>=C2=A0 =C2=A0 [&lt;00000000b2b0e9d8&gt;] nvkm_device_init+0x332/0x5=
a0 [nouveau]</div><div>=C2=A0 =C2=A0 [&lt;000000003b736a7c&gt;] nvkm_udevic=
e_init+0x93/0xe0 [nouveau]</div><div>=C2=A0 =C2=A0 [&lt;00000000cc1011dc&gt=
;] nvkm_object_init+0xcb/0x610 [nouveau]</div><div>=C2=A0 =C2=A0 [&lt;00000=
00006253ff8&gt;] nvkm_ioctl_new+0x412/0x9a0 [nouveau]</div><div>=C2=A0 =C2=
=A0 [&lt;00000000db03ae9a&gt;] nvkm_ioctl+0x3b4/0xbe0 [nouveau]</div><div>=
=C2=A0 =C2=A0 [&lt;00000000ac40bf7e&gt;] nvif_object_init+0x2df/0x530 [nouv=
eau]</div><div>=C2=A0 =C2=A0 [&lt;00000000e98baaae&gt;] nvif_device_init+0x=
12/0xe0 [nouveau]</div><div>=C2=A0 =C2=A0 [&lt;000000006d050b26&gt;] nouvea=
u_cli_init+0x4e7/0x15b0 [nouveau]</div><div>=C2=A0 =C2=A0 [&lt;00000000d3f3=
14bc&gt;] nouveau_drm_load+0x118/0x1380 [nouveau]</div><div>=C2=A0 =C2=A0 [=
&lt;000000009823b666&gt;] drm_dev_register+0x2c5/0x5a0 [drm]</div><div>=C2=
=A0 =C2=A0 [&lt;000000001a870888&gt;] drm_get_pci_dev+0x16d/0x4b0 [drm]</di=
v><div>=C2=A0 =C2=A0 [&lt;000000004d6e667f&gt;] nouveau_drm_probe+0x459/0x6=
20 [nouveau]</div><div>=C2=A0 =C2=A0 [&lt;00000000ad85fd78&gt;] local_pci_p=
robe+0xde/0x1a0</div><div>=C2=A0 =C2=A0 [&lt;00000000c07cf5fe&gt;] pci_devi=
ce_probe+0x419/0x590</div></div><div><br></div><div>Jaejoong</div></div></d=
iv></div></div></div></div>

--00000000000065bbe005787df617--

--===============1611874946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1611874946==--
