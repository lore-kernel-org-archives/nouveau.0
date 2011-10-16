From: "Dmitriy.Trt" <dmitriy.trt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NVIDIA (including Optimus) laptop owners - please
	read!
Date: Sun, 16 Oct 2011 21:37:05 +0700
Message-ID: <CAEBsfjeBuhFTFUdod-q4Ma5d3RJU6deb7MHFCs73M=oHtTW28w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1636590566=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1636590566==
Content-Type: multipart/alternative; boundary=bcaec5314e79a5a93004af6b6cc3

--bcaec5314e79a5a93004af6b6cc3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

i2cdetect output has both 0x54 and 0x56. But I've stuck on getting vbios
images.
# nvagetbios -s PROM >vbios.rom

gives me the error you've mentioned:

> Attempt to extract the vbios from card 0 (nv86) using PROM
> Invalid signature(0x55aa). You may want to try another retrieval method.
>

and adding string (without quotes) "nouveau.vbios=3DACPI" to kernel options
doesn't work at all. GRUB2 shows me error:

> alloc magic is broken at 0xdfbdbc50
> Aborted. Press any key to exit.
>

Nouveau already works MUCH better than proprietary driver for my tasks.
Thanks a lot for that! Please help me to help you.

My system info:

   - Debian testing/unstable
   - kernel 3.0.0-1-686-pae from repository
   - libdrm-nouveau1a 2.4.26-1
   - xserver-xorg-video-nouveau 1:0.0.16+git20110411+8378443-1+exp1

--
=D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=B9 =D0=A2=D0=B0=D1=80=D1=82=D1=8B=
=D0=BD=D0=BE=D0=B2 aka Dmitriy.trt
Jabber: dmitriy.trt-962d5TIgE1qHXe+LvDLADg@public.gmane.org
Skype: dmitriytrt

--bcaec5314e79a5a93004af6b6cc3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

i2cdetect output has both 0x54 and 0x56. But I&#39;ve stuck on getting vbio=
s images.<br># nvagetbios -s PROM &gt;vbios.rom<br><br>gives me the error y=
ou&#39;ve mentioned:<br><blockquote style=3D"margin: 0pt 0pt 0pt 0.8ex; bor=
der-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;" class=3D"gmail_=
quote">
Attempt to extract the vbios from card 0 (nv86) using PROM<br>Invalid signa=
ture(0x55aa). You may want to try another retrieval method.<br></blockquote=
><br>and adding string (without quotes) &quot;nouveau.vbios=3DACPI&quot; to=
 kernel options doesn&#39;t work at all. GRUB2 shows me error:<br>
<blockquote style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(=
204, 204, 204); padding-left: 1ex;" class=3D"gmail_quote">alloc magic is br=
oken at 0xdfbdbc50<br>Aborted. Press any key to exit.<br></blockquote><div>
<br>Nouveau already works MUCH better than proprietary driver for my tasks.=
 Thanks a lot for that! Please help me to help you.<br><br>My system info: =
<br><ul><li>Debian testing/unstable</li><li>kernel 3.0.0-1-686-pae from rep=
ository<br>
</li><li>libdrm-nouveau1a 2.4.26-1</li><li>xserver-xorg-video-nouveau 1:0.0=
.16+git20110411+8378443-1+exp1<br></li></ul></div>--<br>=D0=94=D0=BC=D0=B8=
=D1=82=D1=80=D0=B8=D0=B9 =D0=A2=D0=B0=D1=80=D1=82=D1=8B=D0=BD=D0=BE=D0=B2 a=
ka Dmitriy.trt<br>Jabber: <a href=3D"mailto:dmitriy.trt-962d5TIgE1qHXe+LvDLADg@public.gmane.org" target=
=3D"_blank">dmitriy.trt-962d5TIgE1qHXe+LvDLADg@public.gmane.org</a><br>
Skype: dmitriytrt<br><br>

--bcaec5314e79a5a93004af6b6cc3--

--===============1636590566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1636590566==--
