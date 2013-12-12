From: Matthias Nagel <matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Is binary firmware still necessary for GTX660 card (NVE0
 family) in order to use DRM and/or VDPAU video acceleration?
Date: Thu, 12 Dec 2013 08:32:49 +0100
Message-ID: <CAN39ZY-1Z=t7i8e=jFYaNH8Tj32J62da085N3uTi-P-8-rp9Uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1390420150=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1390420150==
Content-Type: multipart/alternative; boundary=047d7b676b544336db04ed515a0a

--047d7b676b544336db04ed515a0a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

I run the Gentoo Linux distribution and use a self-compiled Linux 3.10.17
kernel. According to

[1] http://nouveau.freedesktop.org/wiki/InstallDRM/
[2] http://nouveau.freedesktop.org/wiki/VideoAcceleration/

I need the original firmware from the binary driver in order to sucessully
use DRM and to use VDPAU video acceleration. I used the python script from
[2] and I had a look at the ebuild from

[3] https://bugs.gentoo.org/show_bug.cgi?id=3D480832

to extract the firmware and to place it at /lib/firmware/nouveau. But I do
not see any dmesg output about loading the firmware. I do not see any dmesg
output about nouveau failing to do so either. I neither do no see any
"nouveau <pci id>: firmware: requesting nouveau/" in my kernel output.

Anyway VDPAU seems to work. If I call mplayer with "-vo vdpau -vc
ffmpeg12vdpau,...", I don't get any error message and my CPU load drops
from 30% to 7% for a recent mpeg transport stream 1080p video.

In conclusion, do I still need the firmware? Do the information given at
[1], [2] still apply or are they outdated?

Thank you, Matthias

--
Matthias Nagel
Parkstra=C3=9Fe 27
76131 Karlsruhe

Festnetz: +49-721-96869289
Mobil: +49-151-15998774
e-Mail: matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
ICQ: 499797758
Skype: nagmat84

--047d7b676b544336db04ed515a0a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello,<br><br>I run the Gentoo Linux distributio=
n and use a self-compiled Linux 3.10.17 kernel. According to<br><br>[1] <a =
href=3D"http://nouveau.freedesktop.org/wiki/InstallDRM/">http://nouveau.fre=
edesktop.org/wiki/InstallDRM/</a><br>
[2] <a href=3D"http://nouveau.freedesktop.org/wiki/VideoAcceleration/">http=
://nouveau.freedesktop.org/wiki/VideoAcceleration/</a><br><br>I need the or=
iginal firmware from the binary driver in order to sucessully use DRM and t=
o use VDPAU video acceleration. I used the python script from [2] and I had=
 a look at the ebuild from<br>
<br>[3] <a href=3D"https://bugs.gentoo.org/show_bug.cgi?id=3D480832">https:=
//bugs.gentoo.org/show_bug.cgi?id=3D480832</a><br><br>to extract the firmwa=
re and to place it at /lib/firmware/nouveau. But I do not see any dmesg out=
put about loading the firmware. I do not see any dmesg output about nouveau=
 failing to do so either. I neither do no see any &quot;nouveau &lt;pci id&=
gt;: firmware: requesting nouveau/&quot; in my kernel output.<br>
<br>Anyway VDPAU seems to work. If I call mplayer with &quot;-vo vdpau -vc =
ffmpeg12vdpau,...&quot;, I don&#39;t get any error message and my CPU load =
drops from 30% to 7% for a recent mpeg transport stream 1080p video.<br>
<br></div>In conclusion, do I still need the firmware? Do the information g=
iven at [1], [2] still apply or are they outdated?<br><br></div>Thank you, =
Matthias<br><div><div><div><br>--<br>Matthias Nagel<br>Parkstra=C3=9Fe 27<b=
r>
76131 Karlsruhe<br><br>Festnetz: +49-721-96869289<br>Mobil: +49-151-1599877=
4<br>e-Mail: <a href=3D"mailto:matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">matthias.h.nagel=
@gmail.com</a><br>ICQ: 499797758<br>Skype: nagmat84</div></div></div></div>

--047d7b676b544336db04ed515a0a--

--===============1390420150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1390420150==--
