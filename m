From: =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: GeForce(R) GT 710 1GB PCIE x 1 on arm64
Date: Wed, 6 May 2020 15:53:26 +0200
Message-ID: <CAFCWPP+WKRhhXG3CRfqRztWbFJwUqeeY6tiip4fT9gwtyjKNwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1848318347=="
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

--===============1848318347==
Content-Type: multipart/alternative; boundary="0000000000002802dd05a4fb1899"

--0000000000002802dd05a4fb1899
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi to all.
I'm experimenting with running a
https://www.zotac.com/us/product/graphics_card/geforce%C2%AE-gt-710-1gb-pci=
e-x-1
card on an Nvidia Jetson TX2 arm64 device.
Possible?
Linux kernel aarch64 5.6.10.
Because Nvidia did not list drivers for this architecture, I'm
experimenting with a nouveau driver.
The Jetson TX2 has a default driver for the host1x framebuffer for output
from the board via HDMI.
I changed the video kernel parameter to nouveau. Booting the system OK only
there is no output on the monitor.
The device can only be controlled via the serial console.
Can anyone advise me where to start setting up - (if something needs to be
set up)

Greeting

Milan Bu=C5=A1ka

--=20

Remember, no question is too stupid and no problem too small
       -- We've all been beginners

--0000000000002802dd05a4fb1899
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi to all.<br>I&#39;m experimenting with running a <a href=
=3D"https://www.zotac.com/us/product/graphics_card/geforce%C2%AE-gt-710-1gb=
-pcie-x-1">https://www.zotac.com/us/product/graphics_card/geforce%C2%AE-gt-=
710-1gb-pcie-x-1</a> card on an Nvidia Jetson TX2 arm64 device.<br>Possible=
?<br>Linux kernel aarch64 5.6.10.<br>Because Nvidia did not list drivers fo=
r this architecture, I&#39;m experimenting with a nouveau driver.<br>The Je=
tson TX2 has a default driver for the host1x framebuffer for output from th=
e board via HDMI.<br>I changed the video kernel parameter to nouveau. Booti=
ng the system OK only there is no output on the monitor.<br>The device can =
only be controlled via the serial console.<br>Can anyone advise me where to=
 start setting up - (if something needs to be set up)<br><br>Greeting<br><b=
r>Milan Bu=C5=A1ka<br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=C2=A0 =C2=A0 =
=C2=A0<br>Remember, no question is too stupid and no problem too small<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0-- We&#39;ve all been beginners</div></div>

--0000000000002802dd05a4fb1899--

--===============1848318347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1848318347==--
