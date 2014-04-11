From: ~Stack~ <i.am.stack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Assistance in tracking a kernel/nouveau error
Date: Thu, 10 Apr 2014 21:59:55 -0500
Message-ID: <53475AAB.9070507@gmail.com>
References: <5339EB75.1080109@gmail.com> <5341E03C.7020109@gmail.com>
 <CAKb7UvjLr4z50Kvh2FowJ+0_va53r1n+wa5hOC=_LOU_5P7QOg@mail.gmail.com>
 <5345CAE9.1080908@gmail.com> <53471642.8010802@gmail.com>
 <CAKb7UvgG=u9TCCwMC+UJMMmsa3G6qL0KrCzE5n2rxASN14XKfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1733679264=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgG=u9TCCwMC+UJMMmsa3G6qL0KrCzE5n2rxASN14XKfA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1733679264==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2OFVIDAJLDKIIANGPSSNH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2OFVIDAJLDKIIANGPSSNH
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 04/10/2014 05:14 PM, Ilia Mirkin wrote:
> You might mention what hardware you have (lspci output for the nvidia
> card... just need the chip name), and what kernels the various distros
> are using. (I think that Ubuntu/Fedora tend not to make frankenkernels
> like RHEL does, so the version has some sort of correlation to actual
> upstream versions.) That might help identify potential issues that
> were fixed.

Greetings,
Here is the lspci info. I will try and grab the kernel versions from the
discs tomorrow (I left them at work).
Thanks!
~Stack~

> 01:00.0 VGA compatible controller: NVIDIA Corporation GF108GLM [Quadro
> 1000M] (rev a1) (prog-if 00 [VGA controller])
> 	Subsystem: Dell Device 04a3
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
> Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbo=
rt-
> <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0, Cache Line Size: 64 bytes
> 	Interrupt: pin A routed to IRQ 16
> 	Region 0: Memory at dc000000 (32-bit, non-prefetchable) [size=3D16M]
> 	Region 1: Memory at d0000000 (64-bit, prefetchable) [size=3D128M]
> 	Region 3: Memory at d8000000 (64-bit, prefetchable) [size=3D32M]
> 	Region 5: I/O ports at 7000 [size=3D128]
> 	Expansion ROM at dd000000 [disabled] [size=3D512K]
> 	Capabilities: [60] Power Management version 3
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
> 	Capabilities: [68] MSI: Enable- Count=3D1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [78] Express (v1) Endpoint, MSI 00
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1
<64us
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
> 		DevCtl:	Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
> 			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
> 		LnkCap:	Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Latency L0
> <256ns, L1 <4us
> 			ClockPM+ Surprise- LLActRep- BwNot-
> 		LnkCtl:	ASPM Disabled; RCB 64 bytes Disabled- Retrain- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> 		LnkSta:	Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+ DLActive-
> BWMgmt- ABWMgmt-
> 	Capabilities: [b4] Vendor Specific Information: Len=3D14 <?>
> 	Capabilities: [100 v1] Virtual Channel
> 		Caps:	LPEVC=3D0 RefClk=3D100ns PATEntryBits=3D1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=3DFixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=3D00 MaxTimeSlots=3D1 RejSnoopTrans-
> 			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=3Dff
> 			Status:	NegoPending- InProgress-
> 	Capabilities: [128 v1] Power Budgeting <?>
> 	Capabilities: [600 v1] Vendor Specific Information: ID=3D0001 Rev=3D1
> Len=3D024 <?>
> 	Kernel driver in use: nouveau
> 	Kernel modules: nouveau, nvidiafb
>



------enig2OFVIDAJLDKIIANGPSSNH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlNHWqsACgkQ4OKTk6qYr2S8sgCgvwG2SngzbDcoth9FmTNiDPlu
wEQAoJRX0pbVKHdELAj19L8po2Vgq28O
=0ibo
-----END PGP SIGNATURE-----

------enig2OFVIDAJLDKIIANGPSSNH--

--===============1733679264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1733679264==--
