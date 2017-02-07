From: Karl Hanzel <karl-eIW0ACB840VAfugRpC6u6w@public.gmane.org>
Subject: CentOS 7 on MacbookPro w/ Nvidia ...
Date: Mon, 6 Feb 2017 23:06:05 -0700
Message-ID: <6B17140C-27B5-4AEC-A0C6-FD325C6715B1@khaotik.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: multipart/mixed; boundary="===============1393224260=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1393224260==
Content-Type: multipart/alternative; boundary="Apple-Mail=_05980451-C02D-46D4-BE2E-3243A7D8DF17"


--Apple-Mail=_05980451-C02D-46D4-BE2E-3243A7D8DF17
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi folks -

Hoping someone might be able to help steer me.
I=E2=80=99ve installed CentOS 7 to an older MacbookPro with Nvidia =
graphics.
X11 fails to come up.  I believe the Nouveau driver is bombing...  =
=E2=80=98dmesg  |  grep nouv=E2=80=99:

[    2.473768] nouveau 0000:01:00.0: enabling device (0002 -> 0003)
[    2.473869] nouveau 0000:01:00.0: NVIDIA G84 (084700a2)
[    2.473907] nouveau 0000:01:00.0: irq 31 for MSI/MSI-X
[    2.475169] nouveau 0000:01:00.0: Invalid ROM contents
[    2.475351] nouveau 0000:01:00.0: bios: version 60.84.49.03.00
[    2.497947] nouveau 0000:01:00.0: fb: 128 MiB GDDR3
[    2.548957] nouveau 0000:01:00.0: DRM: VRAM: 128 MiB
[    2.548960] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    2.548964] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    2.548966] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    2.548970] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000123 00010034
[    2.548973] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011210 00000028
[    2.548975] nouveau 0000:01:00.0: DRM: DCB outp 02: 02011212 00010030
[    2.548978] nouveau 0000:01:00.0: DRM: DCB outp 03: 01011211 0080c070
[    2.548980] nouveau 0000:01:00.0: DRM: DCB conn 00: 0040
[    2.548982] nouveau 0000:01:00.0: DRM: DCB conn 01: 1120
[    2.557639] nouveau 0000:01:00.0: DRM: unknown connector type 20
[    2.557691] nouveau 0000:01:00.0: DRM: failed to create encoder =
0/1/0: -19
[    2.573784] nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer =
copies
[    2.653230] nouveau 0000:01:00.0: DRM: allocated 1440x900 fb: =
0x50000, bo ffff8801344d7c00
[    3.745758] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    3.749046] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 =
on minor 0

=E2=80=98Thoughts?


Thanks!


Karl
*----->


--Apple-Mail=_05980451-C02D-46D4-BE2E-3243A7D8DF17
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Hi folks -<div class=3D""><br class=3D""></div><div =
class=3D"">Hoping someone might be able to help steer me.</div><div =
class=3D"">I=E2=80=99ve installed CentOS 7 to an older MacbookPro with =
Nvidia graphics.</div><div class=3D"">X11 fails to come up. &nbsp;I =
believe the Nouveau driver is bombing... &nbsp;=E2=80=98dmesg &nbsp;| =
&nbsp;grep nouv=E2=80=99:</div><div class=3D""><br =
class=3D""></div><blockquote style=3D"margin: 0 0 0 40px; border: none; =
padding: 0px;" class=3D""><div class=3D""><div style=3D"margin: 0px; =
line-height: normal; font-family: Monaco;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; font-size: 12px;" =
class=3D"">[&nbsp; &nbsp; 2.473768] nouveau 0000:01:00.0: enabling =
device (0002 -&gt; 0003)</span></div><div style=3D"margin: 0px; =
line-height: normal; font-family: Monaco;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; font-size: 12px;" =
class=3D"">[&nbsp; &nbsp; 2.473869] nouveau 0000:01:00.0: NVIDIA G84 =
(084700a2)</span></div><div style=3D"margin: 0px; line-height: normal; =
font-family: Monaco;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; font-size: 12px;" class=3D"">[&nbsp; &nbsp; =
2.473907] nouveau 0000:01:00.0: irq 31 for MSI/MSI-X</span></div><div =
style=3D"margin: 0px; line-height: normal; font-family: Monaco;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; =
font-size: 12px;" class=3D"">[&nbsp; &nbsp; 2.475169] nouveau =
0000:01:00.0: Invalid ROM contents</span></div><div style=3D"margin: =
0px; line-height: normal; font-family: Monaco;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; font-size: 12px;" =
class=3D"">[&nbsp; &nbsp; 2.475351] nouveau 0000:01:00.0: bios: version =
60.84.49.03.00</span></div><div style=3D"margin: 0px; line-height: =
normal; font-family: Monaco;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; font-size: 12px;" =
class=3D"">[&nbsp; &nbsp; 2.497947] nouveau 0000:01:00.0: fb: 128 MiB =
GDDR3</span></div><div style=3D"margin: 0px; line-height: normal; =
font-family: Monaco;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; font-size: 12px;" class=3D"">[&nbsp; &nbsp; =
2.548957] nouveau 0000:01:00.0: DRM: VRAM: 128 MiB</span></div><div =
style=3D"margin: 0px; line-height: normal; font-family: Monaco;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; =
font-size: 12px;" class=3D"">[&nbsp; &nbsp; 2.548960] nouveau =
0000:01:00.0: DRM: GART: 1048576 MiB</span></div><div style=3D"margin: =
0px; line-height: normal; font-family: Monaco;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; font-size: 12px;" =
class=3D"">[&nbsp; &nbsp; 2.548964] nouveau 0000:01:00.0: DRM: TMDS =
table version 2.0</span></div><div style=3D"margin: 0px; line-height: =
normal; font-family: Monaco;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; font-size: 12px;" =
class=3D"">[&nbsp; &nbsp; 2.548966] nouveau 0000:01:00.0: DRM: DCB =
version 4.0</span></div><div style=3D"margin: 0px; line-height: normal; =
font-family: Monaco;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; font-size: 12px;" class=3D"">[&nbsp; &nbsp; =
2.548970] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000123 =
00010034</span></div><div style=3D"margin: 0px; line-height: normal; =
font-family: Monaco;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; font-size: 12px;" class=3D"">[&nbsp; &nbsp; =
2.548973] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011210 =
00000028</span></div><div style=3D"margin: 0px; line-height: normal; =
font-family: Monaco;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; font-size: 12px;" class=3D"">[&nbsp; &nbsp; =
2.548975] nouveau 0000:01:00.0: DRM: DCB outp 02: 02011212 =
00010030</span></div><div style=3D"margin: 0px; line-height: normal; =
font-family: Monaco;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; font-size: 12px;" class=3D"">[&nbsp; &nbsp; =
2.548978] nouveau 0000:01:00.0: DRM: DCB outp 03: 01011211 =
0080c070</span></div><div style=3D"margin: 0px; line-height: normal; =
font-family: Monaco;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures; font-size: 12px;" class=3D"">[&nbsp; &nbsp; =
2.548980] nouveau 0000:01:00.0: DRM: DCB conn 00: 0040</span></div><div =
style=3D"margin: 0px; line-height: normal; font-family: Monaco;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; =
font-size: 12px;" class=3D"">[&nbsp; &nbsp; 2.548982] nouveau =
0000:01:00.0: DRM: DCB conn 01: 1120</span></div><div style=3D"margin: =
0px; line-height: normal; font-family: Monaco;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; font-size: 12px;" =
class=3D"">[&nbsp; &nbsp; 2.557639] nouveau 0000:01:00.0: DRM: unknown =
connector type 20</span></div><div style=3D"margin: 0px; line-height: =
normal; font-family: Monaco;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; font-size: 12px;" =
class=3D"">[&nbsp; &nbsp; 2.557691] nouveau 0000:01:00.0: DRM: failed to =
create encoder 0/1/0: -19</span></div><div style=3D"margin: 0px; =
line-height: normal; font-family: Monaco;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; font-size: 12px;" =
class=3D"">[&nbsp; &nbsp; 2.573784] nouveau 0000:01:00.0: DRM: MM: using =
CRYPT for buffer copies</span></div><div style=3D"margin: 0px; =
line-height: normal; font-family: Monaco;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures; font-size: 12px;" =
class=3D"">[&nbsp; &nbsp; 2.653230] nouveau 0000:01:00.0: DRM: allocated =
1440x900 fb: 0x50000, bo ffff8801344d7c00</span></div><div =
style=3D"margin: 0px; line-height: normal; font-family: Monaco;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; =
font-size: 12px;" class=3D"">[&nbsp; &nbsp; 3.745758] nouveau =
0000:01:00.0: fb0: nouveaufb frame buffer device</span></div><div =
style=3D"margin: 0px; line-height: normal; font-family: Monaco;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures; =
font-size: 12px;" class=3D"">[&nbsp; &nbsp; 3.749046] [drm] Initialized =
nouveau 1.3.1 20120801 for 0000:01:00.0 on minor =
0</span></div></div></blockquote><br class=3D""><div =
class=3D"">=E2=80=98Thoughts?</div><div class=3D""><br =
class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D"">Thanks!</div><div class=3D""><br class=3D""></div><div =
class=3D""><br class=3D""></div><div class=3D"">Karl</div><div =
class=3D"">*-----&gt;</div><div class=3D""><br =
class=3D""></div></body></html>=

--Apple-Mail=_05980451-C02D-46D4-BE2E-3243A7D8DF17--

--===============1393224260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1393224260==--
