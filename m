From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated
 riva/nvidia with nouveau
Date: Mon, 18 May 2020 10:38:47 -0400
Message-ID: <CAKb7UvgBhvE-dEfva+n5SUTJ4CZT2KKkno=SVb9Jx5KBbZWR+A@mail.gmail.com>
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com>
 <87d071aedu.fsf@mpe.ellerman.id.au> <87v9ktpd4v.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87v9ktpd4v.fsf-hBGjKatGTSWzQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Andreas Schwab <schwab-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Andreas,

On Mon, May 18, 2020 at 9:56 AM Andreas Schwab <schwab-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>
> On Mai 18 2020, Michael Ellerman wrote:
>
> > The old drivers may be crufty but they presumably have been tested by
> > people and at least somewhat work.
>
> I can confirm that the nvidia fbdev driver is working perfectly fine.
>
> > I gave it a quick spin on a G5 I have access to and dmesg has a bunch of
> > errors in it (see below). I can't actually tell if the display is
> > working because the machine is remote, and I can't go and check it at
> > the moment because the office is closed.
>
> The nouveau driver is completely borked.
>
> [    2.299204] nouveau 0000:f0:10.0: NVIDIA NV34 (034100a2)
> [    2.363100] nouveau 0000:f0:10.0: bios: version 04.34.20.19.00
> [    2.363273] nouveau 0000:f0:10.0: bios: OOB 1 00000962 00000962
> [    2.363323] nouveau 0000:f0:10.0: bios: OOB 1 00000966 00000966
> [    2.363332] nouveau 0000:f0:10.0: bios: OOB 1 00000963 00000963
> [    2.363341] nouveau 0000:f0:10.0: bios: OOB 1 00000964 00000964
> [    2.363387] nouveau 0000:f0:10.0: bios: OOB 1 0000096a 0000096a
> [    2.363396] nouveau 0000:f0:10.0: bios: OOB 1 00000967 00000967
> [    2.363405] nouveau 0000:f0:10.0: bios: OOB 1 00000968 00000968
> [    2.363453] nouveau 0000:f0:10.0: bios: OOB 1 0000096e 0000096e
> [    2.363462] nouveau 0000:f0:10.0: bios: OOB 1 0000096b 0000096b
> [    2.363471] nouveau 0000:f0:10.0: bios: OOB 1 0000096c 0000096c
> [    2.363516] nouveau 0000:f0:10.0: bios: OOB 1 00000972 00000972
> [    2.363526] nouveau 0000:f0:10.0: bios: OOB 1 0000096f 0000096f
> [    2.363534] nouveau 0000:f0:10.0: bios: OOB 1 00000970 00000970
> [    2.363580] nouveau 0000:f0:10.0: bios: OOB 1 00000976 00000976
> [    2.363589] nouveau 0000:f0:10.0: bios: OOB 1 00000973 00000973
> [    2.363597] nouveau 0000:f0:10.0: bios: OOB 1 00000974 00000974
> [    2.363643] nouveau 0000:f0:10.0: bios: OOB 1 0000097a 0000097a
> [    2.363652] nouveau 0000:f0:10.0: bios: OOB 1 00000977 00000977
> [    2.363661] nouveau 0000:f0:10.0: bios: OOB 1 00000978 00000978
> [    2.363709] nouveau 0000:f0:10.0: bios: OOB 1 0000097e 0000097e
> [    2.363718] nouveau 0000:f0:10.0: bios: OOB 1 0000097b 0000097b
> [    2.363727] nouveau 0000:f0:10.0: bios: OOB 1 0000097c 0000097c
> [    2.363772] nouveau 0000:f0:10.0: bios: OOB 1 00000982 00000982
> [    2.363781] nouveau 0000:f0:10.0: bios: OOB 1 0000097f 0000097f
> [    2.363790] nouveau 0000:f0:10.0: bios: OOB 1 00000980 00000980
> [    2.363836] nouveau 0000:f0:10.0: bios: OOB 1 00000986 00000986
> [    2.363845] nouveau 0000:f0:10.0: bios: OOB 1 00000983 00000983
> [    2.363854] nouveau 0000:f0:10.0: bios: OOB 1 00000984 00000984
> [    2.363900] nouveau 0000:f0:10.0: bios: OOB 1 0000098a 0000098a
> [    2.363909] nouveau 0000:f0:10.0: bios: OOB 1 00000987 00000987
> [    2.363918] nouveau 0000:f0:10.0: bios: OOB 1 00000988 00000988
> [    2.363965] nouveau 0000:f0:10.0: bios: OOB 1 0000098e 0000098e
> [    2.363974] nouveau 0000:f0:10.0: bios: OOB 1 0000098b 0000098b
> [    2.363983] nouveau 0000:f0:10.0: bios: OOB 1 0000098c 0000098c
> [    2.364029] nouveau 0000:f0:10.0: bios: OOB 1 00000992 00000992
> [    2.364038] nouveau 0000:f0:10.0: bios: OOB 1 0000098f 0000098f
> [    2.364047] nouveau 0000:f0:10.0: bios: OOB 1 00000990 00000990
> [    2.364383] nouveau 0000:f0:10.0: gpio: GPU is missing power, check its power cables.  Boot with nouveau.config=NvPowerChecks=0 to disable.
> [    2.364402] nouveau 0000:f0:10.0: gpio: init failed, -22
> [    2.364431] nouveau 0000:f0:10.0: init failed with -22
> [    2.364438] nouveau: DRM-master:00000000:00000080: init failed with -22
> [    2.364450] nouveau 0000:f0:10.0: DRM-master: Device allocation failed: -22
> [    2.365268] nouveau: probe of 0000:f0:10.0 failed with error -22

If you're interested in providing some further info, could you attach
your VBIOS? I did, at one point, a long time ago, get a NV34 G5
PowerMac7,3 working fine with nouveau. I'm curious if something in
your VBIOS is different, or if the logic has regressed. (It would have
been working in 4.4 or so.)

You can find the VBIOS in of, it's called "NVDA,BMP", should be
accessible in procfs or sysfs somewhere, but not 100% sure where.
(From an old guide,
/proc/device-tree/pci@f0000000/NVDA,Parent@10/NVDA,BMP seems to be it,
possibly with some local adjustments.)

Thanks,

  -ilia
