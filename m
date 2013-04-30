From: Jiaxing Wang <hello.wjx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Any suggestion for cpu soft lockup when modprobe nouveau?
Date: Tue, 30 Apr 2013 22:15:45 +0800
Message-ID: <517FD211.90702@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------000009040202090904000506"
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

This is a multi-part message in MIME format.
--------------000009040202090904000506
Content-Type: multipart/alternative;
 boundary="------------090900020609020305030708"


--------------090900020609020305030708
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi everyone,
In my laptop soft lockup happens when modprobe nouveau at boot time , it 
report soft lockup repeatedly(full kernel log is attached):

Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] BUG: soft lockup 
- CPU#1 stuck for 22s! [modprobe:559]
... ...
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] Call Trace:
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] [<f8b4c720>] ? 
init_condition+0x70/0xa0 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] [<f8b4ee27>] 
nvbios_exec+0x37/0xd0 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] [<f8b4f2ca>] 
nvbios_init+0x8a/0x130 [nouveau]
... ...

Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084003] BUG: soft lockup 
- CPU#1 stuck for 23s! [modprobe:559]
... ...
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] Call Trace:
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] [<f8b46785>] 
bit_entry+0x55/0xf0 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] [<f8b4b115>] 
init_table+0x25/0xb0 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] [<c107033d>] ? 
hrtimer_interrupt+0x16d/0x280
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] [<f8b4b1c8>] 
init_table_+0x28/0x190 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] [<f8b4c59f>] 
init_condition_met+0x2f/0x140 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] [<f8b4c72e>] 
init_condition+0x7e/0xa0 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] [<f8b4ee27>] 
nvbios_exec+0x37/0xd0 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] [<f8b4f2ca>] 
nvbios_init+0x8a/0x130 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] [<f8b44470>] ? 
nouveau_subdev_fini+0x70/0x80 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] [<f8b548df>] 
nouveau_devinit_init+0x1f/0x30 [nouveau]
... ...

And my kernel version is 3.8.8, and graphic card is nvidia Geforce 9300GS.
Any suggestion for this issue or how can I debug this?

--------------090900020609020305030708
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi everyone, <br>
    In my laptop soft lockup happens when modprobe nouveau at boot time
    , it report soft lockup repeatedly(full kernel log is attached):<br>
    <br>
    Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [&nbsp; 108.084004] BUG: soft
    lockup - CPU#1 stuck for 22s! [modprobe:559]<br>
    ... ...<br>
    Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [&nbsp; 108.084004] Call Trace:<br>
    Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [&nbsp; 108.084004]&nbsp;
    [&lt;f8b4c720&gt;] ? init_condition+0x70/0xa0 [nouveau]<br>
    Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [&nbsp; 108.084004]&nbsp;
    [&lt;f8b4ee27&gt;] nvbios_exec+0x37/0xd0 [nouveau]<br>
    Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [&nbsp; 108.084004]&nbsp;
    [&lt;f8b4f2ca&gt;] nvbios_init+0x8a/0x130 [nouveau]<br>
    ... ...<br>
    <br>
    Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [&nbsp;&nbsp; 72.084003] BUG: soft
    lockup - CPU#1 stuck for 23s! [modprobe:559]<br>
    ... ...<br>
    Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [&nbsp;&nbsp; 72.084004] Call Trace:<br>
    Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [&nbsp;&nbsp; 72.084004]&nbsp;
    [&lt;f8b46785&gt;] bit_entry+0x55/0xf0 [nouveau]<br>
    Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [&nbsp;&nbsp; 72.084004]&nbsp;
    [&lt;f8b4b115&gt;] init_table+0x25/0xb0 [nouveau]<br>
    Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [&nbsp;&nbsp; 72.084004]&nbsp;
    [&lt;c107033d&gt;] ? hrtimer_interrupt+0x16d/0x280<br>
    Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [&nbsp;&nbsp; 72.084004]&nbsp;
    [&lt;f8b4b1c8&gt;] init_table_+0x28/0x190 [nouveau]<br>
    Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [&nbsp;&nbsp; 72.084004]&nbsp;
    [&lt;f8b4c59f&gt;] init_condition_met+0x2f/0x140 [nouveau]<br>
    Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [&nbsp;&nbsp; 72.084004]&nbsp;
    [&lt;f8b4c72e&gt;] init_condition+0x7e/0xa0 [nouveau]<br>
    Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [&nbsp;&nbsp; 72.084004]&nbsp;
    [&lt;f8b4ee27&gt;] nvbios_exec+0x37/0xd0 [nouveau]<br>
    Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [&nbsp;&nbsp; 72.084004]&nbsp;
    [&lt;f8b4f2ca&gt;] nvbios_init+0x8a/0x130 [nouveau]<br>
    Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [&nbsp;&nbsp; 72.084004]&nbsp;
    [&lt;f8b44470&gt;] ? nouveau_subdev_fini+0x70/0x80 [nouveau]<br>
    Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [&nbsp;&nbsp; 72.084004]&nbsp;
    [&lt;f8b548df&gt;] nouveau_devinit_init+0x1f/0x30 [nouveau]<br>
    ... ...<br>
    <br>
    And my kernel version is 3.8.8, and graphic card is nvidia Geforce
    9300GS.<br>
    Any suggestion for this issue or how can I debug this?<br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
  </body>
</html>

--------------090900020609020305030708--

--------------000009040202090904000506
Content-Type: text/x-log;
 name="kern.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="kern.log"

Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: imklog 5.8.11, log source =3D /p=
roc/kmsg started.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Initializing cgro=
up subsys cpuset
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Initializing cgro=
up subsys cpu
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Linux version 3.8=
=2E0-19-generic (buildd@panlong) (gcc version 4.7.3 (Ubuntu/Linaro 4.7.3-=
1ubuntu1) ) #29-Ubuntu SMP Wed Apr 17 18:19:42 UTC 2013 (Ubuntu 3.8.0-19.=
29-generic 3.8.8)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] KERNEL supported =
cpus:
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   Intel GenuineIn=
tel
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   AMD AuthenticAM=
D
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   NSC Geode by NS=
C
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   Cyrix CyrixInst=
ead
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   Centaur Centaur=
Hauls
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   Transmeta Genui=
neTMx86
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   Transmeta Trans=
metaCPU
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   UMC UMC UMC UMC=

Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] e820: BIOS-provid=
ed physical RAM map:
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x0000000000000000-0x000000000009f3ff] usable
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x000000000009f400-0x000000000009ffff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x00000000000d2000-0x00000000000d3fff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x00000000000dc000-0x00000000000fffff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x0000000000100000-0x000000007f0a0fff] usable
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x000000007f0a1000-0x000000007f0a6fff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x000000007f0a7000-0x000000007f1b9fff] usable
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x000000007f1ba000-0x000000007f20efff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x000000007f20f000-0x000000007f307fff] usable
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x000000007f308000-0x000000007f50efff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x000000007f50f000-0x000000007f518fff] usable
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x000000007f519000-0x000000007f51efff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x000000007f51f000-0x000000007f563fff] usable
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x000000007f564000-0x000000007f59efff] ACPI NVS
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x000000007f59f000-0x000000007f5fffff] ACPI data
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x000000007f800000-0x000000007fffffff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x00000000e0000000-0x00000000efffffff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x00000000fec00000-0x00000000fec0ffff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x00000000fed00000-0x00000000fed003ff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x00000000fed10000-0x00000000fed13fff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x00000000fed18000-0x00000000fed19fff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x00000000fed1c000-0x00000000fed8ffff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x00000000fee00000-0x00000000fee00fff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] BIOS-e820: [mem 0=
x00000000ff800000-0x00000000ffffffff] reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] NX (Execute Disab=
le) protection: active
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] SMBIOS 2.5 presen=
t.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] DMI: LENOVO 20005=
               /JITR1, BIOS 0BCN49WW(V3.01)          11/18/2008
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] e820: update [mem=
 0x00000000-0x0000ffff] usable =3D=3D> reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] e820: remove [mem=
 0x000a0000-0x000fffff] usable
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] e820: last_pfn =3D=
 0x7f564 max_arch_pfn =3D 0x1000000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] MTRR default type=
: uncachable
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] MTRR fixed ranges=
 enabled:
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   00000-9FFFF wri=
te-back
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   A0000-BFFFF unc=
achable
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   C0000-FFFFF wri=
te-protect
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] MTRR variable ran=
ges enabled:
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   0 base 07F80000=
0 mask FFF800000 uncachable
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   1 base 00000000=
0 mask F80000000 write-back
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   2 base 0FFE0000=
0 mask FFFE00000 write-protect
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   3 base 07F60000=
0 mask FFFE00000 uncachable
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   4 disabled
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   5 disabled
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   6 disabled
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] x86 PAT enabled: =
cpu 0, old 0x7040600070406, new 0x7010600070106
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] found SMP MP-tabl=
e at [mem 0x000f7510-0x000f751f] mapped at [c00f7510]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] initial memory ma=
pped: [mem 0x00000000-0x01ffffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Base memory tramp=
oline at [c009b000] 9b000 size 16384
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] init_memory_mappi=
ng: [mem 0x00000000-0x37bfdfff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]  [mem 0x00000000-=
0x001fffff] page 4k
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]  [mem 0x00200000-=
0x379fffff] page 2M
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]  [mem 0x37a00000-=
0x37bfdfff] page 4k
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] kernel direct map=
ping tables up to 0x37bfdfff @ [mem 0x01ffa000-0x01ffffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] RAMDISK: [mem 0x3=
616c000-0x370adfff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: RSDP 000f74=
80 00024 (v02 LENOVO)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: XSDT 7f5f85=
2f 0006C (v01 LENOVO CB-01    00000000  LTP 00000000)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: FACP 7f5e80=
00 000F4 (v03 LENOVO CB-01    00000001 ALAN 00000001)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: DSDT 7f5e90=
00 0665B (v02 LENOVO CB-01    00000001 INTL 20050624)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: FACS 7f59ef=
c0 00040
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: HPET 7f5fed=
86 00038 (v01 LENOVO CB-01    00000001 LOHR 0000005A)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: MCFG 7f5fed=
be 0003C (v01 LENOVO CB-01    00000001 LOHR 0000005A)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: SLIC 7f5fed=
fa 00176 (v01 LENOVO CB-01    00000001 TBD  00000001)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: APIC 7f5fef=
70 00068 (v01 PTLTD  ? APIC   00000000  LTP 00000000)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: BOOT 7f5fef=
d8 00028 (v01 PTLTD  $SBFTBL$ 00000000  LTP 00000001)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: SSDT 7f5e70=
00 00655 (v01  PmRef    CpuPm 00003000 INTL 20050624)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: SSDT 7f5e60=
00 00259 (v01  PmRef  Cpu0Tst 00003000 INTL 20050624)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: SSDT 7f5e50=
00 0020F (v01  PmRef    ApTst 00003000 INTL 20050624)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: Local APIC =
address 0xfee00000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] 1145MB HIGHMEM av=
ailable.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] 891MB LOWMEM avai=
lable.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   mapped low ram:=
 0 - 37bfe000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   low ram: 0 - 37=
bfe000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Zone ranges:
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   DMA      [mem 0=
x00010000-0x00ffffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   Normal   [mem 0=
x01000000-0x37bfdfff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   HighMem  [mem 0=
x37bfe000-0x7f563fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Movable zone star=
t for each node
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Early memory node=
 ranges
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   node   0: [mem =
0x00010000-0x0009efff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   node   0: [mem =
0x00100000-0x7f0a0fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   node   0: [mem =
0x7f0a7000-0x7f1b9fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   node   0: [mem =
0x7f20f000-0x7f307fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   node   0: [mem =
0x7f50f000-0x7f518fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   node   0: [mem =
0x7f51f000-0x7f563fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] On node 0 totalpa=
ges: 520843
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] free_area_init_no=
de: node 0, pgdat c18f6100, node_mem_map f517c200
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   DMA zone: 32 pa=
ges used for memmap
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   DMA zone: 0 pag=
es reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   DMA zone: 3951 =
pages, LIFO batch:0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   Normal zone: 17=
52 pages used for memmap
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   Normal zone: 22=
2502 pages, LIFO batch:31
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   HighMem zone: 2=
291 pages used for memmap
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]   HighMem zone: 2=
90315 pages, LIFO batch:31
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Using APIC driver=
 default
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: PM-Timer IO=
 Port: 0x408
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: Local APIC =
address 0xfee00000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: LAPIC (acpi=
_id[0x00] lapic_id[0x00] enabled)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: LAPIC (acpi=
_id[0x01] lapic_id[0x01] enabled)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: LAPIC_NMI (=
acpi_id[0x00] high edge lint[0x1])
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: LAPIC_NMI (=
acpi_id[0x01] high edge lint[0x1])
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: IOAPIC (id[=
0x02] address[0xfec00000] gsi_base[0])
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] IOAPIC[0]: apic_i=
d 2, version 32, address 0xfec00000, GSI 0-23
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: INT_SRC_OVR=
 (bus 0 bus_irq 0 global_irq 2 high edge)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: INT_SRC_OVR=
 (bus 0 bus_irq 9 global_irq 9 high level)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: IRQ0 used b=
y override.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: IRQ2 used b=
y override.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: IRQ9 used b=
y override.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Using ACPI (MADT)=
 for SMP configuration information
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] ACPI: HPET id: 0x=
8086a201 base: 0xfed00000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] smpboot: Allowing=
 2 CPUs, 0 hotplug CPUs
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] nr_irqs_gsi: 40
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] PM: Registered no=
save memory: 000000000009f000 - 00000000000a0000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] PM: Registered no=
save memory: 00000000000a0000 - 00000000000d2000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] PM: Registered no=
save memory: 00000000000d2000 - 00000000000d4000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] PM: Registered no=
save memory: 00000000000d4000 - 00000000000dc000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] PM: Registered no=
save memory: 00000000000dc000 - 0000000000100000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] e820: [mem 0x8000=
0000-0xdfffffff] available for PCI devices
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Booting paravirtu=
alized kernel on bare hardware
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] setup_percpu: NR_=
CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:2 nr_node_ids:1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] PERCPU: Embedded =
14 pages/cpu @f7bd5000 s35008 r0 d22336 u57344
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] pcpu-alloc: s3500=
8 r0 d22336 u57344 alloc=3D14*4096
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] pcpu-alloc: [0] 0=
 [0] 1=20
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Built 1 zonelists=
 in Zone order, mobility grouping on.  Total pages: 516768
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Kernel command li=
ne: BOOT_IMAGE=3D/boot/vmlinuz-3.8.0-19-generic root=3DUUID=3Dd898661c-e8=
cd-4ebb-821c-c168aaed9c22 ro quiet splash vt.handoff=3D7
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] PID hash table en=
tries: 4096 (order: 2, 16384 bytes)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Dentry cache hash=
 table entries: 131072 (order: 7, 524288 bytes)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Inode-cache hash =
table entries: 65536 (order: 6, 262144 bytes)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] __ex_table alread=
y sorted, skipping sort
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Initializing CPU#=
0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] xsave: enabled xs=
tate_bv 0x3, cntxt size 0x240
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] allocated 4172448=
 bytes of page_cgroup
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] please try 'cgrou=
p_disable=3Dmemory' option if you don't want memory cgroups
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Initializing High=
Mem for node 0 (00037bfe:0007f564)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Memory: 2035400k/=
2086288k available (6251k kernel code, 47972k reserved, 2973k data, 784k =
init, 1170424k highmem)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] virtual kernel me=
mory layout:
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]     fixmap  : 0xf=
ff14000 - 0xfffff000   ( 940 kB)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]     pkmap   : 0xf=
fc00000 - 0xffe00000   (2048 kB)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]     vmalloc : 0xf=
83fe000 - 0xffbfe000   ( 120 MB)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]     lowmem  : 0xc=
0000000 - 0xf7bfe000   ( 891 MB)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]       .init : 0xc=
1903000 - 0xc19c7000   ( 784 kB)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]       .data : 0xc=
161ad30 - 0xc19023c0   (2973 kB)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000]       .text : 0xc=
1000000 - 0xc161ad30   (6251 kB)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Checking if this =
processor honours the WP bit even in supervisor mode...Ok.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] SLUB: Genslabs=3D=
15, HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=3D1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Hierarchical RCU =
implementation.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] 	RCU dyntick-idle=
 grace-period acceleration is enabled.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] 	RCU restricting =
CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D2.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] NR_IRQS:2304 nr_i=
rqs:512 16
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] CPU 0 irqstacks, =
hard=3Df4c08000 soft=3Df4c0a000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Extended CMOS yea=
r: 2000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] Console: colour d=
ummy device 80x25
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] console [tty0] en=
abled
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] hpet clockevent r=
egistered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] tsc: Fast TSC cal=
ibration using PIT
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.000000] tsc: Detected 199=
4.892 MHz processor
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004001] Calibrating delay=
 loop (skipped), value calculated using timer frequency.. 3989.78 BogoMIP=
S (lpj=3D7979568)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004005] pid_max: default:=
 32768 minimum: 301
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004038] Security Framewor=
k initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004048] AppArmor: AppArmo=
r initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004049] Yama: becoming mi=
ndful.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004101] Mount-cache hash =
table entries: 512
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004325] Initializing cgro=
up subsys cpuacct
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004327] Initializing cgro=
up subsys memory
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004335] Initializing cgro=
up subsys devices
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004337] Initializing cgro=
up subsys freezer
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004340] Initializing cgro=
up subsys blkio
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004342] Initializing cgro=
up subsys perf_event
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004345] Initializing cgro=
up subsys hugetlb
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004377] CPU: Physical Pro=
cessor ID: 0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004379] CPU: Processor Co=
re ID: 0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004381] mce: CPU supports=
 6 MCE banks
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004389] CPU0: Thermal mon=
itoring enabled (TM2)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004392] process: using mw=
ait in idle threads
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004400] Last level iTLB e=
ntries: 4KB 128, 2MB 4, 4MB 4
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004400] Last level dTLB e=
ntries: 4KB 256, 2MB 0, 4MB 32
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004400] tlb_flushall_shif=
t: -1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.004704] Freeing SMP alter=
natives: 24k freed
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.010165] ACPI: Core revisi=
on 20121018
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.020013] ftrace: allocatin=
g 26115 entries in 52 pages
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.032097] Enabling APIC mod=
e:  Flat.  Using 1 I/O APICs
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.032501] ..TIMER: vector=3D=
0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.072199] smpboot: CPU0: In=
tel Pentium(R) Dual-Core CPU       T4200  @ 2.00GHz (fam: 06, model: 17, =
stepping: 0a)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.076000] Performance Event=
s: PEBS fmt0+, 4-deep LBR, Core2 events, Intel PMU driver.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.076000] ... version:     =
           2
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.076000] ... bit width:   =
           40
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.076000] ... generic regis=
ters:      2
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.076000] ... value mask:  =
           000000ffffffffff
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.076000] ... max period:  =
           000000007fffffff
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.076000] ... fixed-purpose=
 events:   3
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.076000] ... event mask:  =
           0000000700000003
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.076000] CPU 1 irqstacks, =
hard=3Df4cd8000 soft=3Df4cda000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.076000] smpboot: Booting =
Node   0, Processors  #1 OK
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.008000] Initializing CPU#=
1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.086421] Brought up 2 CPUs=

Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.086426] smpboot: Total of=
 2 processors activated (7979.56 BogoMIPS)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.086522] NMI watchdog: ena=
bled on all CPUs, permanently consumes one hw-PMU counter.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.087564] devtmpfs: initial=
ized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.087564] EVM: security.sel=
inux
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.087564] EVM: security.SMA=
CK64
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.087564] EVM: security.cap=
ability
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.088088] PM: Registering A=
CPI NVS region [mem 0x7f564000-0x7f59efff] (241664 bytes)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089279] regulator-dummy: =
no parameters
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089343] NET: Registered p=
rotocol family 16
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089520] EISA bus register=
ed
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089634] ACPI: bus type pc=
i registered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089712] PCI: MMCONFIG for=
 domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)=

Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089716] PCI: MMCONFIG at =
[mem 0xe0000000-0xefffffff] reserved in E820
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089717] PCI: Using MMCONF=
IG for extended config space
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089719] PCI: Using config=
uration type 1 for base access
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089850] mtrr: your CPUs h=
ad inconsistent variable MTRR settings
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089851] mtrr: probably yo=
ur BIOS does not setup all CPUs.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089853] mtrr: corrected c=
onfiguration.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089853] bio: create slab =
<bio-0> at 0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089853] ACPI: Added _OSI(=
Module Device)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089853] ACPI: Added _OSI(=
Processor Device)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089853] ACPI: Added _OSI(=
3.0 _SCP Extensions)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.089853] ACPI: Added _OSI(=
Processor Aggregator Device)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.093049] ACPI: EC: Look up=
 EC in DSDT
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.097927] [Firmware Bug]: A=
CPI: BIOS _OSI(Linux) query ignored
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.098970] ACPI: SSDT 7f51ac=
a0 00223 (v01  PmRef  Cpu0Ist 00003000 INTL 20050624)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.099425] ACPI: Dynamic OEM=
 Table Load:
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.099428] ACPI: SSDT   (nul=
l) 00223 (v01  PmRef  Cpu0Ist 00003000 INTL 20050624)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.099711] ACPI: SSDT 7f5196=
20 00549 (v01  PmRef  Cpu0Cst 00003001 INTL 20050624)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.100153] ACPI: Dynamic OEM=
 Table Load:
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.100156] ACPI: SSDT   (nul=
l) 00549 (v01  PmRef  Cpu0Cst 00003001 INTL 20050624)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.100418] ACPI: SSDT 7f51aa=
20 001CF (v01  PmRef    ApIst 00003000 INTL 20050624)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.100894] ACPI: Dynamic OEM=
 Table Load:
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.100897] ACPI: SSDT   (nul=
l) 001CF (v01  PmRef    ApIst 00003000 INTL 20050624)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.100908] ACPI: SSDT 7f51af=
20 0008D (v01  PmRef    ApCst 00003000 INTL 20050624)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.100908] ACPI: Dynamic OEM=
 Table Load:
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.100908] ACPI: SSDT   (nul=
l) 0008D (v01  PmRef    ApCst 00003000 INTL 20050624)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.100908] ACPI: Interpreter=
 enabled
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.100908] ACPI: (supports S=
0 S3 S4 S5)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.100908] ACPI: Using IOAPI=
C for interrupt routing
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.147402] ACPI: EC: GPE =3D=
 0x1c, I/O: command/status =3D 0x66, data =3D 0x62
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.147553] ACPI: No dock dev=
ices found.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.147560] PCI: Using host b=
ridge windows from ACPI; if necessary, use "pci=3Dnocrs" and report a bug=

Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.148072] ACPI: PCI Root Br=
idge [PCI0] (domain 0000 [bus 00-ff])
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.148076] ACPI: PCI Interru=
pt Routing Table [\_SB_.PCI0._PRT]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149185] PCI host bridge t=
o bus 0000:00
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149190] pci_bus 0000:00: =
root bus resource [bus 00-ff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149193] pci_bus 0000:00: =
root bus resource [io  0x0000-0x0cf7]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149195] pci_bus 0000:00: =
root bus resource [io  0x0d00-0xffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149198] pci_bus 0000:00: =
root bus resource [mem 0x000a0000-0x000bffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149201] pci_bus 0000:00: =
root bus resource [mem 0x000d4000-0x000d7fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149204] pci_bus 0000:00: =
root bus resource [mem 0x000d8000-0x000dbfff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149207] pci_bus 0000:00: =
root bus resource [mem 0x80000000-0xfebfffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149219] pci 0000:00:00.0:=
 [8086:2a40] type 00 class 0x060000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149246] DMAR: Forcing wri=
te-buffer flush capability
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149248] DMAR: Disabling I=
OMMU for graphics on this chipset
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149280] pci 0000:00:01.0:=
 [8086:2a41] type 01 class 0x060400
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149334] pci 0000:00:01.0:=
 PME# supported from D0 D3hot D3cold
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149389] pci 0000:00:1a.0:=
 [8086:2937] type 00 class 0x0c0300
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149448] pci 0000:00:1a.0:=
 reg 20: [io  0x1800-0x181f]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149519] pci 0000:00:1a.1:=
 [8086:2938] type 00 class 0x0c0300
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149577] pci 0000:00:1a.1:=
 reg 20: [io  0x1820-0x183f]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149648] pci 0000:00:1a.2:=
 [8086:2939] type 00 class 0x0c0300
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149707] pci 0000:00:1a.2:=
 reg 20: [io  0x1840-0x185f]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149789] pci 0000:00:1a.7:=
 [8086:293c] type 00 class 0x0c0320
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149818] pci 0000:00:1a.7:=
 reg 10: [mem 0xf4505800-0xf4505bff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149940] pci 0000:00:1a.7:=
 PME# supported from D0 D3hot D3cold
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149975] pci 0000:00:1b.0:=
 [8086:293e] type 00 class 0x040300
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.149997] pci 0000:00:1b.0:=
 reg 10: [mem 0xf4500000-0xf4503fff 64bit]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.150093] pci 0000:00:1b.0:=
 PME# supported from D0 D3hot D3cold
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.150124] pci 0000:00:1c.0:=
 [8086:2940] type 01 class 0x060400
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.150223] pci 0000:00:1c.0:=
 PME# supported from D0 D3hot D3cold
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.150255] pci 0000:00:1c.1:=
 [8086:2942] type 01 class 0x060400
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.150354] pci 0000:00:1c.1:=
 PME# supported from D0 D3hot D3cold
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.150387] pci 0000:00:1c.2:=
 [8086:2944] type 01 class 0x060400
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.150486] pci 0000:00:1c.2:=
 PME# supported from D0 D3hot D3cold
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.150519] pci 0000:00:1c.3:=
 [8086:2946] type 01 class 0x060400
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.150617] pci 0000:00:1c.3:=
 PME# supported from D0 D3hot D3cold
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.150651] pci 0000:00:1c.5:=
 [8086:294a] type 01 class 0x060400
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.150751] pci 0000:00:1c.5:=
 PME# supported from D0 D3hot D3cold
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.150787] pci 0000:00:1d.0:=
 [8086:2934] type 00 class 0x0c0300
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.150846] pci 0000:00:1d.0:=
 reg 20: [io  0x1860-0x187f]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.150916] pci 0000:00:1d.1:=
 [8086:2935] type 00 class 0x0c0300
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.150975] pci 0000:00:1d.1:=
 reg 20: [io  0x1880-0x189f]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151046] pci 0000:00:1d.2:=
 [8086:2936] type 00 class 0x0c0300
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151104] pci 0000:00:1d.2:=
 reg 20: [io  0x18a0-0x18bf]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151187] pci 0000:00:1d.7:=
 [8086:293a] type 00 class 0x0c0320
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151215] pci 0000:00:1d.7:=
 reg 10: [mem 0xf4505c00-0xf4505fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151337] pci 0000:00:1d.7:=
 PME# supported from D0 D3hot D3cold
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151366] pci 0000:00:1e.0:=
 [8086:2448] type 01 class 0x060401
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151453] pci 0000:00:1f.0:=
 [8086:2919] type 00 class 0x060100
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151610] pci 0000:00:1f.2:=
 [8086:2929] type 00 class 0x010601
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151637] pci 0000:00:1f.2:=
 reg 10: [io  0x18f0-0x18f7]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151648] pci 0000:00:1f.2:=
 reg 14: [io  0x18e4-0x18e7]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151659] pci 0000:00:1f.2:=
 reg 18: [io  0x18e8-0x18ef]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151670] pci 0000:00:1f.2:=
 reg 1c: [io  0x18e0-0x18e3]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151682] pci 0000:00:1f.2:=
 reg 20: [io  0x18c0-0x18df]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151693] pci 0000:00:1f.2:=
 reg 24: [mem 0xf4505000-0xf45057ff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151760] pci 0000:00:1f.2:=
 PME# supported from D3hot
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151784] pci 0000:00:1f.3:=
 [8086:2930] type 00 class 0x0c0500
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151806] pci 0000:00:1f.3:=
 reg 10: [mem 0x00000000-0x000000ff 64bit]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151835] pci 0000:00:1f.3:=
 reg 20: [io  0x1c00-0x1c1f]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151885] pci 0000:00:1f.6:=
 [8086:2932] type 00 class 0x118000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.151915] pci 0000:00:1f.6:=
 reg 10: [mem 0xf4504000-0xf4504fff 64bit]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.152086] pci 0000:01:00.0:=
 [10de:06e9] type 00 class 0x030000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.152114] pci 0000:01:00.0:=
 reg 10: [mem 0xce000000-0xceffffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.152135] pci 0000:01:00.0:=
 reg 14: [mem 0xd0000000-0xdfffffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.152157] pci 0000:01:00.0:=
 reg 1c: [mem 0xcc000000-0xcdffffff 64bit]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.152172] pci 0000:01:00.0:=
 reg 24: [io  0x2000-0x207f]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.152187] pci 0000:01:00.0:=
 reg 30: [mem 0x00000000-0x0001ffff pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.160022] pci 0000:00:01.0:=
 PCI bridge to [bus 01]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.160026] pci 0000:00:01.0:=
   bridge window [io  0x2000-0x2fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.160031] pci 0000:00:01.0:=
   bridge window [mem 0xcc000000-0xceffffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.160036] pci 0000:00:01.0:=
   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.160092] pci 0000:00:1c.0:=
 PCI bridge to [bus 02]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.160157] pci 0000:00:1c.1:=
 PCI bridge to [bus 03]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.160476] pci 0000:04:00.0:=
 [14e4:4315] type 00 class 0x028000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.160544] pci 0000:04:00.0:=
 reg 10: [mem 0xf4100000-0xf4103fff 64bit]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.160910] pci 0000:04:00.0:=
 supports D1 D2
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.160913] pci 0000:04:00.0:=
 PME# supported from D0 D3hot D3cold
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.161089] pci 0000:00:1c.2:=
 PCI bridge to [bus 04]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.161097] pci 0000:00:1c.2:=
   bridge window [mem 0xf4100000-0xf41fffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.161159] pci 0000:00:1c.3:=
 PCI bridge to [bus 05-06]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.161164] pci 0000:00:1c.3:=
   bridge window [io  0x3000-0x3fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.161169] pci 0000:00:1c.3:=
   bridge window [mem 0xf0000000-0xf3ffffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.161177] pci 0000:00:1c.3:=
   bridge window [mem 0xf6000000-0xf7ffffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.161341] pci 0000:07:00.0:=
 [14e4:1713] type 00 class 0x020000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.161408] pci 0000:07:00.0:=
 reg 10: [mem 0xf4000000-0xf400ffff 64bit]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.161811] pci 0000:07:00.0:=
 PME# supported from D3hot D3cold
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.161950] pci 0000:00:1c.5:=
 PCI bridge to [bus 07]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.161958] pci 0000:00:1c.5:=
   bridge window [mem 0xf4000000-0xf40fffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162015] pci 0000:08:06.0:=
 [1217:00f7] type 00 class 0x0c0010
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162037] pci 0000:08:06.0:=
 reg 10: [mem 0xf4200000-0xf4200fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162050] pci 0000:08:06.0:=
 reg 14: [mem 0xf4202000-0xf42027ff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162137] pci 0000:08:06.0:=
 supports D1 D2
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162140] pci 0000:08:06.0:=
 PME# supported from D0 D1 D2 D3hot D3cold
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162167] pci 0000:08:06.2:=
 [1217:7120] type 00 class 0x080501
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162190] pci 0000:08:06.2:=
 reg 10: [mem 0xf4202800-0xf42028ff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162294] pci 0000:08:06.2:=
 supports D1 D2
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162297] pci 0000:08:06.2:=
 PME# supported from D0 D1 D2 D3hot D3cold
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162322] pci 0000:08:06.3:=
 [1217:7130] type 00 class 0x018000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162346] pci 0000:08:06.3:=
 reg 10: [mem 0xf4201000-0xf4201fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162449] pci 0000:08:06.3:=
 supports D1 D2
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162452] pci 0000:08:06.3:=
 PME# supported from D0 D1 D2 D3hot D3cold
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162512] pci 0000:00:1e.0:=
 PCI bridge to [bus 08] (subtractive decode)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162520] pci 0000:00:1e.0:=
   bridge window [mem 0xf4200000-0xf42fffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162528] pci 0000:00:1e.0:=
   bridge window [io  0x0000-0x0cf7] (subtractive decode)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162530] pci 0000:00:1e.0:=
   bridge window [io  0x0d00-0xffff] (subtractive decode)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162533] pci 0000:00:1e.0:=
   bridge window [mem 0x000a0000-0x000bffff] (subtractive decode)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162536] pci 0000:00:1e.0:=
   bridge window [mem 0x000d4000-0x000d7fff] (subtractive decode)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162539] pci 0000:00:1e.0:=
   bridge window [mem 0x000d8000-0x000dbfff] (subtractive decode)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162542] pci 0000:00:1e.0:=
   bridge window [mem 0x80000000-0xfebfffff] (subtractive decode)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162580] pci_bus 0000:00: =
on NUMA node 0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162591] ACPI: PCI Interru=
pt Routing Table [\_SB_.PCI0.P0P2._PRT]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162650] ACPI: PCI Interru=
pt Routing Table [\_SB_.PCI0.P0P1._PRT]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162726] ACPI: PCI Interru=
pt Routing Table [\_SB_.PCI0.RP01._PRT]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162798] ACPI: PCI Interru=
pt Routing Table [\_SB_.PCI0.RP02._PRT]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162846] ACPI: PCI Interru=
pt Routing Table [\_SB_.PCI0.RP03._PRT]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162901] ACPI: PCI Interru=
pt Routing Table [\_SB_.PCI0.RP04._PRT]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.162951] ACPI: PCI Interru=
pt Routing Table [\_SB_.PCI0.RP06._PRT]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.163009]  pci0000:00: ACPI=
 _OSC support notification failed, disabling PCIe ASPM
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.163012]  pci0000:00: Unab=
le to request _OSC control (_OSC support mask: 0x08)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.164566] ACPI: PCI Interru=
pt Link [LNKA] (IRQs 1 3 4 *5 6 7 10 12 14 15)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.164638] ACPI: PCI Interru=
pt Link [LNKB] (IRQs 1 3 4 5 6 7 *11 12 14 15)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.164706] ACPI: PCI Interru=
pt Link [LNKC] (IRQs 1 *3 4 5 6 7 10 12 14 15)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.164773] ACPI: PCI Interru=
pt Link [LNKD] (IRQs 1 3 4 5 6 7 11 12 14 15) *10
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.164841] ACPI: PCI Interru=
pt Link [LNKE] (IRQs 1 3 4 5 6 *7 10 12 14 15)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.164909] ACPI: PCI Interru=
pt Link [LNKF] (IRQs 1 3 4 5 6 7 *11 12 14 15)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.164976] ACPI: PCI Interru=
pt Link [LNKG] (IRQs 1 3 4 5 6 7 *10 12 14 15)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.165043] ACPI: PCI Interru=
pt Link [LNKH] (IRQs 1 3 *4 5 6 7 11 12 14 15)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.165155] vgaarb: device ad=
ded: PCI:0000:01:00.0,decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.165155] vgaarb: loaded
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.165155] vgaarb: bridge co=
ntrol possible 0000:01:00.0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.165155] SCSI subsystem in=
itialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.165155] ACPI: bus type sc=
si registered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.165155] libata version 3.=
00 loaded.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.165155] ACPI: bus type us=
b registered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.165155] usbcore: register=
ed new interface driver usbfs
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.165155] usbcore: register=
ed new interface driver hub
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.165155] usbcore: register=
ed new device driver usb
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.165155] PCI: Using ACPI f=
or IRQ routing
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.172318] PCI: pci_cache_li=
ne_size set to 64 bytes
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.172895] e820: reserve RAM=
 buffer [mem 0x0009f400-0x0009ffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.172898] e820: reserve RAM=
 buffer [mem 0x7f0a1000-0x7fffffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.172902] e820: reserve RAM=
 buffer [mem 0x7f1ba000-0x7fffffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.172905] e820: reserve RAM=
 buffer [mem 0x7f308000-0x7fffffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.172908] e820: reserve RAM=
 buffer [mem 0x7f519000-0x7fffffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.172911] e820: reserve RAM=
 buffer [mem 0x7f564000-0x7fffffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.173020] NetLabel: Initial=
izing
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.173023] NetLabel:  domain=
 hash size =3D 128
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.173024] NetLabel:  protoc=
ols =3D UNLABELED CIPSOv4
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.173038] NetLabel:  unlabe=
led traffic allowed by default
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.173053] HPET: 4 timers in=
 total, 0 timers will be used for per-cpu timer
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.173053] hpet0: at MMIO 0x=
fed00000, IRQs 2, 8, 0, 0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.173053] hpet0: 4 comparat=
ors, 64-bit 14.318180 MHz counter
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.176013] Switching to cloc=
ksource hpet
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.184974] AppArmor: AppArmo=
r Filesystem Enabled
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185013] pnp: PnP ACPI ini=
t
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185031] ACPI: bus type pn=
p registered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185187] pnp 00:00: Plug a=
nd Play ACPI device, IDs ENE0201 (active)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185280] pnp 00:01: [dma 4=
]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185309] pnp 00:01: Plug a=
nd Play ACPI device, IDs PNP0200 (active)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185341] pnp 00:02: Plug a=
nd Play ACPI device, IDs INT0800 (active)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185496] system 00:03: [me=
m 0xfed00000-0xfed003ff] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185500] system 00:03: Plu=
g and Play ACPI device, IDs PNP0103 PNP0c01 (active)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185544] pnp 00:04: Plug a=
nd Play ACPI device, IDs PNP0c04 (active)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185652] system 00:05: [io=
  0x0680-0x069f] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185656] system 00:05: [io=
  0x0480-0x048f] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185659] system 00:05: [io=
  0xffff] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185663] system 00:05: [io=
  0xffff] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185666] system 00:05: [io=
  0x0400-0x047f] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185669] system 00:05: [io=
  0x1180-0x11ff] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185672] system 00:05: [io=
  0x164e-0x164f] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185675] system 00:05: [io=
  0xfe00] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185680] system 00:05: Plu=
g and Play ACPI device, IDs PNP0c02 (active)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.185765] pnp 00:06: Plug a=
nd Play ACPI device, IDs PNP0b00 (active)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.204110] pnp 00:07: Plug a=
nd Play ACPI device, IDs SYN0713 SYN0700 SYN0002 PNP0f13 (active)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.204149] pnp 00:08: Plug a=
nd Play ACPI device, IDs PNP0303 (active)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.204421] system 00:09: [me=
m 0xfed1c000-0xfed1ffff] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.204425] system 00:09: [me=
m 0xfed10000-0xfed13fff] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.204429] system 00:09: [me=
m 0xfed18000-0xfed18fff] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.204432] system 00:09: [me=
m 0xfed19000-0xfed19fff] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.204435] system 00:09: [me=
m 0xe0000000-0xefffffff] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.204441] system 00:09: [me=
m 0xfed20000-0xfed3ffff] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.204445] system 00:09: [me=
m 0xfed40000-0xfed44fff] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.204448] system 00:09: [me=
m 0xfed45000-0xfed8ffff] has been reserved
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.204452] system 00:09: Plu=
g and Play ACPI device, IDs PNP0c02 (active)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.204613] pnp: PnP ACPI: fo=
und 10 devices
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.204615] ACPI: ACPI bus ty=
pe pnp unregistered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.204619] PnPBIOS: Disabled=
 by ACPI PNP
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241462] pci 0000:00:1c.0:=
 bridge window [io  0x1000-0x0fff] to [bus 02] add_size 1000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241468] pci 0000:00:1c.0:=
 bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 02] add_siz=
e 200000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241472] pci 0000:00:1c.0:=
 bridge window [mem 0x00100000-0x000fffff] to [bus 02] add_size 200000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241483] pci 0000:00:1c.1:=
 bridge window [io  0x1000-0x0fff] to [bus 03] add_size 1000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241487] pci 0000:00:1c.1:=
 bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 03] add_siz=
e 200000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241490] pci 0000:00:1c.1:=
 bridge window [mem 0x00100000-0x000fffff] to [bus 03] add_size 200000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241501] pci 0000:00:1c.2:=
 bridge window [io  0x1000-0x0fff] to [bus 04] add_size 1000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241505] pci 0000:00:1c.2:=
 bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 04] add_siz=
e 200000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241524] pci 0000:00:1c.5:=
 bridge window [io  0x1000-0x0fff] to [bus 07] add_size 1000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241528] pci 0000:00:1c.5:=
 bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 07] add_siz=
e 200000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241547] pci 0000:00:1c.0:=
 res[14]=3D[mem 0x00100000-0x000fffff] get_res_add_size add_size 200000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241551] pci 0000:00:1c.0:=
 res[15]=3D[mem 0x00100000-0x000fffff 64bit pref] get_res_add_size add_si=
ze 200000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241554] pci 0000:00:1c.1:=
 res[14]=3D[mem 0x00100000-0x000fffff] get_res_add_size add_size 200000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241557] pci 0000:00:1c.1:=
 res[15]=3D[mem 0x00100000-0x000fffff 64bit pref] get_res_add_size add_si=
ze 200000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241560] pci 0000:00:1c.2:=
 res[15]=3D[mem 0x00100000-0x000fffff 64bit pref] get_res_add_size add_si=
ze 200000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241563] pci 0000:00:1c.5:=
 res[15]=3D[mem 0x00100000-0x000fffff 64bit pref] get_res_add_size add_si=
ze 200000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241567] pci 0000:00:1c.0:=
 res[13]=3D[io  0x1000-0x0fff] get_res_add_size add_size 1000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241570] pci 0000:00:1c.1:=
 res[13]=3D[io  0x1000-0x0fff] get_res_add_size add_size 1000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241573] pci 0000:00:1c.2:=
 res[13]=3D[io  0x1000-0x0fff] get_res_add_size add_size 1000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241575] pci 0000:00:1c.5:=
 res[13]=3D[io  0x1000-0x0fff] get_res_add_size add_size 1000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241582] pci 0000:00:1c.0:=
 BAR 14: assigned [mem 0x80000000-0x801fffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241587] pci 0000:00:1c.0:=
 BAR 15: assigned [mem 0x80200000-0x803fffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241591] pci 0000:00:1c.1:=
 BAR 14: assigned [mem 0x80400000-0x805fffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241595] pci 0000:00:1c.1:=
 BAR 15: assigned [mem 0x80600000-0x807fffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241600] pci 0000:00:1c.2:=
 BAR 15: assigned [mem 0x80800000-0x809fffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241604] pci 0000:00:1c.5:=
 BAR 15: assigned [mem 0x80a00000-0x80bfffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241609] pci 0000:00:1c.0:=
 BAR 13: assigned [io  0x4000-0x4fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241613] pci 0000:00:1c.1:=
 BAR 13: assigned [io  0x5000-0x5fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241617] pci 0000:00:1c.2:=
 BAR 13: assigned [io  0x6000-0x6fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241621] pci 0000:00:1c.5:=
 BAR 13: assigned [io  0x7000-0x7fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241625] pci 0000:00:1f.3:=
 BAR 0: assigned [mem 0x80c00000-0x80c000ff 64bit]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241640] pci 0000:01:00.0:=
 BAR 6: can't assign mem pref (size 0x20000)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241643] pci 0000:00:01.0:=
 PCI bridge to [bus 01]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241647] pci 0000:00:01.0:=
   bridge window [io  0x2000-0x2fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241652] pci 0000:00:01.0:=
   bridge window [mem 0xcc000000-0xceffffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241656] pci 0000:00:01.0:=
   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241661] pci 0000:00:1c.0:=
 PCI bridge to [bus 02]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241665] pci 0000:00:1c.0:=
   bridge window [io  0x4000-0x4fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241672] pci 0000:00:1c.0:=
   bridge window [mem 0x80000000-0x801fffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241677] pci 0000:00:1c.0:=
   bridge window [mem 0x80200000-0x803fffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241685] pci 0000:00:1c.1:=
 PCI bridge to [bus 03]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241689] pci 0000:00:1c.1:=
   bridge window [io  0x5000-0x5fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241695] pci 0000:00:1c.1:=
   bridge window [mem 0x80400000-0x805fffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241700] pci 0000:00:1c.1:=
   bridge window [mem 0x80600000-0x807fffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241708] pci 0000:00:1c.2:=
 PCI bridge to [bus 04]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241712] pci 0000:00:1c.2:=
   bridge window [io  0x6000-0x6fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241719] pci 0000:00:1c.2:=
   bridge window [mem 0xf4100000-0xf41fffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241724] pci 0000:00:1c.2:=
   bridge window [mem 0x80800000-0x809fffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241731] pci 0000:00:1c.3:=
 PCI bridge to [bus 05-06]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241735] pci 0000:00:1c.3:=
   bridge window [io  0x3000-0x3fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241742] pci 0000:00:1c.3:=
   bridge window [mem 0xf0000000-0xf3ffffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241747] pci 0000:00:1c.3:=
   bridge window [mem 0xf6000000-0xf7ffffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241755] pci 0000:00:1c.5:=
 PCI bridge to [bus 07]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241758] pci 0000:00:1c.5:=
   bridge window [io  0x7000-0x7fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241765] pci 0000:00:1c.5:=
   bridge window [mem 0xf4000000-0xf40fffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241770] pci 0000:00:1c.5:=
   bridge window [mem 0x80a00000-0x80bfffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241778] pci 0000:00:1e.0:=
 PCI bridge to [bus 08]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241785] pci 0000:00:1e.0:=
   bridge window [mem 0xf4200000-0xf42fffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241848] pci 0000:00:1e.0:=
 setting latency timer to 64
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241853] pci_bus 0000:00: =
resource 4 [io  0x0000-0x0cf7]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241856] pci_bus 0000:00: =
resource 5 [io  0x0d00-0xffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241859] pci_bus 0000:00: =
resource 6 [mem 0x000a0000-0x000bffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241861] pci_bus 0000:00: =
resource 7 [mem 0x000d4000-0x000d7fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241864] pci_bus 0000:00: =
resource 8 [mem 0x000d8000-0x000dbfff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241867] pci_bus 0000:00: =
resource 9 [mem 0x80000000-0xfebfffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241870] pci_bus 0000:01: =
resource 0 [io  0x2000-0x2fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241872] pci_bus 0000:01: =
resource 1 [mem 0xcc000000-0xceffffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241875] pci_bus 0000:01: =
resource 2 [mem 0xd0000000-0xdfffffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241878] pci_bus 0000:02: =
resource 0 [io  0x4000-0x4fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241881] pci_bus 0000:02: =
resource 1 [mem 0x80000000-0x801fffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241884] pci_bus 0000:02: =
resource 2 [mem 0x80200000-0x803fffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241886] pci_bus 0000:03: =
resource 0 [io  0x5000-0x5fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241889] pci_bus 0000:03: =
resource 1 [mem 0x80400000-0x805fffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241892] pci_bus 0000:03: =
resource 2 [mem 0x80600000-0x807fffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241895] pci_bus 0000:04: =
resource 0 [io  0x6000-0x6fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241897] pci_bus 0000:04: =
resource 1 [mem 0xf4100000-0xf41fffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241900] pci_bus 0000:04: =
resource 2 [mem 0x80800000-0x809fffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241903] pci_bus 0000:05: =
resource 0 [io  0x3000-0x3fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241906] pci_bus 0000:05: =
resource 1 [mem 0xf0000000-0xf3ffffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241909] pci_bus 0000:05: =
resource 2 [mem 0xf6000000-0xf7ffffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241912] pci_bus 0000:07: =
resource 0 [io  0x7000-0x7fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241914] pci_bus 0000:07: =
resource 1 [mem 0xf4000000-0xf40fffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241917] pci_bus 0000:07: =
resource 2 [mem 0x80a00000-0x80bfffff 64bit pref]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241920] pci_bus 0000:08: =
resource 1 [mem 0xf4200000-0xf42fffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241923] pci_bus 0000:08: =
resource 4 [io  0x0000-0x0cf7]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241925] pci_bus 0000:08: =
resource 5 [io  0x0d00-0xffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241928] pci_bus 0000:08: =
resource 6 [mem 0x000a0000-0x000bffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241931] pci_bus 0000:08: =
resource 7 [mem 0x000d4000-0x000d7fff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241933] pci_bus 0000:08: =
resource 8 [mem 0x000d8000-0x000dbfff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241936] pci_bus 0000:08: =
resource 9 [mem 0x80000000-0xfebfffff]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.241972] NET: Registered p=
rotocol family 2
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.242145] TCP established h=
ash table entries: 8192 (order: 4, 65536 bytes)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.242173] TCP bind hash tab=
le entries: 8192 (order: 4, 65536 bytes)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.242196] TCP: Hash tables =
configured (established 8192 bind 8192)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.242224] TCP: reno registe=
red
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.242227] UDP hash table en=
tries: 512 (order: 2, 16384 bytes)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.242236] UDP-Lite hash tab=
le entries: 512 (order: 2, 16384 bytes)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.242294] NET: Registered p=
rotocol family 1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.242558] pci 0000:01:00.0:=
 Boot video device
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.242810] PCI: CLS 64 bytes=
, default 64
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.242858] Trying to unpack =
rootfs image as initramfs...
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.589620] Freeing initrd me=
mory: 15624k freed
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.597412] Simple Boot Flag =
at 0x36 set to 0x1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.597749] Initialise module=
 verification
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.597796] audit: initializi=
ng netlink socket (disabled)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.597810] type=3D2000 audit=
(1367103714.596:1): initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.623670] bounce pool size:=
 64 pages
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.623684] HugeTLB registere=
d 2 MB page size, pre-allocated 0 pages
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.625472] VFS: Disk quotas =
dquot_6.5.2
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.625530] Dquot-cache hash =
table entries: 1024 (order 0, 4096 bytes)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.626172] fuse init (API ve=
rsion 7.20)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.626271] msgmni has been s=
et to 1719
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.626721] Key type asymmetr=
ic registered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.626724] Asymmetric key pa=
rser 'x509' registered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.626769] Block layer SCSI =
generic (bsg) driver version 0.4 loaded (major 252)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.626799] io scheduler noop=
 registered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.626802] io scheduler dead=
line registered (default)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.626811] io scheduler cfq =
registered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.626984] pcieport 0000:00:=
01.0: irq 40 for MSI/MSI-X
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.627085] pcieport 0000:00:=
1c.0: irq 41 for MSI/MSI-X
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.627202] pcieport 0000:00:=
1c.1: irq 42 for MSI/MSI-X
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.627317] pcieport 0000:00:=
1c.2: irq 43 for MSI/MSI-X
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.627436] pcieport 0000:00:=
1c.3: irq 44 for MSI/MSI-X
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.627551] pcieport 0000:00:=
1c.5: irq 45 for MSI/MSI-X
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.627646] pci_hotplug: PCI =
Hot Plug PCI Core version: 0.5
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.627667] pciehp: PCI Expre=
ss Hot Plug Controller Driver version: 0.4
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.627733] intel_idle: does =
not run on family 6 model 23
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.631333] ACPI: AC Adapter =
[ACAD] (on-line)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.631429] input: Lid Switch=
 as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.631544] ACPI: Lid Switch =
[LID0]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.631586] input: Power Butt=
on as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.631591] ACPI: Power Butto=
n [PWRB]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.631633] input: Sleep Butt=
on as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input2
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.631637] ACPI: Sleep Butto=
n [SLPB]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.631694] input: Power Butt=
on as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.631698] ACPI: Power Butto=
n [PWRF]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.631786] ACPI: Requesting =
acpi_cpufreq
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.635981] Monitor-Mwait wil=
l be used to enter C-1 state
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.635991] Monitor-Mwait wil=
l be used to enter C-2 state
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.635996] tsc: Marking TSC =
unstable due to TSC halts in idle
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.636041] ACPI: acpi_idle r=
egistered with cpuidle
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.679590] ACPI: Invalid act=
ive0 threshold
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.685797] thermal LNXTHERM:=
00: registered as thermal_zone0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.685800] ACPI: Thermal Zon=
e [TZ00] (45 C)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.685858] GHES: HEST is not=
 enabled!
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.685958] Serial: 8250/1655=
0 driver, 32 ports, IRQ sharing enabled
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.686069] isapnp: Scanning =
for PnP cards...
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.798828] ACPI: Battery Slo=
t [BAT1] (battery present)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.798991] Linux agpgart int=
erface v0.103
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.800661] brd: module loade=
d
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.801446] loop: module load=
ed
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.801903] libphy: Fixed MDI=
O Bus: probed
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.801985] tun: Universal TU=
N/TAP device driver, 1.6
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.801987] tun: (C) 1999-200=
4 Max Krasnyansky <maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.802025] PPP generic drive=
r version 2.4.2
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.802066] ehci_hcd: USB 2.0=
 'Enhanced' Host Controller (EHCI) Driver
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.802068] ehci-pci: EHCI PC=
I platform driver
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.802102] ehci-pci 0000:00:=
1a.7: setting latency timer to 64
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.802107] ehci-pci 0000:00:=
1a.7: EHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.802114] ehci-pci 0000:00:=
1a.7: new USB bus registered, assigned bus number 1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.802131] ehci-pci 0000:00:=
1a.7: debug port 1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.806034] ehci-pci 0000:00:=
1a.7: cache line size of 64 is not supported
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.806060] ehci-pci 0000:00:=
1a.7: irq 20, io mem 0xf4505800
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.816018] ehci-pci 0000:00:=
1a.7: USB 2.0 started, EHCI 1.00
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.816041] usb usb1: New USB=
 device found, idVendor=3D1d6b, idProduct=3D0002
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.816044] usb usb1: New USB=
 device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.816047] usb usb1: Product=
: EHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.816050] usb usb1: Manufac=
turer: Linux 3.8.0-19-generic ehci_hcd
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.816052] usb usb1: SerialN=
umber: 0000:00:1a.7
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.816161] hub 1-0:1.0: USB =
hub found
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.816166] hub 1-0:1.0: 6 po=
rts detected
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.816319] ehci-pci 0000:00:=
1d.7: setting latency timer to 64
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.816324] ehci-pci 0000:00:=
1d.7: EHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.816330] ehci-pci 0000:00:=
1d.7: new USB bus registered, assigned bus number 2
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.816345] ehci-pci 0000:00:=
1d.7: debug port 1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.820256] ehci-pci 0000:00:=
1d.7: cache line size of 64 is not supported
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.820273] ehci-pci 0000:00:=
1d.7: irq 23, io mem 0xf4505c00
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832017] ehci-pci 0000:00:=
1d.7: USB 2.0 started, EHCI 1.00
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832049] usb usb2: New USB=
 device found, idVendor=3D1d6b, idProduct=3D0002
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832052] usb usb2: New USB=
 device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832054] usb usb2: Product=
: EHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832057] usb usb2: Manufac=
turer: Linux 3.8.0-19-generic ehci_hcd
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832060] usb usb2: SerialN=
umber: 0000:00:1d.7
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832158] hub 2-0:1.0: USB =
hub found
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832162] hub 2-0:1.0: 6 po=
rts detected
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832297] ehci-platform: EH=
CI generic platform driver
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832307] ohci_hcd: USB 1.1=
 'Open' Host Controller (OHCI) Driver
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832328] uhci_hcd: USB Uni=
versal Host Controller Interface driver
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832350] uhci_hcd 0000:00:=
1a.0: setting latency timer to 64
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832355] uhci_hcd 0000:00:=
1a.0: UHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832360] uhci_hcd 0000:00:=
1a.0: new USB bus registered, assigned bus number 3
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832398] uhci_hcd 0000:00:=
1a.0: irq 16, io base 0x00001800
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832432] usb usb3: New USB=
 device found, idVendor=3D1d6b, idProduct=3D0001
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832435] usb usb3: New USB=
 device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832437] usb usb3: Product=
: UHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832440] usb usb3: Manufac=
turer: Linux 3.8.0-19-generic uhci_hcd
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832443] usb usb3: SerialN=
umber: 0000:00:1a.0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832538] hub 3-0:1.0: USB =
hub found
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832543] hub 3-0:1.0: 2 po=
rts detected
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832633] uhci_hcd 0000:00:=
1a.1: setting latency timer to 64
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832637] uhci_hcd 0000:00:=
1a.1: UHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832643] uhci_hcd 0000:00:=
1a.1: new USB bus registered, assigned bus number 4
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832680] uhci_hcd 0000:00:=
1a.1: irq 21, io base 0x00001820
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832713] usb usb4: New USB=
 device found, idVendor=3D1d6b, idProduct=3D0001
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832716] usb usb4: New USB=
 device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832718] usb usb4: Product=
: UHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832721] usb usb4: Manufac=
turer: Linux 3.8.0-19-generic uhci_hcd
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832723] usb usb4: SerialN=
umber: 0000:00:1a.1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832821] hub 4-0:1.0: USB =
hub found
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832826] hub 4-0:1.0: 2 po=
rts detected
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832910] uhci_hcd 0000:00:=
1a.2: setting latency timer to 64
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832914] uhci_hcd 0000:00:=
1a.2: UHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832919] uhci_hcd 0000:00:=
1a.2: new USB bus registered, assigned bus number 5
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832945] uhci_hcd 0000:00:=
1a.2: irq 20, io base 0x00001840
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832979] usb usb5: New USB=
 device found, idVendor=3D1d6b, idProduct=3D0001
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832982] usb usb5: New USB=
 device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832985] usb usb5: Product=
: UHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832987] usb usb5: Manufac=
turer: Linux 3.8.0-19-generic uhci_hcd
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.832990] usb usb5: SerialN=
umber: 0000:00:1a.2
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833080] hub 5-0:1.0: USB =
hub found
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833085] hub 5-0:1.0: 2 po=
rts detected
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833170] uhci_hcd 0000:00:=
1d.0: setting latency timer to 64
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833174] uhci_hcd 0000:00:=
1d.0: UHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833180] uhci_hcd 0000:00:=
1d.0: new USB bus registered, assigned bus number 6
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833205] uhci_hcd 0000:00:=
1d.0: irq 23, io base 0x00001860
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833237] usb usb6: New USB=
 device found, idVendor=3D1d6b, idProduct=3D0001
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833240] usb usb6: New USB=
 device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833243] usb usb6: Product=
: UHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833246] usb usb6: Manufac=
turer: Linux 3.8.0-19-generic uhci_hcd
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833248] usb usb6: SerialN=
umber: 0000:00:1d.0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833338] hub 6-0:1.0: USB =
hub found
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833346] hub 6-0:1.0: 2 po=
rts detected
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833433] uhci_hcd 0000:00:=
1d.1: setting latency timer to 64
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833437] uhci_hcd 0000:00:=
1d.1: UHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833442] uhci_hcd 0000:00:=
1d.1: new USB bus registered, assigned bus number 7
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833479] uhci_hcd 0000:00:=
1d.1: irq 19, io base 0x00001880
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833512] usb usb7: New USB=
 device found, idVendor=3D1d6b, idProduct=3D0001
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833515] usb usb7: New USB=
 device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833517] usb usb7: Product=
: UHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833520] usb usb7: Manufac=
turer: Linux 3.8.0-19-generic uhci_hcd
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833523] usb usb7: SerialN=
umber: 0000:00:1d.1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833613] hub 7-0:1.0: USB =
hub found
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833619] hub 7-0:1.0: 2 po=
rts detected
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833702] uhci_hcd 0000:00:=
1d.2: setting latency timer to 64
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833706] uhci_hcd 0000:00:=
1d.2: UHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833711] uhci_hcd 0000:00:=
1d.2: new USB bus registered, assigned bus number 8
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833747] uhci_hcd 0000:00:=
1d.2: irq 18, io base 0x000018a0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833780] usb usb8: New USB=
 device found, idVendor=3D1d6b, idProduct=3D0001
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833783] usb usb8: New USB=
 device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833785] usb usb8: Product=
: UHCI Host Controller
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833788] usb usb8: Manufac=
turer: Linux 3.8.0-19-generic uhci_hcd
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833791] usb usb8: SerialN=
umber: 0000:00:1d.2
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833882] hub 8-0:1.0: USB =
hub found
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.833887] hub 8-0:1.0: 2 po=
rts detected
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.834046] i8042: PNP: PS/2 =
Controller [PNP0303:PS2K,PNP0f13:MSS0] at 0x60,0x64 irq 1,12
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.864560] serio: i8042 KBD =
port at 0x60,0x64 irq 1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.864567] serio: i8042 AUX =
port at 0x60,0x64 irq 12
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.864685] mousedev: PS/2 mo=
use device common for all mice
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866571] rtc_cmos 00:06: R=
TC can wake from S4
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866709] rtc_cmos 00:06: r=
tc core: registered rtc_cmos as rtc0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866738] rtc0: alarms up t=
o one month, y3k, 242 bytes nvram, hpet irqs
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866851] device-mapper: ue=
vent: version 1.0.3
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866919] device-mapper: io=
ctl: 4.23.1-ioctl (2012-12-18) initialised: dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866940] EISA: Probing bus=
 0 at eisa.0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866942] EISA: Cannot allo=
cate resource for mainboard
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866945] Cannot allocate r=
esource for EISA slot 1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866947] Cannot allocate r=
esource for EISA slot 2
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866949] Cannot allocate r=
esource for EISA slot 3
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866950] Cannot allocate r=
esource for EISA slot 4
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866952] Cannot allocate r=
esource for EISA slot 5
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866954] Cannot allocate r=
esource for EISA slot 6
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866956] Cannot allocate r=
esource for EISA slot 7
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866958] Cannot allocate r=
esource for EISA slot 8
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866960] EISA: Detected 0 =
cards.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.866971] cpufreq-nforce2: =
No nForce2 chipset.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.867012] cpuidle: using go=
vernor ladder
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.867061] cpuidle: using go=
vernor menu
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.867065] ledtrig-cpu: regi=
stered to indicate activity on CPUs
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.867067] EFI Variables Fac=
ility v0.08 2004-May-17
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.867248] ashmem: initializ=
ed
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.867390] TCP: cubic regist=
ered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.867508] NET: Registered p=
rotocol family 10
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.867718] NET: Registered p=
rotocol family 17
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.867731] Key type dns_reso=
lver registered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.867913] Using IPI No-Shor=
tcut mode
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.867991] Loading module ve=
rification certificates
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.872732] MODSIGN: Loaded c=
ert 'Magrathea: Glacier signing key: fceb9fd088cf158e29d83343e1c98bf8ab23=
d94a'
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.872749] registered taskst=
ats version 1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.892714] input: AT Transla=
ted Set 2 keyboard as /devices/platform/i8042/serio0/input/input4
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.899069] Key type trusted =
registered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.926668] Key type encrypte=
d registered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.957678] rtc_cmos 00:06: s=
etting system clock to 2013-04-27 23:01:56 UTC (1367103716)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.958211] BIOS EDD facility=
 v0.16 2004-Jun-25, 0 devices found
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    0.958213] EDD information n=
ot available.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.043215] isapnp: No Plug &=
 Play device found
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.043306] Freeing unused ke=
rnel memory: 784k freed
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.043572] Write protecting =
the kernel text: 6252k
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.043650] Write protecting =
the kernel read-only data: 2432k
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.043652] NX-protecting the=
 kernel data: 3988k
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.361612] pps_core: LinuxPP=
S API ver. 1 registered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.361616] pps_core: Softwar=
e ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti-k2GhghHVRtY@public.gmane.org>
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.368339] PTP clock support=
 registered
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.385451] Disabling lock de=
bugging due to kernel taint
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.388042] usb 2-1: new high=
-speed USB device number 2 using ehci-pci
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.391722] ahci 0000:00:1f.2=
: version 3.0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.391788] ahci 0000:00:1f.2=
: irq 46 for MSI/MSI-X
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.391831] ahci: SSS flag se=
t, parallel bus scan disabled
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.391856] ahci 0000:00:1f.2=
: AHCI 0001.0200 32 slots 4 ports 3 Gbps 0x3 impl SATA mode
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.391861] ahci 0000:00:1f.2=
: flags: 64bit ncq sntf stag pm led clo pio slum part ccc ems sxs=20
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.391866] ahci 0000:00:1f.2=
: setting latency timer to 64
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.393259] tg3.c:v3.128 (Dec=
ember 03, 2012)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.404640] sdhci: Secure Dig=
ital Host Controller Interface driver
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.404644] sdhci: Copyright(=
c) Pierre Ossman
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.412031] scsi0 : ahci
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.418968] scsi1 : ahci
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.422426] scsi2 : ahci
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.426442] scsi3 : ahci
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.426521] ata1: SATA max UD=
MA/133 abar m2048@0xf4505000 port 0xf4505100 irq 46
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.426525] ata2: SATA max UD=
MA/133 abar m2048@0xf4505000 port 0xf4505180 irq 46
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.426527] ata3: DUMMY
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.426529] ata4: DUMMY
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.458819] tg3 0000:07:00.0 =
eth0: Tigon3 [partno(BCM95906) rev c002] (PCI Express) MAC address 00:23:=
5a:12:3a:dd
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.458825] tg3 0000:07:00.0 =
eth0: attached PHY is 5906 (10/100Base-TX Ethernet) (WireSpeed[0], EEE[0]=
)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.458828] tg3 0000:07:00.0 =
eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.458831] tg3 0000:07:00.0 =
eth0: dma_rwctrl[76180000] dma_mask[64-bit]
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.472094] firewire_ohci 000=
0:08:06.0: added OHCI v1.10 device as card 0, 8 IR + 8 IT contexts, quirk=
s 0x10
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.472163] sdhci-pci 0000:08=
:06.2: SDHCI controller found [1217:7120] (rev 2)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.472215] mmc0: no vqmmc re=
gulator found
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.472217] mmc0: no vmmc reg=
ulator found
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.508072] mmc0: SDHCI contr=
oller on PCI [0000:08:06.2] using DMA
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.521229] usb 2-1: New USB =
device found, idVendor=3D4971, idProduct=3D1014
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.521234] usb 2-1: New USB =
device strings: Mfr=3D10, Product=3D11, SerialNumber=3D3
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.521237] usb 2-1: Product:=
 Touro Mobile 3.0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.521239] usb 2-1: Manufact=
urer: HGST
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.521242] usb 2-1: SerialNu=
mber: 21001212240B00002588
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.632030] usb 2-3: new high=
-speed USB device number 3 using ehci-pci
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.744072] ata1: SATA link u=
p 3.0 Gbps (SStatus 123 SControl 300)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.744572] ata1.00: ATA-8: S=
T9250827AS, 3.AAC, max UDMA/133
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.744576] ata1.00: 48839716=
8 sectors, multi 16: LBA48 NCQ (depth 31/32)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.745013] ata1.00: configur=
ed for UDMA/133
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.745175] scsi 0:0:0:0: Dir=
ect-Access     ATA      ST9250827AS      3.AA PQ: 0 ANSI: 5
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.745347] sd 0:0:0:0: Attac=
hed scsi generic sg0 type 0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.745462] sd 0:0:0:0: [sda]=
 488397168 512-byte logical blocks: (250 GB/232 GiB)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.745518] sd 0:0:0:0: [sda]=
 Write Protect is off
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.745522] sd 0:0:0:0: [sda]=
 Mode Sense: 00 3a 00 00
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.745577] sd 0:0:0:0: [sda]=
 Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.889572]  sda: sda1 sda2 s=
da3
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.889972] sd 0:0:0:0: [sda]=
 Attached SCSI disk
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.920242] usb 2-3: New USB =
device found, idVendor=3D04f2, idProduct=3Db090
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.920246] usb 2-3: New USB =
device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.920249] usb 2-3: Product:=
 Lenovo EasyCamera
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.920252] usb 2-3: Manufact=
urer: Vimicro Corp.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    1.972156] firewire_core 000=
0:08:06.0: created device fw0: GUID 00023f91c940464a, S400
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.064078] ata2: SATA link u=
p 1.5 Gbps (SStatus 113 SControl 300)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.076850] ata2.00: ATAPI: O=
ptiarc DVD RW AD-7560S, S805, max UDMA/100
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.090550] ata2.00: configur=
ed for UDMA/100
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.092241] scsi 1:0:0:0: CD-=
ROM            Optiarc  DVD RW AD-7560S  S805 PQ: 0 ANSI: 5
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.095928] sr0: scsi3-mmc dr=
ive: 24x/24x writer dvd-ram cd/rw xa/form2 cdda tray
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.095931] cdrom: Uniform CD=
-ROM driver Revision: 3.20
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.096075] sr 1:0:0:0: Attac=
hed scsi CD-ROM sr0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.096170] sr 1:0:0:0: Attac=
hed scsi generic sg1 type 5
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.185784] Initializing USB =
Mass Storage driver...
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.186003] scsi4 : usb-stora=
ge 2-1:1.0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.186674] usbcore: register=
ed new interface driver usb-storage
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.186677] USB Mass Storage =
support registered.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.420040] usb 3-1: new full=
-speed USB device number 2 using uhci_hcd
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.592498] usb 3-1: New USB =
device found, idVendor=3D0a5c, idProduct=3D2150
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.592503] usb 3-1: New USB =
device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.592506] usb 3-1: Product:=
 BCM2046 Bluetooth Device
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.592509] usb 3-1: Manufact=
urer: Broadcom Corp
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.592511] usb 3-1: SerialNu=
mber: 002269F966C1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.832054] usb 8-1: new full=
-speed USB device number 2 using uhci_hcd
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.990870] usb 8-1: New USB =
device found, idVendor=3D24ae, idProduct=3D2000
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.990875] usb 8-1: New USB =
device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.990878] usb 8-1: Product:=
 RAPOO 2.4G Wireless Device
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    2.990880] usb 8-1: Manufact=
urer: RAPOO
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.021930] usbcore: register=
ed new interface driver usbhid
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.021934] usbhid: USB HID c=
ore driver
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.032162] input: RAPOO RAPO=
O 2.4G Wireless Device as /devices/pci0000:00/0000:00:1d.2/usb8/8-1/8-1:1=
=2E0/input/input5
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.032438] hid-generic 0003:=
24AE:2000.0001: input,hidraw0: USB HID v1.01 Keyboard [RAPOO RAPOO 2.4G W=
ireless Device] on usb-0000:00:1d.2-1/input0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.034215] input: RAPOO RAPO=
O 2.4G Wireless Device as /devices/pci0000:00/0000:00:1d.2/usb8/8-1/8-1:1=
=2E1/input/input6
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.035933] hid-generic 0003:=
24AE:2000.0002: input,hiddev0,hidraw1: USB HID v1.01 Mouse [RAPOO RAPOO 2=
=2E4G Wireless Device] on usb-0000:00:1d.2-1/input1
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.184685] scsi 4:0:0:0: Dir=
ect-Access     HGST                      0000 PQ: 0 ANSI: 6
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.185339] sd 4:0:0:0: Attac=
hed scsi generic sg2 type 0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.185902] sd 4:0:0:0: [sdb]=
 1953523708 512-byte logical blocks: (1.00 TB/931 GiB)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.186900] sd 4:0:0:0: [sdb]=
 Write Protect is off
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.186904] sd 4:0:0:0: [sdb]=
 Mode Sense: 27 00 00 00
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.187901] sd 4:0:0:0: [sdb]=
 No Caching mode page present
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.187904] sd 4:0:0:0: [sdb]=
 Assuming drive cache: write through
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.190653] sd 4:0:0:0: [sdb]=
 No Caching mode page present
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.190658] sd 4:0:0:0: [sdb]=
 Assuming drive cache: write through
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.251691]  sdb: sdb1 sdb2 s=
db3 < sdb5 >
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.254923] sd 4:0:0:0: [sdb]=
 No Caching mode page present
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.254928] sd 4:0:0:0: [sdb]=
 Assuming drive cache: write through
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    3.254932] sd 4:0:0:0: [sdb]=
 Attached SCSI disk
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [    4.035449] EXT4-fs (sdb2): m=
ounted filesystem with ordered data mode. Opts: (null)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   16.708982] Adding 3999740k s=
wap on /dev/sdb5.  Priority:-1 extents:1 across:3999740k=20
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   17.041590] IPv6: ADDRCONF(NE=
TDEV_UP): eth0: link is not ready
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   17.185011] EXT4-fs (sdb2): r=
e-mounted. Opts: errors=3Dremount-ro
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   17.696622] lp: driver loaded=
 but no devices found
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.247663] FS-Cache: Loaded
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.274265] RPC: Registered n=
amed UNIX socket transport module.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.274270] RPC: Registered u=
dp transport module.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.274271] RPC: Registered t=
cp transport module.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.274273] RPC: Registered t=
cp NFSv4.1 backchannel transport module.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.342074] FS-Cache: Netfs '=
nfs' registered for caching
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.496242] acpi device:02: r=
egistered as cooling_device2
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.496331] ACPI: Video Devic=
e [VGA] (multi-head: yes  rom: no  post: no)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.497366] input: Video Bus =
as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:00/LNXVIDEO:00/inpu=
t/input7
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.540775] ene_ir: chip is 0=
x3926 - kbver =3D 0x00, rev =3D 0xc0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.540779] ene_ir: PLL freq =
=3D 1406
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.540781] ene_ir: KB3926C d=
etected
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.540793] ene_ir: Firmware =
regs: c0 00
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.540795] ene_ir: Hardware =
features:
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.540796] ene_ir: * Uses GP=
IO 40 for IR demodulated input
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.556392] Installing knfsd =
(copyright (C) 1996 okir-pn4DOG8n3UYbFoVRYvo4fw@public.gmane.org).
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.640027] Registered IR key=
map rc-rc6-mce
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.640688] input: ENE eHome =
Infrared Remote Receiver as /devices/virtual/rc/rc0/input8
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.641028] rc0: ENE eHome In=
frared Remote Receiver as /devices/virtual/rc/rc0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.648325] ene_ir: driver ha=
s been successfully loaded
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.705481] IR NEC protocol h=
andler initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.769261] input: Ideapad ex=
tra buttons as /devices/platform/ideapad/input/input9
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.793045] IR RC5(x) protoco=
l handler initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.870946] IR RC6 protocol h=
andler initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.892477] ACPI Warning: 0x0=
0000428-0x0000042f SystemIO conflicts with Region \PMIO 1 (20121018/utadd=
ress-251)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.892486] ACPI: If an ACPI =
driver is available for this device, you should use it instead of the nat=
ive driver
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.892490] ACPI Warning: 0x0=
00011b0-0x000011bf SystemIO conflicts with Region \GPIO 1 (20121018/utadd=
ress-251)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.892495] ACPI: If an ACPI =
driver is available for this device, you should use it instead of the nat=
ive driver
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.892497] ACPI Warning: 0x0=
0001180-0x000011af SystemIO conflicts with Region \GPIO 1 (20121018/utadd=
ress-251)
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.892501] ACPI: If an ACPI =
driver is available for this device, you should use it instead of the nat=
ive driver
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.892503] lpc_ich: Resource=
 conflict(s) found affecting gpio_ich
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   18.937671] IR JVC protocol h=
andler initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.067553] IR Sony protocol =
handler initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.068055] Bluetooth: Core v=
er 2.16
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.068635] NET: Registered p=
rotocol family 31
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.068639] Bluetooth: HCI de=
vice and connection manager initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.068649] Bluetooth: HCI so=
cket layer initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.068653] Bluetooth: L2CAP =
socket layer initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.068665] Bluetooth: SCO so=
cket layer initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.147835] IR SANYO protocol=
 handler initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.248483] input: MCE IR Key=
board/Mouse (ene_ir) as /devices/virtual/input/input10
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.248603] IR MCE Keyboard/m=
ouse protocol handler initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.271436] cfg80211: Calling=
 CRDA to update world regulatory domain
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.356786] usbcore: register=
ed new interface driver btusb
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.405585] lirc_dev: IR Remo=
te Control driver registered, major 247=20
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.457310] lib80211: common =
routines for IEEE802.11 drivers
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.457315] lib80211_crypt: r=
egistered algorithm 'NULL'
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.487545] rc rc0: lirc_dev:=
 driver ir-lirc-codec (ene_ir) registered at minor =3D 0
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.487549] IR LIRC bridge ha=
ndler initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.500334] [drm] Initialized=
 drm 1.1.0 20060810
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   19.686744] microcode: CPU0 s=
ig=3D0x1067a, pf=3D0x80, revision=3D0xa07
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   20.054674] Bluetooth: RFCOMM=
 TTY layer initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   20.054689] Bluetooth: RFCOMM=
 socket layer initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   20.054692] Bluetooth: RFCOMM=
 ver 1.11
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   20.187325] Bluetooth: BNEP (=
Ethernet Emulation) ver 1.3
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   20.187329] Bluetooth: BNEP f=
ilters: protocol multicast
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   20.187338] Bluetooth: BNEP s=
ocket layer initialized
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   20.236078] wl: module licens=
e 'MIXED/Proprietary' taints kernel.
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   20.384923] wmi: Mapper loade=
d
Apr 27 23:02:15 wjx-IdeaPad-Y430 kernel: [   20.416737] INFO @wl_cfg80211=
_attach : Registered CFG80211 phy
Apr 27 23:02:16 wjx-IdeaPad-Y430 kernel: [   20.523478] lib80211_crypt: r=
egistered algorithm 'TKIP'
Apr 27 23:02:16 wjx-IdeaPad-Y430 kernel: [   20.524958] Linux video captu=
re interface: v2.00
Apr 27 23:02:16 wjx-IdeaPad-Y430 kernel: [   20.858510] eth1: Broadcom BC=
M4315 802.11 Hybrid Wireless Controller 6.20.155.1 (r326264)
Apr 27 23:02:16 wjx-IdeaPad-Y430 kernel: [   21.207277] ppdev: user-space=
 parallel port driver
Apr 27 23:02:16 wjx-IdeaPad-Y430 kernel: [   21.344708] uvcvideo: Found U=
VC 1.00 device Lenovo EasyCamera (04f2:b090)
Apr 27 23:02:16 wjx-IdeaPad-Y430 kernel: [   21.356795] input: Lenovo Eas=
yCamera as /devices/pci0000:00/0000:00:1d.7/usb2/2-3/2-3:1.0/input/input1=
1
Apr 27 23:02:16 wjx-IdeaPad-Y430 kernel: [   21.357625] usbcore: register=
ed new interface driver uvcvideo
Apr 27 23:02:16 wjx-IdeaPad-Y430 kernel: [   21.357628] USB Video Class d=
river (1.1.1)
Apr 27 23:02:16 wjx-IdeaPad-Y430 kernel: [   21.380243] nouveau  [  DEVIC=
E][0000:01:00.0] BOOT0  : 0x298480a2
Apr 27 23:02:16 wjx-IdeaPad-Y430 kernel: [   21.380248] nouveau  [  DEVIC=
E][0000:01:00.0] Chipset: G98 (NV98)
Apr 27 23:02:16 wjx-IdeaPad-Y430 kernel: [   21.380251] nouveau  [  DEVIC=
E][0000:01:00.0] Family : NV50
Apr 27 23:02:16 wjx-IdeaPad-Y430 kernel: [   21.382155] nouveau  [   VBIO=
S][0000:01:00.0] checking PRAMIN for image...
Apr 27 23:02:17 wjx-IdeaPad-Y430 kernel: [   21.486956] nouveau  [   VBIO=
S][0000:01:00.0] ... appears to be valid
Apr 27 23:02:17 wjx-IdeaPad-Y430 kernel: [   21.486961] nouveau  [   VBIO=
S][0000:01:00.0] using image from PRAMIN
Apr 27 23:02:17 wjx-IdeaPad-Y430 kernel: [   21.487144] nouveau  [   VBIO=
S][0000:01:00.0] BIT signature found
Apr 27 23:02:17 wjx-IdeaPad-Y430 kernel: [   21.487148] nouveau  [   VBIO=
S][0000:01:00.0] version 62.98.38.00.08
Apr 27 23:02:17 wjx-IdeaPad-Y430 kernel: [   21.496269] microcode: CPU1 s=
ig=3D0x1067a, pf=3D0x80, revision=3D0xa07
Apr 27 23:02:17 wjx-IdeaPad-Y430 kernel: [   22.169468] cfg80211: World r=
egulatory domain updated:
Apr 27 23:02:17 wjx-IdeaPad-Y430 kernel: [   22.169473] cfg80211:   (star=
t_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
Apr 27 23:02:17 wjx-IdeaPad-Y430 kernel: [   22.169476] cfg80211:   (2402=
000 KHz - 2472000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Apr 27 23:02:17 wjx-IdeaPad-Y430 kernel: [   22.169478] cfg80211:   (2457=
000 KHz - 2482000 KHz @ 20000 KHz), (300 mBi, 2000 mBm)
Apr 27 23:02:17 wjx-IdeaPad-Y430 kernel: [   22.169481] cfg80211:   (2474=
000 KHz - 2494000 KHz @ 20000 KHz), (300 mBi, 2000 mBm)
Apr 27 23:02:17 wjx-IdeaPad-Y430 kernel: [   22.169483] cfg80211:   (5170=
000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Apr 27 23:02:17 wjx-IdeaPad-Y430 kernel: [   22.169485] cfg80211:   (5735=
000 KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Apr 27 23:02:18 wjx-IdeaPad-Y430 kernel: [   23.320294] microcode: Microc=
ode Update Driver: v2.00 <tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org>, Peter Oruba
Apr 27 23:02:22 wjx-IdeaPad-Y430 kernel: [   26.691921] type=3D1400 audit=
(1367074942.230:2): apparmor=3D"STATUS" operation=3D"profile_load" name=3D=
"/sbin/dhclient" pid=3D809 comm=3D"apparmor_parser"
Apr 27 23:02:22 wjx-IdeaPad-Y430 kernel: [   26.692695] type=3D1400 audit=
(1367074942.234:3): apparmor=3D"STATUS" operation=3D"profile_load" name=3D=
"/usr/lib/NetworkManager/nm-dhcp-client.action" pid=3D809 comm=3D"apparmo=
r_parser"
Apr 27 23:02:22 wjx-IdeaPad-Y430 kernel: [   26.692978] type=3D1400 audit=
(1367074942.234:4): apparmor=3D"STATUS" operation=3D"profile_load" name=3D=
"/usr/lib/connman/scripts/dhclient-script" pid=3D809 comm=3D"apparmor_par=
ser"
Apr 27 23:02:22 wjx-IdeaPad-Y430 kernel: [   26.757590] snd_hda_intel 000=
0:00:1b.0: irq 47 for MSI/MSI-X
Apr 27 23:02:22 wjx-IdeaPad-Y430 kernel: [   26.944146] input: HDA Intel =
HDMI/DP,pcm=3D3 Phantom as /devices/pci0000:00/0000:00:1b.0/sound/card0/i=
nput12
Apr 27 23:02:24 wjx-IdeaPad-Y430 kernel: [   28.733759] type=3D1400 audit=
(1367074944.274:5): apparmor=3D"STATUS" operation=3D"profile_load" name=3D=
"/usr/lib/cups/backend/cups-pdf" pid=3D808 comm=3D"apparmor_parser"
Apr 27 23:02:24 wjx-IdeaPad-Y430 kernel: [   28.745408] type=3D1400 audit=
(1367074944.286:6): apparmor=3D"STATUS" operation=3D"profile_load" name=3D=
"/usr/sbin/cupsd" pid=3D808 comm=3D"apparmor_parser"
Apr 27 23:02:26 wjx-IdeaPad-Y430 kernel: [   30.728572] type=3D1400 audit=
(1367074946.270:7): apparmor=3D"STATUS" operation=3D"profile_load" name=3D=
"/usr/lib/lightdm/lightdm/lightdm-guest-session-wrapper" pid=3D927 comm=3D=
"apparmor_parser"
Apr 27 23:02:26 wjx-IdeaPad-Y430 kernel: [   30.728992] type=3D1400 audit=
(1367074946.270:8): apparmor=3D"STATUS" operation=3D"profile_load" name=3D=
"/usr/lib/lightdm/lightdm/lightdm-guest-session-wrapper//chromium_browser=
" pid=3D927 comm=3D"apparmor_parser"
Apr 27 23:02:26 wjx-IdeaPad-Y430 kernel: [   30.731372] type=3D1400 audit=
(1367074946.270:9): apparmor=3D"STATUS" operation=3D"profile_load" name=3D=
"/usr/lib/i386-linux-gnu/lightdm-remote-session-freerdp/freerdp-session-w=
rapper" pid=3D928 comm=3D"apparmor_parser"
Apr 27 23:02:26 wjx-IdeaPad-Y430 kernel: [   30.731796] type=3D1400 audit=
(1367074946.270:10): apparmor=3D"STATUS" operation=3D"profile_load" name=3D=
"/usr/lib/i386-linux-gnu/lightdm-remote-session-freerdp/freerdp-session-w=
rapper//chromium_browser" pid=3D928 comm=3D"apparmor_parser"
Apr 27 23:02:26 wjx-IdeaPad-Y430 kernel: [   30.786318] type=3D1400 audit=
(1367074946.326:11): apparmor=3D"STATUS" operation=3D"profile_replace" na=
me=3D"/sbin/dhclient" pid=3D930 comm=3D"apparmor_parser"
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004] BUG: soft lockup =
- CPU#1 stuck for 23s! [modprobe:559]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004] Modules linked in=
: snd_hda_codec_conexant snd_hda_codec_hdmi snd_hda_intel snd_hda_codec s=
nd_hwdep(F) snd_pcm(F) snd_page_alloc(F) coretemp snd_seq_midi(F) snd_seq=
_midi_event(F) snd_rawmidi(F) snd_seq(F) nouveau(+) uvcvideo parport_pc(F=
) snd_seq_device(F) ppdev(F) snd_timer(F) videobuf2_vmalloc videobuf2_mem=
ops videobuf2_core joydev(F) mxm_wmi lib80211_crypt_tkip videodev wmi wl(=
POF) bnep rfcomm ttm microcode(F) drm_kms_helper snd(F) drm ir_lirc_codec=
 lib80211 lirc_dev btusb i2c_algo_bit cfg80211 ir_mce_kbd_decoder soundco=
re(F) psmouse(F) ir_sanyo_decoder ir_sony_decoder bluetooth serio_raw(F) =
ir_jvc_decoder lpc_ich ir_rc6_decoder ir_rc5_decoder ideapad_laptop ir_ne=
c_decoder rc_rc6_mce sparse_keymap nfsd(F) ene_ir rc_core video(F) auth_r=
pcgss(F) nfs_acl(F) nfs(F) lockd(F) binfmt_misc(F) sunrpc(F) mac_hid fsca=
che(F) lp(F) parport(F) hid_generic usbhid hid usb_storage(F) sdhci_pci f=
irewire_ohci firewire_core sdhci tg3 ahci(F) libahci(F) crc_itu_t(F) ptp =
pps_core
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004] Pid: 559, comm: m=
odprobe Tainted: PF          O 3.8.0-19-generic #29-Ubuntu LENOVO 20005  =
             /JITR1
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004] EIP: 0060:[<f8b43=
fb7>] EFLAGS: 00000286 CPU: 1
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004] EIP is at nv_prin=
tk_+0x37/0x190 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004] EAX: 10000001 EBX=
: f1ffcf60 ECX: 00000000 EDX: f8b48c70
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004] ESI: f8be25cd EDI=
: f8be2645 EBP: f183f9f0 ESP: f183f878
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  DS: 007b ES: 007=
b FS: 00d8 GS: 00e0 SS: 0068
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004] CR0: 8005003b CR2=
: b778a000 CR3: 318a7000 CR4: 000407f0
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004] DR0: 00000000 DR1=
: 00000000 DR2: 00000000 DR3: 00000000
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004] DR6: ffff0ff0 DR7=
: 00000400
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004] Process modprobe =
(pid: 559, ti=3Df183e000 task=3Df1892670 task.ti=3Df183e000)
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004] Stack:
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  ffffffff 000162b=
9 00000005 f7beb100 00000082 f1892670 f183f8a0 c108734f
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  ffff0614 0000000=
0 f183f8a0 f183f8a0 c1623740 f183f8c4 c107b43a 435f73b0
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  0000000a 0000000=
0 00000001 f183f8d8 c105af31 00000001 00000000 f7be6980
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004] Call Trace:
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c108734f>] ? t=
rigger_load_balance+0x4f/0x1c0
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c107b43a>] ? s=
cheduler_tick+0xda/0x100
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c105af31>] ? u=
pdate_process_times+0x61/0x70
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c12edec0>] ? t=
imerqueue_add+0x50/0xb0
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c1099fb3>] ? k=
time_get+0x63/0x100
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c10319bb>] ? l=
apic_next_event+0x1b/0x20
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b467f0>] ? b=
it_entry+0xc0/0xf0 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b4b115>] ? i=
nit_table+0x25/0xb0 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c107033d>] ? h=
rtimer_interrupt+0x16d/0x280
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b4b2b4>] ? i=
nit_table_+0x114/0x190 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b4c689>] ? i=
nit_condition_met+0x119/0x140 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b48cc1>] ini=
t_not+0x51/0x70 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b4ee27>] nvb=
ios_exec+0x37/0xd0 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b4f2ca>] nvb=
ios_init+0x8a/0x130 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b44470>] ? n=
ouveau_subdev_fini+0x70/0x80 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b548df>] nou=
veau_devinit_init+0x1f/0x30 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b5617b>] nv5=
0_devinit_init+0x3b/0x180 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b44583>] ? n=
ouveau_subdev_create_+0x93/0xc0 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b44470>] ? n=
ouveau_subdev_fini+0x70/0x80 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b434b0>] ? n=
ouveau_object_inc+0x40/0x1b0 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b4352c>] nou=
veau_object_inc+0xbc/0x1b0 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b52a42>] nou=
veau_devobj_ctor+0x1e2/0x710 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c1515c01>] ? p=
ci_conf1_read+0x71/0x110
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b42e5b>] nou=
veau_object_ctor+0x3b/0xe0 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8b43787>] nou=
veau_object_new+0x167/0x220 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8bab780>] nou=
veau_drm_load+0x180/0x590 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8966c0b>] ? d=
rm_sysfs_device_add+0x7b/0xb0 [drm]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f89655eb>] drm=
_get_pci_dev+0x13b/0x2a0 [drm]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c1312c17>] ? _=
_pci_set_master+0x27/0x80
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8babe2e>] nou=
veau_drm_probe+0x29e/0x310 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c1316bf9>] pci=
_device_probe+0x79/0xb0
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c13e24ec>] dri=
ver_probe_device+0x5c/0x1e0
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c1316b53>] ? p=
ci_match_device+0xb3/0xc0
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c13e2701>] __d=
river_attach+0x91/0xa0
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c13e2670>] ? d=
river_probe_device+0x1e0/0x1e0
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c13e0cd2>] bus=
_for_each_dev+0x42/0x80
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c13e20ae>] dri=
ver_attach+0x1e/0x20
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c13e2670>] ? d=
river_probe_device+0x1e0/0x1e0
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c13e1d3f>] bus=
_add_driver+0x16f/0x250
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c13169f0>] ? p=
ci_device_shutdown+0x50/0x50
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c13e2cea>] dri=
ver_register+0x6a/0x160
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8a01000>] ? 0=
xf8a00fff
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c1315de3>] __p=
ci_register_driver+0x33/0x40
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f896584d>] drm=
_pci_init+0xfd/0x110 [drm]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8a01000>] ? 0=
xf8a00fff
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8a01048>] nou=
veau_drm_init+0x48/0x1000 [nouveau]
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c1003132>] do_=
one_initcall+0x112/0x160
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c1609795>] ? s=
et_section_ro_nx+0x54/0x59
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c10ac963>] loa=
d_module+0x1163/0x1880
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8a27000>] ? 0=
xf8a26fff
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c10ad0f8>] sys=
_init_module+0x78/0xb0
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<f8a27000>] ? 0=
xf8a26fff
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004]  [<c161988d>] sys=
enter_do_call+0x12/0x28
Apr 27 23:02:39 wjx-IdeaPad-Y430 kernel: [   44.084004] Code: 89 75 f8 89=
 7d fc 66 66 66 66 90 8b 5d 08 8b 75 0c 8b 7d 14 65 a1 14 00 00 00 89 45 =
f0 31 c0 85 db 0f 84 2d 01 00 00 8b 03 8b 00 <a9> 00 00 00 20 0f 85 d6 00=
 00 00 8b 53 08 b9 bf 23 be f8 85 d2
Apr 27 23:02:45 wjx-IdeaPad-Y430 kernel: [   50.245562] tg3 0000:07:00.0:=
 irq 48 for MSI/MSI-X
Apr 27 23:02:45 wjx-IdeaPad-Y430 kernel: [   50.358058] IPv6: ADDRCONF(NE=
TDEV_UP): eth0: link is not ready
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084003] BUG: soft lockup =
- CPU#1 stuck for 23s! [modprobe:559]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] Modules linked in=
: snd_hda_codec_conexant snd_hda_codec_hdmi snd_hda_intel snd_hda_codec s=
nd_hwdep(F) snd_pcm(F) snd_page_alloc(F) coretemp snd_seq_midi(F) snd_seq=
_midi_event(F) snd_rawmidi(F) snd_seq(F) nouveau(+) uvcvideo parport_pc(F=
) snd_seq_device(F) ppdev(F) snd_timer(F) videobuf2_vmalloc videobuf2_mem=
ops videobuf2_core joydev(F) mxm_wmi lib80211_crypt_tkip videodev wmi wl(=
POF) bnep rfcomm ttm microcode(F) drm_kms_helper snd(F) drm ir_lirc_codec=
 lib80211 lirc_dev btusb i2c_algo_bit cfg80211 ir_mce_kbd_decoder soundco=
re(F) psmouse(F) ir_sanyo_decoder ir_sony_decoder bluetooth serio_raw(F) =
ir_jvc_decoder lpc_ich ir_rc6_decoder ir_rc5_decoder ideapad_laptop ir_ne=
c_decoder rc_rc6_mce sparse_keymap nfsd(F) ene_ir rc_core video(F) auth_r=
pcgss(F) nfs_acl(F) nfs(F) lockd(F) binfmt_misc(F) sunrpc(F) mac_hid fsca=
che(F) lp(F) parport(F) hid_generic usbhid hid usb_storage(F) sdhci_pci f=
irewire_ohci firewire_core sdhci tg3 ahci(F) libahci(F) crc_itu_t(F) ptp =
pps_core
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] Pid: 559, comm: m=
odprobe Tainted: PF          O 3.8.0-19-generic #29-Ubuntu LENOVO 20005  =
             /JITR1
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] EIP: 0060:[<f8b45=
8e8>] EFLAGS: 00000212 CPU: 1
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] EIP is at nouveau=
_bios_rd08+0x8/0x10 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] EAX: f1ffcf60 EBX=
: f1ffcf60 ECX: 00000000 EDX: 00000215
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] ESI: 00000218 EDI=
: f8beb2e0 EBP: f183f914 ESP: f183f914
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  DS: 007b ES: 007=
b FS: 00d8 GS: 00e0 SS: 0068
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] CR0: 8005003b CR2=
: b778a000 CR3: 318a7000 CR4: 000407f0
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] DR0: 00000000 DR1=
: 00000000 DR2: 00000000 DR3: 00000000
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] DR6: ffff0ff0 DR7=
: 00000400
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] Process modprobe =
(pid: 559, ti=3Df183e000 task=3Df1892670 task.ti=3Df183e000)
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] Stack:
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  f183f930 f8b4678=
5 f183f94a 12490003 f1ffcf60 f183f98a 00000006 f183f95c
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  f8b4b115 c107033=
d c7966ca3 00000010 f7be6878 014987df 02c90012 f183fa6c
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  f1ffcf60 0000000=
6 f183f998 f8b4b1c8 c84d87df 00000010 c88a8d00 00000046
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] Call Trace:
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b46785>] bit=
_entry+0x55/0xf0 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b4b115>] ini=
t_table+0x25/0xb0 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c107033d>] ? h=
rtimer_interrupt+0x16d/0x280
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b4b1c8>] ini=
t_table_+0x28/0x190 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b4c59f>] ini=
t_condition_met+0x2f/0x140 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b4c72e>] ini=
t_condition+0x7e/0xa0 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b4ee27>] nvb=
ios_exec+0x37/0xd0 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b4f2ca>] nvb=
ios_init+0x8a/0x130 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b44470>] ? n=
ouveau_subdev_fini+0x70/0x80 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b548df>] nou=
veau_devinit_init+0x1f/0x30 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b5617b>] nv5=
0_devinit_init+0x3b/0x180 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b44583>] ? n=
ouveau_subdev_create_+0x93/0xc0 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b44470>] ? n=
ouveau_subdev_fini+0x70/0x80 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b434b0>] ? n=
ouveau_object_inc+0x40/0x1b0 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b4352c>] nou=
veau_object_inc+0xbc/0x1b0 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b52a42>] nou=
veau_devobj_ctor+0x1e2/0x710 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c1515c01>] ? p=
ci_conf1_read+0x71/0x110
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b42e5b>] nou=
veau_object_ctor+0x3b/0xe0 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8b43787>] nou=
veau_object_new+0x167/0x220 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8bab780>] nou=
veau_drm_load+0x180/0x590 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8966c0b>] ? d=
rm_sysfs_device_add+0x7b/0xb0 [drm]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f89655eb>] drm=
_get_pci_dev+0x13b/0x2a0 [drm]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c1312c17>] ? _=
_pci_set_master+0x27/0x80
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8babe2e>] nou=
veau_drm_probe+0x29e/0x310 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c1316bf9>] pci=
_device_probe+0x79/0xb0
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c13e24ec>] dri=
ver_probe_device+0x5c/0x1e0
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c1316b53>] ? p=
ci_match_device+0xb3/0xc0
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c13e2701>] __d=
river_attach+0x91/0xa0
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c13e2670>] ? d=
river_probe_device+0x1e0/0x1e0
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c13e0cd2>] bus=
_for_each_dev+0x42/0x80
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c13e20ae>] dri=
ver_attach+0x1e/0x20
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c13e2670>] ? d=
river_probe_device+0x1e0/0x1e0
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c13e1d3f>] bus=
_add_driver+0x16f/0x250
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c13169f0>] ? p=
ci_device_shutdown+0x50/0x50
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c13e2cea>] dri=
ver_register+0x6a/0x160
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8a01000>] ? 0=
xf8a00fff
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c1315de3>] __p=
ci_register_driver+0x33/0x40
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f896584d>] drm=
_pci_init+0xfd/0x110 [drm]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8a01000>] ? 0=
xf8a00fff
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8a01048>] nou=
veau_drm_init+0x48/0x1000 [nouveau]
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c1003132>] do_=
one_initcall+0x112/0x160
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c1609795>] ? s=
et_section_ro_nx+0x54/0x59
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c10ac963>] loa=
d_module+0x1163/0x1880
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8a27000>] ? 0=
xf8a26fff
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c10ad0f8>] sys=
_init_module+0x78/0xb0
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<f8a27000>] ? 0=
xf8a26fff
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004]  [<c161988d>] sys=
enter_do_call+0x12/0x28
Apr 27 23:03:07 wjx-IdeaPad-Y430 kernel: [   72.084004] Code: c0 e8 9d 17=
 7b c8 89 f0 8b 5d f4 8b 75 f8 8b 7d fc 89 ec 5d c3 66 90 66 90 66 90 66 =
90 66 90 66 90 66 90 55 89 e5 66 66 66 66 90 <03> 50 40 5d 0f b6 02 c3 55=
 89 e5 66 66 66 66 90 03 50 40 5d 0f
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532003] INFO: rcu_sched s=
elf-detected stall on CPU { 1}  (t=3D15000 jiffies g=3D758 c=3D757 q=3D21=
308)
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004] sending NMI to al=
l CPUs:
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004] NMI backtrace for=
 cpu 1
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004] Pid: 559, comm: m=
odprobe Tainted: PF          O 3.8.0-19-generic #29-Ubuntu LENOVO 20005  =
             /JITR1
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004] EIP: 0060:[<c12f0=
e04>] EFLAGS: 00000807 CPU: 1
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004] EIP is at delay_t=
sc+0x14/0x70
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004] EAX: 001e3244 EBX=
: 001e3244 ECX: fffff000 EDX: 001e3243
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004] ESI: 0000533c EDI=
: 00000001 EBP: f183f784 ESP: f183f778
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  DS: 007b ES: 007=
b FS: 00d8 GS: 00e0 SS: 0068
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004] CR0: 8005003b CR2=
: b778a000 CR3: 318a7000 CR4: 000407f0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004] DR0: 00000000 DR1=
: 00000000 DR2: 00000000 DR3: 00000000
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004] DR6: ffff0ff0 DR7=
: 00000400
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004] Process modprobe =
(pid: 559, ti=3Df183e000 task=3Df1892670 task.ti=3Df183e000)
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004] Stack:
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  00002710 0000533=
c c18a3580 f183f78c c12f0d8b f183f79c c103345a c17b1056
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  f7be6be0 f183f7e=
0 c10d637b c17c1bb0 00003a98 000002f6 000002f5 0000533c
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  c19c6100 f183f7f=
4 c107edfa c18fdf70 f7be6be0 00000001 c18a3580 f1892670
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004] Call Trace:
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c12f0d8b>] __c=
onst_udelay+0x1b/0x20
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c103345a>] arc=
h_trigger_all_cpu_backtrace+0x5a/0x80
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c10d637b>] rcu=
_pending+0x25b/0x4f0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c107edfa>] ? a=
ccount_process_tick+0x5a/0x200
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c10d8191>] rcu=
_check_callbacks+0x81/0xf0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c105af0b>] upd=
ate_process_times+0x3b/0x70
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c10a1bcd>] tic=
k_sched_handle.isra.10+0x2d/0x70
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c10a1db0>] tic=
k_sched_timer+0x40/0x70
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c106f470>] ? _=
_remove_hrtimer+0x40/0xa0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c106f630>] __r=
un_hrtimer+0x70/0x190
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c10a1d70>] ? t=
ick_sched_do_timer+0x30/0x30
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c10702bf>] hrt=
imer_interrupt+0xef/0x280
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c161a089>] smp=
_apic_timer_interrupt+0x59/0x8d
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c10319bb>] ? l=
apic_next_event+0x1b/0x20
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c1612bd0>] api=
c_timer_interrupt+0x34/0x3c
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c10a007b>] ? a=
larm_handle_timer+0x1b/0x80
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b46785>] ? b=
it_entry+0x55/0xf0 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b4b115>] ini=
t_table+0x25/0xb0 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b4b1c8>] ini=
t_table_+0x28/0x190 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c1612bd0>] ? a=
pic_timer_interrupt+0x34/0x3c
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b4c59f>] ini=
t_condition_met+0x2f/0x140 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b4c72e>] ini=
t_condition+0x7e/0xa0 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b4ee27>] nvb=
ios_exec+0x37/0xd0 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b4f2ca>] nvb=
ios_init+0x8a/0x130 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b44470>] ? n=
ouveau_subdev_fini+0x70/0x80 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b548df>] nou=
veau_devinit_init+0x1f/0x30 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b5617b>] nv5=
0_devinit_init+0x3b/0x180 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b44583>] ? n=
ouveau_subdev_create_+0x93/0xc0 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b44470>] ? n=
ouveau_subdev_fini+0x70/0x80 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b434b0>] ? n=
ouveau_object_inc+0x40/0x1b0 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b4352c>] nou=
veau_object_inc+0xbc/0x1b0 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b52a42>] nou=
veau_devobj_ctor+0x1e2/0x710 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c1515c01>] ? p=
ci_conf1_read+0x71/0x110
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b42e5b>] nou=
veau_object_ctor+0x3b/0xe0 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8b43787>] nou=
veau_object_new+0x167/0x220 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8bab780>] nou=
veau_drm_load+0x180/0x590 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8966c0b>] ? d=
rm_sysfs_device_add+0x7b/0xb0 [drm]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f89655eb>] drm=
_get_pci_dev+0x13b/0x2a0 [drm]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c1312c17>] ? _=
_pci_set_master+0x27/0x80
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8babe2e>] nou=
veau_drm_probe+0x29e/0x310 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c1316bf9>] pci=
_device_probe+0x79/0xb0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c13e24ec>] dri=
ver_probe_device+0x5c/0x1e0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c1316b53>] ? p=
ci_match_device+0xb3/0xc0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c13e2701>] __d=
river_attach+0x91/0xa0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c13e2670>] ? d=
river_probe_device+0x1e0/0x1e0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c13e0cd2>] bus=
_for_each_dev+0x42/0x80
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c13e20ae>] dri=
ver_attach+0x1e/0x20
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c13e2670>] ? d=
river_probe_device+0x1e0/0x1e0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c13e1d3f>] bus=
_add_driver+0x16f/0x250
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c13169f0>] ? p=
ci_device_shutdown+0x50/0x50
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c13e2cea>] dri=
ver_register+0x6a/0x160
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8a01000>] ? 0=
xf8a00fff
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c1315de3>] __p=
ci_register_driver+0x33/0x40
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f896584d>] drm=
_pci_init+0xfd/0x110 [drm]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8a01000>] ? 0=
xf8a00fff
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8a01048>] nou=
veau_drm_init+0x48/0x1000 [nouveau]
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c1003132>] do_=
one_initcall+0x112/0x160
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c1609795>] ? s=
et_section_ro_nx+0x54/0x59
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c10ac963>] loa=
d_module+0x1163/0x1880
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8a27000>] ? 0=
xf8a26fff
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c10ad0f8>] sys=
_init_module+0x78/0xb0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<f8a27000>] ? 0=
xf8a26fff
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004]  [<c161988d>] sys=
enter_do_call+0x12/0x28
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532004] Code: e2 8d 42 01=
 ff 15 80 38 8c c1 5d c3 8d 74 26 00 8d bc 27 00 00 00 00 55 89 e5 57 56 =
53 66 66 66 66 90 89 c3 64 8b 3d 10 f0 9b c1 <8d> 76 00 0f ae e8 0f 31 66=
 66 66 90 89 c6 eb 11 8d 74 26 00 f3
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056] NMI backtrace for=
 cpu 0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056] Pid: 0, comm: swa=
pper/0 Tainted: PF          O 3.8.0-19-generic #29-Ubuntu LENOVO 20005   =
            /JITR1
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056] EIP: 0060:[<c1030=
a38>] EFLAGS: 00000046 CPU: 0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056] EIP is at mwait_i=
dle_with_hints+0x58/0x80
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056] EAX: 00000020 EBX=
: c187c000 ECX: 00000001 EDX: 00000000
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056] ESI: 00000020 EDI=
: 00000001 EBP: c187df10 ESP: c187df04
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  DS: 007b ES: 007=
b FS: 00d8 GS: 00e0 SS: 0068
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056] CR0: 8005003b CR2=
: b7759000 CR3: 31827000 CR4: 000407f0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056] DR0: 00000000 DR1=
: 00000000 DR2: 00000000 DR3: 00000000
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056] DR6: ffff0ff0 DR7=
: 00000400
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056] Process swapper/0=
 (pid: 0, ti=3Dc187c000 task=3Dc18891e0 task.ti=3Dc187c000)
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056] Stack:
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  f4e2a494 0000000=
2 f4e2a400 c187df18 c1030a8c c187df20 c1377760 c187df34
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  c1377838 c18c868=
c 00000098 00000002 c187df44 c14e6d05 c18c868c f4ed7e00
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  c187df60 c14e75e=
e fb73928a 00000012 f4ed7e00 00f42000 00000000 c187df6c
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056] Call Trace:
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  [<c1030a8c>] acp=
i_processor_ffh_cstate_enter+0x2c/0x30
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  [<c1377760>] acp=
i_idle_do_entry+0x10/0x2b
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  [<c1377838>] acp=
i_idle_enter_simple+0x70/0xa3
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  [<c14e6d05>] cpu=
idle_enter+0x15/0x20
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  [<c14e75ee>] cpu=
idle_wrap_enter+0x2e/0x90
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  [<c14e7662>] cpu=
idle_enter_tk+0x12/0x20
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  [<c14e6cf0>] ? n=
force2_target+0x1b0/0x1b0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  [<c14e7211>] cpu=
idle_enter_state+0x11/0x50
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  [<c14e72db>] cpu=
idle_idle_call+0x8b/0x200
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  [<c1018fca>] cpu=
_idle+0xaa/0xe0
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  [<c15f946d>] res=
t_init+0x5d/0x60
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  [<c19039cd>] sta=
rt_kernel+0x377/0x37d
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  [<c19034e2>] ? d=
o_early_param+0x80/0x80
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056]  [<c1903303>] i38=
6_start_kernel+0xa6/0xad
Apr 27 23:03:17 wjx-IdeaPad-Y430 kernel: [   81.532056] Code: a9 00 00 00=
 02 75 34 31 d2 8d 43 08 89 d1 0f 01 c8 0f ae f0 66 90 89 e0 25 00 e0 ff =
ff 8b 40 08 a8 08 75 07 89 f0 89 f9 0f 01 c9 <8b> 5d f4 8b 75 f8 8b 7d fc=
 89 ec 5d c3 8d 76 00 0f ae 7b 08 89
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] BUG: soft lockup =
- CPU#1 stuck for 22s! [modprobe:559]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] Modules linked in=
: snd_hda_codec_conexant snd_hda_codec_hdmi snd_hda_intel snd_hda_codec s=
nd_hwdep(F) snd_pcm(F) snd_page_alloc(F) coretemp snd_seq_midi(F) snd_seq=
_midi_event(F) snd_rawmidi(F) snd_seq(F) nouveau(+) uvcvideo parport_pc(F=
) snd_seq_device(F) ppdev(F) snd_timer(F) videobuf2_vmalloc videobuf2_mem=
ops videobuf2_core joydev(F) mxm_wmi lib80211_crypt_tkip videodev wmi wl(=
POF) bnep rfcomm ttm microcode(F) drm_kms_helper snd(F) drm ir_lirc_codec=
 lib80211 lirc_dev btusb i2c_algo_bit cfg80211 ir_mce_kbd_decoder soundco=
re(F) psmouse(F) ir_sanyo_decoder ir_sony_decoder bluetooth serio_raw(F) =
ir_jvc_decoder lpc_ich ir_rc6_decoder ir_rc5_decoder ideapad_laptop ir_ne=
c_decoder rc_rc6_mce sparse_keymap nfsd(F) ene_ir rc_core video(F) auth_r=
pcgss(F) nfs_acl(F) nfs(F) lockd(F) binfmt_misc(F) sunrpc(F) mac_hid fsca=
che(F) lp(F) parport(F) hid_generic usbhid hid usb_storage(F) sdhci_pci f=
irewire_ohci firewire_core sdhci tg3 ahci(F) libahci(F) crc_itu_t(F) ptp =
pps_core
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] Pid: 559, comm: m=
odprobe Tainted: PF          O 3.8.0-19-generic #29-Ubuntu LENOVO 20005  =
             /JITR1
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] EIP: 0060:[<f8b43=
f80>] EFLAGS: 00000293 CPU: 1
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] EIP is at nv_prin=
tk_+0x0/0x190 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] EAX: f1ffcf60 EBX=
: f183fa6c ECX: 00000000 EDX: f1b3d974
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] ESI: 00000010 EDI=
: f183fa90 EBP: f183fa14 ESP: f183f9ec
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  DS: 007b ES: 007=
b FS: 00d8 GS: 00e0 SS: 0068
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] CR0: 8005003b CR2=
: b778a000 CR3: 318a7000 CR4: 000407f0
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] DR0: 00000000 DR1=
: 00000000 DR2: 00000000 DR3: 00000000
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] DR6: ffff0ff0 DR7=
: 00000400
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] Process modprobe =
(pid: 559, ti=3Df183e000 task=3Df1892670 task.ti=3Df183e000)
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] Stack:
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  f8b4c720 f1ffcf6=
0 f8be25cd 00000005 f8be27d2 0000d973 00000020 00000010
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  f183fa6c f8beb2e=
0 f183fa40 f8b4ee27 00000000 00000000 00000000 00000000
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  00000000 0000000=
0 00000000 00000000 f1ffcf60 f183fa9c f8b4f2ca f183fa9e
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] Call Trace:
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8b4c720>] ? i=
nit_condition+0x70/0xa0 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8b4ee27>] nvb=
ios_exec+0x37/0xd0 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8b4f2ca>] nvb=
ios_init+0x8a/0x130 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8b44470>] ? n=
ouveau_subdev_fini+0x70/0x80 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8b548df>] nou=
veau_devinit_init+0x1f/0x30 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8b5617b>] nv5=
0_devinit_init+0x3b/0x180 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8b44583>] ? n=
ouveau_subdev_create_+0x93/0xc0 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8b44470>] ? n=
ouveau_subdev_fini+0x70/0x80 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8b434b0>] ? n=
ouveau_object_inc+0x40/0x1b0 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8b4352c>] nou=
veau_object_inc+0xbc/0x1b0 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8b52a42>] nou=
veau_devobj_ctor+0x1e2/0x710 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c1515c01>] ? p=
ci_conf1_read+0x71/0x110
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8b42e5b>] nou=
veau_object_ctor+0x3b/0xe0 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8b43787>] nou=
veau_object_new+0x167/0x220 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8bab780>] nou=
veau_drm_load+0x180/0x590 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8966c0b>] ? d=
rm_sysfs_device_add+0x7b/0xb0 [drm]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f89655eb>] drm=
_get_pci_dev+0x13b/0x2a0 [drm]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c1312c17>] ? _=
_pci_set_master+0x27/0x80
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8babe2e>] nou=
veau_drm_probe+0x29e/0x310 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c1316bf9>] pci=
_device_probe+0x79/0xb0
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c13e24ec>] dri=
ver_probe_device+0x5c/0x1e0
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c1316b53>] ? p=
ci_match_device+0xb3/0xc0
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c13e2701>] __d=
river_attach+0x91/0xa0
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c13e2670>] ? d=
river_probe_device+0x1e0/0x1e0
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c13e0cd2>] bus=
_for_each_dev+0x42/0x80
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c13e20ae>] dri=
ver_attach+0x1e/0x20
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c13e2670>] ? d=
river_probe_device+0x1e0/0x1e0
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c13e1d3f>] bus=
_add_driver+0x16f/0x250
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c13169f0>] ? p=
ci_device_shutdown+0x50/0x50
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c13e2cea>] dri=
ver_register+0x6a/0x160
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8a01000>] ? 0=
xf8a00fff
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c1315de3>] __p=
ci_register_driver+0x33/0x40
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f896584d>] drm=
_pci_init+0xfd/0x110 [drm]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8a01000>] ? 0=
xf8a00fff
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8a01048>] nou=
veau_drm_init+0x48/0x1000 [nouveau]
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c1003132>] do_=
one_initcall+0x112/0x160
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c1609795>] ? s=
et_section_ro_nx+0x54/0x59
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c10ac963>] loa=
d_module+0x1163/0x1880
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8a27000>] ? 0=
xf8a26fff
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c10ad0f8>] sys=
_init_module+0x78/0xb0
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<f8a27000>] ? 0=
xf8a26fff
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004]  [<c161988d>] sys=
enter_do_call+0x12/0x28
Apr 27 23:03:43 wjx-IdeaPad-Y430 kernel: [  108.084004] Code: 85 c0 75 ef=
 89 d8 e8 80 f0 ff ff 5b 5d c3 8d b6 00 00 00 00 8d bc 27 00 00 00 00 55 =
89 e5 66 66 66 66 90 e8 b3 ff ff ff 5d c3 90 <55> 89 e5 81 ec 78 01 00 00=
 89 5d f4 89 75 f8 89 7d fc 66 66 66
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005] BUG: soft lockup =
- CPU#1 stuck for 22s! [modprobe:559]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005] Modules linked in=
: snd_hda_codec_conexant snd_hda_codec_hdmi snd_hda_intel snd_hda_codec s=
nd_hwdep(F) snd_pcm(F) snd_page_alloc(F) coretemp snd_seq_midi(F) snd_seq=
_midi_event(F) snd_rawmidi(F) snd_seq(F) nouveau(+) uvcvideo parport_pc(F=
) snd_seq_device(F) ppdev(F) snd_timer(F) videobuf2_vmalloc videobuf2_mem=
ops videobuf2_core joydev(F) mxm_wmi lib80211_crypt_tkip videodev wmi wl(=
POF) bnep rfcomm ttm microcode(F) drm_kms_helper snd(F) drm ir_lirc_codec=
 lib80211 lirc_dev btusb i2c_algo_bit cfg80211 ir_mce_kbd_decoder soundco=
re(F) psmouse(F) ir_sanyo_decoder ir_sony_decoder bluetooth serio_raw(F) =
ir_jvc_decoder lpc_ich ir_rc6_decoder ir_rc5_decoder ideapad_laptop ir_ne=
c_decoder rc_rc6_mce sparse_keymap nfsd(F) ene_ir rc_core video(F) auth_r=
pcgss(F) nfs_acl(F) nfs(F) lockd(F) binfmt_misc(F) sunrpc(F) mac_hid fsca=
che(F) lp(F) parport(F) hid_generic usbhid hid usb_storage(F) sdhci_pci f=
irewire_ohci firewire_core sdhci tg3 ahci(F) libahci(F) crc_itu_t(F) ptp =
pps_core
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005] Pid: 559, comm: m=
odprobe Tainted: PF          O 3.8.0-19-generic #29-Ubuntu LENOVO 20005  =
             /JITR1
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005] EIP: 0060:[<f8b43=
f80>] EFLAGS: 00000293 CPU: 1
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005] EIP is at nv_prin=
tk_+0x0/0x190 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005] EAX: f1ffcf60 EBX=
: f183fa6c ECX: 00000000 EDX: 00000000
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005] ESI: 00000064 EDI=
: 00000064 EBP: f183fa14 ESP: f183f9e8
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  DS: 007b ES: 007=
b FS: 00d8 GS: 00e0 SS: 0068
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005] CR0: 8005003b CR2=
: b778a000 CR3: 318a7000 CR4: 000407f0
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005] DR0: 00000000 DR1=
: 00000000 DR2: 00000000 DR3: 00000000
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005] DR6: ffff0ff0 DR7=
: 00000400
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005] Process modprobe =
(pid: 559, ti=3Df183e000 task=3Df1892670 task.ti=3Df183e000)
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005] Stack:
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  f8b4a1d5 f1ffcf6=
0 f8be25cd 00000005 f8be26db 0000d9b7 00000020 00000064
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  f183fa6c f8beb2e=
0 f183fa90 f183fa40 f8b4ee27 00000000 00000000 00000000
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  00000000 0000000=
0 00000000 00000000 00000000 f1ffcf60 f183fa9c f8b4f2ca
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005] Call Trace:
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8b4a1d5>] ? i=
nit_time+0x75/0xf0 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8b4ee27>] nvb=
ios_exec+0x37/0xd0 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8b4f2ca>] nvb=
ios_init+0x8a/0x130 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8b44470>] ? n=
ouveau_subdev_fini+0x70/0x80 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8b548df>] nou=
veau_devinit_init+0x1f/0x30 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8b5617b>] nv5=
0_devinit_init+0x3b/0x180 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8b44583>] ? n=
ouveau_subdev_create_+0x93/0xc0 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8b44470>] ? n=
ouveau_subdev_fini+0x70/0x80 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8b434b0>] ? n=
ouveau_object_inc+0x40/0x1b0 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8b4352c>] nou=
veau_object_inc+0xbc/0x1b0 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8b52a42>] nou=
veau_devobj_ctor+0x1e2/0x710 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c1515c01>] ? p=
ci_conf1_read+0x71/0x110
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8b42e5b>] nou=
veau_object_ctor+0x3b/0xe0 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8b43787>] nou=
veau_object_new+0x167/0x220 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8bab780>] nou=
veau_drm_load+0x180/0x590 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8966c0b>] ? d=
rm_sysfs_device_add+0x7b/0xb0 [drm]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f89655eb>] drm=
_get_pci_dev+0x13b/0x2a0 [drm]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c1312c17>] ? _=
_pci_set_master+0x27/0x80
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8babe2e>] nou=
veau_drm_probe+0x29e/0x310 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c1316bf9>] pci=
_device_probe+0x79/0xb0
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c13e24ec>] dri=
ver_probe_device+0x5c/0x1e0
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c1316b53>] ? p=
ci_match_device+0xb3/0xc0
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c13e2701>] __d=
river_attach+0x91/0xa0
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c13e2670>] ? d=
river_probe_device+0x1e0/0x1e0
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c13e0cd2>] bus=
_for_each_dev+0x42/0x80
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c13e20ae>] dri=
ver_attach+0x1e/0x20
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c13e2670>] ? d=
river_probe_device+0x1e0/0x1e0
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c13e1d3f>] bus=
_add_driver+0x16f/0x250
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c13169f0>] ? p=
ci_device_shutdown+0x50/0x50
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c13e2cea>] dri=
ver_register+0x6a/0x160
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8a01000>] ? 0=
xf8a00fff
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c1315de3>] __p=
ci_register_driver+0x33/0x40
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f896584d>] drm=
_pci_init+0xfd/0x110 [drm]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8a01000>] ? 0=
xf8a00fff
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8a01048>] nou=
veau_drm_init+0x48/0x1000 [nouveau]
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c1003132>] do_=
one_initcall+0x112/0x160
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c1609795>] ? s=
et_section_ro_nx+0x54/0x59
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c10ac963>] loa=
d_module+0x1163/0x1880
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8a27000>] ? 0=
xf8a26fff
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c10ad0f8>] sys=
_init_module+0x78/0xb0
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<f8a27000>] ? 0=
xf8a26fff
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005]  [<c161988d>] sys=
enter_do_call+0x12/0x28
Apr 27 23:04:11 wjx-IdeaPad-Y430 kernel: [  136.084005] Code: 85 c0 75 ef=
 89 d8 e8 80 f0 ff ff 5b 5d c3 8d b6 00 00 00 00 8d bc 27 00 00 00 00 55 =
89 e5 66 66 66 66 90 e8 b3 ff ff ff 5d c3 90 <55> 89 e5 81 ec 78 01 00 00=
 89 5d f4 89 75 f8 89 7d fc 66 66 66
Apr 27 23:04:14 wjx-IdeaPad-Y430 kernel: [  138.555970] vesafb: mode is 6=
40x480x32, linelength=3D2560, pages=3D0
Apr 27 23:04:14 wjx-IdeaPad-Y430 kernel: [  138.555974] vesafb: scrolling=
: redraw
Apr 27 23:04:14 wjx-IdeaPad-Y430 kernel: [  138.555977] vesafb: Truecolor=
: size=3D8:8:8:8, shift=3D24:16:8:0
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004] BUG: soft lockup =
- CPU#1 stuck for 22s! [modprobe:559]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004] Modules linked in=
: vesafb(F+) snd_hda_codec_conexant snd_hda_codec_hdmi snd_hda_intel snd_=
hda_codec snd_hwdep(F) snd_pcm(F) snd_page_alloc(F) coretemp snd_seq_midi=
(F) snd_seq_midi_event(F) snd_rawmidi(F) snd_seq(F) nouveau(+) uvcvideo p=
arport_pc(F) snd_seq_device(F) ppdev(F) snd_timer(F) videobuf2_vmalloc vi=
deobuf2_memops videobuf2_core joydev(F) mxm_wmi lib80211_crypt_tkip video=
dev wmi wl(POF) bnep rfcomm ttm microcode(F) drm_kms_helper snd(F) drm ir=
_lirc_codec lib80211 lirc_dev btusb i2c_algo_bit cfg80211 ir_mce_kbd_deco=
der soundcore(F) psmouse(F) ir_sanyo_decoder ir_sony_decoder bluetooth se=
rio_raw(F) ir_jvc_decoder lpc_ich ir_rc6_decoder ir_rc5_decoder ideapad_l=
aptop ir_nec_decoder rc_rc6_mce sparse_keymap nfsd(F) ene_ir rc_core vide=
o(F) auth_rpcgss(F) nfs_acl(F) nfs(F) lockd(F) binfmt_misc(F) sunrpc(F) m=
ac_hid fscache(F) lp(F) parport(F) hid_generic usbhid hid usb_storage(F) =
sdhci_pci firewire_ohci firewire_core sdhci tg3 ahci(F) libahci(F) crc_it=
u_t(F) ptp pps_
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: core
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004] Pid: 559, comm: m=
odprobe Tainted: PF          O 3.8.0-19-generic #29-Ubuntu LENOVO 20005  =
             /JITR1
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004] EIP: 0060:[<f8b4c=
c2e>] EFLAGS: 00000212 CPU: 1
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004] EIP is at init_ma=
sk+0x2e/0x260 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004] EAX: f1ffcf60 EBX=
: 0000e820 ECX: f1ffcf60 EDX: f1e67400
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004] ESI: f183fa6c EDI=
: 00000000 EBP: f183f9d4 ESP: f183f9a8
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  DS: 007b ES: 007=
b FS: 00d8 GS: 00e0 SS: 0068
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004] CR0: 8005003b CR2=
: b778a000 CR3: 318a7000 CR4: 000407f0
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004] DR0: 00000000 DR1=
: 00000000 DR2: 00000000 DR3: 00000000
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004] DR6: ffff0ff0 DR7=
: 00000400
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004] Process modprobe =
(pid: 559, ti=3Df183e000 task=3Df1892670 task.ti=3Df183e000)
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004] Stack:
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  00000005 f8be806=
8 0000d975 00000020 00000010 00004080 00010000 a6fa895c
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  f183fa6c 8000000=
0 ffffffff f183fa14 f8b4d1da 80000000 f8be25cd 00000005
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  f8be8204 0000d98=
3 00000020 0000e820 ffffffff 80000000 f8beb2e0 0000e820
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004] Call Trace:
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8b4d1da>] ini=
t_nv_reg+0xca/0xe0 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8b4ee27>] nvb=
ios_exec+0x37/0xd0 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8b4f2ca>] nvb=
ios_init+0x8a/0x130 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8b44470>] ? n=
ouveau_subdev_fini+0x70/0x80 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8b548df>] nou=
veau_devinit_init+0x1f/0x30 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8b5617b>] nv5=
0_devinit_init+0x3b/0x180 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8b44583>] ? n=
ouveau_subdev_create_+0x93/0xc0 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8b44470>] ? n=
ouveau_subdev_fini+0x70/0x80 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8b434b0>] ? n=
ouveau_object_inc+0x40/0x1b0 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8b4352c>] nou=
veau_object_inc+0xbc/0x1b0 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8b52a42>] nou=
veau_devobj_ctor+0x1e2/0x710 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c1515c01>] ? p=
ci_conf1_read+0x71/0x110
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8b42e5b>] nou=
veau_object_ctor+0x3b/0xe0 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8b43787>] nou=
veau_object_new+0x167/0x220 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8bab780>] nou=
veau_drm_load+0x180/0x590 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8966c0b>] ? d=
rm_sysfs_device_add+0x7b/0xb0 [drm]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f89655eb>] drm=
_get_pci_dev+0x13b/0x2a0 [drm]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c1312c17>] ? _=
_pci_set_master+0x27/0x80
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8babe2e>] nou=
veau_drm_probe+0x29e/0x310 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c1316bf9>] pci=
_device_probe+0x79/0xb0
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c13e24ec>] dri=
ver_probe_device+0x5c/0x1e0
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c1316b53>] ? p=
ci_match_device+0xb3/0xc0
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c13e2701>] __d=
river_attach+0x91/0xa0
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c13e2670>] ? d=
river_probe_device+0x1e0/0x1e0
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c13e0cd2>] bus=
_for_each_dev+0x42/0x80
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c13e20ae>] dri=
ver_attach+0x1e/0x20
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c13e2670>] ? d=
river_probe_device+0x1e0/0x1e0
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c13e1d3f>] bus=
_add_driver+0x16f/0x250
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c13169f0>] ? p=
ci_device_shutdown+0x50/0x50
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c13e2cea>] dri=
ver_register+0x6a/0x160
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8a01000>] ? 0=
xf8a00fff
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c1315de3>] __p=
ci_register_driver+0x33/0x40
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f896584d>] drm=
_pci_init+0xfd/0x110 [drm]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8a01000>] ? 0=
xf8a00fff
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8a01048>] nou=
veau_drm_init+0x48/0x1000 [nouveau]
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c1003132>] do_=
one_initcall+0x112/0x160
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c1609795>] ? s=
et_section_ro_nx+0x54/0x59
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c10ac963>] loa=
d_module+0x1163/0x1880
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8a27000>] ? 0=
xf8a26fff
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c10ad0f8>] sys=
_init_module+0x78/0xb0
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<f8a27000>] ? 0=
xf8a26fff
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004]  [<c161988d>] sys=
enter_do_call+0x12/0x28
Apr 27 23:04:39 wjx-IdeaPad-Y430 kernel: [  164.084004] Code: 57 56 53 83=
 ec 20 66 66 66 66 90 89 cf 8b 48 04 89 c6 89 d3 83 e3 fc 8b 41 08 85 c0 =
0f 44 c1 8b 50 04 85 d2 0f 44 d0 83 7a 60 4f <76> 14 85 db 0f 88 10 01 00=
 00 f7 c3 00 00 00 40 0f 85 ac 00 00

--------------000009040202090904000506
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------000009040202090904000506--
