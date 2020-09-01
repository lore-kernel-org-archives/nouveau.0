From: Analabha Roy <hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: VAAPI on GeForce GT 620M
Date: Tue, 1 Sep 2020 13:01:35 +0530
Message-ID: <CAKiGokHoArQcnVAPs0HWzJSFXhwCSLfQAirOQ-zTq=0C-97neQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0040339457=="
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

--===============0040339457==
Content-Type: multipart/alternative; boundary="000000000000ea587c05ae3b82b6"

--000000000000ea587c05ae3b82b6
Content-Type: text/plain; charset="UTF-8"

Hi,

If I am reading the featurematrix
<https://nouveau.freedesktop.org/wiki/FeatureMatrix/> right, VAAPI is
supported for nouveau on the GeForce650M (my card).

Here is the output of inxi -F

System:    Host: MediaServer Kernel: 5.4.0-42-generic x86_64 bits: 64
Console: tty 1 Distro: Ubuntu 18.04.5 LTS
Machine:   Device: laptop System: SAMSUNG product: 300E4C/300E5C/300E7C v:
0.1 serial: N/A
           Mobo: SAMSUNG model: NP300E5X-U01IN v: FAB1 serial: N/A
           UEFI [Legacy]: Phoenix v: P06RAC date: 10/25/2012
Battery    BAT1: charge: 47.5 Wh 100.0% condition: 47.5/47.5 Wh (100%)
CPU:       Dual core Intel Core i3-2310M (-MT-MCP-) cache: 3072 KB
           clock speeds: max: 2100 MHz 1: 835 MHz 2: 1031 MHz 3: 905 MHz 4:
927 MHz
Graphics:  Card-1: Intel 2nd Generation Core Processor Family Integrated
Graphics Controller
           Card-2: NVIDIA GF108M [GeForce GT 620M]
           Display Server: X.org 1.20.8 driver: i915 tty size: 171x45
Advanced Data: N/A out of X


I have installed nouveau, and extracted the firmware from the prop nvidia
drivers separately as per instructions on
 https://nouveau.freedesktop.org/wiki/VideoAcceleration/
<https://nouveau.freedesktop.org/wiki/VideoAcceleration/>
See installed firmware @ https://pastebin.com/Gaqxb88g

<https://pastebin.com/Gaqxb88g>
But running vainfo yields error: https://pastebin.com/NyULBhXt

Does the error mean that VAAPI is unsupported, or does it indicate a config
problem?

Thanks,
AR
-- 
Analabha Roy
Assistant Professor
Department of Physics
<http://www.buruniv.ac.in/academics/department/physics>
The University of Burdwan <http://www.buruniv.ac.in/>
Golapbag Campus, Barddhaman 713104
West Bengal, India
Emails: daneel-0v3tJM2ovI83uPMLIKxrzw@public.gmane.org, aroy-ZqCQOGSO5P5obvhnwckLr5/QNRX+jHPU@public.gmane.org, hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Webpage: http://www.ph.utexas.edu/~daneel/

--000000000000ea587c05ae3b82b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>If I am reading the <a href=3D"http=
s://nouveau.freedesktop.org/wiki/FeatureMatrix/">featurematrix</a> right, V=
AAPI is supported for nouveau on the GeForce650M (my card).</div><div><br><=
/div><div>Here is the output of inxi -F</div><div><br></div><div>System: =
=C2=A0 =C2=A0Host: MediaServer Kernel: 5.4.0-42-generic x86_64 bits: 64 Con=
sole: tty 1 Distro: Ubuntu 18.04.5 LTS<br>Machine: =C2=A0 Device: laptop Sy=
stem: SAMSUNG product: 300E4C/300E5C/300E7C v: 0.1 serial: N/A<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobo: SAMSUNG model: NP300E5X-U01IN v: FA=
B1 serial: N/A<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UEFI [Legacy]: P=
hoenix v: P06RAC date: 10/25/2012<br>Battery =C2=A0 =C2=A0BAT1: charge: 47.=
5 Wh 100.0% condition: 47.5/47.5 Wh (100%)<br>CPU: =C2=A0 =C2=A0 =C2=A0 Dua=
l core Intel Core i3-2310M (-MT-MCP-) cache: 3072 KB<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0clock speeds: max: 2100 MHz 1: 835 MHz 2: 1031 MHz =
3: 905 MHz 4: 927 MHz<br>Graphics: =C2=A0Card-1: Intel 2nd Generation Core =
Processor Family Integrated Graphics Controller<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Card-2: NVIDIA GF108M [GeForce GT 620M]<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Display Server: X.org 1.20.8 driver: i915 tty si=
ze: 171x45 Advanced Data: N/A out of X<br></div><div><br></div><div><br></d=
iv><div>I have installed nouveau, and extracted the firmware from the prop =
nvidia drivers separately as per instructions on<a href=3D"https://nouveau.=
freedesktop.org/wiki/VideoAcceleration/">=C2=A0https://nouveau.freedesktop.=
org/wiki/VideoAcceleration/</a></div><div>See installed firmware @=C2=A0<a =
href=3D"https://pastebin.com/Gaqxb88g">https://pastebin.com/Gaqxb88g<br></a=
></div><div><a href=3D"https://pastebin.com/Gaqxb88g"><br></a></div><div>Bu=
t running vainfo yields error:=C2=A0<a href=3D"https://pastebin.com/NyULBhX=
t">https://pastebin.com/NyULBhXt</a></div><div><br></div><div>Does the erro=
r mean that VAAPI is unsupported, or does it indicate a config problem?<br>=
</div><div><div><br></div><div>Thanks,</div><div>AR</div>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div>Analabha Roy<br></div><div>Assistant Pr=
ofessor</div><div><a href=3D"http://www.buruniv.ac.in/academics/department/=
physics" target=3D"_blank">Department of Physics</a></div><div><a href=3D"h=
ttp://www.buruniv.ac.in/" target=3D"_blank">The University of Burdwan</a></=
div><div>Golapbag Campus, Barddhaman 713104</div><div>West Bengal, India</d=
iv><div>Emails: <a href=3D"mailto:daneel-0v3tJM2ovI83uPMLIKxrzw@public.gmane.org" target=3D"_blank">dane=
el-0v3tJM2ovI83uPMLIKxrzw@public.gmane.org</a>, <a href=3D"mailto:aroy-ZqCQOGSO5P5obvhnwckLr5/QNRX+jHPU@public.gmane.org" target=3D"_bl=
ank">aroy-ZqCQOGSO5P5obvhnwckLr5/QNRX+jHPU@public.gmane.org</a>, <a href=3D"mailto:hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org"=
 target=3D"_blank">hariseldon99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a><br><div><font face=3D"tahoma,=
 sans-serif">Webpage: <a href=3D"http://www.ph.utexas.edu/~daneel/" target=
=3D"_blank">http://www.ph.utexas.edu/~daneel/</a></font></div></div></div><=
/div></div></div></div></div>

--000000000000ea587c05ae3b82b6--

--===============0040339457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0040339457==--
