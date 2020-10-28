From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: GT710 and Nouveau on ARM/ARM64
Date: Wed, 28 Oct 2020 10:10:08 -0400
Message-ID: <CAKb7Uvi-+0nt8Jfp+kaRC=Eq2s5bSB_VFSHqSyV_9tgdDRvg9A@mail.gmail.com>
References: <CAPY8ntDMWeJao5Ld435s0cLSH-a7yYe4=daUso-nZNLdarMupg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0586449361=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPY8ntDMWeJao5Ld435s0cLSH-a7yYe4=daUso-nZNLdarMupg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Dave Stevenson <dave.stevenson-FnsA7b+Nu9Xg+KzdeAJ3hg@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0586449361==
Content-Type: multipart/alternative; boundary="0000000000004fe47405b2bbb9ad"

--0000000000004fe47405b2bbb9ad
Content-Type: text/plain; charset="UTF-8"

The most common issue on arm is that the pci memory window is too narrow to
allocate all the BARs. Can you see if there are messages in the kernel to
that effect?

On Wed, Oct 28, 2020, 9:46 AM Dave Stevenson <dave.stevenson-FnsA7b+Nu9Xg+KzdeAJ3hg@public.gmane.org>
wrote:

> Hi
>
> Seeing as we (Raspberry Pi) have just launched the Compute Module 4
> with an exposed PCIe x1 lane, people are asking about adding graphics
> cards.
>
> Seeing as you are the people who have the knowledge with regard to
> NVidia and nouveau, what are your immediate thoughts of nouveau
> working on ARM/ARM64? Is there a chance of this working? I'm no PCIe
> expert, although I can call on some expertise :-/
>
> I've tried it so far with a GT710 board [1] and ARM64. It's blowing up
> in the memset of nvkm_instobj_new whilst initialising the BAR
> subdevice [2], having gone through the "No such luck" path in
> nvkm_mmu_ptc_get [3].
>
> Taking the naive approach of simply removing the memset, I get through
> initialising all the subdevices, but again die in a location I
> currently haven't pinpointed. The last logging messages are:
> [ 1023.407302] nouveau 0000:01:00.0: fifo: one-time init completed in 760us
> [ 1023.407312] nouveau 0000:01:00.0: fifo: init completed in 775us
> [ 1023.407325] nouveau: DRM-master:00000000:80009009: init running...
> [ 1023.407329] nouveau: DRM-master:00000000:80009009: init children...
> [ 1023.407333] nouveau: DRM-master:00000000:80009009: init completed in 4us
> [ 1023.407352] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at
> 00000000000d1000 engine 05 [BAR2] client 08 [HUB/HOST_CPU_NB] reason
> 02 [PTE] on channel -1 [007fd38000 unknown]
> [ 1023.407354] nouveau: DRM-master:00000000:00000000: ioctl: return 0
> [ 1023.407385] nouveau: DRM-master:00000000:00000000: ioctl: size 32
> [ 1023.407392] nouveau: DRM-master:00000000:00000000: ioctl: vers 0
> type 01 object ffffff80ee8c2170 owner ff
> [ 1023.407415] nouveau: DRM-master:00000000:80009009: ioctl: sclass size 8
> [ 1023.407419] nouveau: DRM-master:00000000:80009009: ioctl: sclass
> vers 0 count 0
> [ 1023.407432] nouveau: DRM-master:00000000:00000000: ioctl: return 0
> [ 1023.407452] nouveau: DRM-master:00000000:00000000: ioctl: size 48
> [ 1023.407459] nouveau: DRM-master:00000000:00000000: ioctl: vers 0
> type 01 object ffffff80ee8c2170 owner ff
> [ 1023.407482] nouveau: DRM-master:00000000:80009009: ioctl: sclass size 24
> [ 1023.407485] nouveau: DRM-master:00000000:80009009: ioctl: sclass
> vers 0 count 2
> [ 1023.407498] nouveau: DRM-master:00000000:00000000: ioctl: return 0
> [ 1023.407519] nouveau: DRM-master:00000000:00000000: ioctl: size 48
>
> Any input very welcome, otherwise I'll continue blundering about
> slightly in the dark.
>
> Thanks
>   Dave
>
> [1]
> https://www.amazon.co.uk/ASUS-GT710-4H-SL-2GD5-GeForce-Multi-Monitor-Productivity/dp/B0897T6PYM/
> [2]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c#L114
> [3]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c#L201
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--0000000000004fe47405b2bbb9ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The most common issue on arm is that the pci memory windo=
w is too narrow to allocate all the BARs. Can you see if there are messages=
 in the kernel to that effect?</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Oct 28, 2020, 9:46 AM Dave Stevenson =
&lt;<a href=3D"mailto:dave.stevenson-FnsA7b+Nu9Xg+KzdeAJ3hg@public.gmane.org">dave.stevenson@raspbe=
rrypi.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi<br>
<br>
Seeing as we (Raspberry Pi) have just launched the Compute Module 4<br>
with an exposed PCIe x1 lane, people are asking about adding graphics<br>
cards.<br>
<br>
Seeing as you are the people who have the knowledge with regard to<br>
NVidia and nouveau, what are your immediate thoughts of nouveau<br>
working on ARM/ARM64? Is there a chance of this working? I&#39;m no PCIe<br=
>
expert, although I can call on some expertise :-/<br>
<br>
I&#39;ve tried it so far with a GT710 board [1] and ARM64. It&#39;s blowing=
 up<br>
in the memset of nvkm_instobj_new whilst initialising the BAR<br>
subdevice [2], having gone through the &quot;No such luck&quot; path in<br>
nvkm_mmu_ptc_get [3].<br>
<br>
Taking the naive approach of simply removing the memset, I get through<br>
initialising all the subdevices, but again die in a location I<br>
currently haven&#39;t pinpointed. The last logging messages are:<br>
[ 1023.407302] nouveau 0000:01:00.0: fifo: one-time init completed in 760us=
<br>
[ 1023.407312] nouveau 0000:01:00.0: fifo: init completed in 775us<br>
[ 1023.407325] nouveau: DRM-master:00000000:80009009: init running...<br>
[ 1023.407329] nouveau: DRM-master:00000000:80009009: init children...<br>
[ 1023.407333] nouveau: DRM-master:00000000:80009009: init completed in 4us=
<br>
[ 1023.407352] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at<br>
00000000000d1000 engine 05 [BAR2] client 08 [HUB/HOST_CPU_NB] reason<br>
02 [PTE] on channel -1 [007fd38000 unknown]<br>
[ 1023.407354] nouveau: DRM-master:00000000:00000000: ioctl: return 0<br>
[ 1023.407385] nouveau: DRM-master:00000000:00000000: ioctl: size 32<br>
[ 1023.407392] nouveau: DRM-master:00000000:00000000: ioctl: vers 0<br>
type 01 object ffffff80ee8c2170 owner ff<br>
[ 1023.407415] nouveau: DRM-master:00000000:80009009: ioctl: sclass size 8<=
br>
[ 1023.407419] nouveau: DRM-master:00000000:80009009: ioctl: sclass<br>
vers 0 count 0<br>
[ 1023.407432] nouveau: DRM-master:00000000:00000000: ioctl: return 0<br>
[ 1023.407452] nouveau: DRM-master:00000000:00000000: ioctl: size 48<br>
[ 1023.407459] nouveau: DRM-master:00000000:00000000: ioctl: vers 0<br>
type 01 object ffffff80ee8c2170 owner ff<br>
[ 1023.407482] nouveau: DRM-master:00000000:80009009: ioctl: sclass size 24=
<br>
[ 1023.407485] nouveau: DRM-master:00000000:80009009: ioctl: sclass<br>
vers 0 count 2<br>
[ 1023.407498] nouveau: DRM-master:00000000:00000000: ioctl: return 0<br>
[ 1023.407519] nouveau: DRM-master:00000000:00000000: ioctl: size 48<br>
<br>
Any input very welcome, otherwise I&#39;ll continue blundering about<br>
slightly in the dark.<br>
<br>
Thanks<br>
=C2=A0 Dave<br>
<br>
[1] <a href=3D"https://www.amazon.co.uk/ASUS-GT710-4H-SL-2GD5-GeForce-Multi=
-Monitor-Productivity/dp/B0897T6PYM/" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://www.amazon.co.uk/ASUS-GT710-4H-SL-2GD5-GeForce-Multi-Mo=
nitor-Productivity/dp/B0897T6PYM/</a><br>
[2] <a href=3D"https://elixir.bootlin.com/linux/latest/source/drivers/gpu/d=
rm/nouveau/nvkm/subdev/instmem/base.c#L114" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://elixir.bootlin.com/linux/latest/source/drivers/gpu=
/drm/nouveau/nvkm/subdev/instmem/base.c#L114</a><br>
[3] <a href=3D"https://elixir.bootlin.com/linux/latest/source/drivers/gpu/d=
rm/nouveau/nvkm/subdev/mmu/base.c#L201" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm=
/nouveau/nvkm/subdev/mmu/base.c#L201</a><br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank" rel=3D"n=
oreferrer">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailm=
an/listinfo/nouveau</a><br>
</blockquote></div>

--0000000000004fe47405b2bbb9ad--

--===============0586449361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0586449361==--
