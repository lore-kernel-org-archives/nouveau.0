From: "support\.intranet" <support.intranet-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org>
Subject: Multicard problem on NV50
Date: Fri, 28 May 2010 16:02:16 +0200
Message-ID: <L34UZS$A71374D2FB50E89514C723C9E18081B9@libero.it>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="_=__=_XaM3_.1275055336.2A.167770.42.3641.52.42.007.1275559720"
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
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--_=__=_XaM3_.1275055336.2A.167770.42.3641.52.42.007.1275559720
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi everyone. I'm trying nouveau on my dual 285GTX setup. The first card w=
orks fine, fast and smooth. But starting everything more than basic icewm=
 (and sometimes even it doesn't work) on the second one either freezes th=
e system or restarts xorg.
I'm attaching dmesg, Xorg.0.log and xorg.conf
Thanks for any help
Alberto Mattea

--_=__=_XaM3_.1275055336.2A.167770.42.3641.52.42.007.1275559720
Content-Type: text/plain;
	name="=?iso-8859-1?Q?dmesg?="
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="=?iso-8859-1?Q?dmesg?="

[    0.000000] Initializing cgroup subsys cpuset=0A[    0.000000] Initial=
izing cgroup subsys cpu=0A[    0.000000] Linux version 2.6.34-996-generic=
 (root@zinc) (gcc version 4.2.3 (Ubuntu 4.2.3-2ubuntu7)) #201005111216 SM=
P Tue May 11 11:19:48 UTC 2010=0A[    0.000000] Command line: BOOT_IMAGE=3D=
/boot/vmlinuz-2.6.34-996-generic root=3DUUID=3D3eff4e64-f5d9-40ee-a3b2-ed=
ad269e2316 ro quiet splash=0A[    0.000000] BIOS-provided physical RAM ma=
p:=0A[    0.000000]  BIOS-e820: 0000000000000000 - 000000000009c400 (usab=
le)=0A[    0.000000]  BIOS-e820: 000000000009c400 - 00000000000a0000 (res=
erved)=0A[    0.000000]  BIOS-e820: 00000000000f0000 - 0000000000100000 (=
reserved)=0A[    0.000000]  BIOS-e820: 0000000000100000 - 00000000bfee000=
0 (usable)=0A[    0.000000]  BIOS-e820: 00000000bfee0000 - 00000000bfee30=
00 (ACPI NVS)=0A[    0.000000]  BIOS-e820: 00000000bfee3000 - 00000000bfe=
f0000 (ACPI data)=0A[    0.000000]  BIOS-e820: 00000000bfef0000 - 0000000=
0bff00000 (reserved)=0A[    0.000000]  BIOS-e820: 00000000f0000000 - 0000=
0000f4000000 (reserved)=0A[    0.000000]  BIOS-e820: 00000000fec00000 - 0=
000000100000000 (reserved)=0A[    0.000000]  BIOS-e820: 0000000100000000 =
- 0000000240000000 (usable)=0A[    0.000000] NX (Execute Disable) protect=
ion: active=0A[    0.000000] DMI 2.4 present.=0A[    0.000000] Phoenix BI=
OS detected: BIOS may corrupt low RAM, working around it.=0A[    0.000000=
] e820 update range: 0000000000000000 - 0000000000010000 (usable) =3D=3D>=
 (reserved)=0A[    0.000000] e820 update range: 0000000000000000 - 000000=
0000001000 (usable) =3D=3D> (reserved)=0A[    0.000000] e820 remove range=
: 00000000000a0000 - 0000000000100000 (usable)=0A[    0.000000] No AGP br=
idge found=0A[    0.000000] last_pfn =3D 0x240000 max_arch_pfn =3D 0x4000=
00000=0A[    0.000000] MTRR default type: uncachable=0A[    0.000000] MTR=
R fixed ranges enabled:=0A[    0.000000]   00000-9FFFF write-back=0A[    =
0.000000]   A0000-BFFFF uncachable=0A[    0.000000]   C0000-C7FFF write-p=
rotect=0A[    0.000000]   C8000-FFFFF uncachable=0A[    0.000000] MTRR va=
riable ranges enabled:=0A[    0.000000]   0 base 000000000000 mask FFFF80=
000000 write-back=0A[    0.000000]   1 base 000080000000 mask FFFFC000000=
0 write-back=0A[    0.000000]   2 base 0000BFF00000 mask FFFFFFF00000 unc=
achable=0A[    0.000000]   3 base 000100000000 mask FFFF00000000 write-ba=
ck=0A[    0.000000]   4 base 000200000000 mask FFFFC0000000 write-back=0A=
[    0.000000]   5 disabled=0A[    0.000000]   6 disabled=0A[    0.000000=
]   7 disabled=0A[    0.000000] TOM2: 0000000240000000 aka 9216M=0A[    0=
.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106=
=0A[    0.000000] e820 update range: 00000000bff00000 - 0000000100000000 =
(usable) =3D=3D> (reserved)=0A[    0.000000] last_pfn =3D 0xbfee0 max_arc=
h_pfn =3D 0x400000000=0A[    0.000000] Scanning 0 areas for low memory co=
rruption=0A[    0.000000] modified physical RAM map:=0A[    0.000000]  mo=
dified: 0000000000000000 - 0000000000010000 (reserved)=0A[    0.000000]  =
modified: 0000000000010000 - 000000000009c400 (usable)=0A[    0.000000]  =
modified: 000000000009c400 - 00000000000a0000 (reserved)=0A[    0.000000]=
  modified: 00000000000f0000 - 0000000000100000 (reserved)=0A[    0.00000=
0]  modified: 0000000000100000 - 00000000bfee0000 (usable)=0A[    0.00000=
0]  modified: 00000000bfee0000 - 00000000bfee3000 (ACPI NVS)=0A[    0.000=
000]  modified: 00000000bfee3000 - 00000000bfef0000 (ACPI data)=0A[    0.=
000000]  modified: 00000000bfef0000 - 00000000bff00000 (reserved)=0A[    =
0.000000]  modified: 00000000f0000000 - 00000000f4000000 (reserved)=0A[  =
  0.000000]  modified: 00000000fec00000 - 0000000100000000 (reserved)=0A[=
    0.000000]  modified: 0000000100000000 - 0000000240000000 (usable)=0A[=
    0.000000] initial memory mapped : 0 - 20000000=0A[    0.000000] found=
 SMP MP-table at [ffff8800000f6000] f6000=0A[    0.000000] Using GB pages=
 for direct mapping=0A[    0.000000] init_memory_mapping: 000000000000000=
0-00000000bfee0000=0A[    0.000000]  0000000000 - 0080000000 page 1G=0A[ =
   0.000000]  0080000000 - 00bfe00000 page 2M=0A[    0.000000]  00bfe0000=
0 - 00bfee0000 page 4k=0A[    0.000000] kernel direct mapping tables up t=
o bfee0000 @ 16000-19000=0A[    0.000000] init_memory_mapping: 0000000100=
000000-0000000240000000=0A[    0.000000]  0100000000 - 0240000000 page 1G=
=0A[    0.000000] kernel direct mapping tables up to 240000000 @ 18000-19=
000=0A[    0.000000] RAMDISK: 3771c000 - 37ff0000=0A[    0.000000] ACPI: =
RSDP 00000000000f7da0 00024 (v02 Nvidia)=0A[    0.000000] ACPI: XSDT 0000=
0000bfee3100 0004C (v01 Nvidia ASUSACPI 42302E31 AWRD 00000000)=0A[    0.=
000000] ACPI: FACP 00000000bfeeb080 000F4 (v03 Nvidia ASUSACPI 42302E31 A=
WRD 00000000)=0A[    0.000000] ACPI: DSDT 00000000bfee3280 07DAC (v01 NVI=
DIA AWRDACPI 00001000 MSFT 03000000)=0A[    0.000000] ACPI: FACS 00000000=
bfee0000 00040=0A[    0.000000] ACPI: SSDT 00000000bfeeb2c0 0088C (v01 PT=
LTD  POWERNOW 00000001  LTP 00000001)=0A[    0.000000] ACPI: HPET 0000000=
0bfeebbc0 00038 (v01 Nvidia ASUSACPI 42302E31 AWRD 00000098)=0A[    0.000=
000] ACPI: MCFG 00000000bfeebc40 0003C (v01 Nvidia ASUSACPI 42302E31 AWRD=
 00000000)=0A[    0.000000] ACPI: APIC 00000000bfeeb1c0 00098 (v01 Nvidia=
 ASUSACPI 42302E31 AWRD 00000000)=0A[    0.000000] ACPI: Local APIC addre=
ss 0xfee00000=0A[    0.000000] Scanning NUMA topology in Northbridge 24=0A=
[    0.000000] No NUMA configuration found=0A[    0.000000] Faking a node=
 at 0000000000000000-0000000240000000=0A[    0.000000] Initmem setup node=
 0 0000000000000000-0000000240000000=0A[    0.000000]   NODE_DATA [000000=
0100000000 - 0000000100004fff]=0A[    0.000000]  [ffffea0000000000-ffffea=
0007dfffff] PMD -> [ffff880100200000-ffff8801071fffff] on node 0=0A[    0=
.000000] Zone PFN ranges:=0A[    0.000000]   DMA      0x00000010 -> 0x000=
01000=0A[    0.000000]   DMA32    0x00001000 -> 0x00100000=0A[    0.00000=
0]   Normal   0x00100000 -> 0x00240000=0A[    0.000000] Movable zone star=
t PFN for each node=0A[    0.000000] early_node_map[3] active PFN ranges=0A=
[    0.000000]     0: 0x00000010 -> 0x0000009c=0A[    0.000000]     0: 0x=
00000100 -> 0x000bfee0=0A[    0.000000]     0: 0x00100000 -> 0x00240000=0A=
[    0.000000] On node 0 totalpages: 2096748=0A[    0.000000]   DMA zone:=
 56 pages used for memmap=0A[    0.000000]   DMA zone: 0 pages reserved=0A=
[    0.000000]   DMA zone: 3924 pages, LIFO batch:0=0A[    0.000000]   DM=
A32 zone: 14280 pages used for memmap=0A[    0.000000]   DMA32 zone: 7677=
68 pages, LIFO batch:31=0A[    0.000000]   Normal zone: 17920 pages used =
for memmap=0A[    0.000000]   Normal zone: 1292800 pages, LIFO batch:31=0A=
[    0.000000] ACPI: PM-Timer IO Port: 0x1008=0A[    0.000000] ACPI: Loca=
l APIC address 0xfee00000=0A[    0.000000] ACPI: LAPIC (acpi_id[0x00] lap=
ic_id[0x00] enabled)=0A[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id=
[0x01] enabled)=0A[    0.000000] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02=
] enabled)=0A[    0.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x03] ena=
bled)=0A[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1]=
)=0A[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])=0A=
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])=0A[   =
 0.000000] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])=0A[    0.0=
00000] ACPI: IOAPIC (id[0x04] address[0xfec00000] gsi_base[0])=0A[    0.0=
00000] IOAPIC[0]: apic_id 4, version 17, address 0xfec00000, GSI 0-23=0A[=
    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)=0A=
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level=
)=0A[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 14 global_irq 14 high=
 edge)=0A[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 15 global_irq 15=
 high edge)=0A[    0.000000] ACPI: IRQ0 used by override.=0A[    0.000000=
] ACPI: IRQ2 used by override.=0A[    0.000000] ACPI: IRQ9 used by overri=
de.=0A[    0.000000] ACPI: IRQ14 used by override.=0A[    0.000000] ACPI:=
 IRQ15 used by override.=0A[    0.000000] Using ACPI (MADT) for SMP confi=
guration information=0A[    0.000000] ACPI: HPET id: 0x10de8201 base: 0xf=
efff000=0A[    0.000000] SMP: Allowing 4 CPUs, 0 hotplug CPUs=0A[    0.00=
0000] nr_irqs_gsi: 24=0A[    0.000000] early_res array is doubled to 64 a=
t [18000 - 187ff]=0A[    0.000000] PM: Registered nosave memory: 00000000=
0009c000 - 000000000009d000=0A[    0.000000] PM: Registered nosave memory=
: 000000000009d000 - 00000000000a0000=0A[    0.000000] PM: Registered nos=
ave memory: 00000000000a0000 - 00000000000f0000=0A[    0.000000] PM: Regi=
stered nosave memory: 00000000000f0000 - 0000000000100000=0A[    0.000000=
] PM: Registered nosave memory: 00000000bfee0000 - 00000000bfee3000=0A[  =
  0.000000] PM: Registered nosave memory: 00000000bfee3000 - 00000000bfef=
0000=0A[    0.000000] PM: Registered nosave memory: 00000000bfef0000 - 00=
000000bff00000=0A[    0.000000] PM: Registered nosave memory: 00000000bff=
00000 - 00000000f0000000=0A[    0.000000] PM: Registered nosave memory: 0=
0000000f0000000 - 00000000f4000000=0A[    0.000000] PM: Registered nosave=
 memory: 00000000f4000000 - 00000000fec00000=0A[    0.000000] PM: Registe=
red nosave memory: 00000000fec00000 - 0000000100000000=0A[    0.000000] A=
llocating PCI resources starting at bff00000 (gap: bff00000:30100000)=0A[=
    0.000000] Booting paravirtualized kernel on bare hardware=0A[    0.00=
0000] setup_percpu: NR_CPUS:64 nr_cpumask_bits:64 nr_cpu_ids:4 nr_node_id=
s:1=0A[    0.000000] PERCPU: Embedded 30 pages/cpu @ffff880001e00000 s906=
64 r8192 d24024 u524288=0A[    0.000000] pcpu-alloc: s90664 r8192 d24024 =
u524288 alloc=3D1*2097152=0A[    0.000000] pcpu-alloc: [0] 0 1 2 3 =0A[  =
  0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total=
 pages: 2064492=0A[    0.000000] Policy zone: Normal=0A[    0.000000] Ker=
nel command line: BOOT_IMAGE=3D/boot/vmlinuz-2.6.34-996-generic root=3DUU=
ID=3D3eff4e64-f5d9-40ee-a3b2-edad269e2316 ro quiet splash=0A[    0.000000=
] PID hash table entries: 4096 (order: 3, 32768 bytes)=0A[    0.000000] C=
hecking aperture...=0A[    0.000000] No AGP bridge found=0A[    0.000000]=
 Node 0: aperture @ 20000000 size 32 MB=0A[    0.000000] Aperture pointin=
g to e820 RAM. Ignoring.=0A[    0.000000] Your BIOS doesn't leave a apert=
ure memory hole=0A[    0.000000] Please enable the IOMMU option in the BI=
OS setup=0A[    0.000000] This costs you 64 MB of RAM=0A[    0.000000] Ma=
pping aperture over 65536 KB of RAM @ 20000000=0A[    0.000000] PM: Regis=
tered nosave memory: 0000000020000000 - 0000000024000000=0A[    0.000000]=
 early_res array is doubled to 128 at [20800 - 217ff]=0A[    0.000000] Su=
btract (57 early reservations)=0A[    0.000000]   #1 [0001000000 - 0001cb=
4e14]   TEXT DATA BSS=0A[    0.000000]   #2 [003771c000 - 0037ff0000]    =
     RAMDISK=0A[    0.000000]   #3 [0001cb5000 - 0001cb515d]             =
BRK=0A[    0.000000]   #4 [00000f6010 - 0000100000]   BIOS reserved=0A[  =
  0.000000]   #5 [00000f6000 - 00000f6010]    MP-table mpf=0A[    0.00000=
0]   #6 [000009c400 - 00000f1400]   BIOS reserved=0A[    0.000000]   #7 [=
00000f1554 - 00000f6000]   BIOS reserved=0A[    0.000000]   #8 [00000f140=
0 - 00000f1554]    MP-table mpc=0A[    0.000000]   #9 [0000010000 - 00000=
12000]      TRAMPOLINE=0A[    0.000000]   #10 [0000012000 - 0000016000]  =
   ACPI WAKEUP=0A[    0.000000]   #11 [0000016000 - 0000018000]         P=
GTABLE=0A[    0.000000]   #12 [0100000000 - 0100005000]       NODE_DATA=0A=
[    0.000000]   #13 [0001cb5180 - 0001cb6180]         BOOTMEM=0A[    0.0=
00000]   #14 [00020b6180 - 00020b6780]         BOOTMEM=0A[    0.000000]  =
 #15 [0100005000 - 0100006000]         BOOTMEM=0A[    0.000000]   #16 [01=
00006000 - 0100007000]         BOOTMEM=0A[    0.000000]   #17 [0100200000=
 - 0107200000]        MEMMAP 0=0A[    0.000000]   #18 [0001cb4e40 - 0001c=
b4fc0]         BOOTMEM=0A[    0.000000]   #19 [0001cb6180 - 0001cce180]  =
       BOOTMEM=0A[    0.000000]   #20 [0001cce180 - 0001ce6180]         B=
OOTMEM=0A[    0.000000]   #21 [0001ce7000 - 0001ce8000]         BOOTMEM=0A=
[    0.000000]   #22 [0001ce6180 - 0001ce61c1]         BOOTMEM=0A[    0.0=
00000]   #23 [0001ce6200 - 0001ce6243]         BOOTMEM=0A[    0.000000]  =
 #24 [0001ce6280 - 0001ce64e8]         BOOTMEM=0A[    0.000000]   #25 [00=
01ce6500 - 0001ce6568]         BOOTMEM=0A[    0.000000]   #26 [0001ce6580=
 - 0001ce65e8]         BOOTMEM=0A[    0.000000]   #27 [0001ce6600 - 0001c=
e6668]         BOOTMEM=0A[    0.000000]   #28 [0001ce6680 - 0001ce66e8]  =
       BOOTMEM=0A[    0.000000]   #29 [0001ce6700 - 0001ce6768]         B=
OOTMEM=0A[    0.000000]   #30 [0001ce6780 - 0001ce67e8]         BOOTMEM=0A=
[    0.000000]   #31 [0001ce6800 - 0001ce6868]         BOOTMEM=0A[    0.0=
00000]   #32 [0001ce6880 - 0001ce68e8]         BOOTMEM=0A[    0.000000]  =
 #33 [0001ce6900 - 0001ce6968]         BOOTMEM=0A[    0.000000]   #34 [00=
01ce6980 - 0001ce69e8]         BOOTMEM=0A[    0.000000]   #35 [0001cb4fc0=
 - 0001cb4fe0]         BOOTMEM=0A[    0.000000]   #36 [0001ce6a00 - 0001c=
e6a20]         BOOTMEM=0A[    0.000000]   #37 [0001ce6a40 - 0001ce6aab]  =
       BOOTMEM=0A[    0.000000]   #38 [0001ce6ac0 - 0001ce6b2b]         B=
OOTMEM=0A[    0.000000]   #39 [0001e00000 - 0001e1e000]         BOOTMEM=0A=
[    0.000000]   #40 [0001e80000 - 0001e9e000]         BOOTMEM=0A[    0.0=
00000]   #41 [0001f00000 - 0001f1e000]         BOOTMEM=0A[    0.000000]  =
 #42 [0001f80000 - 0001f9e000]         BOOTMEM=0A[    0.000000]   #43 [00=
01ce6b40 - 0001ce6b48]         BOOTMEM=0A[    0.000000]   #44 [0001ce6b80=
 - 0001ce6b88]         BOOTMEM=0A[    0.000000]   #45 [0001ce6bc0 - 0001c=
e6bd0]         BOOTMEM=0A[    0.000000]   #46 [0001ce6c00 - 0001ce6c20]  =
       BOOTMEM=0A[    0.000000]   #47 [0001ce6c40 - 0001ce6d70]         B=
OOTMEM=0A[    0.000000]   #48 [0001ce6d80 - 0001ce6dd0]         BOOTMEM=0A=
[    0.000000]   #49 [0001ce6e00 - 0001ce6e50]         BOOTMEM=0A[    0.0=
00000]   #50 [0001ce8000 - 0001cf0000]         BOOTMEM=0A[    0.000000]  =
 #51 [0020000000 - 0024000000]         BOOTMEM=0A[    0.000000]   #52 [00=
01ce6e80 - 0001ce6ea0]         BOOTMEM=0A[    0.000000]   #53 [00020b7000=
 - 00060b7000]         BOOTMEM=0A[    0.000000]   #54 [0001cf0000 - 0001d=
10000]         BOOTMEM=0A[    0.000000]   #55 [0001d10000 - 0001d50000]  =
       BOOTMEM=0A[    0.000000]   #56 [0000018800 - 0000020800]         B=
OOTMEM=0A[    0.000000] Memory: 8117980k/9437184k available (5413k kernel=
 code, 1050192k absent, 269012k reserved, 5529k data, 936k init)=0A[    0=
.000000] SLUB: Genslabs=3D14, HWalign=3D64, Order=3D0-3, MinObjects=3D0, =
CPUs=3D4, Nodes=3D1=0A[    0.000000] Hierarchical RCU implementation.=0A[=
    0.000000] NR_IRQS:4352 nr_irqs:440=0A[    0.000000] Extended CMOS yea=
r: 2000=0A[    0.000000] spurious 8259A interrupt: IRQ7.=0A[    0.000000]=
 Console: colour VGA+ 80x25=0A[    0.000000] console [tty0] enabled=0A[  =
  0.000000] allocated 83886080 bytes of page_cgroup=0A[    0.000000] plea=
se try 'cgroup_disable=3Dmemory' option if you don't want memory cgroups=0A=
[    0.000000] hpet clockevent registered=0A[    0.000000] Fast TSC calib=
ration using PIT=0A[    0.000000] Detected 3615.906 MHz processor.=0A[   =
 0.020005] Calibrating delay loop (skipped), value calculated using timer=
 frequency.. 7231.80 BogoMIPS (lpj=3D36159010)=0A[    0.020023] Security =
Framework initialized=0A[    0.020029] SELinux:  Disabled at boot.=0A[   =
 0.020417] Dentry cache hash table entries: 1048576 (order: 11, 8388608 b=
ytes)=0A[    0.032671] Inode-cache hash table entries: 524288 (order: 10,=
 4194304 bytes)=0A[    0.033951] Mount-cache hash table entries: 256=0A[ =
   0.034054] Initializing cgroup subsys ns=0A[    0.034056] Initializing =
cgroup subsys cpuacct=0A[    0.034059] Initializing cgroup subsys memory=0A=
[    0.034066] Initializing cgroup subsys devices=0A[    0.034067] Initia=
lizing cgroup subsys freezer=0A[    0.034068] Initializing cgroup subsys =
net_cls=0A[    0.034086] tseg: 00bff00000=0A[    0.034087] CPU: Physical =
Processor ID: 0=0A[    0.034088] CPU: Processor Core ID: 0=0A[    0.03409=
1] mce: CPU supports 6 MCE banks=0A[    0.034099] using C1E aware idle ro=
utine=0A[    0.034100] Performance Events: AMD PMU driver.=0A[    0.03410=
4] ... version:                0=0A[    0.034105] ... bit width:         =
     48=0A[    0.034106] ... generic registers:      4=0A[    0.034107] .=
.. value mask:             0000ffffffffffff=0A[    0.034108] ... max peri=
od:             00007fffffffffff=0A[    0.034109] ... fixed-purpose event=
s:   0=0A[    0.034110] ... event mask:             000000000000000f=0A[ =
   0.035382] ACPI: Core revision 20100121=0A[    0.048024] ftrace: conver=
ting mcount calls to 0f 1f 44 00 00=0A[    0.048033] ftrace: allocating 2=
5408 entries in 100 pages=0A[    0.050060] Setting APIC routing to flat=0A=
[    0.050536] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1=0A[    0.154488] CPU0: AMD Phenom(tm) II X4 940 Processor stepping 02=0A=
[    0.160000] Booting Node   0, Processors  #1 #2 #3 Ok.=0A[    0.660005=
] Brought up 4 CPUs=0A[    0.660006] Total of 4 processors activated (289=
30.81 BogoMIPS).=0A[    0.662112] devtmpfs: initialized=0A[    0.662112] =
regulator: core version 0.5=0A[    0.662112] Time: 15:39:48  Date: 05/28/=
10=0A[    0.662112] NET: Registered protocol family 16=0A[    0.662112] n=
ode 0 link 0: io port [c000, ffff]=0A[    0.662112] TOM: 00000000c0000000=
 aka 3072M=0A[    0.662112] Fam 10h mmconf [f0000000, f00fffff]=0A[    0.=
662112] node 0 link 0: mmio [a0000, bffff]=0A[    0.662112] node 0 link 0=
: mmio [c0000000, efffffff]=0A[    0.662112] node 0 link 0: mmio [f400000=
0, fe02ffff]=0A[    0.662112] node 0 link 0: mmio [f0000000, f03fffff] =3D=
=3D> [f0100000, f03fffff]=0A[    0.662112] TOM2: 0000000240000000 aka 921=
6M=0A[    0.662112] bus: [00, 03] on node 0 link 0=0A[    0.662112] bus: =
00 index 0 [io  0x0000-0xffff]=0A[    0.662112] bus: 00 index 1 [mem 0x00=
0a0000-0x000bffff]=0A[    0.662112] bus: 00 index 2 [mem 0xc0000000-0xeff=
fffff]=0A[    0.662112] bus: 00 index 3 [mem 0xf0400000-0xffffffff]=0A[  =
  0.662112] bus: 00 index 4 [mem 0xf0100000-0xf03fffff]=0A[    0.662112] =
bus: 00 index 5 [mem 0x240000000-0xfcffffffff]=0A[    0.662112] ACPI: bus=
 type pci registered=0A[    0.662112] PCI: MMCONFIG for domain 0000 [bus =
00-3f] at [mem 0xf0000000-0xf3ffffff] (base 0xf0000000)=0A[    0.662112] =
PCI: MMCONFIG at [mem 0xf0000000-0xf3ffffff] reserved in E820=0A[    0.66=
3891] PCI: Using configuration type 1 for base access=0A[    0.664190] bi=
o: create slab <bio-0> at 0=0A[    0.664190] ACPI: EC: Look up EC in DSDT=
=0A[    0.674584] ACPI: Interpreter enabled=0A[    0.674590] ACPI: (suppo=
rts S0 S1 S3 S4 S5)=0A[    0.674613] ACPI: Using IOAPIC for interrupt rou=
ting=0A[    0.680940] ACPI: No dock devices found.=0A[    0.680944] PCI: =
Using host bridge windows from ACPI; if necessary, use "pci=3Dnocrs" and =
report a bug=0A[    0.681027] ACPI: PCI Root Bridge [PCI0] (0000:00)=0A[ =
   0.681186] pci_root PNP0A08:00: host bridge window [io  0x0000-0x0cf7]=0A=
[    0.681187] pci_root PNP0A08:00: host bridge window [io  0x0d00-0xffff=
]=0A[    0.681189] pci_root PNP0A08:00: host bridge window [mem 0x000a000=
0-0x000bffff]=0A[    0.681190] pci_root PNP0A08:00: host bridge window [m=
em 0x000c0000-0x000dffff]=0A[    0.681192] pci_root PNP0A08:00: host brid=
ge window [mem 0xbff00000-0xfebfffff]=0A[    0.681362] pci 0000:00:04.0: =
PME# supported from D0 D1 D2 D3hot D3cold=0A[    0.681364] pci 0000:00:04=
.0: PME# disabled=0A[    0.681548] pci 0000:00:09.1: reg 20: [io  0x1c00-=
0x1c3f]=0A[    0.681552] pci 0000:00:09.1: reg 24: [io  0x1c40-0x1c7f]=0A=
[    0.681571] pci 0000:00:09.1: PME# supported from D3hot D3cold=0A[    =
0.681575] pci 0000:00:09.1: PME# disabled=0A[    0.681596] pci 0000:00:0a=
.0: reg 10: [mem 0xfe02f000-0xfe02ffff]=0A[    0.681617] pci 0000:00:0a.0=
: supports D1 D2=0A[    0.681618] pci 0000:00:0a.0: PME# supported from D=
0 D1 D2 D3hot D3cold=0A[    0.681620] pci 0000:00:0a.0: PME# disabled=0A[=
    0.681635] pci 0000:00:0a.1: reg 10: [mem 0xfe02e000-0xfe02e0ff]=0A[  =
  0.681656] pci 0000:00:0a.1: supports D1 D2=0A[    0.681657] pci 0000:00=
:0a.1: PME# supported from D0 D1 D2 D3hot D3cold=0A[    0.681659] pci 000=
0:00:0a.1: PME# disabled=0A[    0.681683] pci 0000:00:0c.0: reg 20: [io  =
0xfd00-0xfd0f]=0A[    0.681707] pci 0000:00:0d.0: reg 10: [io  0x09f0-0x0=
9f7]=0A[    0.681710] pci 0000:00:0d.0: reg 14: [io  0x0bf0-0x0bf3]=0A[  =
  0.681713] pci 0000:00:0d.0: reg 18: [io  0x0970-0x0977]=0A[    0.681716=
] pci 0000:00:0d.0: reg 1c: [io  0x0b70-0x0b73]=0A[    0.681718] pci 0000=
:00:0d.0: reg 20: [io  0xf800-0xf80f]=0A[    0.681721] pci 0000:00:0d.0: =
reg 24: [mem 0xfe02d000-0xfe02dfff]=0A[    0.681749] pci 0000:00:0d.1: re=
g 10: [io  0x09e0-0x09e7]=0A[    0.681752] pci 0000:00:0d.1: reg 14: [io =
 0x0be0-0x0be3]=0A[    0.681755] pci 0000:00:0d.1: reg 18: [io  0x0960-0x=
0967]=0A[    0.681757] pci 0000:00:0d.1: reg 1c: [io  0x0b60-0x0b63]=0A[ =
   0.681760] pci 0000:00:0d.1: reg 20: [io  0xf300-0xf30f]=0A[    0.68176=
3] pci 0000:00:0d.1: reg 24: [mem 0xfe02c000-0xfe02cfff]=0A[    0.681790]=
 pci 0000:00:0d.2: reg 10: [io  0xf200-0xf207]=0A[    0.681793] pci 0000:=
00:0d.2: reg 14: [io  0xf100-0xf103]=0A[    0.681796] pci 0000:00:0d.2: r=
eg 18: [io  0xf000-0xf007]=0A[    0.681799] pci 0000:00:0d.2: reg 1c: [io=
  0xef00-0xef03]=0A[    0.681801] pci 0000:00:0d.2: reg 20: [io  0xee00-0=
xee0f]=0A[    0.681804] pci 0000:00:0d.2: reg 24: [mem 0xfe02b000-0xfe02b=
fff]=0A[    0.681861] pci 0000:00:0e.1: reg 10: [mem 0xfe024000-0xfe027ff=
f]=0A[    0.681885] pci 0000:00:0e.1: PME# supported from D3hot D3cold=0A=
[    0.681887] pci 0000:00:0e.1: PME# disabled=0A[    0.681915] pci 0000:=
00:10.0: reg 10: [mem 0xfe02a000-0xfe02afff]=0A[    0.681918] pci 0000:00=
:10.0: reg 14: [io  0xed00-0xed07]=0A[    0.681920] pci 0000:00:10.0: reg=
 18: [mem 0xfe029000-0xfe0290ff]=0A[    0.681923] pci 0000:00:10.0: reg 1=
c: [mem 0xfe028000-0xfe02800f]=0A[    0.681944] pci 0000:00:10.0: support=
s D1 D2=0A[    0.681945] pci 0000:00:10.0: PME# supported from D0 D1 D2 D=
3hot D3cold=0A[    0.681949] pci 0000:00:10.0: PME# disabled=0A[    0.681=
985] pci 0000:00:17.0: PME# supported from D0 D1 D2 D3hot D3cold=0A[    0=
.681987] pci 0000:00:17.0: PME# disabled=0A[    0.682072] pci 0000:01:00.=
0: reg 10: [mem 0xfc000000-0xfcffffff]=0A[    0.682077] pci 0000:01:00.0:=
 reg 14: [mem 0xe0000000-0xefffffff 64bit pref]=0A[    0.682082] pci 0000=
:01:00.0: reg 1c: [mem 0xfa000000-0xfbffffff 64bit]=0A[    0.682086] pci =
0000:01:00.0: reg 24: [io  0xdc00-0xdc7f]=0A[    0.682089] pci 0000:01:00=
.0: reg 30: [mem 0xfdf80000-0xfdffffff pref]=0A[    0.682108] pci 0000:00=
:04.0: PCI bridge to [bus 01-01]=0A[    0.682111] pci 0000:00:04.0:   bri=
dge window [io  0xd000-0xdfff]=0A[    0.682113] pci 0000:00:04.0:   bridg=
e window [mem 0xfa000000-0xfdffffff]=0A[    0.682115] pci 0000:00:04.0:  =
 bridge window [mem 0xe0000000-0xefffffff 64bit pref]=0A[    0.682152] pc=
i 0000:00:0e.0: PCI bridge to [bus 02-02] (subtractive decode)=0A[    0.6=
82154] pci 0000:00:0e.0:   bridge window [io  0xf000-0x0000] (disabled)=0A=
[    0.682156] pci 0000:00:0e.0:   bridge window [mem 0xfff00000-0x000fff=
ff] (disabled)=0A[    0.682158] pci 0000:00:0e.0:   bridge window [mem 0x=
fff00000-0x000fffff pref] (disabled)=0A[    0.682160] pci 0000:00:0e.0:  =
 bridge window [io  0x0000-0x0cf7] (subtractive decode)=0A[    0.682161] =
pci 0000:00:0e.0:   bridge window [io  0x0d00-0xffff] (subtractive decode=
)=0A[    0.682163] pci 0000:00:0e.0:   bridge window [mem 0x000a0000-0x00=
0bffff] (subtractive decode)=0A[    0.682164] pci 0000:00:0e.0:   bridge =
window [mem 0x000c0000-0x000dffff] (subtractive decode)=0A[    0.682166] =
pci 0000:00:0e.0:   bridge window [mem 0xbff00000-0xfebfffff] (subtractiv=
e decode)=0A[    0.682200] pci 0000:03:00.0: reg 10: [mem 0xf8000000-0xf8=
ffffff]=0A[    0.682206] pci 0000:03:00.0: reg 14: [mem 0xd0000000-0xdfff=
ffff 64bit pref]=0A[    0.682213] pci 0000:03:00.0: reg 1c: [mem 0xf60000=
00-0xf7ffffff 64bit]=0A[    0.682216] pci 0000:03:00.0: reg 24: [io  0xcc=
00-0xcc7f]=0A[    0.682220] pci 0000:03:00.0: reg 30: [mem 0x00000000-0x0=
007ffff pref]=0A[    0.682245] pci 0000:00:17.0: PCI bridge to [bus 03-03=
]=0A[    0.682247] pci 0000:00:17.0:   bridge window [io  0xc000-0xcfff]=0A=
[    0.682249] pci 0000:00:17.0:   bridge window [mem 0xf6000000-0xf9ffff=
ff]=0A[    0.682252] pci 0000:00:17.0:   bridge window [mem 0xd0000000-0x=
dfffffff 64bit pref]=0A[    0.682259] ACPI: PCI Interrupt Routing Table [=
\_SB_.PCI0._PRT]=0A[    0.682524] ACPI: PCI Interrupt Routing Table [\_SB=
_.PCI0.HUB0._PRT]=0A[    0.728372] ACPI: PCI Interrupt Link [LNK1] (IRQs =
5 7 9 10 11 14 15) *0, disabled.=0A[    0.728477] ACPI: PCI Interrupt Lin=
k [LNK2] (IRQs 5 7 9 10 11 14 15) *0, disabled.=0A[    0.728576] ACPI: PC=
I Interrupt Link [LNK3] (IRQs 5 7 9 10 11 14 15) *0, disabled.=0A[    0.7=
28675] ACPI: PCI Interrupt Link [LNK4] (IRQs 5 7 9 10 11 14 15) *0, disab=
led.=0A[    0.728779] ACPI: PCI Interrupt Link [LNK5] (IRQs 5 7 9 10 *11 =
14 15)=0A[    0.728882] ACPI: PCI Interrupt Link [LNK6] (IRQs 5 *7 9 10 1=
1 14 15)=0A[    0.728983] ACPI: PCI Interrupt Link [LNK7] (IRQs 5 7 9 10 =
11 14 15) *0, disabled.=0A[    0.729082] ACPI: PCI Interrupt Link [LNK8] =
(IRQs 5 7 9 10 11 14 15) *0, disabled.=0A[    0.729184] ACPI: PCI Interru=
pt Link [LP2P] (IRQs 5 7 9 10 11 14 15) *0, disabled.=0A[    0.729286] AC=
PI: PCI Interrupt Link [LUBA] (IRQs 5 7 9 10 11 14 15) *0, disabled.=0A[ =
   0.729388] ACPI: PCI Interrupt Link [LMAC] (IRQs *5 7 9 10 11 14 15)=0A=
[    0.729491] ACPI: PCI Interrupt Link [LMC1] (IRQs 5 7 9 10 11 14 15) *=
0, disabled.=0A[    0.729593] ACPI: PCI Interrupt Link [LAZA] (IRQs 5 7 9=
 *10 11 14 15)=0A[    0.729696] ACPI: PCI Interrupt Link [LPMU] (IRQs 5 7=
 9 10 11 14 15) *0, disabled.=0A[    0.729798] ACPI: PCI Interrupt Link [=
LSMB] (IRQs 5 7 9 10 11 14 15) *0, disabled.=0A[    0.729899] ACPI: PCI I=
nterrupt Link [LUB2] (IRQs 5 7 9 10 11 14 15) *0, disabled.=0A[    0.7300=
09] ACPI: PCI Interrupt Link [LIDE] (IRQs 5 7 9 10 11 14 15) *0, disabled=
.=0A[    0.730110] ACPI: PCI Interrupt Link [LSID] (IRQs *5 7 9 10 11 14 =
15)=0A[    0.730214] ACPI: PCI Interrupt Link [LFID] (IRQs *5 7 9 10 11 1=
4 15)=0A[    0.730316] ACPI: PCI Interrupt Link [LSA2] (IRQs *5 7 9 10 11=
 14 15)=0A[    0.730454] ACPI: PCI Interrupt Link [APC1] (IRQs 16) *0, di=
sabled.=0A[    0.730580] ACPI: PCI Interrupt Link [APC2] (IRQs 17) *0, di=
sabled.=0A[    0.730706] ACPI: PCI Interrupt Link [APC3] (IRQs 18) *0, di=
sabled.=0A[    0.730834] ACPI: PCI Interrupt Link [APC4] (IRQs 19) *0, di=
sabled.=0A[    0.730960] ACPI: PCI Interrupt Link [APC5] (IRQs 16) *0=0A[=
    0.731089] ACPI: PCI Interrupt Link [APC6] (IRQs 16) *0=0A[    0.73121=
4] ACPI: PCI Interrupt Link [APC7] (IRQs 16) *0, disabled.=0A[    0.73134=
1] ACPI: PCI Interrupt Link [APC8] (IRQs 16) *0, disabled.=0A[    0.73146=
8] ACPI: PCI Interrupt Link [APCF] (IRQs 20 21 22 23) *0, disabled.=0A[  =
  0.731595] ACPI: PCI Interrupt Link [APCH] (IRQs 20 21 22 23) *0=0A[    =
0.731721] ACPI: PCI Interrupt Link [AMC1] (IRQs 20 21 22 23) *0, disabled=
.=0A[    0.731847] ACPI: PCI Interrupt Link [APMU] (IRQs 20 21 22 23) *0,=
 disabled.=0A[    0.731972] ACPI: PCI Interrupt Link [AAZA] (IRQs 20 21 2=
2 23) *0=0A[    0.732096] ACPI: PCI Interrupt Link [APCS] (IRQs 20 21 22 =
23) *0, disabled.=0A[    0.732220] ACPI: PCI Interrupt Link [APCL] (IRQs =
20 21 22 23) *0, disabled.=0A[    0.732346] ACPI: PCI Interrupt Link [APC=
M] (IRQs 20 21 22 23) *0, disabled.=0A[    0.732470] ACPI: PCI Interrupt =
Link [APCZ] (IRQs 20 21 22 23) *0, disabled.=0A[    0.732594] ACPI: PCI I=
nterrupt Link [APSI] (IRQs 20 21 22 23) *0=0A[    0.732718] ACPI: PCI Int=
errupt Link [APSJ] (IRQs 20 21 22 23) *0=0A[    0.732841] ACPI: PCI Inter=
rupt Link [ASA2] (IRQs 20 21 22 23) *0=0A[    0.732926] vgaarb: device ad=
ded: PCI:0000:01:00.0,decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone=0A[    =
0.732929] vgaarb: device added: PCI:0000:03:00.0,decodes=3Dio+mem,owns=3D=
none,locks=3Dnone=0A[    0.732931] vgaarb: loaded=0A[    0.732990] SCSI s=
ubsystem initialized=0A[    0.733032] libata version 3.00 loaded.=0A[    =
0.733032] usbcore: registered new interface driver usbfs=0A[    0.733032]=
 usbcore: registered new interface driver hub=0A[    0.733032] usbcore: r=
egistered new device driver usb=0A[    0.733032] ACPI: WMI: Mapper loaded=
=0A[    0.733032] PCI: Using ACPI for IRQ routing=0A[    0.733032] PCI: p=
ci_cache_line_size set to 64 bytes=0A[    0.733032] reserve RAM buffer: 0=
00000000009c400 - 000000000009ffff =0A[    0.733032] reserve RAM buffer: =
00000000bfee0000 - 00000000bfffffff =0A[    0.733032] NetLabel: Initializ=
ing=0A[    0.733032] NetLabel:  domain hash size =3D 128=0A[    0.733032]=
 NetLabel:  protocols =3D UNLABELED CIPSOv4=0A[    0.733032] NetLabel:  u=
nlabeled traffic allowed by default=0A[    0.733032] HPET: 3 timers in to=
tal, 0 timers will be used for per-cpu timer=0A[    0.733032] hpet0: at M=
MIO 0xfefff000, IRQs 2, 8, 31=0A[    0.733032] hpet0: 3 comparators, 32-b=
it 25.000000 MHz counter=0A[    0.740020] Switching to clocksource tsc=0A=
[    0.740947] pnp: PnP ACPI init=0A[    0.740960] ACPI: bus type pnp reg=
istered=0A[    0.743856] pnp: PnP ACPI: found 11 devices=0A[    0.743857]=
 ACPI: ACPI bus type pnp unregistered=0A[    0.743865] system 00:01: [io =
 0x1000-0x107f] has been reserved=0A[    0.743867] system 00:01: [io  0x1=
080-0x10ff] has been reserved=0A[    0.743868] system 00:01: [io  0x1400-=
0x147f] has been reserved=0A[    0.743869] system 00:01: [io  0x1480-0x14=
ff] has been reserved=0A[    0.743871] system 00:01: [io  0x1800-0x187f] =
has been reserved=0A[    0.743872] system 00:01: [io  0x1880-0x18ff] has =
been reserved=0A[    0.743875] system 00:02: [io  0x04d0-0x04d1] has been=
 reserved=0A[    0.743877] system 00:02: [io  0x0800-0x087f] has been res=
erved=0A[    0.743878] system 00:02: [io  0x0290-0x0297] has been reserve=
d=0A[    0.743884] system 00:09: [mem 0xf0000000-0xf3ffffff] has been res=
erved=0A[    0.743886] system 00:0a: [mem 0x000d7e00-0x000d7fff] has been=
 reserved=0A[    0.743888] system 00:0a: [mem 0x000f0000-0x000f7fff] coul=
d not be reserved=0A[    0.743889] system 00:0a: [mem 0x000f8000-0x000fbf=
ff] could not be reserved=0A[    0.743891] system 00:0a: [mem 0x000fc000-=
0x000fffff] could not be reserved=0A[    0.743892] system 00:0a: [mem 0xf=
efff000-0xfefff0ff] has been reserved=0A[    0.743894] system 00:0a: [mem=
 0xbfee0000-0xbfefffff] could not be reserved=0A[    0.743895] system 00:=
0a: [mem 0xffff0000-0xffffffff] has been reserved=0A[    0.743897] system=
 00:0a: [mem 0x00000000-0x0009ffff] could not be reserved=0A[    0.743899=
] system 00:0a: [mem 0x00100000-0xbfedffff] could not be reserved=0A[    =
0.743900] system 00:0a: [mem 0xfec00000-0xfec00fff] could not be reserved=
=0A[    0.743902] system 00:0a: [mem 0xfee00000-0xfeefffff] has been rese=
rved=0A[    0.743903] system 00:0a: [mem 0xfefff000-0xfeffffff] could not=
 be reserved=0A[    0.743905] system 00:0a: [mem 0xfff80000-0xfff80fff] h=
as been reserved=0A[    0.743906] system 00:0a: [mem 0xfff90000-0xfffbfff=
f] has been reserved=0A[    0.743908] system 00:0a: [mem 0xfffed000-0xfff=
effff] has been reserved=0A[    0.748545] PCI: max bus depth: 1 pci_try_n=
um: 2=0A[    0.748557] pci 0000:00:04.0: PCI bridge to [bus 01-01]=0A[   =
 0.748558] pci 0000:00:04.0:   bridge window [io  0xd000-0xdfff]=0A[    0=
.748560] pci 0000:00:04.0:   bridge window [mem 0xfa000000-0xfdffffff]=0A=
[    0.748562] pci 0000:00:04.0:   bridge window [mem 0xe0000000-0xefffff=
ff 64bit pref]=0A[    0.748565] pci 0000:00:0e.0: PCI bridge to [bus 02-0=
2]=0A[    0.748566] pci 0000:00:0e.0:   bridge window [io  disabled]=0A[ =
   0.748568] pci 0000:00:0e.0:   bridge window [mem disabled]=0A[    0.74=
8570] pci 0000:00:0e.0:   bridge window [mem pref disabled]=0A[    0.7485=
74] pci 0000:03:00.0: BAR 6: assigned [mem 0xf9000000-0xf907ffff pref]=0A=
[    0.748576] pci 0000:00:17.0: PCI bridge to [bus 03-03]=0A[    0.74857=
8] pci 0000:00:17.0:   bridge window [io  0xc000-0xcfff]=0A[    0.748580]=
 pci 0000:00:17.0:   bridge window [mem 0xf6000000-0xf9ffffff]=0A[    0.7=
48582] pci 0000:00:17.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit=
 pref]=0A[    0.748589] pci 0000:00:04.0: setting latency timer to 64=0A[=
    0.748591] pci 0000:00:0e.0: setting latency timer to 64=0A[    0.7485=
95] pci 0000:00:17.0: setting latency timer to 64=0A[    0.748597] pci_bu=
s 0000:00: resource 4 [io  0x0000-0x0cf7]=0A[    0.748598] pci_bus 0000:0=
0: resource 5 [io  0x0d00-0xffff]=0A[    0.748600] pci_bus 0000:00: resou=
rce 6 [mem 0x000a0000-0x000bffff]=0A[    0.748601] pci_bus 0000:00: resou=
rce 7 [mem 0x000c0000-0x000dffff]=0A[    0.748602] pci_bus 0000:00: resou=
rce 8 [mem 0xbff00000-0xfebfffff]=0A[    0.748604] pci_bus 0000:01: resou=
rce 0 [io  0xd000-0xdfff]=0A[    0.748605] pci_bus 0000:01: resource 1 [m=
em 0xfa000000-0xfdffffff]=0A[    0.748606] pci_bus 0000:01: resource 2 [m=
em 0xe0000000-0xefffffff 64bit pref]=0A[    0.748608] pci_bus 0000:02: re=
source 4 [io  0x0000-0x0cf7]=0A[    0.748609] pci_bus 0000:02: resource 5=
 [io  0x0d00-0xffff]=0A[    0.748610] pci_bus 0000:02: resource 6 [mem 0x=
000a0000-0x000bffff]=0A[    0.748612] pci_bus 0000:02: resource 7 [mem 0x=
000c0000-0x000dffff]=0A[    0.748613] pci_bus 0000:02: resource 8 [mem 0x=
bff00000-0xfebfffff]=0A[    0.748614] pci_bus 0000:03: resource 0 [io  0x=
c000-0xcfff]=0A[    0.748615] pci_bus 0000:03: resource 1 [mem 0xf6000000=
-0xf9ffffff]=0A[    0.748617] pci_bus 0000:03: resource 2 [mem 0xd0000000=
-0xdfffffff 64bit pref]=0A[    0.748637] NET: Registered protocol family =
2=0A[    0.748763] IP route cache hash table entries: 262144 (order: 9, 2=
097152 bytes)=0A[    0.749615] TCP established hash table entries: 524288=
 (order: 11, 8388608 bytes)=0A[    0.752157] TCP bind hash table entries:=
 65536 (order: 8, 1048576 bytes)=0A[    0.752492] TCP: Hash tables config=
ured (established 524288 bind 65536)=0A[    0.752494] TCP reno registered=
=0A[    0.752506] UDP hash table entries: 4096 (order: 5, 131072 bytes)=0A=
[    0.752560] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)=
=0A[    0.752679] NET: Registered protocol family 1=0A[    0.752720] pci =
0000:00:00.0: Found enabled HT MSI Mapping=0A[    0.769878] pci 0000:00:0=
d.0: Enabling HT MSI Mapping=0A[    0.769923] pci 0000:00:0d.1: Enabling =
HT MSI Mapping=0A[    0.769965] pci 0000:00:0d.2: Enabling HT MSI Mapping=
=0A[    0.770007] pci 0000:00:0e.0: Enabling HT MSI Mapping=0A[    0.7700=
53] pci 0000:00:0e.1: Enabling HT MSI Mapping=0A[    0.770108] pci 0000:0=
0:10.0: Enabling HT MSI Mapping=0A[    0.770165] pci 0000:00:17.0: Enabli=
ng HT MSI Mapping=0A[    0.770181] pci 0000:01:00.0: Boot video device=0A=
[    0.770190] PCI: CLS 32 bytes, default 64=0A[    0.770238] Trying to u=
npack rootfs image as initramfs...=0A[    0.896271] Freeing initrd memory=
: 9040k freed=0A[    0.899220] PCI-DMA: Disabling AGP.=0A[    0.899306] P=
CI-DMA: aperture base @ 20000000 size 65536 KB=0A[    0.899307] PCI-DMA: =
using GART IOMMU.=0A[    0.899309] PCI-DMA: Reserving 64MB of IOMMU area =
in the AGP aperture=0A[    0.902474] Scanning for low memory corruption e=
very 60 seconds=0A[    0.902564] audit: initializing netlink socket (disa=
bled)=0A[    0.902572] type=3D2000 audit(1275061188.900:1): initialized=0A=
[    0.911198] HugeTLB registered 2 MB page size, pre-allocated 0 pages=0A=
[    0.912034] VFS: Disk quotas dquot_6.5.2=0A[    0.912065] Dquot-cache =
hash table entries: 512 (order 0, 4096 bytes)=0A[    0.912408] fuse init =
(API version 7.13)=0A[    0.912452] msgmni has been set to 16001=0A[    0=
.912624] alg: No test for stdrng (krng)=0A[    0.912658] Block layer SCSI=
 generic (bsg) driver version 0.4 loaded (major 253)=0A[    0.912660] io =
scheduler noop registered=0A[    0.912661] io scheduler deadline register=
ed=0A[    0.912696] io scheduler cfq registered (default)=0A[    0.912780=
] pcieport 0000:00:04.0: setting latency timer to 64=0A[    0.912794]   a=
lloc irq_desc for 24 on node 0=0A[    0.912796]   alloc kstat_irqs on nod=
e 0=0A[    0.912802] pcieport 0000:00:04.0: irq 24 for MSI/MSI-X=0A[    0=
.912861] pcieport 0000:00:17.0: setting latency timer to 64=0A[    0.9128=
76]   alloc irq_desc for 25 on node 0=0A[    0.912877]   alloc kstat_irqs=
 on node 0=0A[    0.912881] pcieport 0000:00:17.0: irq 25 for MSI/MSI-X=0A=
[    0.912920] pcieport 0000:00:04.0: Requesting control of PCIe PME from=
 ACPI BIOS=0A[    0.912930] pcieport 0000:00:04.0: Failed to receive cont=
rol of PCIe PME service: no _OSC support=0A[    0.912934] pcie_pme: probe=
 of 0000:00:04.0:pcie01 failed with error -13=0A[    0.912936] pcieport 0=
000:00:17.0: Requesting control of PCIe PME from ACPI BIOS=0A[    0.91293=
8] pcieport 0000:00:17.0: Failed to receive control of PCIe PME service: =
no _OSC support=0A[    0.912939] pcie_pme: probe of 0000:00:17.0:pcie01 f=
ailed with error -13=0A[    0.912948] pci_hotplug: PCI Hot Plug PCI Core =
version: 0.5=0A[    0.912960] pciehp: PCI Express Hot Plug Controller Dri=
ver version: 0.4=0A[    0.913035] input: Power Button as /devices/LNXSYST=
M:00/LNXSYBUS:00/PNP0C0C:00/input/input0=0A[    0.913037] ACPI: Power But=
ton [PWRB]=0A[    0.913069] input: Power Button as /devices/LNXSYSTM:00/L=
NXPWRBN:00/input/input1=0A[    0.913071] ACPI: Power Button [PWRF]=0A[   =
 0.913104] ACPI: Fan [FAN] (on)=0A[    0.916619] ACPI Warning for \_TZ_.T=
HRM._PSL: Return Package type mismatch at index 0 - found [NULL Object De=
scriptor], expected Reference (20100121/nspredef-1059)=0A[    0.916624] A=
CPI: Expecting a [Reference] package element, found type 0=0A[    0.91668=
2] ACPI: Invalid passive threshold=0A[    0.916918] thermal LNXTHERM:01: =
registered as thermal_zone0=0A[    0.916921] ACPI: Thermal Zone [THRM] (4=
0 C)=0A[    0.917676] Linux agpgart interface v0.103=0A[    0.917679] Ser=
ial: 8250/16550 driver, 4 ports, IRQ sharing enabled=0A[    0.918309] brd=
: module loaded=0A[    0.918561] loop: module loaded=0A[    0.918721] pat=
a_acpi 0000:00:0c.0: setting latency timer to 64=0A[    0.919014] ACPI: P=
CI Interrupt Link [APSI] enabled at IRQ 23=0A[    0.919017]   alloc irq_d=
esc for 23 on node 0=0A[    0.919019]   alloc kstat_irqs on node 0=0A[   =
 0.919028] pata_acpi 0000:00:0d.0: PCI INT A -> Link[APSI] -> GSI 23 (lev=
el, low) -> IRQ 23=0A[    0.919040] pata_acpi 0000:00:0d.0: setting laten=
cy timer to 64=0A[    0.919044] pata_acpi 0000:00:0d.0: PCI INT A disable=
d=0A[    0.919272] ACPI: PCI Interrupt Link [ASA2] enabled at IRQ 22=0A[ =
   0.919273]   alloc irq_desc for 22 on node 0=0A[    0.919274]   alloc k=
stat_irqs on node 0=0A[    0.919280] pata_acpi 0000:00:0d.2: PCI INT C ->=
 Link[ASA2] -> GSI 22 (level, low) -> IRQ 22=0A[    0.919288] pata_acpi 0=
000:00:0d.2: setting latency timer to 64=0A[    0.919292] pata_acpi 0000:=
00:0d.2: PCI INT C disabled=0A[    0.919505] Fixed MDIO Bus: probed=0A[  =
  0.919520] PPP generic driver version 2.4.2=0A[    0.919545] tun: Univer=
sal TUN/TAP device driver, 1.6=0A[    0.919546] tun: (C) 1999-2004 Max Kr=
asnyansky <maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>=0A[    0.919593] ehci_hcd: USB 2.0 'Enhance=
d' Host Controller (EHCI) Driver=0A[    0.919842] ACPI: PCI Interrupt Lin=
k [APCL] enabled at IRQ 21=0A[    0.919844]   alloc irq_desc for 21 on no=
de 0=0A[    0.919845]   alloc kstat_irqs on node 0=0A[    0.919852] ehci_=
hcd 0000:00:0a.1: PCI INT B -> Link[APCL] -> GSI 21 (level, low) -> IRQ 2=
1=0A[    0.919873] ehci_hcd 0000:00:0a.1: setting latency timer to 64=0A[=
    0.919875] ehci_hcd 0000:00:0a.1: EHCI Host Controller=0A[    0.919892=
] ehci_hcd 0000:00:0a.1: new USB bus registered, assigned bus number 1=0A=
[    0.919915] ehci_hcd 0000:00:0a.1: debug port 1=0A[    0.919921] ehci_=
hcd 0000:00:0a.1: cache line size of 32 is not supported=0A[    0.919938]=
 ehci_hcd 0000:00:0a.1: irq 21, io mem 0xfe02e000=0A[    0.939811] ehci_h=
cd 0000:00:0a.1: USB 2.0 started, EHCI 1.00=0A[    0.939875] hub 1-0:1.0:=
 USB hub found=0A[    0.939878] hub 1-0:1.0: 10 ports detected=0A[    0.9=
39934] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver=0A[    0.94=
0181] ACPI: PCI Interrupt Link [APCF] enabled at IRQ 20=0A[    0.940183] =
  alloc irq_desc for 20 on node 0=0A[    0.940185]   alloc kstat_irqs on =
node 0=0A[    0.940192] ohci_hcd 0000:00:0a.0: PCI INT A -> Link[APCF] ->=
 GSI 20 (level, low) -> IRQ 20=0A[    0.940202] ohci_hcd 0000:00:0a.0: se=
tting latency timer to 64=0A[    0.940203] ohci_hcd 0000:00:0a.0: OHCI Ho=
st Controller=0A[    0.940222] ohci_hcd 0000:00:0a.0: new USB bus registe=
red, assigned bus number 2=0A[    0.940244] ohci_hcd 0000:00:0a.0: irq 20=
, io mem 0xfe02f000=0A[    1.001874] hub 2-0:1.0: USB hub found=0A[    1.=
001879] hub 2-0:1.0: 10 ports detected=0A[    1.001929] uhci_hcd: USB Uni=
versal Host Controller Interface driver=0A[    1.001985] PNP: PS/2 Contro=
ller [PNP0303:PS2K] at 0x60,0x64 irq 1=0A[    1.001987] PNP: PS/2 appears=
 to have AUX port disabled, if this is incorrect please boot with i8042.n=
opnp=0A[    1.002112] serio: i8042 KBD port at 0x60,0x64 irq 1=0A[    1.0=
02152] mice: PS/2 mouse device common for all mice=0A[    1.002206] rtc_c=
mos 00:05: RTC can wake from S4=0A[    1.002228] rtc_cmos 00:05: rtc core=
: registered rtc_cmos as rtc0=0A[    1.002260] rtc0: alarms up to one yea=
r, y3k, 242 bytes nvram, hpet irqs=0A[    1.002306] device-mapper: uevent=
: version 1.0.3=0A[    1.002368] device-mapper: ioctl: 4.17.0-ioctl (2010=
-03-05) initialised: dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org=0A[    1.002454] device-mapper: =
multipath: version 1.1.1 loaded=0A[    1.002456] device-mapper: multipath=
 round-robin: version 1.0.0 loaded=0A[    1.002636] cpuidle: using govern=
or ladder=0A[    1.002637] cpuidle: using governor menu=0A[    1.002815] =
TCP cubic registered=0A[    1.002884] NET: Registered protocol family 10=0A=
[    1.003101] lo: Disabled Privacy Extensions=0A[    1.003238] NET: Regi=
stered protocol family 17=0A[    1.003263] powernow-k8: Found 1 AMD Pheno=
m(tm) II X4 940 Processor processors (4 cpu cores) (version 2.20.00)=0A[ =
   1.003298] powernow-k8:    0 : pstate 0 (3600 MHz)=0A[    1.003299] pow=
ernow-k8:    1 : pstate 1 (2300 MHz)=0A[    1.003300] powernow-k8:    2 :=
 pstate 2 (1800 MHz)=0A[    1.003301] powernow-k8:    3 : pstate 3 (800 M=
Hz)=0A[    1.003607] PM: Resume from disk failed.=0A[    1.003616] regist=
ered taskstats version 1=0A[    1.003802]   Magic number: 10:820:690=0A[ =
   1.003819] mem mem: hash matches=0A[    1.003871] rtc_cmos 00:05: setti=
ng system clock to 2010-05-28 15:39:49 UTC (1275061189)=0A[    1.003873] =
BIOS EDD facility v0.16 2004-Jun-25, 0 devices found=0A[    1.003874] EDD=
 information not available.=0A[    1.003925] Freeing unused kernel memory=
: 936k freed=0A[    1.004122] Write protecting the kernel read-only data:=
 10240k=0A[    1.004229] Freeing unused kernel memory: 712k freed=0A[    =
1.004451] Freeing unused kernel memory: 1700k freed=0A[    1.014741] udev=
: starting version 151=0A[    1.026553] input: AT Translated Set 2 keyboa=
rd as /devices/platform/i8042/serio0/input/input2=0A[    1.042461] [drm] =
Initialized drm 1.1.0 20060810=0A[    1.052074] sata_nv 0000:00:0d.0: ver=
sion 3.5=0A[    1.052086] sata_nv 0000:00:0d.0: PCI INT A -> Link[APSI] -=
> GSI 23 (level, low) -> IRQ 23=0A[    1.052087] sata_nv 0000:00:0d.0: Us=
ing SWNCQ mode=0A[    1.053063] sata_nv 0000:00:0d.0: setting latency tim=
er to 64=0A[    1.054697] scsi0 : sata_nv=0A[    1.055911] scsi1 : sata_n=
v=0A[    1.056066] ata1: SATA max UDMA/133 cmd 0x9f0 ctl 0xbf0 bmdma 0xf8=
00 irq 23=0A[    1.056069] ata2: SATA max UDMA/133 cmd 0x970 ctl 0xb70 bm=
dma 0xf808 irq 23=0A[    1.056138] forcedeth: Reverse Engineered nForce e=
thernet driver. Version 0.64.=0A[    1.056363] ACPI: PCI Interrupt Link [=
APCH] enabled at IRQ 23=0A[    1.056367] forcedeth 0000:00:10.0: PCI INT =
A -> Link[APCH] -> GSI 23 (level, low) -> IRQ 23=0A[    1.056370] forcede=
th 0000:00:10.0: setting latency timer to 64=0A[    1.056416] nv_probe: s=
et workaround bit for reversed mac addr=0A[    1.390438] ata1: SATA link =
down (SStatus 0 SControl 300)=0A[    1.580527] forcedeth 0000:00:10.0: if=
name eth0, PHY OUI 0x5043 @ 1, addr 04:4b:80:80:80:03=0A[    1.580529] fo=
rcedeth 0000:00:10.0: highdma csum vlan pwrctl mgmt gbit lnktim msi desc-=
v3=0A[    1.580569] pata_amd 0000:00:0c.0: version 0.4.1=0A[    1.580594]=
 pata_amd 0000:00:0c.0: setting latency timer to 64=0A[    1.580651] scsi=
2 : pata_amd=0A[    1.580696] scsi3 : pata_amd=0A[    1.581182] ata3: PAT=
A max UDMA/133 cmd 0x1f0 ctl 0x3f6 bmdma 0xfd00 irq 14=0A[    1.581183] a=
ta4: PATA max UDMA/133 cmd 0x170 ctl 0x376 bmdma 0xfd08 irq 15=0A[    1.5=
81450] ACPI: PCI Interrupt Link [APSJ] enabled at IRQ 22=0A[    1.581454]=
 sata_nv 0000:00:0d.1: PCI INT B -> Link[APSJ] -> GSI 22 (level, low) -> =
IRQ 22=0A[    1.581455] sata_nv 0000:00:0d.1: Using SWNCQ mode=0A[    1.5=
82393] sata_nv 0000:00:0d.1: setting latency timer to 64=0A[    1.582510]=
 scsi4 : sata_nv=0A[    1.582572] scsi5 : sata_nv=0A[    1.582709] ata5: =
SATA max UDMA/133 cmd 0x9e0 ctl 0xbe0 bmdma 0xf300 irq 22=0A[    1.582711=
] ata6: SATA max UDMA/133 cmd 0x960 ctl 0xb60 bmdma 0xf308 irq 22=0A[    =
1.582792] sata_nv 0000:00:0d.2: PCI INT C -> Link[ASA2] -> GSI 22 (level,=
 low) -> IRQ 22=0A[    1.582794] sata_nv 0000:00:0d.2: Using SWNCQ mode=0A=
[    1.583729] sata_nv 0000:00:0d.2: setting latency timer to 64=0A[    1=
.583829] scsi6 : sata_nv=0A[    1.583889] scsi7 : sata_nv=0A[    1.584026=
] ata7: SATA max UDMA/133 cmd 0xf200 ctl 0xf100 bmdma 0xee00 irq 22=0A[  =
  1.584028] ata8: SATA max UDMA/133 cmd 0xf000 ctl 0xef00 bmdma 0xee08 ir=
q 22=0A[    1.620015] usb 1-6: new high speed USB device using ehci_hcd a=
nd address 6=0A[    1.734191] ata2: SATA link down (SStatus 0 SControl 30=
0)=0A[    1.776653] Initializing USB Mass Storage driver...=0A[    1.7766=
80] usbcore: registered new interface driver usb-storage=0A[    1.776681]=
 USB Mass Storage support registered.=0A[    1.782932] ata3.00: ATAPI: HL=
-DT-STDVD-RAM GSA-H20L, 1.02, max UDMA/33=0A[    1.782947] ata3.01: ATAPI=
: HL-DT-STDVD-ROM GDR8164B, 0L06, max UDMA/33=0A[    1.782959] ata3: nv_m=
ode_filter: 0x739f&0x739f->0x739f, BIOS=3D0x7000 (0xc0c00000) ACPI=3D0x70=
1f (60:60:0x1f)=0A[    1.782962] ata3: nv_mode_filter: 0x739f&0x739f->0x7=
39f, BIOS=3D0x7000 (0xc0c00000) ACPI=3D0x701f (60:60:0x1f)=0A[    1.82281=
2] ata3.00: configured for UDMA/33=0A[    1.862707] ata3.01: configured f=
or UDMA/33=0A[    1.866068] scsi 2:0:0:0: CD-ROM            HL-DT-ST DVD-=
RAM GSA-H20L 1.02 PQ: 0 ANSI: 5=0A[    1.871013] sr0: scsi3-mmc drive: 48=
x/48x writer dvd-ram cd/rw xa/form2 cdda tray=0A[    1.871015] Uniform CD=
-ROM driver Revision: 3.20=0A[    1.871075] sr 2:0:0:0: Attached scsi CD-=
ROM sr0=0A[    1.871107] sr 2:0:0:0: Attached scsi generic sg0 type 5=0A[=
    1.874429] scsi 2:0:1:0: CD-ROM            HL-DT-ST DVD-ROM GDR8164B 0=
L06 PQ: 0 ANSI: 5=0A[    1.882260] sr1: scsi3-mmc drive: 52x/52x cd/rw xa=
/form2 cdda tray=0A[    1.882300] sr 2:0:1:0: Attached scsi CD-ROM sr1=0A=
[    1.882322] sr 2:0:1:0: Attached scsi generic sg1 type 5=0A[    1.8823=
71] ata4: port disabled. ignoring.=0A[    1.921723] ata7: SATA link down =
(SStatus 0 SControl 300)=0A[    2.070046] ata5: SATA link up 3.0 Gbps (SS=
tatus 123 SControl 300)=0A[    2.090248] ata5.00: ATA-7: SAMSUNG HD300LJ,=
 ZT100-13, max UDMA7=0A[    2.090249] ata5.00: 586072368 sectors, multi 1=
6: LBA48 NCQ (depth 31/32)=0A[    2.110014] usb 2-1: new low speed USB de=
vice using ohci_hcd and address 2=0A[    2.110246] ata5.00: configured fo=
r UDMA/133=0A[    2.110311] scsi 4:0:0:0: Direct-Access     ATA      SAMS=
UNG HD300LJ  ZT10 PQ: 0 ANSI: 5=0A[    2.110404] sd 4:0:0:0: [sda] 586072=
368 512-byte logical blocks: (300 GB/279 GiB)=0A[    2.110422] sd 4:0:0:0=
: Attached scsi generic sg2 type 0=0A[    2.110430] sd 4:0:0:0: [sda] Wri=
te Protect is off=0A[    2.110432] sd 4:0:0:0: [sda] Mode Sense: 00 3a 00=
 00=0A[    2.110444] sd 4:0:0:0: [sda] Write cache: enabled, read cache: =
enabled, doesn't support DPO or FUA=0A[    2.110519]  sda: sda1=0A[    2.=
134176] sda: p1 size 1172134467 exceeds device capacity, limited to end o=
f disk=0A[    2.134280] sd 4:0:0:0: [sda] Attached SCSI disk=0A[    2.600=
029] ata6: SATA link up 3.0 Gbps (SStatus 123 SControl 300)=0A[    2.6202=
42] ata6.00: ATA-7: SAMSUNG HD300LJ, ZT100-13, max UDMA7=0A[    2.620244]=
 ata6.00: 586072368 sectors, multi 16: LBA48 NCQ (depth 31/32)=0A[    2.6=
40242] ata6.00: configured for UDMA/133=0A[    2.640289] scsi 5:0:0:0: Di=
rect-Access     ATA      SAMSUNG HD300LJ  ZT10 PQ: 0 ANSI: 5=0A[    2.640=
376] sd 5:0:0:0: [sdb] 586072368 512-byte logical blocks: (300 GB/279 GiB=
)=0A[    2.640382] sd 5:0:0:0: Attached scsi generic sg3 type 0=0A[    2.=
640403] sd 5:0:0:0: [sdb] Write Protect is off=0A[    2.640405] sd 5:0:0:=
0: [sdb] Mode Sense: 00 3a 00 00=0A[    2.640434] sd 5:0:0:0: [sdb] Write=
 cache: enabled, read cache: enabled, doesn't support DPO or FUA=0A[    2=
.640517]  sdb: unknown partition table=0A[    2.659629] sd 5:0:0:0: [sdb]=
 Attached SCSI disk=0A[    2.690014] usb 2-2: new full speed USB device u=
sing ohci_hcd and address 3=0A[    2.982937] ata8: SATA link down (SStatu=
s 0 SControl 300)=0A[    2.985279] usbcore: registered new interface driv=
er hiddev=0A[    2.985801] scsi8 : usb-storage 1-6:1.0=0A[    2.985862] u=
sbcore: registered new interface driver ums-cypress=0A[    2.991292] inpu=
t: Microsoft Microsoft 3-Button Mouse with IntelliEye(TM) as /devices/pci=
0000:00/0000:00:0a.0/usb2/2-1/2-1:1.0/input/input3=0A[    2.991344] gener=
ic-usb 0003:045E:0053.0001: input,hidraw0: USB HID v1.10 Mouse [Microsoft=
 Microsoft 3-Button Mouse with IntelliEye(TM)] on usb-0000:00:0a.0-1/inpu=
t0=0A[    2.991361] usbcore: registered new interface driver usbhid=0A[  =
  2.991363] usbhid: USB HID core driver=0A[    3.273760] usb 2-3: new ful=
l speed USB device using ohci_hcd and address 4=0A[    3.521265] scsi9 : =
usb-storage 2-3:1.0=0A[    3.880009] usb 2-4: new low speed USB device us=
ing ohci_hcd and address 5=0A[    3.986320] scsi 8:0:0:0: Direct-Access  =
   WDC WD12 00UE-22KVT0      0000 PQ: 0 ANSI: 0=0A[    3.986580] sd 8:0:0=
:0: Attached scsi generic sg4 type 0=0A[    3.987312] sd 8:0:0:0: [sdc] 2=
34441648 512-byte logical blocks: (120 GB/111 GiB)=0A[    3.988183] sd 8:=
0:0:0: [sdc] Write Protect is off=0A[    3.988185] sd 8:0:0:0: [sdc] Mode=
 Sense: 27 00 00 00=0A[    3.988187] sd 8:0:0:0: [sdc] Assuming drive cac=
he: write through=0A[    3.989683] sd 8:0:0:0: [sdc] Assuming drive cache=
: write through=0A[    3.989736]  sdc: sdc1=0A[    4.042949] sd 8:0:0:0: =
[sdc] Assuming drive cache: write through=0A[    4.043004] sd 8:0:0:0: [s=
dc] Attached SCSI disk=0A[    4.082681] device-mapper: ioctl: device does=
n't appear to be in the dev hash table.=0A[    4.154488] input: Logitech =
Logitech Extreme 3D as /devices/pci0000:00/0000:00:0a.0/usb2/2-4/2-4:1.0/=
input/input4=0A[    4.154532] logitech 0003:046D:C215.0002: input,hidraw1=
: USB HID v1.10 Joystick [Logitech Logitech Extreme 3D] on usb-0000:00:0a=
.0-4/input0=0A[    4.306190] EXT4-fs (sdc1): mounted filesystem with orde=
red data mode=0A[    4.532398] scsi 9:0:0:0: Direct-Access     eUSB     C=
ompact Flash         PQ: 0 ANSI: 2=0A[    4.532680] sd 9:0:0:0: Attached =
scsi generic sg5 type 0=0A[    4.565389] sd 9:0:0:0: [sdd] Attached SCSI =
removable disk=0A[    8.146543] udev: starting version 151=0A[   12.03451=
6] EDAC MC: Ver: 2.1.0 May 11 2010=0A[   12.120608] usblp0: USB Bidirecti=
onal printer dev 3 if 0 alt 1 proto 2 vid 0x03F0 pid 0x1204=0A[   12.1206=
20] usbcore: registered new interface driver usblp=0A[   12.364193] EDAC =
amd64_edac:  Ver: 3.3.0 May 11 2010=0A[   12.364255] EDAC amd64: This nod=
e reports that Memory ECC is currently disabled, set F3x44[22] (0000:00:1=
8.3).=0A[   12.364262] EDAC amd64: ECC disabled in the BIOS or no ECC cap=
ability, module will not load.=0A[   12.364263]  Either enable ECC checki=
ng or force module loading by setting 'ecc_enable_override'.=0A[   12.364=
264]  (Note that use of the override may cause unknown side effects.)=0A[=
   12.364273] amd64_edac: probe of 0000:00:18.2 failed with error -22=0A[=
   12.744456] ACPI: resource nForce2_smbus [io  0x1c00-0x1c3f] conflicts =
with ACPI region SM00 [mem 0x00001c00-0x00001c05 64bit disabled]=0A[   12=
.744458] ACPI: If an ACPI driver is available for this device, you should=
 use it instead of the native driver=0A[   12.744460] nForce2_smbus 0000:=
00:09.1: Error probing SMB1.=0A[   12.744543] i2c i2c-0: nForce2 SMBus ad=
apter at 0x1c40=0A[   14.855356] ACPI: PCI Interrupt Link [AAZA] enabled =
at IRQ 21=0A[   14.855361] HDA Intel 0000:00:0e.1: PCI INT B -> Link[AAZA=
] -> GSI 21 (level, low) -> IRQ 21=0A[   14.855364] hda_intel: msi for de=
vice 1043:81f6 set to 0=0A[   14.855399] HDA Intel 0000:00:0e.1: setting =
latency timer to 64=0A[   15.587522]   alloc irq_desc for 26 on node 0=0A=
[   15.587525]   alloc kstat_irqs on node 0=0A[   15.587533] forcedeth 00=
00:00:10.0: irq 26 for MSI/MSI-X=0A[   16.944761] input: HDA Digital PCBe=
ep as /devices/pci0000:00/0000:00:0e.1/input/input5=0A[   19.539928] lp: =
driver loaded but no devices found=0A[   19.844571] ppdev: user-space par=
allel port driver=0A[   25.966144] usb 2-2: usbfs: interface 0 claimed by=
 usblp while 'usb' sets config #1=0A[   26.490009] eth0: no IPv6 routers =
present=0A[   27.830533] ACPI: PCI Interrupt Link [APC5] enabled at IRQ 1=
6=0A[   27.830537]   alloc irq_desc for 16 on node 0=0A[   27.830538]   a=
lloc kstat_irqs on node 0=0A[   27.830548] nouveau 0000:01:00.0: PCI INT =
A -> Link[APC5] -> GSI 16 (level, low) -> IRQ 16=0A[   27.830551] nouveau=
 0000:01:00.0: setting latency timer to 64=0A[   27.832857] [drm] nouveau=
 0000:01:00.0: Detected an NV50 generation card (0x0a0180b1)=0A[   27.834=
929] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMI=
N=0A[   27.899077] [drm] nouveau 0000:01:00.0: ... appears to be valid=0A=
[   27.899081] [drm] nouveau 0000:01:00.0: BIT BIOS found=0A[   27.899083=
] [drm] nouveau 0000:01:00.0: Bios version 62.00.45.00=0A[   27.899085] [=
drm] nouveau 0000:01:00.0: TMDS table revision 2.0 not currently supporte=
d=0A[   27.899087] [drm] nouveau 0000:01:00.0: Found Display Configuratio=
n Block version 4.0=0A[   27.899089] [drm] nouveau 0000:01:00.0: Raw DCB =
entry 0: 04000320 00000028=0A[   27.899091] [drm] nouveau 0000:01:00.0: R=
aw DCB entry 1: 01000322 00020030=0A[   27.899093] [drm] nouveau 0000:01:=
00.0: Raw DCB entry 2: 02011310 00000028=0A[   27.899094] [drm] nouveau 0=
000:01:00.0: Raw DCB entry 3: 02022302 00020010=0A[   27.899096] [drm] no=
uveau 0000:01:00.0: DCB connector table: VHER 0x40 5 16 4=0A[   27.899098=
] [drm] nouveau 0000:01:00.0:   0: 0x00001030: type 0x30 idx 0 tag 0x07=0A=
[   27.899100] [drm] nouveau 0000:01:00.0:   1: 0x00000100: type 0x00 idx=
 1 tag 0xff=0A[   27.899101] [drm] nouveau 0000:01:00.0:   2: 0x00002261:=
 type 0x61 idx 2 tag 0x08=0A[   27.899108] [drm] nouveau 0000:01:00.0: Pa=
rsing VBIOS init table 0 at offset 0xD293=0A[   27.970146] [drm] nouveau =
0000:01:00.0: Parsing VBIOS init table 1 at offset 0xD6BE=0A[   28.000225=
] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xEB22=
=0A[   28.000230] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 =
at offset 0xEBFF=0A[   28.023771] [drm] nouveau 0000:01:00.0: Parsing VBI=
OS init table 4 at offset 0xECD1=0A[   28.023773] [drm] nouveau 0000:01:0=
0.0: Parsing VBIOS init table at offset 0xED36=0A[   28.060010] [drm] nou=
veau 0000:01:00.0: 0xED36: Condition still not met after 20ms, skipping f=
ollowing opcodes=0A[   28.060017] [drm] nouveau 0000:01:00.0: 0xC21A: par=
sing output script 0=0A[   28.060019] [drm] nouveau 0000:01:00.0: 0xC21A:=
 parsing output script 0=0A[   28.060028] [drm] nouveau 0000:01:00.0: Det=
ected 2048MiB VRAM=0A[   28.254734] [TTM] Zone  kernel: Available graphic=
s memory: 4098158 kiB.=0A[   28.254735] [TTM] Zone   dma32: Available gra=
phics memory: 2097152 kiB.=0A[   28.254737] [ttm] Initializing pool alloc=
ator.=0A[   28.269293] [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture=
)=0A[   28.272108] [drm] nouveau 0000:01:00.0: Allocating FIFO number 1=0A=
[   28.275497] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initial=
ised FIFO 1=0A[   28.275973] [drm] nouveau 0000:01:00.0: Detected a DAC o=
utput=0A[   28.275975] [drm] nouveau 0000:01:00.0: Detected a TMDS output=
=0A[   28.275977] [drm] nouveau 0000:01:00.0: Detected a DAC output=0A[  =
 28.275978] [drm] nouveau 0000:01:00.0: Detected a TMDS output=0A[   28.2=
75979] [drm] nouveau 0000:01:00.0: Detected a DVI-I connector=0A[   28.27=
6017] [drm] nouveau 0000:01:00.0: Detected a VGA connector=0A[   28.27602=
9] [drm] nouveau 0000:01:00.0: Detected a HDMI connector=0A[   28.302087]=
 Slow work thread pool: Starting up=0A[   28.302130] Slow work thread poo=
l: Ready=0A[   28.460165] [drm] nouveau 0000:01:00.0: allocated 1280x1024=
 fb: 0x40250000, bo ffff880234de9c00=0A[   28.460207] fb0: nouveaufb fram=
e buffer device=0A[   28.460208] registered panic notifier=0A[   28.46021=
2] [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0=0A=
[   28.460262] nouveau 0000:03:00.0: enabling device (0000 -> 0003)=0A[  =
 28.460515] ACPI: PCI Interrupt Link [APC6] enabled at IRQ 16=0A[   28.46=
0518] nouveau 0000:03:00.0: PCI INT A -> Link[APC6] -> GSI 16 (level, low=
) -> IRQ 16=0A[   28.460523] nouveau 0000:03:00.0: setting latency timer =
to 64=0A[   28.462875] [drm] nouveau 0000:03:00.0: Detected an NV50 gener=
ation card (0x0a0180b1)=0A[   28.464948] [drm] nouveau 0000:03:00.0: Atte=
mpting to load BIOS image from PRAMIN=0A[   28.464954] [drm] nouveau 0000=
:03:00.0: ... BIOS signature not found=0A[   28.464955] [drm] nouveau 000=
0:03:00.0: Attempting to load BIOS image from PROM=0A[   28.526469] Conso=
le: switching to colour frame buffer device 160x64=0A[   28.652669] [drm]=
 nouveau 0000:03:00.0: ... appears to be valid=0A[   28.652673] [drm] nou=
veau 0000:03:00.0: BIT BIOS found=0A[   28.652675] [drm] nouveau 0000:03:=
00.0: Bios version 62.00.45.00=0A[   28.652678] [drm] nouveau 0000:03:00.=
0: TMDS table revision 2.0 not currently supported=0A[   28.652680] [drm]=
 nouveau 0000:03:00.0: Found Display Configuration Block version 4.0=0A[ =
  28.652681] [drm] nouveau 0000:03:00.0: Raw DCB entry 0: 04000320 000000=
28=0A[   28.652684] [drm] nouveau 0000:03:00.0: Raw DCB entry 1: 01000322=
 00020030=0A[   28.652685] [drm] nouveau 0000:03:00.0: Raw DCB entry 2: 0=
2011310 00000028=0A[   28.652686] [drm] nouveau 0000:03:00.0: Raw DCB ent=
ry 3: 02022302 00020010=0A[   28.652688] [drm] nouveau 0000:03:00.0: DCB =
connector table: VHER 0x40 5 16 4=0A[   28.652690] [drm] nouveau 0000:03:=
00.0:   0: 0x00001030: type 0x30 idx 0 tag 0x07=0A[   28.652692] [drm] no=
uveau 0000:03:00.0:   1: 0x00000100: type 0x00 idx 1 tag 0xff=0A[   28.65=
2694] [drm] nouveau 0000:03:00.0:   2: 0x00002261: type 0x61 idx 2 tag 0x=
08=0A[   28.652703] [drm] nouveau 0000:03:00.0: Adaptor not initialised=0A=
[   28.652704] [drm] nouveau 0000:03:00.0: Running VBIOS init tables=0A[ =
  28.652710] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 0 at of=
fset 0xD293=0A[   28.863815] [drm] nouveau 0000:03:00.0: Parsing VBIOS in=
it table 1 at offset 0xD6BE=0A[   28.970010] [drm] nouveau 0000:03:00.0: =
Parsing VBIOS init table 2 at offset 0xEB22=0A[   28.970043] [drm] nouvea=
u 0000:03:00.0: Parsing VBIOS init table 3 at offset 0xEBFF=0A[   28.9900=
27] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table 4 at offset 0xEC=
D1=0A[   28.990028] [drm] nouveau 0000:03:00.0: Parsing VBIOS init table =
at offset 0xED36=0A[   29.020011] [drm] nouveau 0000:03:00.0: 0xC21A: par=
sing output script 0=0A[   29.020013] [drm] nouveau 0000:03:00.0: 0xC21A:=
 parsing output script 0=0A[   29.020055] [drm] nouveau 0000:03:00.0: Det=
ected 2048MiB VRAM=0A[   29.256782] [drm] nouveau 0000:03:00.0: 512 MiB G=
ART (aperture)=0A[   29.259562] [drm] nouveau 0000:03:00.0: Allocating FI=
FO number 1=0A[   29.263031] [drm] nouveau 0000:03:00.0: nouveau_channel_=
alloc: initialised FIFO 1=0A[   29.263578] [drm] nouveau 0000:03:00.0: De=
tected a DAC output=0A[   29.263580] [drm] nouveau 0000:03:00.0: Detected=
 a TMDS output=0A[   29.263581] [drm] nouveau 0000:03:00.0: Detected a DA=
C output=0A[   29.263582] [drm] nouveau 0000:03:00.0: Detected a TMDS out=
put=0A[   29.263584] [drm] nouveau 0000:03:00.0: Detected a DVI-I connect=
or=0A[   29.263624] [drm] nouveau 0000:03:00.0: Detected a VGA connector=0A=
[   29.263636] [drm] nouveau 0000:03:00.0: Detected a HDMI connector=0A[ =
  29.425894] [drm] nouveau 0000:03:00.0: allocated 1024x768 fb: 0x4025000=
0, bo ffff8802347f9c00=0A[   29.425942] fb1: nouveaufb frame buffer devic=
e=0A[   29.425945] [drm] Initialized nouveau 0.0.16 20090420 for 0000:03:=
00.0 on minor 1=0A[   29.426511] vgaarb: device changed decodes: PCI:0000=
:03:00.0,olddecodes=3Dio+mem,decodes=3Dnone:owns=3Dnone=0A[   29.426514] =
vgaarb: device changed decodes: PCI:0000:01:00.0,olddecodes=3Dio+mem,deco=
des=3Dnone:owns=3Dio+mem=0A[   30.384436] [drm] nouveau 0000:01:00.0: All=
ocating FIFO number 2=0A[   30.387734] [drm] nouveau 0000:01:00.0: nouvea=
u_channel_alloc: initialised FIFO 2=0A[   30.447982] [drm] nouveau 0000:0=
3:00.0: Allocating FIFO number 2=0A[   30.448130] [drm] nouveau 0000:01:0=
0.0: 0xC21E: parsing output script 1=0A[   30.448141] [drm] nouveau 0000:=
01:00.0: 0xC21F: parsing output script 2=0A[   30.448153] [drm] nouveau 0=
000:01:00.0: 0xC108: parsing clock script 0=0A[   30.448402] [drm] nouvea=
u 0000:01:00.0: 0xBAB1: parsing clock script 1=0A[   30.451068] [drm] nou=
veau 0000:03:00.0: nouveau_channel_alloc: initialised FIFO 2=0A[   30.452=
750] [drm] nouveau 0000:03:00.0: 0x1255: parsing clock script 0=0A[   31.=
240163] [drm] nouveau 0000:01:00.0: Allocating FIFO number 3=0A[   31.243=
453] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO =
3=0A[   31.290048] [drm] nouveau 0000:03:00.0: Allocating FIFO number 3=0A=
[   31.293381] [drm] nouveau 0000:03:00.0: nouveau_channel_alloc: initial=
ised FIFO 3=0A[   49.564920] CPUFREQ: Per core ondemand sysfs interface i=
s deprecated - up_threshold=0A[  123.981338] [drm] nouveau 0000:03:00.0: =
PFIFO_DMA_PUSHER - Ch 2=0A[  123.981434] [drm] nouveau 0000:03:00.0: PGRA=
PH_DATA_ERROR - Ch 2/2 Class 0x502d Mthd 0x0200 Data 0x00000000:0x0005f87=
c=0A[  123.981436] [drm] nouveau 0000:03:00.0: PGRAPH_DATA_ERROR - INVALI=
D_BITFIELD=0A[  123.981444] [drm] nouveau 0000:03:00.0: PGRAPH_DATA_ERROR=
 - Ch 2/2 Class 0x502d Mthd 0x0208 Data 0x00000ed4:0x00000002=0A[  123.98=
1446] [drm] nouveau 0000:03:00.0: PGRAPH_DATA_ERROR - INVALID_ENUM=0A[  1=
23.981455] [drm] nouveau 0000:03:00.0: PGRAPH_DATA_ERROR - Ch 2/2 Class 0=
x502d Mthd 0x020c Data 0x00000ed4:0x00000ed4=0A[  123.981457] [drm] nouve=
au 0000:03:00.0: PGRAPH_DATA_ERROR - INVALID_VALUE=0A[  132.353224] [drm]=
 nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 2=0A[  132.3566=
31] [drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 3=0A[ =
 132.361967] [drm] nouveau 0000:03:00.0: nouveau_channel_free: freeing fi=
fo 2=0A[  135.361253] [drm] nouveau 0000:03:00.0: Failed to idle channel =
2.=0A[  135.364542] [drm] nouveau 0000:03:00.0: PFIFO_DMA_PUSHER - Ch 127=
=0A[  135.364763] [drm] nouveau 0000:03:00.0: nouveau_channel_free: freei=
ng fifo 3=0A[  137.054093] [drm] nouveau 0000:01:00.0: Allocating FIFO nu=
mber 2=0A[  137.060948] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc=
: initialised FIFO 2=0A[  137.066683] [drm] nouveau 0000:03:00.0: Allocat=
ing FIFO number 2=0A[  137.073506] [drm] nouveau 0000:03:00.0: nouveau_ch=
annel_alloc: initialised FIFO 2=0A[  137.095611] [drm] nouveau 0000:01:00=
.0: Allocating FIFO number 3=0A[  137.098885] [drm] nouveau 0000:01:00.0:=
 nouveau_channel_alloc: initialised FIFO 3=0A[  137.099731] [drm] nouveau=
 0000:03:00.0: Allocating FIFO number 3=0A[  137.103016] [drm] nouveau 00=
00:03:00.0: nouveau_channel_alloc: initialised FIFO 3=0A[  226.465281] [d=
rm] nouveau 0000:01:00.0: Allocating FIFO number 4=0A[  226.472172] [drm]=
 nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 4=0A[  226=
.507404] [drm] nouveau 0000:03:00.0: Allocating FIFO number 4=0A[  226.51=
4247] [drm] nouveau 0000:03:00.0: nouveau_channel_alloc: initialised FIFO=
 4=0A[  229.743755] [drm] nouveau 0000:03:00.0: fail wait other chan=0A[ =
 229.743764] [drm] nouveau 0000:03:00.0: validate vram_list=0A[  229.7437=
72] [drm] nouveau 0000:03:00.0: validate: -16=0A[  232.739999] [drm] nouv=
eau 0000:03:00.0: fail wait other chan=0A[  232.740002] [drm] nouveau 000=
0:03:00.0: validate vram_list=0A[  232.740004] [drm] nouveau 0000:03:00.0=
: validate: -16=0A[  235.739998] [drm] nouveau 0000:03:00.0: fail wait ot=
her chan=0A[  235.740001] [drm] nouveau 0000:03:00.0: validate vram_list=0A=
[  235.740002] [drm] nouveau 0000:03:00.0: validate: -16=0A[  238.739997]=
 [drm] nouveau 0000:03:00.0: fail wait other chan=0A[  238.739999] [drm] =
nouveau 0000:03:00.0: validate vram_list=0A[  238.740000] [drm] nouveau 0=
000:03:00.0: validate: -16=0A[  241.739998] [drm] nouveau 0000:03:00.0: f=
ail wait other chan=0A[  241.740001] [drm] nouveau 0000:03:00.0: validate=
 vram_list=0A[  241.740003] [drm] nouveau 0000:03:00.0: validate: -16=0A[=
  244.739997] [drm] nouveau 0000:03:00.0: fail wait other chan=0A[  244.7=
39999] [drm] nouveau 0000:03:00.0: validate vram_list=0A[  244.740000] [d=
rm] nouveau 0000:03:00.0: validate: -16=0A[  247.760941] [drm] nouveau 00=
00:01:00.0: nouveau_channel_free: freeing fifo 4=0A[  247.763871] [drm] n=
ouveau 0000:03:00.0: nouveau_channel_free: freeing fifo 4=0A[  250.759998=
] [drm] nouveau 0000:03:00.0: Failed to idle channel 4.=0A[  267.698858] =
[drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 2=0A[  267=
.701722] [drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 3=
=0A[  267.706478] [drm] nouveau 0000:03:00.0: nouveau_channel_free: freei=
ng fifo 2=0A[  270.700004] [drm] nouveau 0000:03:00.0: Failed to idle cha=
nnel 2.=0A[  270.703101] [drm] nouveau 0000:03:00.0: nouveau_channel_free=
: freeing fifo 3=0A[  273.700006] [drm] nouveau 0000:03:00.0: Failed to i=
dle channel 3.=0A[  274.653575] [drm] nouveau 0000:01:00.0: Allocating FI=
FO number 2=0A[  274.660479] [drm] nouveau 0000:01:00.0: nouveau_channel_=
alloc: initialised FIFO 2=0A[  274.677607] [drm] nouveau 0000:03:00.0: Al=
locating FIFO number 2=0A[  274.684464] [drm] nouveau 0000:03:00.0: nouve=
au_channel_alloc: initialised FIFO 2=0A[  274.696990] [drm] nouveau 0000:=
01:00.0: Allocating FIFO number 3=0A[  274.700261] [drm] nouveau 0000:01:=
00.0: nouveau_channel_alloc: initialised FIFO 3=0A[  274.701150] [drm] no=
uveau 0000:03:00.0: Allocating FIFO number 3=0A[  274.704389] [drm] nouve=
au 0000:03:00.0: nouveau_channel_alloc: initialised FIFO 3=0A[  292.55864=
6] [drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fifo 2=0A[  =
292.561427] [drm] nouveau 0000:01:00.0: nouveau_channel_free: freeing fif=
o 3=0A[  292.565736] [drm] nouveau 0000:03:00.0: nouveau_channel_free: fr=
eeing fifo 2=0A[  295.560004] [drm] nouveau 0000:03:00.0: Failed to idle =
channel 2.=0A[  295.563021] [drm] nouveau 0000:03:00.0: nouveau_channel_f=
ree: freeing fifo 3=0A[  298.559999] [drm] nouveau 0000:03:00.0: Failed t=
o idle channel 3.=0A[  299.493349] [drm] nouveau 0000:01:00.0: Allocating=
 FIFO number 2=0A[  299.500231] [drm] nouveau 0000:01:00.0: nouveau_chann=
el_alloc: initialised FIFO 2=0A[  299.517282] [drm] nouveau 0000:03:00.0:=
 Allocating FIFO number 2=0A[  299.524118] [drm] nouveau 0000:03:00.0: no=
uveau_channel_alloc: initialised FIFO 2=0A[  299.532493] [drm] nouveau 00=
00:01:00.0: Allocating FIFO number 3=0A[  299.535568] [drm] nouveau 0000:=
01:00.0: nouveau_channel_alloc: initialised FIFO 3=0A[  299.536411] [drm]=
 nouveau 0000:03:00.0: Allocating FIFO number 3=0A[  299.539444] [drm] no=
uveau 0000:03:00.0: nouveau_channel_alloc: initialised FIFO 3=0A

--_=__=_XaM3_.1275055336.2A.167770.42.3641.52.42.007.1275559720
Content-Type: text/plain;
	name="=?iso-8859-1?Q?xorg.conf?="
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="=?iso-8859-1?Q?xorg.conf?="

Section "ServerLayout"=0A    Identifier     "Default Layout"=0A    Screen=
      0  "Screen0" 0 0=0A    Screen      1  "Screen1" RightOf "Screen0"=0A=
    Option         "Xinerama" "0"=0AEndSection=0A=0ASection "Monitor"=0A =
   Identifier     "Monitor0"=0A    VendorName     "Unknown"=0A    ModelNa=
me      "LG L1960TR"=0A    HorizSync       30.0 - 71.0=0A    VertRefresh =
    56.0 - 75.0=0A    Option         "DPMS"=0AEndSection=0A=0ASection "Mo=
nitor"=0A    Identifier     "Monitor1"=0A    VendorName     "Unknown"=0A =
   ModelName      "LG FLATRON L1510S"=0A    HorizSync       31.0 - 63.0=0A=
    VertRefresh     56.0 - 75.0=0AEndSection=0A=0ASection "Device"=0A    =
    Identifier  "Card0"=0A        Driver      "nouveau"=0A        VendorN=
ame  "nVidia Corporation"=0A        BoardName   "GT200b [GeForce GTX 285]=
"=0A        BusID       "PCI:1:0:0"=0AEndSection=0A=0ASection "Device"=0A=
        Identifier  "Card1"=0A        Driver      "nouveau"=0A        Ven=
dorName  "nVidia Corporation"=0A        BoardName   "GT200b [GeForce GTX =
285]"=0A        BusID       "PCI:3:0:0"=0AEndSection=0A=0ASection "Screen=
"=0A        Identifier "Screen0"=0A        Device     "Card0"=0A        M=
onitor    "Monitor0"=0A        SubSection "Display"=0A                Vie=
wport   0 0=0A                Depth     24=0A        EndSubSection=0AEndS=
ection=0A=0ASection "Screen"=0A        Identifier "Screen1"=0A        Dev=
ice     "Card1"=0A        Monitor    "Monitor1"=0A        SubSection "Dis=
play"=0A                Viewport   0 0=0A                Depth 24=0A     =
   EndSubSection=0AEndSection=0A=0A

--_=__=_XaM3_.1275055336.2A.167770.42.3641.52.42.007.1275559720
Content-Type: text/x-log;
	name="=?iso-8859-1?Q?Xorg.0.log?="
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="=?iso-8859-1?Q?Xorg.0.log?="

[   298.603] =0AX.Org X Server 1.8.1=0ARelease Date: 2010-05-11=0A[   298=
.603] X Protocol Version 11, Revision 0=0A[   298.603] Build Operating Sy=
stem: Linux 2.6.24-27-xen x86_64 Ubuntu=0A[   298.603] Current Operating =
System: Linux alby 2.6.34-996-generic #201005111216 SMP Tue May 11 11:19:=
48 UTC 2010 x86_64=0A[   298.603] Kernel command line: BOOT_IMAGE=3D/boot=
/vmlinuz-2.6.34-996-generic root=3DUUID=3D3eff4e64-f5d9-40ee-a3b2-edad269=
e2316 ro quiet splash=0A[   298.603] Build Date: 21 May 2010  04:30:29PM=0A=
[   298.603] xorg-server 2:1.8.1+git20100521+server-1.8-branch.a8de0866-0=
ubuntu0sarvatt~lucid (Robert Hooker <sarvatt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>) =0A[   298.603]=
 Current version of pixman: 0.19.1=0A[   298.603] 	Before reporting probl=
ems, check http://wiki.x.org=0A	to make sure that you have the latest ver=
sion.=0A[   298.603] Markers: (--) probed, (**) from config file, (=3D=3D=
) default setting,=0A	(++) from command line, (!!) notice, (II) informati=
onal,=0A	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.=0A=
[   298.603] (=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Fri May 28 1=
5:44:47 2010=0A[   298.603] (=3D=3D) Using config file: "/etc/X11/xorg.co=
nf"=0A[   298.603] (=3D=3D) Using system config directory "/usr/share/X11=
/xorg.conf.d"=0A[   298.603] (=3D=3D) ServerLayout "Default Layout"=0A[  =
 298.603] (**) |-->Screen "Screen0" (0)=0A[   298.603] (**) |   |-->Monit=
or "Monitor0"=0A[   298.603] (**) |   |-->Device "Card0"=0A[   298.603] (=
**) |-->Screen "Screen1" (1)=0A[   298.603] (**) |   |-->Monitor "Monitor=
1"=0A[   298.603] (**) |   |-->Device "Card1"=0A[   298.603] (**) Option =
"Xinerama" "0"=0A[   298.603] (=3D=3D) Automatically adding devices=0A[  =
 298.603] (=3D=3D) Automatically enabling devices=0A[   298.603] (WW) The=
 directory "/usr/share/fonts/X11/cyrillic" does not exist.=0A[   298.603]=
 	Entry deleted from font path.=0A[   298.603] (=3D=3D) FontPath set to:=0A=
	/usr/share/fonts/X11/misc,=0A	/usr/share/fonts/X11/100dpi/:unscaled,=0A	=
/usr/share/fonts/X11/75dpi/:unscaled,=0A	/usr/share/fonts/X11/Type1,=0A	/=
usr/share/fonts/X11/100dpi,=0A	/usr/share/fonts/X11/75dpi,=0A	/var/lib/de=
foma/x-ttcidfont-conf.d/dirs/TrueType,=0A	built-ins=0A[   298.603] (=3D=3D=
) ModulePath set to "/usr/lib/xorg/extra-modules,/usr/lib/xorg/modules"=0A=
[   298.603] (II) The server relies on udev to provide the list of input =
devices.=0A	If no devices become available, reconfigure udev or disable A=
utoAddDevices.=0A[   298.603] (II) Loader magic: 0x7ce8c0=0A[   298.603] =
(II) Module ABI versions:=0A[   298.603] 	X.Org ANSI C Emulation: 0.4=0A[=
   298.603] 	X.Org Video Driver: 7.0=0A[   298.603] 	X.Org XInput driver =
: 9.0=0A[   298.603] 	X.Org Server Extension : 3.0=0A[   298.618] (--) PC=
I:*(0:1:0:0) 10de:05e3:0000:0000 nVidia Corporation GT200b [GeForce GTX 2=
85] rev 161, Mem @ 0xfc000000/16777216, 0xe0000000/268435456, 0xfa000000/=
33554432, I/O @ 0x0000dc00/128, BIOS @ 0x????????/524288=0A[   298.618] (=
--) PCI: (0:3:0:0) 10de:05e3:0000:0000 nVidia Corporation GT200b [GeForce=
 GTX 285] rev 161, Mem @ 0xf8000000/16777216, 0xd0000000/268435456, 0xf60=
00000/33554432, I/O @ 0x0000cc00/128, BIOS @ 0x????????/524288=0A[   298.=
618] (II) Open ACPI successful (/var/run/acpid.socket)=0A[   298.618] (II=
) LoadModule: "extmod"=0A[   298.618] (II) Loading /usr/lib/xorg/modules/=
extensions/libextmod.so=0A[   298.618] (II) Module extmod: vendor=3D"X.Or=
g Foundation"=0A[   298.618] 	compiled for 1.8.1, module version =3D 1.0.=
0=0A[   298.618] 	Module class: X.Org Server Extension=0A[   298.618] 	AB=
I class: X.Org Server Extension, version 3.0=0A[   298.618] (II) Loading =
extension MIT-SCREEN-SAVER=0A[   298.618] (II) Loading extension XFree86-=
VidModeExtension=0A[   298.618] (II) Loading extension XFree86-DGA=0A[   =
298.618] (II) Loading extension DPMS=0A[   298.618] (II) Loading extensio=
n XVideo=0A[   298.618] (II) Loading extension XVideo-MotionCompensation=0A=
[   298.618] (II) Loading extension X-Resource=0A[   298.618] (II) LoadMo=
dule: "dbe"=0A[   298.619] (II) Loading /usr/lib/xorg/modules/extensions/=
libdbe.so=0A[   298.619] (II) Module dbe: vendor=3D"X.Org Foundation"=0A[=
   298.619] 	compiled for 1.8.1, module version =3D 1.0.0=0A[   298.619] =
	Module class: X.Org Server Extension=0A[   298.619] 	ABI class: X.Org Se=
rver Extension, version 3.0=0A[   298.619] (II) Loading extension DOUBLE-=
BUFFER=0A[   298.619] (II) LoadModule: "glx"=0A[   298.619] (II) Loading =
/usr/lib/xorg/modules/extensions/libglx.so=0A[   298.619] (II) Module glx=
: vendor=3D"X.Org Foundation"=0A[   298.619] 	compiled for 1.8.1, module =
version =3D 1.0.0=0A[   298.619] 	ABI class: X.Org Server Extension, vers=
ion 3.0=0A[   298.619] (=3D=3D) AIGLX enabled=0A[   298.619] (II) Loading=
 extension GLX=0A[   298.619] (II) LoadModule: "record"=0A[   298.619] (I=
I) Loading /usr/lib/xorg/modules/extensions/librecord.so=0A[   298.619] (=
II) Module record: vendor=3D"X.Org Foundation"=0A[   298.619] 	compiled f=
or 1.8.1, module version =3D 1.13.0=0A[   298.619] 	Module class: X.Org S=
erver Extension=0A[   298.619] 	ABI class: X.Org Server Extension, versio=
n 3.0=0A[   298.619] (II) Loading extension RECORD=0A[   298.619] (II) Lo=
adModule: "dri"=0A[   298.619] (II) Loading /usr/lib/xorg/modules/extensi=
ons/libdri.so=0A[   298.619] (II) Module dri: vendor=3D"X.Org Foundation"=
=0A[   298.619] 	compiled for 1.8.1, module version =3D 1.0.0=0A[   298.6=
19] 	ABI class: X.Org Server Extension, version 3.0=0A[   298.619] (II) L=
oading extension XFree86-DRI=0A[   298.619] (II) LoadModule: "dri2"=0A[  =
 298.620] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so=0A[   =
298.620] (II) Module dri2: vendor=3D"X.Org Foundation"=0A[   298.620] 	co=
mpiled for 1.8.1, module version =3D 1.2.0=0A[   298.620] 	ABI class: X.O=
rg Server Extension, version 3.0=0A[   298.620] (II) Loading extension DR=
I2=0A[   298.620] (II) LoadModule: "nouveau"=0A[   298.620] (II) Loading =
/usr/lib/xorg/modules/drivers/nouveau_drv.so=0A[   298.620] (II) Module n=
ouveau: vendor=3D"X.Org Foundation"=0A[   298.620] 	compiled for 1.8.1, m=
odule version =3D 0.0.16=0A[   298.620] 	Module class: X.Org Video Driver=
=0A[   298.620] 	ABI class: X.Org Video Driver, version 7.0=0A[   298.620=
] (II) NOUVEAU driver =0A[   298.620] (II) NOUVEAU driver for NVIDIA chip=
set families :=0A[   298.620] 	RIVA TNT    (NV04)=0A[   298.620] 	RIVA TN=
T2   (NV05)=0A[   298.620] 	GeForce 256 (NV10)=0A[   298.620] 	GeForce 2 =
  (NV11, NV15)=0A[   298.620] 	GeForce 4MX (NV17, NV18)=0A[   298.620] 	G=
eForce 3   (NV20)=0A[   298.620] 	GeForce 4Ti (NV25, NV28)=0A[   298.620]=
 	GeForce FX  (NV3x)=0A[   298.620] 	GeForce 6   (NV4x)=0A[   298.620] 	G=
eForce 7   (G7x)=0A[   298.620] 	GeForce 8   (G8x)=0A[   298.620] (++) us=
ing VT number 7=0A=0A[   298.620] (II) Primary Device is: PCI 01@00:00:0=0A=
[   298.620] drmOpenDevice: node name is /dev/dri/card0=0A[   298.620] dr=
mOpenDevice: open result is 8, (OK)=0A[   298.620] drmOpenByBusid: Search=
ing for BusID pci:0000:01:00.0=0A[   298.620] drmOpenDevice: node name is=
 /dev/dri/card0=0A[   298.620] drmOpenDevice: open result is 8, (OK)=0A[ =
  298.620] drmOpenByBusid: drmOpenMinor returns 8=0A[   298.620] drmOpenB=
yBusid: drmGetBusid reports pci:0000:01:00.0=0A[   298.620] (II) [drm] no=
uveau interface version: 0.0.16=0A[   298.620] drmOpenDevice: node name i=
s /dev/dri/card0=0A[   298.620] drmOpenDevice: open result is 8, (OK)=0A[=
   298.620] drmOpenByBusid: Searching for BusID pci:0000:03:00.0=0A[   29=
8.620] drmOpenDevice: node name is /dev/dri/card0=0A[   298.620] drmOpenD=
evice: open result is 8, (OK)=0A[   298.620] drmOpenByBusid: drmOpenMinor=
 returns 8=0A[   298.620] drmOpenByBusid: drmGetBusid reports pci:0000:01=
:00.0=0A[   298.620] drmOpenDevice: node name is /dev/dri/card1=0A[   298=
.620] drmOpenDevice: open result is 8, (OK)=0A[   298.620] drmOpenByBusid=
: drmOpenMinor returns 8=0A[   298.620] drmOpenByBusid: drmGetBusid repor=
ts pci:0000:03:00.0=0A[   298.620] (II) [drm] nouveau interface version: =
0.0.16=0A[   298.620] (II) Loading sub module "dri"=0A[   298.620] (II) L=
oadModule: "dri"=0A[   298.621] (II) Reloading /usr/lib/xorg/modules/exte=
nsions/libdri.so=0A[   298.621] (II) NOUVEAU(0): Loaded DRI module=0A[   =
298.621] drmOpenDevice: node name is /dev/dri/card0=0A[   298.621] drmOpe=
nDevice: open result is 9, (OK)=0A[   298.621] drmOpenDevice: node name i=
s /dev/dri/card0=0A[   298.621] drmOpenDevice: open result is 9, (OK)=0A[=
   298.621] drmOpenByBusid: Searching for BusID pci:0000:01:00.0=0A[   29=
8.621] drmOpenDevice: node name is /dev/dri/card0=0A[   298.621] drmOpenD=
evice: open result is 9, (OK)=0A[   298.621] drmOpenByBusid: drmOpenMinor=
 returns 9=0A[   298.621] drmOpenByBusid: drmGetBusid reports pci:0000:01=
:00.0=0A[   298.621] (II) [drm] DRM interface version 1.3=0A[   298.621] =
(II) [drm] DRM open master succeeded.=0A[   298.621] (--) NOUVEAU(0): Chi=
pset: "NVIDIA NVa0"=0A[   298.621] (=3D=3D) NOUVEAU(0): Depth 24, (--) fr=
amebuffer bpp 32=0A[   298.621] (=3D=3D) NOUVEAU(0): RGB weight 888=0A[  =
 298.621] (=3D=3D) NOUVEAU(0): Default visual is TrueColor=0A[   298.621]=
 (=3D=3D) NOUVEAU(0): Using HW cursor=0A[   298.726] (II) NOUVEAU(0): Out=
put DVI-I-1 using monitor section Monitor0=0A[   298.823] (II) NOUVEAU(0)=
: Output VGA-1 has no monitor section=0A[   298.831] (II) NOUVEAU(0): Out=
put HDMI-1 has no monitor section=0A[   298.937] (II) NOUVEAU(0): EDID fo=
r output DVI-I-1=0A[   298.937] (II) NOUVEAU(0): Manufacturer: GSM  Model=
: 4b21  Serial#: 70272=0A[   298.937] (II) NOUVEAU(0): Year: 2007  Week: =
5=0A[   298.937] (II) NOUVEAU(0): EDID Version: 1.3=0A[   298.937] (II) N=
OUVEAU(0): Digital Display Input=0A[   298.937] (II) NOUVEAU(0): Max Imag=
e Size [cm]: horiz.: 38  vert.: 30=0A[   298.937] (II) NOUVEAU(0): Gamma:=
 2.20=0A[   298.937] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend =
Off=0A[   298.938] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 =
YCrCb 4:4:4 =0A[   298.938] (II) NOUVEAU(0): First detailed timing is pre=
ferred mode=0A[   298.938] (II) NOUVEAU(0): redX: 0.645 redY: 0.344   gre=
enX: 0.291 greenY: 0.604=0A[   298.938] (II) NOUVEAU(0): blueX: 0.149 blu=
eY: 0.130   whiteX: 0.312 whiteY: 0.328=0A[   298.938] (II) NOUVEAU(0): S=
upported established timings:=0A[   298.938] (II) NOUVEAU(0): 720x400@70H=
z=0A[   298.938] (II) NOUVEAU(0): 640x480@60Hz=0A[   298.938] (II) NOUVEA=
U(0): 640x480@75Hz=0A[   298.938] (II) NOUVEAU(0): 800x600@60Hz=0A[   298=
.938] (II) NOUVEAU(0): 800x600@75Hz=0A[   298.938] (II) NOUVEAU(0): 832x6=
24@75Hz=0A[   298.938] (II) NOUVEAU(0): 1024x768@60Hz=0A[   298.938] (II)=
 NOUVEAU(0): 1024x768@75Hz=0A[   298.938] (II) NOUVEAU(0): 1152x864@75Hz=0A=
[   298.938] (II) NOUVEAU(0): Manufacturer's mask: 0=0A[   298.938] (II) =
NOUVEAU(0): Supported standard timings:=0A[   298.938] (II) NOUVEAU(0): #=
0: hsize: 640  vsize 480  refresh: 75  vid: 20273=0A[   298.938] (II) NOU=
VEAU(0): #1: hsize: 800  vsize 600  refresh: 75  vid: 20293=0A[   298.938=
] (II) NOUVEAU(0): #2: hsize: 1024  vsize 768  refresh: 75  vid: 20321=0A=
[   298.938] (II) NOUVEAU(0): #3: hsize: 1280  vsize 1024  refresh: 60  v=
id: 32897=0A[   298.938] (II) NOUVEAU(0): Supported detailed timing:=0A[ =
  298.938] (II) NOUVEAU(0): clock: 108.0 MHz   Image Size:  376 x 301 mm=0A=
[   298.938] (II) NOUVEAU(0): h_active: 1280  h_sync: 1328  h_sync_end 14=
40 h_blank_end 1688 h_border: 0=0A[   298.938] (II) NOUVEAU(0): v_active:=
 1024  v_sync: 1025  v_sync_end 1028 v_blanking: 1066 v_border: 0=0A[   2=
98.938] (II) NOUVEAU(0): Ranges: V min: 56 V max: 75 Hz, H min: 30 H max:=
 71 kHz, PixClock max 110 MHz=0A[   298.938] (II) NOUVEAU(0): Monitor nam=
e: L1960TR=0A[   298.938] (II) NOUVEAU(0): Monitor name: =0A[   298.938] =
(II) NOUVEAU(0): EDID (in hex):=0A[   298.938] (II) NOUVEAU(0): 	00ffffff=
ffffff001e6d214b80120100=0A[   298.938] (II) NOUVEAU(0): 	05110103ee261e7=
8ea0a50a5584a9a26=0A[   298.938] (II) NOUVEAU(0): 	215054a56a80314f454f61=
4f81800101=0A[   298.938] (II) NOUVEAU(0): 	010101010101302a009851002a403=
070=0A[   298.938] (II) NOUVEAU(0): 	1300782d1100001e000000fd00384b1e=0A[=
   298.938] (II) NOUVEAU(0): 	470b000a202020202020000000fc004c=0A[   298.=
938] (II) NOUVEAU(0): 	3139363054520a2020202020000000fc=0A[   298.938] (I=
I) NOUVEAU(0): 	000a2020202020202020202020200070=0A[   298.938] (II) NOUV=
EAU(0): EDID vendor "GSM", prod id 19233=0A[   298.938] (II) NOUVEAU(0): =
Using hsync ranges from config file=0A[   298.938] (II) NOUVEAU(0): Using=
 vrefresh ranges from config file=0A[   298.938] (II) NOUVEAU(0): Printin=
g DDC gathered Modelines:=0A[   298.938] (II) NOUVEAU(0): Modeline "1280x=
1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync=
 (64.0 kHz)=0A[   298.938] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.0=
0  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)=0A[   298.9=
39] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480=
 481 484 500 -hsync -vsync (37.5 kHz)=0A[   298.939] (II) NOUVEAU(0): Mod=
eline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsy=
nc (31.5 kHz)=0A[   298.939] (II) NOUVEAU(0): Modeline "720x400"x0.0   28=
.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)=0A[   298.=
939] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 131=
2  768 769 772 800 +hsync +vsync (60.0 kHz)=0A[   298.939] (II) NOUVEAU(0=
): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 =
-hsync -vsync (48.4 kHz)=0A[   298.939] (II) NOUVEAU(0): Modeline "832x62=
4"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz=
)=0A[   298.939] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816=
 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)=0A[   298.939] (II) N=
OUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 =
868 900 +hsync +vsync (67.5 kHz)=0A[   298.939] (II) NOUVEAU(0): Printing=
 probed modes for output DVI-I-1=0A[   298.939] (II) NOUVEAU(0): Modeline=
 "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsyn=
c +vsync (64.0 kHz)=0A[   298.939] (II) NOUVEAU(0): Modeline "1152x864"x7=
5.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz=
)=0A[   298.939] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 =
1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz)=0A[   298.939] (=
II) NOUVEAU(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  76=
8 769 772 800 +hsync +vsync (60.0 kHz)=0A[   298.939] (II) NOUVEAU(0): Mo=
deline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsy=
nc -vsync (48.4 kHz)=0A[   298.939] (II) NOUVEAU(0): Modeline "832x624"x7=
4.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)=0A=
[   298.939] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 89=
6 1056  600 601 604 625 +hsync +vsync (46.9 kHz)=0A[   298.939] (II) NOUV=
EAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 62=
8 +hsync +vsync (37.9 kHz)=0A[   298.939] (II) NOUVEAU(0): Modeline "640x=
480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 k=
Hz)=0A[   298.939] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 =
656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)=0A[   298.939] (II)=
 NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 41=
4 449 -hsync +vsync (31.5 kHz)=0A[   299.037] (II) NOUVEAU(0): EDID for o=
utput VGA-1=0A[   299.045] (II) NOUVEAU(0): EDID for output HDMI-1=0A[   =
299.045] (II) NOUVEAU(0): Output DVI-I-1 connected=0A[   299.045] (II) NO=
UVEAU(0): Output VGA-1 disconnected=0A[   299.045] (II) NOUVEAU(0): Outpu=
t HDMI-1 disconnected=0A[   299.045] (II) NOUVEAU(0): Using exact sizes f=
or initial modes=0A[   299.045] (II) NOUVEAU(0): Output DVI-I-1 using ini=
tial mode 1280x1024=0A[   299.045] (II) NOUVEAU(0): Using default gamma o=
f (1.0, 1.0, 1.0) unless otherwise stated.=0A[   299.045] (--) NOUVEAU(0)=
: Virtual size is 1280x1024 (pitch 1280)=0A[   299.045] (**) NOUVEAU(0): =
 Driver mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz), 64.0 kHz, 60.0=
 Hz=0A[   299.045] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  12=
80 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)=0A[   299=
.045] (**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled from 0.=
0 MHz), 67.5 kHz, 75.0 Hz=0A[   299.045] (II) NOUVEAU(0): Modeline "1152x=
864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67=
.5 kHz)=0A[   299.045] (**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz=
 (scaled from 0.0 MHz), 60.1 kHz, 75.1 Hz=0A[   299.045] (II) NOUVEAU(0):=
 Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769 772 800 +=
hsync +vsync (60.1 kHz)=0A[   299.045] (**) NOUVEAU(0):  Driver mode "102=
4x768": 78.8 MHz (scaled from 0.0 MHz), 60.0 kHz, 75.0 Hz=0A[   299.045] =
(II) NOUVEAU(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  7=
68 769 772 800 +hsync +vsync (60.0 kHz)=0A[   299.045] (**) NOUVEAU(0):  =
Driver mode "1024x768": 65.0 MHz (scaled from 0.0 MHz), 48.4 kHz, 60.0 Hz=
=0A[   299.045] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1=
048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)=0A[   299.045] (*=
*) NOUVEAU(0):  Driver mode "832x624": 57.3 MHz (scaled from 0.0 MHz), 49=
.7 kHz, 74.6 Hz=0A[   299.045] (II) NOUVEAU(0): Modeline "832x624"x74.6  =
 57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)=0A[   =
299.045] (**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 0=
.0 MHz), 46.9 kHz, 75.0 Hz=0A[   299.045] (II) NOUVEAU(0): Modeline "800x=
600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 =
kHz)=0A[   299.045] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (sc=
aled from 0.0 MHz), 37.9 kHz, 60.3 Hz=0A[   299.045] (II) NOUVEAU(0): Mod=
eline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +v=
sync (37.9 kHz)=0A[   299.045] (**) NOUVEAU(0):  Driver mode "640x480": 3=
1.5 MHz (scaled from 0.0 MHz), 37.5 kHz, 75.0 Hz=0A[   299.045] (II) NOUV=
EAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500=
 -hsync -vsync (37.5 kHz)=0A[   299.045] (**) NOUVEAU(0):  Driver mode "6=
40x480": 25.2 MHz (scaled from 0.0 MHz), 31.5 kHz, 60.0 Hz=0A[   299.045]=
 (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 4=
90 492 525 -hsync -vsync (31.5 kHz)=0A[   299.045] (**) NOUVEAU(0):  Driv=
er mode "720x400": 28.3 MHz (scaled from 0.0 MHz), 31.5 kHz, 70.1 Hz=0A[ =
  299.045] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 =
900  400 412 414 449 -hsync +vsync (31.5 kHz)=0A[   299.045] (**) NOUVEAU=
(0): Display dimensions: (380, 300) mm=0A[   299.045] (**) NOUVEAU(0): DP=
I set to (85, 86)=0A[   299.045] (II) Loading sub module "wfb"=0A[   299.=
045] (II) LoadModule: "wfb"=0A[   299.046] (II) Loading /usr/lib/xorg/mod=
ules/libwfb.so=0A[   299.047] (II) Module wfb: vendor=3D"X.Org Foundation=
"=0A[   299.047] 	compiled for 1.8.1, module version =3D 1.0.0=0A[   299.=
047] 	ABI class: X.Org ANSI C Emulation, version 0.4=0A[   299.047] (II) =
Loading sub module "fb"=0A[   299.047] (II) LoadModule: "fb"=0A[   299.04=
7] (II) Loading /usr/lib/xorg/modules/libfb.so=0A[   299.048] (II) Module=
 fb: vendor=3D"X.Org Foundation"=0A[   299.048] 	compiled for 1.8.1, modu=
le version =3D 1.0.0=0A[   299.048] 	ABI class: X.Org ANSI C Emulation, v=
ersion 0.4=0A[   299.048] (II) Loading sub module "exa"=0A[   299.048] (I=
I) LoadModule: "exa"=0A[   299.048] (II) Loading /usr/lib/xorg/modules/li=
bexa.so=0A[   299.049] (II) Module exa: vendor=3D"X.Org Foundation"=0A[  =
 299.049] 	compiled for 1.8.1, module version =3D 2.5.0=0A[   299.049] 	A=
BI class: X.Org Video Driver, version 7.0=0A[   299.049] (II) Loading sub=
 module "shadowfb"=0A[   299.049] (II) LoadModule: "shadowfb"=0A[   299.0=
49] (II) Loading /usr/lib/xorg/modules/libshadowfb.so=0A[   299.049] (II)=
 Module shadowfb: vendor=3D"X.Org Foundation"=0A[   299.049] 	compiled fo=
r 1.8.1, module version =3D 1.0.0=0A[   299.049] 	ABI class: X.Org ANSI C=
 Emulation, version 0.4=0A[   299.049] (II) Loading sub module "dri"=0A[ =
  299.050] (II) LoadModule: "dri"=0A[   299.050] (II) Reloading /usr/lib/=
xorg/modules/extensions/libdri.so=0A[   299.050] (II) NOUVEAU(1): Loaded =
DRI module=0A[   299.050] drmOpenDevice: node name is /dev/dri/card0=0A[ =
  299.050] drmOpenDevice: open result is 10, (OK)=0A[   299.050] drmOpenD=
evice: node name is /dev/dri/card0=0A[   299.050] drmOpenDevice: open res=
ult is 10, (OK)=0A[   299.050] drmOpenByBusid: Searching for BusID pci:00=
00:03:00.0=0A[   299.050] drmOpenDevice: node name is /dev/dri/card0=0A[ =
  299.050] drmOpenDevice: open result is 10, (OK)=0A[   299.050] drmOpenB=
yBusid: drmOpenMinor returns 10=0A[   299.050] drmOpenByBusid: drmGetBusi=
d reports pci:0000:01:00.0=0A[   299.051] drmOpenDevice: node name is /de=
v/dri/card1=0A[   299.051] drmOpenDevice: open result is 10, (OK)=0A[   2=
99.051] drmOpenByBusid: drmOpenMinor returns 10=0A[   299.051] drmOpenByB=
usid: drmGetBusid reports pci:0000:03:00.0=0A[   299.051] (II) [drm] DRM =
interface version 1.3=0A[   299.051] (II) [drm] DRM open master succeeded=
.=0A[   299.051] (--) NOUVEAU(1): Chipset: "NVIDIA NVa0"=0A[   299.051] (=
=3D=3D) NOUVEAU(1): Depth 24, (--) framebuffer bpp 32=0A[   299.051] (=3D=
=3D) NOUVEAU(1): RGB weight 888=0A[   299.051] (=3D=3D) NOUVEAU(1): Defau=
lt visual is TrueColor=0A[   299.051] (=3D=3D) NOUVEAU(1): Using HW curso=
r=0A[   299.156] (II) NOUVEAU(1): Output DVI-I-2 using monitor section Mo=
nitor1=0A[   299.261] (II) NOUVEAU(1): Output VGA-2 has no monitor sectio=
n=0A[   299.269] (II) NOUVEAU(1): Output HDMI-2 has no monitor section=0A=
[   299.374] (II) NOUVEAU(1): EDID for output DVI-I-2=0A[   299.480] (II)=
 NOUVEAU(1): EDID for output VGA-2=0A[   299.480] (II) NOUVEAU(1): Manufa=
cturer: GSM  Model: 3b55  Serial#: 55787=0A[   299.480] (II) NOUVEAU(1): =
Year: 2003  Week: 2=0A[   299.480] (II) NOUVEAU(1): EDID Version: 1.3=0A[=
   299.480] (II) NOUVEAU(1): Analog Display Input,  Input Voltage Level: =
0.714/0.286 V=0A[   299.480] (II) NOUVEAU(1): Sync:  Separate=0A[   299.4=
80] (II) NOUVEAU(1): Max Image Size [cm]: horiz.: 30  vert.: 23=0A[   299=
.480] (II) NOUVEAU(1): Gamma: 2.20=0A[   299.480] (II) NOUVEAU(1): DPMS c=
apabilities: StandBy Suspend Off; RGB/Color Display=0A[   299.480] (II) N=
OUVEAU(1): First detailed timing is preferred mode=0A[   299.480] (II) NO=
UVEAU(1): redX: 0.631 redY: 0.347   greenX: 0.309 greenY: 0.583=0A[   299=
.480] (II) NOUVEAU(1): blueX: 0.149 blueY: 0.113   whiteX: 0.313 whiteY: =
0.329=0A[   299.480] (II) NOUVEAU(1): Supported established timings:=0A[ =
  299.480] (II) NOUVEAU(1): 720x400@70Hz=0A[   299.480] (II) NOUVEAU(1): =
640x480@60Hz=0A[   299.480] (II) NOUVEAU(1): 640x480@67Hz=0A[   299.480] =
(II) NOUVEAU(1): 640x480@72Hz=0A[   299.480] (II) NOUVEAU(1): 640x480@75H=
z=0A[   299.480] (II) NOUVEAU(1): 800x600@56Hz=0A[   299.480] (II) NOUVEA=
U(1): 800x600@60Hz=0A[   299.480] (II) NOUVEAU(1): 800x600@72Hz=0A[   299=
.480] (II) NOUVEAU(1): 800x600@75Hz=0A[   299.480] (II) NOUVEAU(1): 832x6=
24@75Hz=0A[   299.480] (II) NOUVEAU(1): 1024x768@60Hz=0A[   299.480] (II)=
 NOUVEAU(1): 1024x768@70Hz=0A[   299.480] (II) NOUVEAU(1): 1024x768@75Hz=0A=
[   299.480] (II) NOUVEAU(1): Manufacturer's mask: 0=0A[   299.480] (II) =
NOUVEAU(1): Supported standard timings:=0A[   299.480] (II) NOUVEAU(1): #=
0: hsize: 640  vsize 480  refresh: 75  vid: 20273=0A[   299.480] (II) NOU=
VEAU(1): #1: hsize: 800  vsize 600  refresh: 75  vid: 20293=0A[   299.480=
] (II) NOUVEAU(1): #2: hsize: 1024  vsize 768  refresh: 75  vid: 20321=0A=
[   299.480] (II) NOUVEAU(1): Supported detailed timing:=0A[   299.480] (=
II) NOUVEAU(1): clock: 65.0 MHz   Image Size:  304 x 228 mm=0A[   299.480=
] (II) NOUVEAU(1): h_active: 1024  h_sync: 1048  h_sync_end 1184 h_blank_=
end 1344 h_border: 0=0A[   299.480] (II) NOUVEAU(1): v_active: 768  v_syn=
c: 771  v_sync_end 777 v_blanking: 806 v_border: 0=0A[   299.481] (II) NO=
UVEAU(1): Ranges: V min: 56 V max: 75 Hz, H min: 31 H max: 63 kHz, PixClo=
ck max 80 MHz=0A[   299.481] (II) NOUVEAU(1): Monitor name: FLATRON L1510=
=0A[   299.481] (II) NOUVEAU(1): Monitor name: S=0A[   299.481] (II) NOUV=
EAU(1): EDID (in hex):=0A[   299.481] (II) NOUVEAU(1): 	00ffffffffffff001=
e6d553bebd90000=0A[   299.481] (II) NOUVEAU(1): 	020d0103281e1778eab145a1=
584f9526=0A[   299.481] (II) NOUVEAU(1): 	1d5054bfee00314f454f614f0101010=
1=0A[   299.481] (II) NOUVEAU(1): 	01010101010164190040410026301888=0A[  =
 299.481] (II) NOUVEAU(1): 	360030e410000018000000fd00384b1f=0A[   299.48=
1] (II) NOUVEAU(1): 	3f08000a202020202020000000fc0046=0A[   299.481] (II)=
 NOUVEAU(1): 	4c4154524f4e204c31353130000000fc=0A[   299.481] (II) NOUVEA=
U(1): 	00530a2020202020202020202020000c=0A[   299.481] (II) NOUVEAU(1): P=
rinting probed modes for output VGA-2=0A[   299.481] (II) NOUVEAU(1): Mod=
eline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsyn=
c -vsync (48.4 kHz)=0A[   299.481] (II) NOUVEAU(1): Modeline "1024x768"x7=
5.1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz=
)=0A[   299.481] (II) NOUVEAU(1): Modeline "1024x768"x75.0   78.75  1024 =
1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)=0A[   299.481] (=
II) NOUVEAU(1): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  76=
8 771 777 806 -hsync -vsync (56.5 kHz)=0A[   299.481] (II) NOUVEAU(1): Mo=
deline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -=
vsync (49.7 kHz)=0A[   299.481] (II) NOUVEAU(1): Modeline "800x600"x72.2 =
  50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)=0A[  =
 299.481] (II) NOUVEAU(1): Modeline "800x600"x75.0   49.50  800 816 896 1=
056  600 601 604 625 +hsync +vsync (46.9 kHz)=0A[   299.481] (II) NOUVEAU=
(1): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +=
hsync +vsync (37.9 kHz)=0A[   299.481] (II) NOUVEAU(1): Modeline "800x600=
"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz=
)=0A[   299.481] (II) NOUVEAU(1): Modeline "640x480"x72.8   31.50  640 66=
4 704 832  480 489 491 520 -hsync -vsync (37.9 kHz)=0A[   299.481] (II) N=
OUVEAU(1): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 =
500 -hsync -vsync (37.5 kHz)=0A[   299.481] (II) NOUVEAU(1): Modeline "64=
0x480"x66.7   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0=
 kHz)=0A[   299.481] (II) NOUVEAU(1): Modeline "640x480"x60.0   25.20  64=
0 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)=0A[   299.481] (I=
I) NOUVEAU(1): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 =
414 449 -hsync +vsync (31.5 kHz)=0A[   299.489] (II) NOUVEAU(1): EDID for=
 output HDMI-2=0A[   299.489] (II) NOUVEAU(1): Output DVI-I-2 disconnecte=
d=0A[   299.489] (II) NOUVEAU(1): Output VGA-2 connected=0A[   299.489] (=
II) NOUVEAU(1): Output HDMI-2 disconnected=0A[   299.489] (II) NOUVEAU(1)=
: Using exact sizes for initial modes=0A[   299.489] (II) NOUVEAU(1): Out=
put VGA-2 using initial mode 1024x768=0A[   299.489] (II) NOUVEAU(1): Usi=
ng default gamma of (1.0, 1.0, 1.0) unless otherwise stated.=0A[   299.48=
9] (--) NOUVEAU(1): Virtual size is 1024x768 (pitch 1024)=0A[   299.489] =
(**) NOUVEAU(1):  Driver mode "1024x768": 65.0 MHz (scaled from 0.0 MHz),=
 48.4 kHz, 60.0 Hz=0A[   299.489] (II) NOUVEAU(1): Modeline "1024x768"x60=
.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)=
=0A[   299.489] (**) NOUVEAU(1):  Driver mode "1024x768": 78.8 MHz (scale=
d from 0.0 MHz), 60.1 kHz, 75.1 Hz=0A[   299.489] (II) NOUVEAU(1): Modeli=
ne "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +=
vsync (60.1 kHz)=0A[   299.489] (**) NOUVEAU(1):  Driver mode "1024x768":=
 78.8 MHz (scaled from 0.0 MHz), 60.0 kHz, 75.0 Hz=0A[   299.489] (II) NO=
UVEAU(1): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768 769 =
772 800 +hsync +vsync (60.0 kHz)=0A[   299.489] (**) NOUVEAU(1):  Driver =
mode "1024x768": 75.0 MHz (scaled from 0.0 MHz), 56.5 kHz, 70.1 Hz=0A[   =
299.489] (II) NOUVEAU(1): Modeline "1024x768"x70.1   75.00  1024 1048 118=
4 1328  768 771 777 806 -hsync -vsync (56.5 kHz)=0A[   299.489] (**) NOUV=
EAU(1):  Driver mode "832x624": 57.3 MHz (scaled from 0.0 MHz), 49.7 kHz,=
 74.6 Hz=0A[   299.489] (II) NOUVEAU(1): Modeline "832x624"x74.6   57.28 =
 832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)=0A[   299.489=
] (**) NOUVEAU(1):  Driver mode "800x600": 50.0 MHz (scaled from 0.0 MHz)=
, 48.1 kHz, 72.2 Hz=0A[   299.489] (II) NOUVEAU(1): Modeline "800x600"x72=
.2   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)=0A=
[   299.489] (**) NOUVEAU(1):  Driver mode "800x600": 49.5 MHz (scaled fr=
om 0.0 MHz), 46.9 kHz, 75.0 Hz=0A[   299.489] (II) NOUVEAU(1): Modeline "=
800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (4=
6.9 kHz)=0A[   299.489] (**) NOUVEAU(1):  Driver mode "800x600": 40.0 MHz=
 (scaled from 0.0 MHz), 37.9 kHz, 60.3 Hz=0A[   299.490] (II) NOUVEAU(1):=
 Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsyn=
c +vsync (37.9 kHz)=0A[   299.490] (**) NOUVEAU(1):  Driver mode "800x600=
": 36.0 MHz (scaled from 0.0 MHz), 35.2 kHz, 56.2 Hz=0A[   299.490] (II) =
NOUVEAU(1): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 60=
3 625 +hsync +vsync (35.2 kHz)=0A[   299.490] (**) NOUVEAU(1):  Driver mo=
de "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.9 kHz, 72.8 Hz=0A[   299=
.490] (II) NOUVEAU(1): Modeline "640x480"x72.8   31.50  640 664 704 832  =
480 489 491 520 -hsync -vsync (37.9 kHz)=0A[   299.490] (**) NOUVEAU(1): =
 Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.5 kHz, 75.0 Hz=
=0A[   299.490] (II) NOUVEAU(1): Modeline "640x480"x75.0   31.50  640 656=
 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)=0A[   299.490] (**) NO=
UVEAU(1):  Driver mode "640x480": 30.2 MHz (scaled from 0.0 MHz), 35.0 kH=
z, 66.7 Hz=0A[   299.490] (II) NOUVEAU(1): Modeline "640x480"x66.7   30.2=
4  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)=0A[   299.49=
0] (**) NOUVEAU(1):  Driver mode "640x480": 25.2 MHz (scaled from 0.0 MHz=
), 31.5 kHz, 60.0 Hz=0A[   299.490] (II) NOUVEAU(1): Modeline "640x480"x6=
0.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)=0A=
[   299.490] (**) NOUVEAU(1):  Driver mode "720x400": 28.3 MHz (scaled fr=
om 0.0 MHz), 31.5 kHz, 70.1 Hz=0A[   299.490] (II) NOUVEAU(1): Modeline "=
720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31=
.5 kHz)=0A[   299.490] (=3D=3D) NOUVEAU(1): DPI set to (96, 96)=0A[   299=
.490] (II) Loading sub module "wfb"=0A[   299.490] (II) LoadModule: "wfb"=
=0A[   299.491] (II) Reloading /usr/lib/xorg/modules/libwfb.so=0A[   299.=
491] (II) Loading sub module "fb"=0A[   299.491] (II) LoadModule: "fb"=0A=
[   299.491] (II) Reloading /usr/lib/xorg/modules/libfb.so=0A[   299.491]=
 (II) Loading sub module "exa"=0A[   299.491] (II) LoadModule: "exa"=0A[ =
  299.492] (II) Reloading /usr/lib/xorg/modules/libexa.so=0A[   299.492] =
(II) Loading sub module "shadowfb"=0A[   299.492] (II) LoadModule: "shado=
wfb"=0A[   299.493] (II) Reloading /usr/lib/xorg/modules/libshadowfb.so=0A=
[   299.493] (--) Depth 24 pixmap format is 32 bpp=0A[   299.500] (II) NO=
UVEAU(0): Opened GPU channel 2=0A[   299.500] (II) NOUVEAU(0): [DRI2] Set=
up complete=0A[   299.500] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau=0A=
[   299.500] (II) NOUVEAU(0): GART: 512MiB available=0A[   299.504] (II) =
NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer=0A[   299.504] (II)=
 EXA(0): Driver allocated offscreen pixmaps=0A[   299.504] (II) EXA(0): D=
river registered support for the following operations:=0A[   299.504] (II=
)         Solid=0A[   299.504] (II)         Copy=0A[   299.504] (II)     =
    Composite (RENDER acceleration)=0A[   299.504] (II)         UploadToS=
creen=0A[   299.504] (II)         DownloadFromScreen=0A[   299.504] (=3D=3D=
) NOUVEAU(0): Backing store disabled=0A[   299.504] (=3D=3D) NOUVEAU(0): =
Silken mouse enabled=0A[   299.505] (II) NOUVEAU(0): [XvMC] Associated wi=
th Nouveau GeForce 8/9 Textured Video.=0A[   299.505] (II) NOUVEAU(0): [X=
vMC] Extension initialized.=0A[   299.516] (II) NOUVEAU(0): NVEnterVT is =
called.=0A[   299.516] (**) NOUVEAU(0): DPMS enabled=0A[   299.516] (II) =
NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled messag=
e.=0A[   299.517] (--) RandR disabled=0A[   299.524] (II) NOUVEAU(1): Ope=
ned GPU channel 2=0A[   299.524] (II) NOUVEAU(1): [DRI2] Setup complete=0A=
[   299.524] (II) NOUVEAU(1): [DRI2]   DRI driver: nouveau=0A[   299.524]=
 (II) NOUVEAU(1): GART: 512MiB available=0A[   299.525] (II) NOUVEAU(1): =
GART: Allocated 16MiB as a scratch buffer=0A[   299.525] (II) EXA(1): Dri=
ver allocated offscreen pixmaps=0A[   299.525] (II) EXA(1): Driver regist=
ered support for the following operations:=0A[   299.525] (II)         So=
lid=0A[   299.525] (II)         Copy=0A[   299.525] (II)         Composit=
e (RENDER acceleration)=0A[   299.525] (II)         UploadToScreen=0A[   =
299.525] (II)         DownloadFromScreen=0A[   299.525] (=3D=3D) NOUVEAU(=
1): Backing store disabled=0A[   299.525] (=3D=3D) NOUVEAU(1): Silken mou=
se enabled=0A[   299.525] (II) NOUVEAU(1): [XvMC] Associated with Nouveau=
 GeForce 8/9 Textured Video.=0A[   299.525] (II) NOUVEAU(1): [XvMC] Exten=
sion initialized.=0A[   299.525] (II) NOUVEAU(1): NVEnterVT is called.=0A=
[   299.525] (=3D=3D) NOUVEAU(1): DPMS enabled=0A[   299.525] (II) NOUVEA=
U(1): RandR 1.2 enabled, ignore the following RandR disabled message.=0A[=
   299.525] (--) RandR disabled=0A[   299.525] (II) Initializing built-in=
 extension Generic Event Extension=0A[   299.525] (II) Initializing built=
-in extension SHAPE=0A[   299.525] (II) Initializing built-in extension M=
IT-SHM=0A[   299.525] (II) Initializing built-in extension XInputExtensio=
n=0A[   299.525] (II) Initializing built-in extension XTEST=0A[   299.525=
] (II) Initializing built-in extension BIG-REQUESTS=0A[   299.525] (II) I=
nitializing built-in extension SYNC=0A[   299.525] (II) Initializing buil=
t-in extension XKEYBOARD=0A[   299.525] (II) Initializing built-in extens=
ion XC-MISC=0A[   299.525] (II) Initializing built-in extension SECURITY=0A=
[   299.525] (II) Initializing built-in extension XINERAMA=0A[   299.525]=
 (II) Initializing built-in extension XFIXES=0A[   299.525] (II) Initiali=
zing built-in extension RENDER=0A[   299.525] (II) Initializing built-in =
extension RANDR=0A[   299.525] (II) Initializing built-in extension COMPO=
SITE=0A[   299.525] (II) Initializing built-in extension DAMAGE=0A[   299=
.536] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer=0A[   299.536] (II) AI=
GLX: enabled GLX_INTEL_swap_event=0A[   299.536] (II) AIGLX: enabled GLX_=
SGI_make_current_read=0A[   299.536] (II) AIGLX: GLX_EXT_texture_from_pix=
map backed by buffer objects=0A[   299.536] (II) AIGLX: Loaded and initia=
lized /usr/lib/dri/nouveau_dri.so=0A[   299.536] (II) GLX: Initialized DR=
I2 GL provider for screen 0=0A[   299.539] (II) AIGLX: enabled GLX_MESA_c=
opy_sub_buffer=0A[   299.539] (II) AIGLX: enabled GLX_INTEL_swap_event=0A=
[   299.539] (II) AIGLX: enabled GLX_SGI_make_current_read=0A[   299.539]=
 (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objects=0A[   2=
99.540] (II) AIGLX: Loaded and initialized /usr/lib/dri/nouveau_dri.so=0A=
[   299.540] (II) GLX: Initialized DRI2 GL provider for screen 1=0A[   29=
9.540] (II) NOUVEAU(0): Setting screen physical size to 338 x 270=0A[   2=
99.540] resize called 1280 1024=0A[   299.540] (II) NOUVEAU(1): Setting s=
creen physical size to 270 x 203=0A[   299.540] resize called 1024 768=0A=
[   299.577] (II) config/udev: Adding input device Power Button (/dev/inp=
ut/event1)=0A[   299.577] (**) Power Button: Applying InputClass "evdev k=
eyboard catchall"=0A[   299.577] (II) LoadModule: "evdev"=0A[   299.577] =
(II) Loading /usr/lib/xorg/modules/input/evdev_drv.so=0A[   299.577] (II)=
 Module evdev: vendor=3D"X.Org Foundation"=0A[   299.577] 	compiled for 1=
.8.0.902, module version =3D 2.4.0=0A[   299.577] 	Module class: X.Org XI=
nput Driver=0A[   299.577] 	ABI class: X.Org XInput driver, version 9.0=0A=
[   299.577] (**) Power Button: always reports core events=0A[   299.577]=
 (**) Power Button: Device: "/dev/input/event1"=0A[   299.652] (--) Power=
 Button: Found keys=0A[   299.652] (II) Power Button: Configuring as keyb=
oard=0A[   299.652] (II) XINPUT: Adding extended input device "Power Butt=
on" (type: KEYBOARD)=0A[   299.652] (**) Option "xkb_rules" "evdev"=0A[  =
 299.652] (**) Option "xkb_model" "pc105"=0A[   299.652] (**) Option "xkb=
_layout" "it"=0A[   299.721] (II) config/udev: Adding input device Power =
Button (/dev/input/event0)=0A[   299.721] (**) Power Button: Applying Inp=
utClass "evdev keyboard catchall"=0A[   299.722] (**) Power Button: alway=
s reports core events=0A[   299.722] (**) Power Button: Device: "/dev/inp=
ut/event0"=0A[   299.762] (--) Power Button: Found keys=0A[   299.762] (I=
I) Power Button: Configuring as keyboard=0A[   299.762] (II) XINPUT: Addi=
ng extended input device "Power Button" (type: KEYBOARD)=0A[   299.762] (=
**) Option "xkb_rules" "evdev"=0A[   299.762] (**) Option "xkb_model" "pc=
105"=0A[   299.762] (**) Option "xkb_layout" "it"=0A[   299.767] (II) con=
fig/udev: Adding input device Microsoft Microsoft 3-Button Mouse with Int=
elliEye(TM) (/dev/input/event3)=0A[   299.767] (**) Microsoft Microsoft 3=
-Button Mouse with IntelliEye(TM): Applying InputClass "evdev pointer cat=
chall"=0A[   299.767] (**) Microsoft Microsoft 3-Button Mouse with Intell=
iEye(TM): always reports core events=0A[   299.767] (**) Microsoft Micros=
oft 3-Button Mouse with IntelliEye(TM): Device: "/dev/input/event3"=0A[  =
 299.802] (--) Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): Fo=
und 3 mouse buttons=0A[   299.802] (--) Microsoft Microsoft 3-Button Mous=
e with IntelliEye(TM): Found scroll wheel(s)=0A[   299.802] (--) Microsof=
t Microsoft 3-Button Mouse with IntelliEye(TM): Found relative axes=0A[  =
 299.802] (--) Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): Fo=
und x and y relative axes=0A[   299.802] (II) Microsoft Microsoft 3-Butto=
n Mouse with IntelliEye(TM): Configuring as mouse=0A[   299.802] (**) Mic=
rosoft Microsoft 3-Button Mouse with IntelliEye(TM): YAxisMapping: button=
s 4 and 5=0A[   299.802] (**) Microsoft Microsoft 3-Button Mouse with Int=
elliEye(TM): EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheel=
Timeout: 200=0A[   299.802] (II) XINPUT: Adding extended input device "Mi=
crosoft Microsoft 3-Button Mouse with IntelliEye(TM)" (type: MOUSE)=0A[  =
 299.802] (**) Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): (a=
ccel) keeping acceleration scheme 1=0A[   299.803] (**) Microsoft Microso=
ft 3-Button Mouse with IntelliEye(TM): (accel) acceleration profile 0=0A[=
   299.803] (**) Microsoft Microsoft 3-Button Mouse with IntelliEye(TM): =
(accel) acceleration factor: 2.000=0A[   299.803] (**) Microsoft Microsof=
t 3-Button Mouse with IntelliEye(TM): (accel) acceleration threshold: 4=0A=
[   299.803] (II) Microsoft Microsoft 3-Button Mouse with IntelliEye(TM):=
 initialized for relative axes.=0A[   299.803] (II) config/udev: Adding i=
nput device Microsoft Microsoft 3-Button Mouse with IntelliEye(TM) (/dev/=
input/mouse0)=0A[   299.803] (II) No input driver/identifier specified (i=
gnoring)=0A[   299.806] (II) config/udev: Adding input device Logitech Lo=
gitech Extreme 3D (/dev/input/event4)=0A[   299.806] (II) No input driver=
/identifier specified (ignoring)=0A[   299.807] (II) config/udev: Adding =
input device Logitech Logitech Extreme 3D (/dev/input/js0)=0A[   299.807]=
 (II) No input driver/identifier specified (ignoring)=0A[   299.815] (II)=
 config/udev: Adding input device HDA Digital PCBeep (/dev/input/event5)=0A=
[   299.815] (II) No input driver/identifier specified (ignoring)=0A[   2=
99.820] (II) config/udev: Adding input device AT Translated Set 2 keyboar=
d (/dev/input/event2)=0A[   299.820] (**) AT Translated Set 2 keyboard: A=
pplying InputClass "evdev keyboard catchall"=0A[   299.820] (**) AT Trans=
lated Set 2 keyboard: always reports core events=0A[   299.820] (**) AT T=
ranslated Set 2 keyboard: Device: "/dev/input/event2"=0A[   299.892] (--)=
 AT Translated Set 2 keyboard: Found keys=0A[   299.892] (II) AT Translat=
ed Set 2 keyboard: Configuring as keyboard=0A[   299.892] (II) XINPUT: Ad=
ding extended input device "AT Translated Set 2 keyboard" (type: KEYBOARD=
)=0A[   299.892] (**) Option "xkb_rules" "evdev"=0A[   299.892] (**) Opti=
on "xkb_model" "pc105"=0A[   299.892] (**) Option "xkb_layout" "it"=0A[  =
 304.791] (II) NOUVEAU(0): EDID vendor "GSM", prod id 19233=0A[   304.791=
] (II) NOUVEAU(0): Using hsync ranges from config file=0A[   304.791] (II=
) NOUVEAU(0): Using vrefresh ranges from config file=0A[   304.791] (II) =
NOUVEAU(0): Printing DDC gathered Modelines:=0A[   304.791] (II) NOUVEAU(=
0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028=
 1066 +hsync +vsync (64.0 kHz)=0A[   304.791] (II) NOUVEAU(0): Modeline "=
800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37=
.9 kHz)=0A[   304.791] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  6=
40 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)=0A[   304.791] (=
II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 =
492 525 -hsync -vsync (31.5 kHz)=0A[   304.791] (II) NOUVEAU(0): Modeline=
 "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (3=
1.5 kHz)=0A[   304.791] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75 =
 1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)=0A[   304.=
791] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 134=
4  768 771 777 806 -hsync -vsync (48.4 kHz)=0A[   304.791] (II) NOUVEAU(0=
): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsy=
nc -vsync (49.7 kHz)=0A[   304.791] (II) NOUVEAU(0): Modeline "800x600"x0=
.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)=0A=
[   304.791] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 =
1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)=0A[   305.107] (II) N=
OUVEAU(1): EDID vendor "GSM", prod id 15189=0A[   305.107] (II) NOUVEAU(1=
): Using hsync ranges from config file=0A[   305.107] (II) NOUVEAU(1): Us=
ing vrefresh ranges from config file=0A[   305.107] (II) NOUVEAU(1): Prin=
ting DDC gathered Modelines:=0A[   305.108] (II) NOUVEAU(1): Modeline "10=
24x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (=
48.4 kHz)=0A[   305.108] (II) NOUVEAU(1): Modeline "800x600"x0.0   40.00 =
 800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)=0A[   305.108=
] (II) NOUVEAU(1): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 =
601 603 625 +hsync +vsync (35.2 kHz)=0A[   305.108] (II) NOUVEAU(1): Mode=
line "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsyn=
c (37.5 kHz)=0A[   305.108] (II) NOUVEAU(1): Modeline "640x480"x0.0   31.=
50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz)=0A[   305.1=
08] (II) NOUVEAU(1): Modeline "640x480"x0.0   30.24  640 704 768 864  480=
 483 486 525 -hsync -vsync (35.0 kHz)=0A[   305.108] (II) NOUVEAU(1): Mod=
eline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsy=
nc (31.5 kHz)=0A[   305.108] (II) NOUVEAU(1): Modeline "720x400"x0.0   28=
.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)=0A[   305.=
108] (II) NOUVEAU(1): Modeline "1024x768"x0.0   78.75  1024 1040 1136 131=
2  768 769 772 800 +hsync +vsync (60.0 kHz)=0A[   305.108] (II) NOUVEAU(1=
): Modeline "1024x768"x0.0   75.00  1024 1048 1184 1328  768 771 777 806 =
-hsync -vsync (56.5 kHz)=0A[   305.108] (II) NOUVEAU(1): Modeline "832x62=
4"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz=
)=0A[   305.108] (II) NOUVEAU(1): Modeline "800x600"x0.0   49.50  800 816=
 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)=0A[   305.108] (II) N=
OUVEAU(1): Modeline "800x600"x0.0   50.00  800 856 976 1040  600 637 643 =
666 +hsync +vsync (48.1 kHz)=0A[   305.322] (II) NOUVEAU(0): EDID vendor =
"GSM", prod id 19233=0A[   305.322] (II) NOUVEAU(0): Using hsync ranges f=
rom config file=0A[   305.322] (II) NOUVEAU(0): Using vrefresh ranges fro=
m config file=0A[   305.322] (II) NOUVEAU(0): Printing DDC gathered Model=
ines:=0A[   305.322] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1=
280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)=0A[   30=
5.322] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056 =
 600 601 605 628 +hsync +vsync (37.9 kHz)=0A[   305.322] (II) NOUVEAU(0):=
 Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync =
-vsync (37.5 kHz)=0A[   305.322] (II) NOUVEAU(0): Modeline "640x480"x0.0 =
  25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)=0A[   =
305.322] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900=
  400 412 414 449 -hsync +vsync (31.5 kHz)=0A[   305.322] (II) NOUVEAU(0)=
: Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +=
hsync +vsync (60.0 kHz)=0A[   305.322] (II) NOUVEAU(0): Modeline "1024x76=
8"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 =
kHz)=0A[   305.322] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 =
864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)=0A[   305.322] (II=
) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 6=
04 625 +hsync +vsync (46.9 kHz)=0A[   305.322] (II) NOUVEAU(0): Modeline =
"1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsyn=
c (67.5 kHz)=0A[   310.945] (II) NOUVEAU(0): EDID vendor "GSM", prod id 1=
9233=0A[   310.945] (II) NOUVEAU(0): Using hsync ranges from config file=0A=
[   310.945] (II) NOUVEAU(0): Using vrefresh ranges from config file=0A[ =
  310.945] (II) NOUVEAU(0): Printing DDC gathered Modelines:=0A[   310.94=
5] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688=
  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)=0A[   310.945] (II) NOUVEA=
U(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +=
hsync +vsync (37.9 kHz)=0A[   310.945] (II) NOUVEAU(0): Modeline "640x480=
"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)=0A=
[   310.945] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752=
 800  480 490 492 525 -hsync -vsync (31.5 kHz)=0A[   310.945] (II) NOUVEA=
U(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -h=
sync +vsync (31.5 kHz)=0A[   310.945] (II) NOUVEAU(0): Modeline "1024x768=
"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 k=
Hz)=0A[   310.945] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024=
 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)=0A[   310.945] =
(II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 62=
5 628 667 -hsync -vsync (49.7 kHz)=0A[   310.945] (II) NOUVEAU(0): Modeli=
ne "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync=
 (46.9 kHz)=0A[   310.945] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.=
00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)=0A

--_=__=_XaM3_.1275055336.2A.167770.42.3641.52.42.007.1275559720
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--_=__=_XaM3_.1275055336.2A.167770.42.3641.52.42.007.1275559720--
