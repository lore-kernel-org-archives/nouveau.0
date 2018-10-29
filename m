From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105117] desktop freeze playing video nouveau:
 DATA_ERROR INVALID_BITFIELD
Date: Mon, 29 Oct 2018 02:38:00 +0000
Message-ID: <bug-105117-8800-MGYWpV7hGW@http.bugs.freedesktop.org/>
References: <bug-105117-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0117952455=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105117-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0117952455==
Content-Type: multipart/alternative; boundary="15407806801.c97fcE7D2.25124"
Content-Transfer-Encoding: 7bit


--15407806801.c97fcE7D2.25124
Date: Mon, 29 Oct 2018 02:38:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105117

--- Comment #5 from rcoe-TsGEh1ee8XYAvxtiuMwx3w@public.gmane.org ---
kernel messages from a recent hang
2018-10-24T09:53:06.809167-05:00 mothra kernel: [    4.902944] fb: switchin=
g to
nouveaufb from VESA VGA
2018-10-24T09:53:06.809168-05:00 mothra kernel: [    4.903264] nouveau
0000:01:00.0: NVIDIA GF108 (0c1e00a1)
2018-10-24T09:53:06.809169-05:00 mothra kernel: [    4.937027] nouveau
0000:01:00.0: bios: version 70.08.a8.00.14
2018-10-24T09:53:06.809175-05:00 mothra kernel: [    5.005069] nouveau
0000:01:00.0: fb: 1024 MiB GDDR5
2018-10-24T09:53:06.809203-05:00 mothra kernel: [    5.104944] nouveau
0000:01:00.0: DRM: VRAM: 1024 MiB
2018-10-24T09:53:06.809204-05:00 mothra kernel: [    5.104945] nouveau
0000:01:00.0: DRM: GART: 1048576 MiB
2018-10-24T09:53:06.809205-05:00 mothra kernel: [    5.104949] nouveau
0000:01:00.0: DRM: TMDS table version 2.0
2018-10-24T09:53:06.809205-05:00 mothra kernel: [    5.104950] nouveau
0000:01:00.0: DRM: DCB version 4.0
2018-10-24T09:53:06.809206-05:00 mothra kernel: [    5.104953] nouveau
0000:01:00.0: DRM: DCB outp 00: 01000323 00010034
2018-10-24T09:53:06.809236-05:00 mothra kernel: [    5.104955] nouveau
0000:01:00.0: DRM: DCB outp 01: 020323a6 0f220010
2018-10-24T09:53:06.809237-05:00 mothra kernel: [    5.104956] nouveau
0000:01:00.0: DRM: DCB outp 02: 040433b6 0f220010
2018-10-24T09:53:06.809238-05:00 mothra kernel: [    5.104958] nouveau
0000:01:00.0: DRM: DCB outp 03: 08024382 00020010
2018-10-24T09:53:06.809239-05:00 mothra kernel: [    5.104959] nouveau
0000:01:00.0: DRM: DCB outp 04: 02032362 00020010
2018-10-24T09:53:06.809240-05:00 mothra kernel: [    5.104961] nouveau
0000:01:00.0: DRM: DCB outp 05: 04043372 00020010
2018-10-24T09:53:06.809240-05:00 mothra kernel: [    5.104962] nouveau
0000:01:00.0: DRM: DCB outp 06: 02011300 00000000
2018-10-24T09:53:06.809241-05:00 mothra kernel: [    5.104964] nouveau
0000:01:00.0: DRM: DCB conn 00: 00000041
2018-10-24T09:53:06.809242-05:00 mothra kernel: [    5.104965] nouveau
0000:01:00.0: DRM: DCB conn 01: 00000100
2018-10-24T09:53:06.809243-05:00 mothra kernel: [    5.104966] nouveau
0000:01:00.0: DRM: DCB conn 02: 00001246
2018-10-24T09:53:06.809244-05:00 mothra kernel: [    5.104968] nouveau
0000:01:00.0: DRM: DCB conn 03: 00002346
2018-10-24T09:53:06.809245-05:00 mothra kernel: [    5.104969] nouveau
0000:01:00.0: DRM: DCB conn 04: 00010461
2018-10-24T09:53:06.809245-05:00 mothra kernel: [    5.104970] nouveau
0000:01:00.0: DRM: DCB conn 05: 00000500
2018-10-24T09:53:06.809248-05:00 mothra kernel: [    5.183320] nouveau
0000:01:00.0: DRM: MM: using COPY0 for buffer copies
2018-10-24T09:53:06.809249-05:00 mothra kernel: [    5.373383] nouveau
0000:01:00.0: DRM: allocated 1680x1050 fb: 0x60000, bo 00000000f9f35d3d
2018-10-24T09:53:06.809250-05:00 mothra kernel: [    5.375243] fbcon: nouve=
aufb
(fb0) is primary device
2018-10-24T09:53:06.809254-05:00 mothra kernel: [    6.873495] nouveau
0000:01:00.0: fb0: nouveaufb frame buffer device
2018-10-24T09:53:06.809255-05:00 mothra kernel: [    6.892038] [drm]
Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
2018-10-24T11:47:25.579058-05:00 mothra kernel: [ 6865.556430] nouveau
0000:01:00.0: swiotlb buffer is full (sz: 2097152 bytes)
2018-10-24T11:47:25.579135-05:00 mothra kernel: [ 6865.556433] nouveau
0000:01:00.0: swiotlb: coherent allocation failed, size=3D2097152
2018-10-24T11:47:25.579160-05:00 mothra kernel: [ 6865.556559]  ?
nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
2018-10-24T11:47:25.579162-05:00 mothra kernel: [ 6865.556591]=20
nouveau_bo_new+0x416/0x590 [nouveau]
2018-10-24T11:47:25.579163-05:00 mothra kernel: [ 6865.556621]  ?
nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
2018-10-24T11:47:25.579164-05:00 mothra kernel: [ 6865.556650]  ?
nouveau_gem_new+0x100/0x100 [nouveau]
2018-10-24T11:47:25.579165-05:00 mothra kernel: [ 6865.556678]=20
nouveau_gem_new+0x49/0x100 [nouveau]
2018-10-24T11:47:25.579166-05:00 mothra kernel: [ 6865.556706]=20
nouveau_gem_ioctl_new+0x41/0xc0 [nouveau]
2018-10-24T11:47:25.579170-05:00 mothra kernel: [ 6865.556755]  ?
nouveau_gem_new+0x100/0x100 [nouveau]
2018-10-24T11:47:25.579172-05:00 mothra kernel: [ 6865.556790]=20
nouveau_drm_ioctl+0x64/0xc0 [nouveau]
2018-10-24T11:56:48.760064-05:00 mothra kernel: [    3.710377] fb: switchin=
g to
nouveaufb from VESA VGA
2018-10-24T11:56:48.760065-05:00 mothra kernel: [    3.710516] nouveau
0000:01:00.0: NVIDIA GF108 (0c1e00a1)
2018-10-24T11:56:48.760070-05:00 mothra kernel: [    3.733163] nouveau
0000:01:00.0: bios: version 70.08.a8.00.14
2018-10-24T11:56:48.760071-05:00 mothra kernel: [    3.735801] nouveau
0000:01:00.0: fb: 1024 MiB GDDR5
2018-10-24T11:56:48.760078-05:00 mothra kernel: [    3.797042] nouveau
0000:01:00.0: DRM: VRAM: 1024 MiB
2018-10-24T11:56:48.760079-05:00 mothra kernel: [    3.797044] nouveau
0000:01:00.0: DRM: GART: 1048576 MiB
2018-10-24T11:56:48.760080-05:00 mothra kernel: [    3.797047] nouveau
0000:01:00.0: DRM: TMDS table version 2.0
2018-10-24T11:56:48.760081-05:00 mothra kernel: [    3.797049] nouveau
0000:01:00.0: DRM: DCB version 4.0
2018-10-24T11:56:48.760081-05:00 mothra kernel: [    3.797051] nouveau
0000:01:00.0: DRM: DCB outp 00: 01000323 00010034
2018-10-24T11:56:48.760082-05:00 mothra kernel: [    3.797053] nouveau
0000:01:00.0: DRM: DCB outp 01: 020323a6 0f220010
2018-10-24T11:56:48.760086-05:00 mothra kernel: [    3.797055] nouveau
0000:01:00.0: DRM: DCB outp 02: 040433b6 0f220010
2018-10-24T11:56:48.760087-05:00 mothra kernel: [    3.797056] nouveau
0000:01:00.0: DRM: DCB outp 03: 08024382 00020010
2018-10-24T11:56:48.760088-05:00 mothra kernel: [    3.797058] nouveau
0000:01:00.0: DRM: DCB outp 04: 02032362 00020010
2018-10-24T11:56:48.760089-05:00 mothra kernel: [    3.797059] nouveau
0000:01:00.0: DRM: DCB outp 05: 04043372 00020010
2018-10-24T11:56:48.760090-05:00 mothra kernel: [    3.797061] nouveau
0000:01:00.0: DRM: DCB outp 06: 02011300 00000000
2018-10-24T11:56:48.760090-05:00 mothra kernel: [    3.797063] nouveau
0000:01:00.0: DRM: DCB conn 00: 00000041
2018-10-24T11:56:48.760095-05:00 mothra kernel: [    3.797064] nouveau
0000:01:00.0: DRM: DCB conn 01: 00000100
2018-10-24T11:56:48.760097-05:00 mothra kernel: [    3.797066] nouveau
0000:01:00.0: DRM: DCB conn 02: 00001246
2018-10-24T11:56:48.760098-05:00 mothra kernel: [    3.797067] nouveau
0000:01:00.0: DRM: DCB conn 03: 00002346
2018-10-24T11:56:48.760099-05:00 mothra kernel: [    3.797068] nouveau
0000:01:00.0: DRM: DCB conn 04: 00010461
2018-10-24T11:56:48.760099-05:00 mothra kernel: [    3.797070] nouveau
0000:01:00.0: DRM: DCB conn 05: 00000500
2018-10-24T11:56:48.760105-05:00 mothra kernel: [    3.856403] nouveau
0000:01:00.0: DRM: MM: using COPY0 for buffer copies
2018-10-24T11:56:48.760121-05:00 mothra kernel: [    4.045733] nouveau
0000:01:00.0: DRM: allocated 1680x1050 fb: 0x60000, bo 0000000010148891
2018-10-24T11:56:48.760122-05:00 mothra kernel: [    4.045809] fbcon: nouve=
aufb
(fb0) is primary device
2018-10-24T11:56:48.760281-05:00 mothra kernel: [    5.344994] nouveau
0000:01:00.0: fb0: nouveaufb frame buffer device
2018-10-24T11:56:48.760282-05:00 mothra kernel: [    5.364120] [drm]
Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
2018-10-24T16:43:59.030769-05:00 mothra kernel: [17241.573152] nouveau
0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 13 [003f696000
ositorWorkQueue[30653]] subc 0 mthd 0000 data 00000000
2018-10-24T16:43:59.030786-05:00 mothra kernel: [17241.573177] nouveau
0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 0880 data 80000574
2018-10-24T16:43:59.030788-05:00 mothra kernel: [17241.573201] nouveau
0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 0884 data 200308e0
2018-10-24T16:43:59.030789-05:00 mothra kernel: [17241.573225] nouveau
0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 0888 data 00010000
2018-10-24T16:43:59.030801-05:00 mothra kernel: [17241.573249] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 0890 data 00380000
2018-10-24T16:43:59.030803-05:00 mothra kernel: [17241.573273] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 0894 data a00308e3
2018-10-24T16:43:59.030803-05:00 mothra kernel: [17241.573294] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 0898 data 000001a0
2018-10-24T16:43:59.030804-05:00 mothra kernel: [17241.573314] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 089c data 3f000000
2018-10-24T16:43:59.030805-05:00 mothra kernel: [17241.573335] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 08a0 data 3f000000
2018-10-24T16:43:59.030806-05:00 mothra kernel: [17241.573355] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 08a4 data 80000671
2018-10-24T16:43:59.030807-05:00 mothra kernel: [17241.573375] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 08a8 data 800004b9
2018-10-24T16:43:59.030807-05:00 mothra kernel: [17241.573397] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 08ac data 80000e04
2018-10-24T16:43:59.030808-05:00 mothra kernel: [17241.573417] nouveau
0000:01:00.0: gr: DATA_ERROR 00000004 [INVALID_VALUE] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 08b0 data 800103e4
2018-10-24T16:43:59.030809-05:00 mothra kernel: [17241.573438] nouveau
0000:01:00.0: gr: DATA_ERROR 00000004 [INVALID_VALUE] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 08b4 data 20010680
2018-10-24T16:43:59.030810-05:00 mothra kernel: [17241.573459] nouveau
0000:01:00.0: gr: DATA_ERROR 00000004 [INVALID_VALUE] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 08bc data 2001054f
2018-10-24T16:43:59.030810-05:00 mothra kernel: [17241.573480] nouveau
0000:01:00.0: gr: DATA_ERROR 00000004 [INVALID_VALUE] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 08c4 data 800004b3
2018-10-24T16:43:59.030811-05:00 mothra kernel: [17241.573501] nouveau
0000:01:00.0: gr: DATA_ERROR 00000004 [INVALID_VALUE] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 08cc data 800004e0
2018-10-24T16:43:59.030812-05:00 mothra kernel: [17241.573521] nouveau
0000:01:00.0: gr: DATA_ERROR 00000004 [INVALID_VALUE] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 08d4 data 200403ef
2018-10-24T16:43:59.030813-05:00 mothra kernel: [17241.573536] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 08e0 data 0000ffff
2018-10-24T16:43:59.030813-05:00 mothra kernel: [17241.573538] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030814-05:00 mothra kernel: [17241.573541] nouveau
0000:01:00.0: gr: 409000 - done 00000320
2018-10-24T16:43:59.030815-05:00 mothra kernel: [17241.573546] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 800308e0
2018-10-24T16:43:59.030815-05:00 mothra kernel: [17241.573551] nouveau
0000:01:00.0: gr: 409000 - stat 0000ffff 00000003 00000006 00000001
2018-10-24T16:43:59.030816-05:00 mothra kernel: [17241.573554] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030817-05:00 mothra kernel: [17241.573559] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030817-05:00 mothra kernel: [17241.573563] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030818-05:00 mothra kernel: [17241.573573] nouveau
0000:01:00.0: gr: TRAP ch 13 [003f696000 ositorWorkQueue[30653]]
2018-10-24T16:43:59.030818-05:00 mothra kernel: [17241.573580] nouveau
0000:01:00.0: gr: GPC0/PROP trap: 00000001 [] x =3D 32, y =3D 0, format =3D=
 0,
storage type =3D 0
2018-10-24T16:43:59.030819-05:00 mothra kernel: [17241.573586] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 0908 data 603640c1
2018-10-24T16:43:59.030819-05:00 mothra kernel: [17241.573587] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030820-05:00 mothra kernel: [17241.573591] nouveau
0000:01:00.0: gr: 409000 - done 00000340
2018-10-24T16:43:59.030821-05:00 mothra kernel: [17241.573595] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 00030914
2018-10-24T16:43:59.030821-05:00 mothra kernel: [17241.573600] nouveau
0000:01:00.0: gr: 409000 - stat 00201c40 00000003 00000006 00000001
2018-10-24T16:43:59.030822-05:00 mothra kernel: [17241.573602] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030822-05:00 mothra kernel: [17241.573607] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030823-05:00 mothra kernel: [17241.573612] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030823-05:00 mothra kernel: [17241.573619] nouveau
0000:01:00.0: fifo: write fault at 0000000000 engine 00 [PGRAPH] client 0f
[GPC0/PROP] reason 02 [PAGE_NOT_PRESENT] on channel 13 [003f696000
ositorWorkQueue[30653]]
2018-10-24T16:43:59.030824-05:00 mothra kernel: [17241.573621] nouveau
0000:01:00.0: fifo: gr engine fault on channel 13, recovering...
2018-10-24T16:43:59.030825-05:00 mothra kernel: [17241.573639] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 0960 data 58004000
2018-10-24T16:43:59.030826-05:00 mothra kernel: [17241.573640] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030826-05:00 mothra kernel: [17241.573644] nouveau
0000:01:00.0: gr: 409000 - done 00000340
2018-10-24T16:43:59.030827-05:00 mothra kernel: [17241.573649] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 80030960
2018-10-24T16:43:59.030827-05:00 mothra kernel: [17241.573654] nouveau
0000:01:00.0: gr: 409000 - stat 58004000 00000003 00000006 00000001
2018-10-24T16:43:59.030828-05:00 mothra kernel: [17241.573657] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030828-05:00 mothra kernel: [17241.573662] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030829-05:00 mothra kernel: [17241.573667] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030829-05:00 mothra kernel: [17241.573676] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 0960 data 58004000
2018-10-24T16:43:59.030830-05:00 mothra kernel: [17241.573683] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 0964 data 90305c40
2018-10-24T16:43:59.030830-05:00 mothra kernel: [17241.573685] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030831-05:00 mothra kernel: [17241.573687] nouveau
0000:01:00.0: gr: 409000 - done 00000340
2018-10-24T16:43:59.030832-05:00 mothra kernel: [17241.573691] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 80030964
2018-10-24T16:43:59.030832-05:00 mothra kernel: [17241.573696] nouveau
0000:01:00.0: gr: 409000 - stat 90305c40 00000003 00000006 00000001
2018-10-24T16:43:59.030833-05:00 mothra kernel: [17241.573698] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030833-05:00 mothra kernel: [17241.573703] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030834-05:00 mothra kernel: [17241.573708] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030834-05:00 mothra kernel: [17241.573718] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 0964 data 90305c40
2018-10-24T16:43:59.030835-05:00 mothra kernel: [17241.573723] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 0968 data 90305c40
2018-10-24T16:43:59.030836-05:00 mothra kernel: [17241.573724] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030836-05:00 mothra kernel: [17241.573728] nouveau
0000:01:00.0: gr: 409000 - done 00000320
2018-10-24T16:43:59.030837-05:00 mothra kernel: [17241.573732] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 80030968
2018-10-24T16:43:59.030837-05:00 mothra kernel: [17241.573736] nouveau
0000:01:00.0: gr: 409000 - stat 58004000 00000003 00000006 00000001
2018-10-24T16:43:59.030838-05:00 mothra kernel: [17241.573739] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030838-05:00 mothra kernel: [17241.573744] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030839-05:00 mothra kernel: [17241.573748] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030839-05:00 mothra kernel: [17241.573760] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 0968 data 58004000
2018-10-24T16:43:59.030840-05:00 mothra kernel: [17241.573768] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 096c data fc001d06
2018-10-24T16:43:59.030840-05:00 mothra kernel: [17241.573770] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030841-05:00 mothra kernel: [17241.573773] nouveau
0000:01:00.0: gr: 409000 - done 00000340
2018-10-24T16:43:59.030841-05:00 mothra kernel: [17241.573777] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 8003096c
2018-10-24T16:43:59.030842-05:00 mothra kernel: [17241.573781] nouveau
0000:01:00.0: gr: 409000 - stat fc001d06 00000003 00000006 00000000
2018-10-24T16:43:59.030842-05:00 mothra kernel: [17241.573784] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030843-05:00 mothra kernel: [17241.573789] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030843-05:00 mothra kernel: [17241.573795] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030844-05:00 mothra kernel: [17241.573811] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 096c data fc001d06
2018-10-24T16:43:59.030845-05:00 mothra kernel: [17241.573816] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 0970 data 80104202
2018-10-24T16:43:59.030845-05:00 mothra kernel: [17241.573817] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030846-05:00 mothra kernel: [17241.573820] nouveau
0000:01:00.0: gr: 409000 - done 00000320
2018-10-24T16:43:59.030861-05:00 mothra kernel: [17241.573824] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 80030970
2018-10-24T16:43:59.030869-05:00 mothra kernel: [17241.573829] nouveau
0000:01:00.0: gr: 409000 - stat 80104202 00000003 00000006 00000001
2018-10-24T16:43:59.030870-05:00 mothra kernel: [17241.573831] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030871-05:00 mothra kernel: [17241.573836] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030871-05:00 mothra kernel: [17241.573841] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030872-05:00 mothra kernel: [17241.573851] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 0970 data 80104202
2018-10-24T16:43:59.030872-05:00 mothra kernel: [17241.573857] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 0974 data c040dc20
2018-10-24T16:43:59.030873-05:00 mothra kernel: [17241.573858] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030873-05:00 mothra kernel: [17241.573861] nouveau
0000:01:00.0: gr: 409000 - done 00000320
2018-10-24T16:43:59.030874-05:00 mothra kernel: [17241.573864] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 80030974
2018-10-24T16:43:59.030875-05:00 mothra kernel: [17241.573869] nouveau
0000:01:00.0: gr: 409000 - stat c040dc20 00000003 00000006 00000001
2018-10-24T16:43:59.030875-05:00 mothra kernel: [17241.573871] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030876-05:00 mothra kernel: [17241.573876] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030876-05:00 mothra kernel: [17241.573881] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030877-05:00 mothra kernel: [17241.574180] nouveau
0000:01:00.0: ositorWorkQueue[30653]: channel 13 killed!
2018-10-24T16:46:54.442770-05:00 mothra kernel: [17416.983612]
gstglcontext[31954]: segfault at 1a ip 00007fa1dd5163de sp 00007fa18a311180
error 4 in nouveau_dri.so[7fa1dd33e000+7e8000]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15407806801.c97fcE7D2.25124
Date: Mon, 29 Oct 2018 02:38:00 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - desktop freeze playing video nouveau: DATA_ERROR INVALID_=
BITFIELD"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105117#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - desktop freeze playing video nouveau: DATA_ERROR INVALID_=
BITFIELD"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105117">bug 10511=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rcoe&#64;wi.rr.com" title=3D"rcoe&#64;wi.rr.com">rcoe&#64;wi.rr.com</a>
</span></b>
        <pre>kernel messages from a recent hang
2018-10-24T09:53:06.809167-05:00 mothra kernel: [    4.902944] fb: switchin=
g to
nouveaufb from VESA VGA
2018-10-24T09:53:06.809168-05:00 mothra kernel: [    4.903264] nouveau
0000:01:00.0: NVIDIA GF108 (0c1e00a1)
2018-10-24T09:53:06.809169-05:00 mothra kernel: [    4.937027] nouveau
0000:01:00.0: bios: version 70.08.a8.00.14
2018-10-24T09:53:06.809175-05:00 mothra kernel: [    5.005069] nouveau
0000:01:00.0: fb: 1024 MiB GDDR5
2018-10-24T09:53:06.809203-05:00 mothra kernel: [    5.104944] nouveau
0000:01:00.0: DRM: VRAM: 1024 MiB
2018-10-24T09:53:06.809204-05:00 mothra kernel: [    5.104945] nouveau
0000:01:00.0: DRM: GART: 1048576 MiB
2018-10-24T09:53:06.809205-05:00 mothra kernel: [    5.104949] nouveau
0000:01:00.0: DRM: TMDS table version 2.0
2018-10-24T09:53:06.809205-05:00 mothra kernel: [    5.104950] nouveau
0000:01:00.0: DRM: DCB version 4.0
2018-10-24T09:53:06.809206-05:00 mothra kernel: [    5.104953] nouveau
0000:01:00.0: DRM: DCB outp 00: 01000323 00010034
2018-10-24T09:53:06.809236-05:00 mothra kernel: [    5.104955] nouveau
0000:01:00.0: DRM: DCB outp 01: 020323a6 0f220010
2018-10-24T09:53:06.809237-05:00 mothra kernel: [    5.104956] nouveau
0000:01:00.0: DRM: DCB outp 02: 040433b6 0f220010
2018-10-24T09:53:06.809238-05:00 mothra kernel: [    5.104958] nouveau
0000:01:00.0: DRM: DCB outp 03: 08024382 00020010
2018-10-24T09:53:06.809239-05:00 mothra kernel: [    5.104959] nouveau
0000:01:00.0: DRM: DCB outp 04: 02032362 00020010
2018-10-24T09:53:06.809240-05:00 mothra kernel: [    5.104961] nouveau
0000:01:00.0: DRM: DCB outp 05: 04043372 00020010
2018-10-24T09:53:06.809240-05:00 mothra kernel: [    5.104962] nouveau
0000:01:00.0: DRM: DCB outp 06: 02011300 00000000
2018-10-24T09:53:06.809241-05:00 mothra kernel: [    5.104964] nouveau
0000:01:00.0: DRM: DCB conn 00: 00000041
2018-10-24T09:53:06.809242-05:00 mothra kernel: [    5.104965] nouveau
0000:01:00.0: DRM: DCB conn 01: 00000100
2018-10-24T09:53:06.809243-05:00 mothra kernel: [    5.104966] nouveau
0000:01:00.0: DRM: DCB conn 02: 00001246
2018-10-24T09:53:06.809244-05:00 mothra kernel: [    5.104968] nouveau
0000:01:00.0: DRM: DCB conn 03: 00002346
2018-10-24T09:53:06.809245-05:00 mothra kernel: [    5.104969] nouveau
0000:01:00.0: DRM: DCB conn 04: 00010461
2018-10-24T09:53:06.809245-05:00 mothra kernel: [    5.104970] nouveau
0000:01:00.0: DRM: DCB conn 05: 00000500
2018-10-24T09:53:06.809248-05:00 mothra kernel: [    5.183320] nouveau
0000:01:00.0: DRM: MM: using COPY0 for buffer copies
2018-10-24T09:53:06.809249-05:00 mothra kernel: [    5.373383] nouveau
0000:01:00.0: DRM: allocated 1680x1050 fb: 0x60000, bo 00000000f9f35d3d
2018-10-24T09:53:06.809250-05:00 mothra kernel: [    5.375243] fbcon: nouve=
aufb
(fb0) is primary device
2018-10-24T09:53:06.809254-05:00 mothra kernel: [    6.873495] nouveau
0000:01:00.0: fb0: nouveaufb frame buffer device
2018-10-24T09:53:06.809255-05:00 mothra kernel: [    6.892038] [drm]
Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
2018-10-24T11:47:25.579058-05:00 mothra kernel: [ 6865.556430] nouveau
0000:01:00.0: swiotlb buffer is full (sz: 2097152 bytes)
2018-10-24T11:47:25.579135-05:00 mothra kernel: [ 6865.556433] nouveau
0000:01:00.0: swiotlb: coherent allocation failed, size=3D2097152
2018-10-24T11:47:25.579160-05:00 mothra kernel: [ 6865.556559]  ?
nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
2018-10-24T11:47:25.579162-05:00 mothra kernel: [ 6865.556591]=20
nouveau_bo_new+0x416/0x590 [nouveau]
2018-10-24T11:47:25.579163-05:00 mothra kernel: [ 6865.556621]  ?
nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
2018-10-24T11:47:25.579164-05:00 mothra kernel: [ 6865.556650]  ?
nouveau_gem_new+0x100/0x100 [nouveau]
2018-10-24T11:47:25.579165-05:00 mothra kernel: [ 6865.556678]=20
nouveau_gem_new+0x49/0x100 [nouveau]
2018-10-24T11:47:25.579166-05:00 mothra kernel: [ 6865.556706]=20
nouveau_gem_ioctl_new+0x41/0xc0 [nouveau]
2018-10-24T11:47:25.579170-05:00 mothra kernel: [ 6865.556755]  ?
nouveau_gem_new+0x100/0x100 [nouveau]
2018-10-24T11:47:25.579172-05:00 mothra kernel: [ 6865.556790]=20
nouveau_drm_ioctl+0x64/0xc0 [nouveau]
2018-10-24T11:56:48.760064-05:00 mothra kernel: [    3.710377] fb: switchin=
g to
nouveaufb from VESA VGA
2018-10-24T11:56:48.760065-05:00 mothra kernel: [    3.710516] nouveau
0000:01:00.0: NVIDIA GF108 (0c1e00a1)
2018-10-24T11:56:48.760070-05:00 mothra kernel: [    3.733163] nouveau
0000:01:00.0: bios: version 70.08.a8.00.14
2018-10-24T11:56:48.760071-05:00 mothra kernel: [    3.735801] nouveau
0000:01:00.0: fb: 1024 MiB GDDR5
2018-10-24T11:56:48.760078-05:00 mothra kernel: [    3.797042] nouveau
0000:01:00.0: DRM: VRAM: 1024 MiB
2018-10-24T11:56:48.760079-05:00 mothra kernel: [    3.797044] nouveau
0000:01:00.0: DRM: GART: 1048576 MiB
2018-10-24T11:56:48.760080-05:00 mothra kernel: [    3.797047] nouveau
0000:01:00.0: DRM: TMDS table version 2.0
2018-10-24T11:56:48.760081-05:00 mothra kernel: [    3.797049] nouveau
0000:01:00.0: DRM: DCB version 4.0
2018-10-24T11:56:48.760081-05:00 mothra kernel: [    3.797051] nouveau
0000:01:00.0: DRM: DCB outp 00: 01000323 00010034
2018-10-24T11:56:48.760082-05:00 mothra kernel: [    3.797053] nouveau
0000:01:00.0: DRM: DCB outp 01: 020323a6 0f220010
2018-10-24T11:56:48.760086-05:00 mothra kernel: [    3.797055] nouveau
0000:01:00.0: DRM: DCB outp 02: 040433b6 0f220010
2018-10-24T11:56:48.760087-05:00 mothra kernel: [    3.797056] nouveau
0000:01:00.0: DRM: DCB outp 03: 08024382 00020010
2018-10-24T11:56:48.760088-05:00 mothra kernel: [    3.797058] nouveau
0000:01:00.0: DRM: DCB outp 04: 02032362 00020010
2018-10-24T11:56:48.760089-05:00 mothra kernel: [    3.797059] nouveau
0000:01:00.0: DRM: DCB outp 05: 04043372 00020010
2018-10-24T11:56:48.760090-05:00 mothra kernel: [    3.797061] nouveau
0000:01:00.0: DRM: DCB outp 06: 02011300 00000000
2018-10-24T11:56:48.760090-05:00 mothra kernel: [    3.797063] nouveau
0000:01:00.0: DRM: DCB conn 00: 00000041
2018-10-24T11:56:48.760095-05:00 mothra kernel: [    3.797064] nouveau
0000:01:00.0: DRM: DCB conn 01: 00000100
2018-10-24T11:56:48.760097-05:00 mothra kernel: [    3.797066] nouveau
0000:01:00.0: DRM: DCB conn 02: 00001246
2018-10-24T11:56:48.760098-05:00 mothra kernel: [    3.797067] nouveau
0000:01:00.0: DRM: DCB conn 03: 00002346
2018-10-24T11:56:48.760099-05:00 mothra kernel: [    3.797068] nouveau
0000:01:00.0: DRM: DCB conn 04: 00010461
2018-10-24T11:56:48.760099-05:00 mothra kernel: [    3.797070] nouveau
0000:01:00.0: DRM: DCB conn 05: 00000500
2018-10-24T11:56:48.760105-05:00 mothra kernel: [    3.856403] nouveau
0000:01:00.0: DRM: MM: using COPY0 for buffer copies
2018-10-24T11:56:48.760121-05:00 mothra kernel: [    4.045733] nouveau
0000:01:00.0: DRM: allocated 1680x1050 fb: 0x60000, bo 0000000010148891
2018-10-24T11:56:48.760122-05:00 mothra kernel: [    4.045809] fbcon: nouve=
aufb
(fb0) is primary device
2018-10-24T11:56:48.760281-05:00 mothra kernel: [    5.344994] nouveau
0000:01:00.0: fb0: nouveaufb frame buffer device
2018-10-24T11:56:48.760282-05:00 mothra kernel: [    5.364120] [drm]
Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
2018-10-24T16:43:59.030769-05:00 mothra kernel: [17241.573152] nouveau
0000:01:00.0: fifo: PBDMA0: 00040000 [] ch 13 [003f696000
ositorWorkQueue[30653]] subc 0 mthd 0000 data 00000000
2018-10-24T16:43:59.030786-05:00 mothra kernel: [17241.573177] nouveau
0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 0880 data 80000574
2018-10-24T16:43:59.030788-05:00 mothra kernel: [17241.573201] nouveau
0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 0884 data 200308e0
2018-10-24T16:43:59.030789-05:00 mothra kernel: [17241.573225] nouveau
0000:01:00.0: gr: DATA_ERROR 0000000c [INVALID_BITFIELD] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 0888 data 00010000
2018-10-24T16:43:59.030801-05:00 mothra kernel: [17241.573249] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 0890 data 00380000
2018-10-24T16:43:59.030803-05:00 mothra kernel: [17241.573273] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 0894 data a00308e3
2018-10-24T16:43:59.030803-05:00 mothra kernel: [17241.573294] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 0898 data 000001a0
2018-10-24T16:43:59.030804-05:00 mothra kernel: [17241.573314] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 089c data 3f000000
2018-10-24T16:43:59.030805-05:00 mothra kernel: [17241.573335] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 08a0 data 3f000000
2018-10-24T16:43:59.030806-05:00 mothra kernel: [17241.573355] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 08a4 data 80000671
2018-10-24T16:43:59.030807-05:00 mothra kernel: [17241.573375] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 08a8 data 800004b9
2018-10-24T16:43:59.030807-05:00 mothra kernel: [17241.573397] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 08ac data 80000e04
2018-10-24T16:43:59.030808-05:00 mothra kernel: [17241.573417] nouveau
0000:01:00.0: gr: DATA_ERROR 00000004 [INVALID_VALUE] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 08b0 data 800103e4
2018-10-24T16:43:59.030809-05:00 mothra kernel: [17241.573438] nouveau
0000:01:00.0: gr: DATA_ERROR 00000004 [INVALID_VALUE] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 08b4 data 20010680
2018-10-24T16:43:59.030810-05:00 mothra kernel: [17241.573459] nouveau
0000:01:00.0: gr: DATA_ERROR 00000004 [INVALID_VALUE] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 08bc data 2001054f
2018-10-24T16:43:59.030810-05:00 mothra kernel: [17241.573480] nouveau
0000:01:00.0: gr: DATA_ERROR 00000004 [INVALID_VALUE] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 08c4 data 800004b3
2018-10-24T16:43:59.030811-05:00 mothra kernel: [17241.573501] nouveau
0000:01:00.0: gr: DATA_ERROR 00000004 [INVALID_VALUE] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 08cc data 800004e0
2018-10-24T16:43:59.030812-05:00 mothra kernel: [17241.573521] nouveau
0000:01:00.0: gr: DATA_ERROR 00000004 [INVALID_VALUE] ch 13 [003f696000
ositorWorkQueue[30653]] subc 3 class 902d mthd 08d4 data 200403ef
2018-10-24T16:43:59.030813-05:00 mothra kernel: [17241.573536] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 08e0 data 0000ffff
2018-10-24T16:43:59.030813-05:00 mothra kernel: [17241.573538] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030814-05:00 mothra kernel: [17241.573541] nouveau
0000:01:00.0: gr: 409000 - done 00000320
2018-10-24T16:43:59.030815-05:00 mothra kernel: [17241.573546] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 800308e0
2018-10-24T16:43:59.030815-05:00 mothra kernel: [17241.573551] nouveau
0000:01:00.0: gr: 409000 - stat 0000ffff 00000003 00000006 00000001
2018-10-24T16:43:59.030816-05:00 mothra kernel: [17241.573554] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030817-05:00 mothra kernel: [17241.573559] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030817-05:00 mothra kernel: [17241.573563] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030818-05:00 mothra kernel: [17241.573573] nouveau
0000:01:00.0: gr: TRAP ch 13 [003f696000 ositorWorkQueue[30653]]
2018-10-24T16:43:59.030818-05:00 mothra kernel: [17241.573580] nouveau
0000:01:00.0: gr: GPC0/PROP trap: 00000001 [] x =3D 32, y =3D 0, format =3D=
 0,
storage type =3D 0
2018-10-24T16:43:59.030819-05:00 mothra kernel: [17241.573586] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 0908 data 603640c1
2018-10-24T16:43:59.030819-05:00 mothra kernel: [17241.573587] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030820-05:00 mothra kernel: [17241.573591] nouveau
0000:01:00.0: gr: 409000 - done 00000340
2018-10-24T16:43:59.030821-05:00 mothra kernel: [17241.573595] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 00030914
2018-10-24T16:43:59.030821-05:00 mothra kernel: [17241.573600] nouveau
0000:01:00.0: gr: 409000 - stat 00201c40 00000003 00000006 00000001
2018-10-24T16:43:59.030822-05:00 mothra kernel: [17241.573602] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030822-05:00 mothra kernel: [17241.573607] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030823-05:00 mothra kernel: [17241.573612] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030823-05:00 mothra kernel: [17241.573619] nouveau
0000:01:00.0: fifo: write fault at 0000000000 engine 00 [PGRAPH] client 0f
[GPC0/PROP] reason 02 [PAGE_NOT_PRESENT] on channel 13 [003f696000
ositorWorkQueue[30653]]
2018-10-24T16:43:59.030824-05:00 mothra kernel: [17241.573621] nouveau
0000:01:00.0: fifo: gr engine fault on channel 13, recovering...
2018-10-24T16:43:59.030825-05:00 mothra kernel: [17241.573639] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 0960 data 58004000
2018-10-24T16:43:59.030826-05:00 mothra kernel: [17241.573640] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030826-05:00 mothra kernel: [17241.573644] nouveau
0000:01:00.0: gr: 409000 - done 00000340
2018-10-24T16:43:59.030827-05:00 mothra kernel: [17241.573649] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 80030960
2018-10-24T16:43:59.030827-05:00 mothra kernel: [17241.573654] nouveau
0000:01:00.0: gr: 409000 - stat 58004000 00000003 00000006 00000001
2018-10-24T16:43:59.030828-05:00 mothra kernel: [17241.573657] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030828-05:00 mothra kernel: [17241.573662] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030829-05:00 mothra kernel: [17241.573667] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030829-05:00 mothra kernel: [17241.573676] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 0960 data 58004000
2018-10-24T16:43:59.030830-05:00 mothra kernel: [17241.573683] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 0964 data 90305c40
2018-10-24T16:43:59.030830-05:00 mothra kernel: [17241.573685] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030831-05:00 mothra kernel: [17241.573687] nouveau
0000:01:00.0: gr: 409000 - done 00000340
2018-10-24T16:43:59.030832-05:00 mothra kernel: [17241.573691] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 80030964
2018-10-24T16:43:59.030832-05:00 mothra kernel: [17241.573696] nouveau
0000:01:00.0: gr: 409000 - stat 90305c40 00000003 00000006 00000001
2018-10-24T16:43:59.030833-05:00 mothra kernel: [17241.573698] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030833-05:00 mothra kernel: [17241.573703] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030834-05:00 mothra kernel: [17241.573708] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030834-05:00 mothra kernel: [17241.573718] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 0964 data 90305c40
2018-10-24T16:43:59.030835-05:00 mothra kernel: [17241.573723] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 0968 data 90305c40
2018-10-24T16:43:59.030836-05:00 mothra kernel: [17241.573724] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030836-05:00 mothra kernel: [17241.573728] nouveau
0000:01:00.0: gr: 409000 - done 00000320
2018-10-24T16:43:59.030837-05:00 mothra kernel: [17241.573732] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 80030968
2018-10-24T16:43:59.030837-05:00 mothra kernel: [17241.573736] nouveau
0000:01:00.0: gr: 409000 - stat 58004000 00000003 00000006 00000001
2018-10-24T16:43:59.030838-05:00 mothra kernel: [17241.573739] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030838-05:00 mothra kernel: [17241.573744] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030839-05:00 mothra kernel: [17241.573748] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030839-05:00 mothra kernel: [17241.573760] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 0968 data 58004000
2018-10-24T16:43:59.030840-05:00 mothra kernel: [17241.573768] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 096c data fc001d06
2018-10-24T16:43:59.030840-05:00 mothra kernel: [17241.573770] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030841-05:00 mothra kernel: [17241.573773] nouveau
0000:01:00.0: gr: 409000 - done 00000340
2018-10-24T16:43:59.030841-05:00 mothra kernel: [17241.573777] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 8003096c
2018-10-24T16:43:59.030842-05:00 mothra kernel: [17241.573781] nouveau
0000:01:00.0: gr: 409000 - stat fc001d06 00000003 00000006 00000000
2018-10-24T16:43:59.030842-05:00 mothra kernel: [17241.573784] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030843-05:00 mothra kernel: [17241.573789] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030843-05:00 mothra kernel: [17241.573795] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030844-05:00 mothra kernel: [17241.573811] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 096c data fc001d06
2018-10-24T16:43:59.030845-05:00 mothra kernel: [17241.573816] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 0970 data 80104202
2018-10-24T16:43:59.030845-05:00 mothra kernel: [17241.573817] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030846-05:00 mothra kernel: [17241.573820] nouveau
0000:01:00.0: gr: 409000 - done 00000320
2018-10-24T16:43:59.030861-05:00 mothra kernel: [17241.573824] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 80030970
2018-10-24T16:43:59.030869-05:00 mothra kernel: [17241.573829] nouveau
0000:01:00.0: gr: 409000 - stat 80104202 00000003 00000006 00000001
2018-10-24T16:43:59.030870-05:00 mothra kernel: [17241.573831] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030871-05:00 mothra kernel: [17241.573836] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030871-05:00 mothra kernel: [17241.573841] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030872-05:00 mothra kernel: [17241.573851] nouveau
0000:01:00.0: gr: ILLEGAL_MTHD ch 13 [003f696000 ositorWorkQueue[30653]] su=
bc 3
class 902d mthd 0970 data 80104202
2018-10-24T16:43:59.030872-05:00 mothra kernel: [17241.573857] nouveau
0000:01:00.0: gr: FECS MTHD subc 3 class 0000 mthd 0974 data c040dc20
2018-10-24T16:43:59.030873-05:00 mothra kernel: [17241.573858] nouveau
0000:01:00.0: gr: FECS 00000002
2018-10-24T16:43:59.030873-05:00 mothra kernel: [17241.573861] nouveau
0000:01:00.0: gr: 409000 - done 00000320
2018-10-24T16:43:59.030874-05:00 mothra kernel: [17241.573864] nouveau
0000:01:00.0: gr: 409000 - stat 80000000 00015c00 00000000 80030974
2018-10-24T16:43:59.030875-05:00 mothra kernel: [17241.573869] nouveau
0000:01:00.0: gr: 409000 - stat c040dc20 00000003 00000006 00000001
2018-10-24T16:43:59.030875-05:00 mothra kernel: [17241.573871] nouveau
0000:01:00.0: gr: 502000 - done 00000300
2018-10-24T16:43:59.030876-05:00 mothra kernel: [17241.573876] nouveau
0000:01:00.0: gr: 502000 - stat 80000000 0000a100 00000000 00000000
2018-10-24T16:43:59.030876-05:00 mothra kernel: [17241.573881] nouveau
0000:01:00.0: gr: 502000 - stat 00000000 00000000 00000002 00000000
2018-10-24T16:43:59.030877-05:00 mothra kernel: [17241.574180] nouveau
0000:01:00.0: ositorWorkQueue[30653]: channel 13 killed!
2018-10-24T16:46:54.442770-05:00 mothra kernel: [17416.983612]
gstglcontext[31954]: segfault at 1a ip 00007fa1dd5163de sp 00007fa18a311180
error 4 in nouveau_dri.so[7fa1dd33e000+7e8000]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15407806801.c97fcE7D2.25124--

--===============0117952455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0117952455==--
