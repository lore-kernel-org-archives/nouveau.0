From: Terra Frost <terrafrost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nouveau doesn't recognize my hdmi monitor
Date: Thu, 29 Dec 2016 19:48:00 -0600
Message-ID: <CAKY7Jh5qHyLe1tphGOYu37QzZyzkbxp8LpAkDP1Tjig8W19Hiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1198012770=="
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

--===============1198012770==
Content-Type: multipart/alternative; boundary=001a1139e92e61766a0544d6649d

--001a1139e92e61766a0544d6649d
Content-Type: text/plain; charset=UTF-8

I have an ASUS UX50V laptop with a "NVIDIA Corporation: G98M [GeForce G
105M]" video card. Linux Mint 18.1 64-bit is installed with
xserver-xorg-video-nouveau 1:1.0.12-1build2. The Nouveau driver does not
seem to be recognizing my HDMI monitor that's plugged in. Here's the output
of xrandr:

Screen 0: minimum 8 x 8, current 1366 x 768, maximum 32767 x 32767
LVDS1 connected primary 1366x768+0+0 (normal left inverted right x axis y
axis) 344mm x 193mm
   1366x768      60.01*+
   1360x768      59.80    59.96
   1280x720      60.00
   1024x768      60.00
   1024x576      60.00
   960x540       60.00
   800x600       60.32    56.25
   864x486       60.00
   640x480       59.94
   720x405       60.00
   680x384       60.00
   640x360       60.00
VGA1 disconnected (normal left inverted right x axis y axis)
VIRTUAL1 disconnected (normal left inverted right x axis y axis)

https://i.stack.imgur.com/GJupM.png

Any ideas as to what I need to do to get this HDMI monitor working? It
worked fine when I had Windows Vista on the laptop..

Thanks!

--001a1139e92e61766a0544d6649d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have an ASUS UX50V laptop with a &quot;NVIDIA Corpo=
ration: G98M [GeForce G 105M]&quot; video card. Linux Mint 18.1 64-bit is i=
nstalled with xserver-xorg-video-nouveau 1:1.0.12-1build2. The Nouveau driv=
er does not seem to be recognizing my HDMI monitor that&#39;s plugged in. H=
ere&#39;s the output of xrandr:</div><div><br></div><div>Screen 0: minimum =
8 x 8, current 1366 x 768, maximum 32767 x 32767</div><div>LVDS1 connected =
primary 1366x768+0+0 (normal left inverted right x axis y axis) 344mm x 193=
mm</div><div>=C2=A0 =C2=A01366x768 =C2=A0 =C2=A0 =C2=A060.01*+</div><div>=
=C2=A0 =C2=A01360x768 =C2=A0 =C2=A0 =C2=A059.80 =C2=A0 =C2=A059.96 =C2=A0</=
div><div>=C2=A0 =C2=A01280x720 =C2=A0 =C2=A0 =C2=A060.00 =C2=A0</div><div>=
=C2=A0 =C2=A01024x768 =C2=A0 =C2=A0 =C2=A060.00 =C2=A0</div><div>=C2=A0 =C2=
=A01024x576 =C2=A0 =C2=A0 =C2=A060.00 =C2=A0</div><div>=C2=A0 =C2=A0960x540=
 =C2=A0 =C2=A0 =C2=A0 60.00 =C2=A0</div><div>=C2=A0 =C2=A0800x600 =C2=A0 =
=C2=A0 =C2=A0 60.32 =C2=A0 =C2=A056.25 =C2=A0</div><div>=C2=A0 =C2=A0864x48=
6 =C2=A0 =C2=A0 =C2=A0 60.00 =C2=A0</div><div>=C2=A0 =C2=A0640x480 =C2=A0 =
=C2=A0 =C2=A0 59.94 =C2=A0</div><div>=C2=A0 =C2=A0720x405 =C2=A0 =C2=A0 =C2=
=A0 60.00 =C2=A0</div><div>=C2=A0 =C2=A0680x384 =C2=A0 =C2=A0 =C2=A0 60.00 =
=C2=A0</div><div>=C2=A0 =C2=A0640x360 =C2=A0 =C2=A0 =C2=A0 60.00 =C2=A0</di=
v><div>VGA1 disconnected (normal left inverted right x axis y axis)</div><d=
iv>VIRTUAL1 disconnected (normal left inverted right x axis y axis)</div><d=
iv><br></div><div><a href=3D"https://i.stack.imgur.com/GJupM.png">https://i=
.stack.imgur.com/GJupM.png</a></div><div><br></div><div>Any ideas as to wha=
t I need to do to get this HDMI monitor working? It worked fine when I had =
Windows Vista on the laptop..</div><div><br></div><div>Thanks!</div></div>

--001a1139e92e61766a0544d6649d--

--===============1198012770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1198012770==--
