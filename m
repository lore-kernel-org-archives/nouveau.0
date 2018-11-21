From: Yang Tsao <yang-RBK+gUnp40Rhl2p70BpVqQ@public.gmane.org>
Subject: About Porting Android to nouveau
Date: Wed, 21 Nov 2018 16:01:31 +0800
Message-ID: <1BEC85DC-B7C2-4851-9E08-71AAD63F695D@flintos.io>
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Content-Type: multipart/mixed; boundary="===============1578591550=="
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


--===============1578591550==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_0BEB3EA6-C0D6-488D-A8B4-453E6B57A156"


--Apple-Mail=_0BEB3EA6-C0D6-488D-A8B4-453E6B57A156
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi, guys:
	I=E2=80=99m a developer of FydeOS. We porting ChromiumOS to =
amd64 and arm platforms. Now, I=E2=80=99m woking on porting android =
environment to Nvidia graphic cards. I have experience to port android =
to Vmware(SVGA).
	I found two display formats were not supported to display in =
nouveau driver: PIPE_FORMAT_R8G8B8A8_UNORM, PIPE_FORMAT_R8G8B8X8_UNORM. =
Which are defined at nv50/nv50_formats.c line: 130,131.

C4(A, R8G8B8A8_UNORM, RGBA8_UNORM, R, G, B, A, UNORM, A8B8G8R8, IB),
F3(A, R8G8B8X8_UNORM, RGBX8_UNORM, R, G, B, xx, UNORM, A8B8G8R8, TB),

	I want the last params to be =E2=80=9CTD=E2=80=9D or =E2=80=9CID=E2=
=80=9D (support PIPE_BIND_DISPLAY_TARGET) , to support android. I =
modified these code, but got display issues and kernel issue:

[   93.313995] nouveau 0000:01:00.0: gr: DATA_ERROR 0000009c [] ch 5 =
[007f6c6000 RenderThread[5395]] subc 0 class a097 mthd 15f0 data =
002c0014
[   93.314082] nouveau 0000:01:00.0: gr: DATA_ERROR 0000009c [] ch 5 =
[007f6c6000 RenderThread[5395]] subc 0 class a097 mthd 15f0 data =
002d0016
[   93.314112] nouveau 0000:01:00.0: gr: DATA_ERROR 0000009c [] ch 5 =
[007f6c6000 RenderThread[5395]] subc 0 class a097 mthd 15f0 data =
002d0018
[   93.314215] nouveau 0000:01:00.0: gr: DATA_ERROR 0000009c [] ch 5 =
[007f6c6000 RenderThread[5395]] subc 0 class a097 mthd 15f0 data =
002d001a
[   93.314244] nouveau 0000:01:00.0: gr: DATA_ERROR 0000009c [] ch 5 =
[007f6c6000 RenderThread[5395]] subc 0 class a097 mthd 15f0 data =
002d001c
[   93.314272] nouveau 0000:01:00.0: gr: DATA_ERROR 0000009c [] ch 5 =
[007f6c6000 RenderThread[5395]] subc 0 class a097 mthd 15f0 data =
002d001e
[   93.314301] nouveau 0000:01:00.0: gr: DATA_ERROR 0000009c [] ch 5 =
[007f6c6000 RenderThread[5395]] subc 0 class a097 mthd 15f0 data =
002e0020
[   93.314325] nouveau 0000:01:00.0: gr: DATA_ERROR 0000009c [] ch 5 =
[007f6c6000 RenderThread[5395]] subc 0 class a097 mthd 15f0 data =
002e0022

	Any idea?

Best regards,

	Yang Tsao=

--Apple-Mail=_0BEB3EA6-C0D6-488D-A8B4-453E6B57A156
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><meta=
 http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D"">Hi, guys:<div =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>I=E2=80=99m a developer of FydeOS. We porting ChromiumOS to amd64 =
and arm platforms. Now, I=E2=80=99m woking on porting android =
environment to Nvidia graphic cards. I have experience to port android =
to Vmware(SVGA).</div><div class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>I found two display formats were =
not supported to display in nouveau driver:&nbsp;<span =
style=3D"font-family: HelveticaNeue;" =
class=3D"">PIPE_FORMAT_R8G8B8A8_UNORM,&nbsp;</span><font =
face=3D"HelveticaNeue" class=3D"">PIPE_FORMAT_R8G8B8X8_UNORM.&nbsp;Which =
are defined at nv50/nv50_formats.c line: 130,131.</font></div><div =
class=3D""><br class=3D""></div><div class=3D""><font =
face=3D"HelveticaNeue" class=3D"">C4(A, R8G8B8A8_UNORM, RGBA8_UNORM, R, =
G, B, A, UNORM, A8B8G8R8, IB),</font></div><div class=3D""><font =
face=3D"HelveticaNeue" class=3D"">F3(A, R8G8B8X8_UNORM, RGBX8_UNORM, R, =
G, B, xx, UNORM, A8B8G8R8, TB),</font></div><div class=3D""><font =
face=3D"HelveticaNeue" class=3D""><br class=3D""></font></div><div =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>I want the last params to be =E2=80=9CTD=E2=80=9D or =E2=80=9CID=E2=
=80=9D (support PIPE_BIND_DISPLAY_TARGET) , to support android. I =
modified these code, but got display issues and kernel issue:</div><div =
class=3D""><br class=3D""></div><div class=3D""><div class=3D"">[ &nbsp; =
93.313995] nouveau 0000:01:00.0: gr: DATA_ERROR 0000009c [] ch 5 =
[007f6c6000 RenderThread[5395]] subc 0 class a097 mthd 15f0 data =
002c0014</div><div class=3D"">[ &nbsp; 93.314082] nouveau 0000:01:00.0: =
gr: DATA_ERROR 0000009c [] ch 5 [007f6c6000 RenderThread[5395]] subc 0 =
class a097 mthd 15f0 data 002d0016</div><div class=3D"">[ &nbsp; =
93.314112] nouveau 0000:01:00.0: gr: DATA_ERROR 0000009c [] ch 5 =
[007f6c6000 RenderThread[5395]] subc 0 class a097 mthd 15f0 data =
002d0018</div><div class=3D"">[ &nbsp; 93.314215] nouveau 0000:01:00.0: =
gr: DATA_ERROR 0000009c [] ch 5 [007f6c6000 RenderThread[5395]] subc 0 =
class a097 mthd 15f0 data 002d001a</div><div class=3D"">[ &nbsp; =
93.314244] nouveau 0000:01:00.0: gr: DATA_ERROR 0000009c [] ch 5 =
[007f6c6000 RenderThread[5395]] subc 0 class a097 mthd 15f0 data =
002d001c</div><div class=3D"">[ &nbsp; 93.314272] nouveau 0000:01:00.0: =
gr: DATA_ERROR 0000009c [] ch 5 [007f6c6000 RenderThread[5395]] subc 0 =
class a097 mthd 15f0 data 002d001e</div><div class=3D"">[ &nbsp; =
93.314301] nouveau 0000:01:00.0: gr: DATA_ERROR 0000009c [] ch 5 =
[007f6c6000 RenderThread[5395]] subc 0 class a097 mthd 15f0 data =
002e0020</div><div class=3D"">[ &nbsp; 93.314325] nouveau 0000:01:00.0: =
gr: DATA_ERROR 0000009c [] ch 5 [007f6c6000 RenderThread[5395]] subc 0 =
class a097 mthd 15f0 data 002e0022</div></div><div class=3D""><br =
class=3D""></div><div class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>Any idea?</div><div class=3D""><br =
class=3D""></div><div class=3D"">Best regards,</div><div class=3D""><br =
class=3D""></div><div class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>Yang =
Tsao</div></div></body></html>=

--Apple-Mail=_0BEB3EA6-C0D6-488D-A8B4-453E6B57A156--

--===============1578591550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1578591550==--
