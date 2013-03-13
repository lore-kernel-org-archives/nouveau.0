From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Lots of IB_EMPTY errors on G98 (GeForce 8400 GS) on SPARC
Date: Tue, 12 Mar 2013 22:44:21 -0500
Message-ID: <CAEk2St=rCh5sXayMJS=pyxAkC4nW1aHdRWsyya6sydG-grya1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1184037964=="
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

--===============1184037964==
Content-Type: multipart/alternative; boundary=20cf30363f75b4551104d7c6388b

--20cf30363f75b4551104d7c6388b
Content-Type: text/plain; charset=ISO-8859-1

I'm running on Sun Blade 2500 with a GeForce 8400 GS PCI. After (maybe?)
fixing a few errrors with bo allocation, I'm getting a lot of IB_EMPTY
errors, ultimately resulting in a GPU lockup. I don't have any sort of
framebuffer visible.

After reading dma-pusher.txt, I see "An attempt to submit IB entry with
length zero will raise DMA_PUSHER error of type IB_EMPTY." How would an
empty command be generated?


Here is the result of "dmesg | grep nouveau".


[   68.533892] nouveau  [  DEVICE][0001:01:00.0] BOOT0  : 0x298200a2
[   69.135616] nouveau  [  DEVICE][0001:01:00.0] Chipset: G98 (NV98)
[   69.215779] nouveau  [  DEVICE][0001:01:00.0] Family : NV50
[   69.289072] nouveau  [   VBIOS][0001:01:00.0] checking PRAMIN for
image...
[   69.379477] nouveau  [   VBIOS][0001:01:00.0] ... signature not found
[   69.464251] nouveau  [   VBIOS][0001:01:00.0] checking PROM for image...
[   69.779596] nouveau  [   VBIOS][0001:01:00.0] ... appears to be valid
[   69.864300] nouveau  [   VBIOS][0001:01:00.0] using image from PROM
[   69.947636] nouveau  [   VBIOS][0001:01:00.0] BIT signature found
[   70.027748] nouveau  [   VBIOS][0001:01:00.0] version 62.98.42.00.00
[   70.112044] nouveau  [ DEVINIT][0001:01:00.0] adaptor not initialised
[   70.196782] nouveau  [   VBIOS][0001:01:00.0] running init tables
[   70.330478] nouveau  [     PFB][0001:01:00.0] RAM type: DDR2
[   70.404928] nouveau  [     PFB][0001:01:00.0] RAM size: 512 MiB
[   70.482762] nouveau  [     PFB][0001:01:00.0]    ZCOMP: 960 tags
[   71.841829] nouveau  [  PTHERM][0001:01:00.0] FAN control: none /
external
[   71.932291] nouveau  [  PTHERM][0001:01:00.0] Thermal management:
disabled
[   72.022728] nouveau  [  PTHERM][0001:01:00.0] Programmed thresholds [
90(3), 95(3), 122(2), 135(5) ]
[   72.372102] nouveau  [     DRM] VRAM: 512 MiB
[   72.429363] nouveau  [     DRM] GART: 512 MiB
[   72.486553] nouveau  [     DRM] TMDS table version 2.0
[   72.554027] nouveau  [     DRM] DCB version 4.0
[   72.613498] nouveau  [     DRM] DCB outp 00: 02000300 00000028
[   72.690134] nouveau  [     DRM] DCB outp 01: 01000302 00020030
[   72.766759] nouveau  [     DRM] DCB outp 02: 04011310 00000028
[   72.843396] nouveau  [     DRM] DCB outp 03: 010223f1 00c0c080
[   72.920019] nouveau  [     DRM] DCB conn 00: 00001030
[   72.986348] nouveau  [     DRM] DCB conn 01: 00000200
[   73.052686] nouveau  [     DRM] DCB conn 02: 00000110
[   73.119020] nouveau  [     DRM] DCB conn 03: 00000111
[   73.185358] nouveau  [     DRM] DCB conn 04: 00000113
[   73.309089] nouveau W[     DRM] failed to create encoder 0/1/0: -19
[   73.391462] nouveau W[     DRM] TV-1 has no encoders, removing
[   73.633008] nouveau E[   PDISP][0001:01:00.0] chid 0 mthd 0x0000 data
0x00000000 0x00011000
[   73.743052] nouveau  [     DRM] 1 available performance level(s)
[   73.822016] nouveau  [     DRM] 3: core 567MHz shader 1400MHz memory
500MHz fanspeed 100%
[   73.929532] nouveau  [     DRM] c: core 566MHz shader 1400MHz memory
499MHz
[   74.052172] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000000 ib_put 0x00000001 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   74.293113] nouveau  [     DRM] MM: using M2MF for buffer copies
[   74.409001] nouveau  [     DRM] allocated 1280x1024 fb: 0x70000, bo
fffff8033ca75000
[   74.510888] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000001 ib_put 0x00000002 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   74.732661] nouveau E[   PDISP][0001:01:00.0] chid 1 mthd 0x0000 data
0x00000000 0x00011000
[   76.732784] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000002 ib_put 0x00000003 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.733524] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000003 ib_put 0x00000004 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.733592] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000004 ib_put 0x00000005 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.733658] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000005 ib_put 0x00000006 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.733720] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000006 ib_put 0x00000007 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.733795] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000007 ib_put 0x00000008 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.733858] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000008 ib_put 0x00000009 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.733920] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000009 ib_put 0x0000000a state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.733982] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x0000000a ib_put 0x0000000b state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734044] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x0000000b ib_put 0x0000000c state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734106] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x0000000c ib_put 0x0000000d state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734167] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x0000000d ib_put 0x0000000e state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734229] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x0000000e ib_put 0x0000000f state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734291] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x0000000f ib_put 0x00000010 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734353] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000010 ib_put 0x00000011 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734415] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000011 ib_put 0x00000012 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734476] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000012 ib_put 0x00000013 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734538] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000013 ib_put 0x00000014 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734599] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000014 ib_put 0x00000015 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734661] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000015 ib_put 0x00000016 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734722] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000016 ib_put 0x00000017 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734783] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000017 ib_put 0x00000018 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734845] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000018 ib_put 0x00000019 state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734906] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x00000019 ib_put 0x0000001a state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   76.734968] nouveau E[   PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM]
get 0x0000000000 put 0x0000000000 ib_get 0x0000001a ib_put 0x0000001b state
0xa0000000 (err: IB_EMPTY) push 0x00406040
[   77.092784] nouveau E[     DRM] GPU lockup - switching to software fbcon
[   95.327048] nouveau 0001:01:00.0: fb0: nouveaufb frame buffer device

--20cf30363f75b4551104d7c6388b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>I&#39;m running on Sun Blade 2500 with a GeForce 8400 GS PCI. After (m=
aybe?) fixing a few errrors with bo allocation, I&#39;m getting a lot of IB=
_EMPTY errors, ultimately resulting in a GPU lockup. I don&#39;t have any s=
ort of framebuffer visible.</div>
<div><br></div><div>After reading dma-pusher.txt, I see &quot;An attempt to=
 submit IB entry with length zero will raise DMA_PUSHER error of type IB_EM=
PTY.&quot; How would an empty command be generated?</div><div><br></div>
<div><br></div><div>Here is the result of &quot;dmesg | grep nouveau&quot;.=
</div><div><br></div><div><br></div><div>[ =A0 68.533892] nouveau =A0[ =A0D=
EVICE][0001:01:00.0] BOOT0 =A0: 0x298200a2</div><div>[ =A0 69.135616] nouve=
au =A0[ =A0DEVICE][0001:01:00.0] Chipset: G98 (NV98)</div>
<div>[ =A0 69.215779] nouveau =A0[ =A0DEVICE][0001:01:00.0] Family : NV50</=
div><div>[ =A0 69.289072] nouveau =A0[ =A0 VBIOS][0001:01:00.0] checking PR=
AMIN for image...</div><div>[ =A0 69.379477] nouveau =A0[ =A0 VBIOS][0001:0=
1:00.0] ... signature not found</div>
<div>[ =A0 69.464251] nouveau =A0[ =A0 VBIOS][0001:01:00.0] checking PROM f=
or image...</div><div>[ =A0 69.779596] nouveau =A0[ =A0 VBIOS][0001:01:00.0=
] ... appears to be valid</div><div>[ =A0 69.864300] nouveau =A0[ =A0 VBIOS=
][0001:01:00.0] using image from PROM</div>
<div>[ =A0 69.947636] nouveau =A0[ =A0 VBIOS][0001:01:00.0] BIT signature f=
ound</div><div>[ =A0 70.027748] nouveau =A0[ =A0 VBIOS][0001:01:00.0] versi=
on 62.98.42.00.00</div><div>[ =A0 70.112044] nouveau =A0[ DEVINIT][0001:01:=
00.0] adaptor not initialised</div>
<div>[ =A0 70.196782] nouveau =A0[ =A0 VBIOS][0001:01:00.0] running init ta=
bles</div><div>[ =A0 70.330478] nouveau =A0[ =A0 =A0 PFB][0001:01:00.0] RAM=
 type: DDR2</div><div>[ =A0 70.404928] nouveau =A0[ =A0 =A0 PFB][0001:01:00=
.0] RAM size: 512 MiB</div>
<div>[ =A0 70.482762] nouveau =A0[ =A0 =A0 PFB][0001:01:00.0] =A0 =A0ZCOMP:=
 960 tags</div><div>[ =A0 71.841829] nouveau =A0[ =A0PTHERM][0001:01:00.0] =
FAN control: none / external</div><div>[ =A0 71.932291] nouveau =A0[ =A0PTH=
ERM][0001:01:00.0] Thermal management: disabled</div>
<div>[ =A0 72.022728] nouveau =A0[ =A0PTHERM][0001:01:00.0] Programmed thre=
sholds [ 90(3), 95(3), 122(2), 135(5) ]</div><div>[ =A0 72.372102] nouveau =
=A0[ =A0 =A0 DRM] VRAM: 512 MiB</div><div>[ =A0 72.429363] nouveau =A0[ =A0=
 =A0 DRM] GART: 512 MiB</div>
<div>[ =A0 72.486553] nouveau =A0[ =A0 =A0 DRM] TMDS table version 2.0</div=
><div>[ =A0 72.554027] nouveau =A0[ =A0 =A0 DRM] DCB version 4.0</div><div>=
[ =A0 72.613498] nouveau =A0[ =A0 =A0 DRM] DCB outp 00: 02000300 00000028</=
div><div>[ =A0 72.690134] nouveau =A0[ =A0 =A0 DRM] DCB outp 01: 01000302 0=
0020030</div>
<div>[ =A0 72.766759] nouveau =A0[ =A0 =A0 DRM] DCB outp 02: 04011310 00000=
028</div><div>[ =A0 72.843396] nouveau =A0[ =A0 =A0 DRM] DCB outp 03: 01022=
3f1 00c0c080</div><div>[ =A0 72.920019] nouveau =A0[ =A0 =A0 DRM] DCB conn =
00: 00001030</div><div>
[ =A0 72.986348] nouveau =A0[ =A0 =A0 DRM] DCB conn 01: 00000200</div><div>=
[ =A0 73.052686] nouveau =A0[ =A0 =A0 DRM] DCB conn 02: 00000110</div><div>=
[ =A0 73.119020] nouveau =A0[ =A0 =A0 DRM] DCB conn 03: 00000111</div><div>=
[ =A0 73.185358] nouveau =A0[ =A0 =A0 DRM] DCB conn 04: 00000113</div>
<div>[ =A0 73.309089] nouveau W[ =A0 =A0 DRM] failed to create encoder 0/1/=
0: -19</div><div>[ =A0 73.391462] nouveau W[ =A0 =A0 DRM] TV-1 has no encod=
ers, removing</div><div>[ =A0 73.633008] nouveau E[ =A0 PDISP][0001:01:00.0=
] chid 0 mthd 0x0000 data 0x00000000 0x00011000</div>
<div>[ =A0 73.743052] nouveau =A0[ =A0 =A0 DRM] 1 available performance lev=
el(s)</div><div>[ =A0 73.822016] nouveau =A0[ =A0 =A0 DRM] 3: core 567MHz s=
hader 1400MHz memory 500MHz fanspeed 100%</div><div>[ =A0 73.929532] nouvea=
u =A0[ =A0 =A0 DRM] c: core 566MHz shader 1400MHz memory 499MHz</div>
<div>[ =A0 74.052172] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1=
 [DRM] get 0x0000000000 put 0x0000000000 ib_get 0x00000000 ib_put 0x0000000=
1 state 0xa0000000 (err: IB_EMPTY) push 0x00406040</div><div>[ =A0 74.29311=
3] nouveau =A0[ =A0 =A0 DRM] MM: using M2MF for buffer copies</div>
<div>[ =A0 74.409001] nouveau =A0[ =A0 =A0 DRM] allocated 1280x1024 fb: 0x7=
0000, bo fffff8033ca75000</div><div>[ =A0 74.510888] nouveau E[ =A0 PFIFO][=
0001:01:00.0] DMA_PUSHER - ch 1 [DRM] get 0x0000000000 put 0x0000000000 ib_=
get 0x00000001 ib_put 0x00000002 state 0xa0000000 (err: IB_EMPTY) push 0x00=
406040</div>
<div>[ =A0 74.732661] nouveau E[ =A0 PDISP][0001:01:00.0] chid 1 mthd 0x000=
0 data 0x00000000 0x00011000</div><div>[ =A0 76.732784] nouveau E[ =A0 PFIF=
O][0001:01:00.0] DMA_PUSHER - ch 1 [DRM] get 0x0000000000 put 0x0000000000 =
ib_get 0x00000002 ib_put 0x00000003 state 0xa0000000 (err: IB_EMPTY) push 0=
x00406040</div>
<div>[ =A0 76.733524] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1=
 [DRM] get 0x0000000000 put 0x0000000000 ib_get 0x00000003 ib_put 0x0000000=
4 state 0xa0000000 (err: IB_EMPTY) push 0x00406040</div><div>[ =A0 76.73359=
2] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM] get 0x000000=
0000 put 0x0000000000 ib_get 0x00000004 ib_put 0x00000005 state 0xa0000000 =
(err: IB_EMPTY) push 0x00406040</div>
<div>[ =A0 76.733658] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1=
 [DRM] get 0x0000000000 put 0x0000000000 ib_get 0x00000005 ib_put 0x0000000=
6 state 0xa0000000 (err: IB_EMPTY) push 0x00406040</div><div>[ =A0 76.73372=
0] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM] get 0x000000=
0000 put 0x0000000000 ib_get 0x00000006 ib_put 0x00000007 state 0xa0000000 =
(err: IB_EMPTY) push 0x00406040</div>
<div>[ =A0 76.733795] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1=
 [DRM] get 0x0000000000 put 0x0000000000 ib_get 0x00000007 ib_put 0x0000000=
8 state 0xa0000000 (err: IB_EMPTY) push 0x00406040</div><div>[ =A0 76.73385=
8] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM] get 0x000000=
0000 put 0x0000000000 ib_get 0x00000008 ib_put 0x00000009 state 0xa0000000 =
(err: IB_EMPTY) push 0x00406040</div>
<div>[ =A0 76.733920] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1=
 [DRM] get 0x0000000000 put 0x0000000000 ib_get 0x00000009 ib_put 0x0000000=
a state 0xa0000000 (err: IB_EMPTY) push 0x00406040</div><div>[ =A0 76.73398=
2] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM] get 0x000000=
0000 put 0x0000000000 ib_get 0x0000000a ib_put 0x0000000b state 0xa0000000 =
(err: IB_EMPTY) push 0x00406040</div>
<div>[ =A0 76.734044] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1=
 [DRM] get 0x0000000000 put 0x0000000000 ib_get 0x0000000b ib_put 0x0000000=
c state 0xa0000000 (err: IB_EMPTY) push 0x00406040</div><div>[ =A0 76.73410=
6] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM] get 0x000000=
0000 put 0x0000000000 ib_get 0x0000000c ib_put 0x0000000d state 0xa0000000 =
(err: IB_EMPTY) push 0x00406040</div>
<div>[ =A0 76.734167] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1=
 [DRM] get 0x0000000000 put 0x0000000000 ib_get 0x0000000d ib_put 0x0000000=
e state 0xa0000000 (err: IB_EMPTY) push 0x00406040</div><div>[ =A0 76.73422=
9] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM] get 0x000000=
0000 put 0x0000000000 ib_get 0x0000000e ib_put 0x0000000f state 0xa0000000 =
(err: IB_EMPTY) push 0x00406040</div>
<div>[ =A0 76.734291] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1=
 [DRM] get 0x0000000000 put 0x0000000000 ib_get 0x0000000f ib_put 0x0000001=
0 state 0xa0000000 (err: IB_EMPTY) push 0x00406040</div><div>[ =A0 76.73435=
3] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM] get 0x000000=
0000 put 0x0000000000 ib_get 0x00000010 ib_put 0x00000011 state 0xa0000000 =
(err: IB_EMPTY) push 0x00406040</div>
<div>[ =A0 76.734415] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1=
 [DRM] get 0x0000000000 put 0x0000000000 ib_get 0x00000011 ib_put 0x0000001=
2 state 0xa0000000 (err: IB_EMPTY) push 0x00406040</div><div>[ =A0 76.73447=
6] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM] get 0x000000=
0000 put 0x0000000000 ib_get 0x00000012 ib_put 0x00000013 state 0xa0000000 =
(err: IB_EMPTY) push 0x00406040</div>
<div>[ =A0 76.734538] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1=
 [DRM] get 0x0000000000 put 0x0000000000 ib_get 0x00000013 ib_put 0x0000001=
4 state 0xa0000000 (err: IB_EMPTY) push 0x00406040</div><div>[ =A0 76.73459=
9] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM] get 0x000000=
0000 put 0x0000000000 ib_get 0x00000014 ib_put 0x00000015 state 0xa0000000 =
(err: IB_EMPTY) push 0x00406040</div>
<div>[ =A0 76.734661] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1=
 [DRM] get 0x0000000000 put 0x0000000000 ib_get 0x00000015 ib_put 0x0000001=
6 state 0xa0000000 (err: IB_EMPTY) push 0x00406040</div><div>[ =A0 76.73472=
2] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM] get 0x000000=
0000 put 0x0000000000 ib_get 0x00000016 ib_put 0x00000017 state 0xa0000000 =
(err: IB_EMPTY) push 0x00406040</div>
<div>[ =A0 76.734783] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1=
 [DRM] get 0x0000000000 put 0x0000000000 ib_get 0x00000017 ib_put 0x0000001=
8 state 0xa0000000 (err: IB_EMPTY) push 0x00406040</div><div>[ =A0 76.73484=
5] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM] get 0x000000=
0000 put 0x0000000000 ib_get 0x00000018 ib_put 0x00000019 state 0xa0000000 =
(err: IB_EMPTY) push 0x00406040</div>
<div>[ =A0 76.734906] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1=
 [DRM] get 0x0000000000 put 0x0000000000 ib_get 0x00000019 ib_put 0x0000001=
a state 0xa0000000 (err: IB_EMPTY) push 0x00406040</div><div>[ =A0 76.73496=
8] nouveau E[ =A0 PFIFO][0001:01:00.0] DMA_PUSHER - ch 1 [DRM] get 0x000000=
0000 put 0x0000000000 ib_get 0x0000001a ib_put 0x0000001b state 0xa0000000 =
(err: IB_EMPTY) push 0x00406040</div>
<div>[ =A0 77.092784] nouveau E[ =A0 =A0 DRM] GPU lockup - switching to sof=
tware fbcon</div><div>[ =A0 95.327048] nouveau 0001:01:00.0: fb0: nouveaufb=
 frame buffer device</div><div><br></div>

--20cf30363f75b4551104d7c6388b--

--===============1184037964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1184037964==--
