From: Matthias Nagel <matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Is binary firmware still necessary for GTX660 card
 (NVE0 family) in order to use DRM and/or VDPAU video acceleration?
Date: Thu, 12 Dec 2013 08:58:10 +0100
Message-ID: <CAN39ZY_QyO8N2TG2+JeAKvW1b9L74jmG8GEMRVfBexKsKFiFow@mail.gmail.com>
References: <CAN39ZY-1Z=t7i8e=jFYaNH8Tj32J62da085N3uTi-P-8-rp9Uw@mail.gmail.com>
	<52A9697A.4050204@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1583234279=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <52A9697A.4050204-GANU6spQydw@public.gmane.org>
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

--===============1583234279==
Content-Type: multipart/alternative; boundary=089e015373bcf6c21604ed51b47a

--089e015373bcf6c21604ed51b47a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Martin,
if you refer to my kernel version. 3.10.17 is the latest, stable version in
the official gentoo repository for the amd64 architeture. See here

[4] https://packages.gentoo.org/package/sys-kernel/gentoo-sources?full_cat

As long as I do not miss any features, I stay with the stable version.

Hence, if I understand you correctly, there are kernel version (newer than
some unknown point in time) that already include the firmware? If this is
the case, someone who knows the exact kernel version should mention that
point on

[1] http://nouveau.freedesktop.org/wiki/InstallDRM/
[2] http://nouveau.freedesktop.org/wiki/VideoAcceleration/
[3] https://bugs.gentoo.org/show_bug.cgi?id=3D480832

and update the information.

Matthias



2013/12/12 Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>

> On 12/12/2013 08:32, Matthias Nagel wrote:
>
>> Hello,
>>
>> I run the Gentoo Linux distribution and use a self-compiled Linux 3.10.1=
7
>> kernel. According to
>>
>> [1] http://nouveau.freedesktop.org/wiki/InstallDRM/
>> [2] http://nouveau.freedesktop.org/wiki/VideoAcceleration/
>>
>> I need the original firmware from the binary driver in order to
>> sucessully use DRM and to use VDPAU video acceleration. I used the pytho=
n
>> script from [2] and I had a look at the ebuild from
>>
>> [3] https://bugs.gentoo.org/show_bug.cgi?id=3D480832
>>
>> to extract the firmware and to place it at /lib/firmware/nouveau. But I
>> do not see any dmesg output about loading the firmware. I do not see any
>> dmesg output about nouveau failing to do so either. I neither do no see =
any
>> "nouveau <pci id>: firmware: requesting nouveau/" in my kernel output.
>>
>> Anyway VDPAU seems to work. If I call mplayer with "-vo vdpau -vc
>> ffmpeg12vdpau,...", I don't get any error message and my CPU load drops
>> from 30% to 7% for a recent mpeg transport stream 1080p video.
>>
>> In conclusion, do I still need the firmware? Do the information given at
>> [1], [2] still apply or are they outdated?
>>
>
> Thanks for your first hand investigation. To be honest, I can't remember
> which kernel provides a working-enough open source pgraph fw.
>
> As you figured out, it works for you, but you should update your kernel,
> there is no point in staying on old Linux releases, at least Nouveau-wise=
.
> If there was a regression, let us know instead of staying on an old kerne=
l.
>
> Cheers,
> Martin Peres
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>



--=20
Matthias Nagel
Parkstra=C3=9Fe 27
76131 Karlsruhe

Festnetz: +49-721-96869289
Mobil: +49-151-15998774
e-Mail: matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
ICQ: 499797758
Skype: nagmat84

--089e015373bcf6c21604ed51b47a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Martin,<br></div>if you refer to my kernel ve=
rsion. 3.10.17 is the latest, stable version in the official gentoo reposit=
ory for the amd64 architeture. See here<br><br>[4] <a href=3D"https://packa=
ges.gentoo.org/package/sys-kernel/gentoo-sources?full_cat">https://packages=
.gentoo.org/package/sys-kernel/gentoo-sources?full_cat</a><br>
<br></div><div>As long as I do not miss any features, I stay with the stabl=
e version.<br></div><div><br></div>Hence, if I understand you correctly, th=
ere are kernel version (newer than some unknown point in time) that already=
 include the firmware? If this is the case, someone who knows the exact ker=
nel version should mention that point on<br>
<br>[1] <a href=3D"http://nouveau.freedesktop.org/wiki/InstallDRM/" target=
=3D"_blank">http://nouveau.freedesktop.org/wiki/InstallDRM/</a><br>
[2] <a href=3D"http://nouveau.freedesktop.org/wiki/VideoAcceleration/" targ=
et=3D"_blank">http://nouveau.freedesktop.org/wiki/VideoAcceleration/</a><br=
>[3] <a href=3D"https://bugs.gentoo.org/show_bug.cgi?id=3D480832" target=3D=
"_blank">https://bugs.gentoo.org/show_bug.cgi?id=3D480832</a><br>
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">and update =
the information.<br><br></div><div class=3D"gmail_extra">Matthias<br></div>=
<div class=3D"gmail_extra"><br><br></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">
2013/12/12 Martin Peres <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.pere=
s@free.fr" target=3D"_blank">martin.peres-GANU6spQydw@public.gmane.org</a>&gt;</span><br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<div class=3D"im">On 12/12/2013 08:32, Matthias Nagel wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hello,<br>
<br>
I run the Gentoo Linux distribution and use a self-compiled Linux 3.10.17 k=
ernel. According to<br>
<br>
[1] <a href=3D"http://nouveau.freedesktop.org/wiki/InstallDRM/" target=3D"_=
blank">http://nouveau.freedesktop.<u></u>org/wiki/InstallDRM/</a><br>
[2] <a href=3D"http://nouveau.freedesktop.org/wiki/VideoAcceleration/" targ=
et=3D"_blank">http://nouveau.freedesktop.<u></u>org/wiki/VideoAcceleration/=
</a><br>
<br>
I need the original firmware from the binary driver in order to sucessully =
use DRM and to use VDPAU video acceleration. I used the python script from =
[2] and I had a look at the ebuild from<br>
<br>
[3] <a href=3D"https://bugs.gentoo.org/show_bug.cgi?id=3D480832" target=3D"=
_blank">https://bugs.gentoo.org/show_<u></u>bug.cgi?id=3D480832</a><br>
<br>
to extract the firmware and to place it at /lib/firmware/nouveau. But I do =
not see any dmesg output about loading the firmware. I do not see any dmesg=
 output about nouveau failing to do so either. I neither do no see any &quo=
t;nouveau &lt;pci id&gt;: firmware: requesting nouveau/&quot; in my kernel =
output.<br>

<br>
Anyway VDPAU seems to work. If I call mplayer with &quot;-vo vdpau -vc ffmp=
eg12vdpau,...&quot;, I don&#39;t get any error message and my CPU load drop=
s from 30% to 7% for a recent mpeg transport stream 1080p video.<br>
<br>
In conclusion, do I still need the firmware? Do the information given at [1=
], [2] still apply or are they outdated?<br>
</blockquote>
<br></div>
Thanks for your first hand investigation. To be honest, I can&#39;t remembe=
r which kernel provides a working-enough open source pgraph fw.<br>
<br>
As you figured out, it works for you, but you should update your kernel, th=
ere is no point in staying on old Linux releases, at least Nouveau-wise. If=
 there was a regression, let us know instead of staying on an old kernel.<b=
r>

<br>
Cheers,<br>
Martin Peres<br>
______________________________<u></u>_________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/<u></u>mailman/listinfo/nouveau</a><b=
r>
</blockquote></div><br><br clear=3D"all"><br>-- <br>Matthias Nagel<br>Parks=
tra=C3=9Fe 27<br>76131 Karlsruhe<br><br>Festnetz: +49-721-96869289<br>Mobil=
: +49-151-15998774<br>e-Mail: <a href=3D"mailto:matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org"=
 target=3D"_blank">matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a><br>
ICQ: 499797758<br>Skype: nagmat84
</div></div>

--089e015373bcf6c21604ed51b47a--

--===============1583234279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1583234279==--
