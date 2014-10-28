From: =?UTF-8?B?VmljdG9yIExlZsOodnJl?= <victorlefevre-GANU6spQydw@public.gmane.org>
Subject: Re: Nouveau doesn't use the maximal resolution of my
 screen and GPU
Date: Tue, 28 Oct 2014 22:15:27 +0100
Message-ID: <5450076F.3020503@free.fr>
References: <544D0A58.30409@free.fr>	<CAKb7Uvi4vF6aHwJMC7zSey3V9M1PAKBp-3YLkMhrRZjLwpO7Dg@mail.gmail.com>	<544FFF5A.3070408@free.fr>
 <CAKb7Uvi-H1DUh37=cH19dXxadsZLEJx3YsmzO1z9-NgOXpvG=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090400050305050700030100"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvi-H1DUh37=cH19dXxadsZLEJx3YsmzO1z9-NgOXpvG=w@mail.gmail.com>
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

This is a multi-part message in MIME format.
--------------090400050305050700030100
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Yes. I attached the logs.

(There is several error messages.)

Le 28/10/2014 21:43, Ilia Mirkin a =C3=A9crit :
> Output name 'default' is not the name of an output nouveau can produce
> (or nvidia for that matter, afaik). This is the vesa driver or...
> something. Can you supply xorg log + dmesg?
>
> On Tue, Oct 28, 2014 at 4:40 PM, Victor Lef=C3=A8vre <victorlefevre@fre=
e.fr> wrote:
>> Hi Illia,
>>
>>
>> With Nouveau :
>> xrandr: Failed to get size of gamma for output default
>> Screen 0: minimum 1024 x 768, current 1024 x 768, maximum 1024 x 768
>> default connected 1024x768+0+0 0mm x 0mm
>>     1024x768       76.0*
>>
>>
>> With the Nvidia Driver :
>>
>> xrandr: Failed to get size of gamma for output default
>> Screen 0: minimum 640 x 480, current 1280 x 1024, maximum 1280 x 1024
>> default connected 1280x1024+0+0 0mm x 0mm
>>     1280x1024       0.0*
>>     1024x768        0.0
>>     800x600         0.0
>>     640x480         0.0
>>
>>
>> Le 27/10/2014 05:19, Ilia Mirkin a =C3=A9crit :
>>
>>> What does 'xrandr' output?
>>>
>>> On Sun, Oct 26, 2014 at 10:51 AM, Victor Lef=C3=A8vre<victorlefevre@f=
ree.fr>
>>> wrote:
>>>> Hi everybody,
>>>>
>>>> I'm using Lubuntu 14.04 on an old desktop PC with a NVIDIA GeForce 7=
600
>>>> GS
>>>> and a screen of 19 inches.
>>>>
>>>> The maximal resolution of my screen with Nvidia drivers is 1280x1024=
. (In
>>>> particular, I use the Nvidia 331.89 driver)
>>>>
>>>> With Nouveau driver, the maximal resolution falls to 1024x768.
>>>>
>>>> Is there a solution for increasing the maximum resolution with Nouve=
au ?
>>>>
>>>> Best regards,
>>>>
>>>> Victor Lef=C3=A8vre
>>>> _______________________________________________
>>>> Nouveau mailing list
>>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>


--------------090400050305050700030100
Content-Type: text/x-log;
 name="dmesg.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dmesg.log"

Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Initializing cgroup subsys cpuset
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Initializing cgroup subsys cpu
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Initializing cgroup subsys cpuacct
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Linux version 3.13.0-38-generic (buildd@akateko) (gcc version 4.8.2 (Ubuntu 4.8.2-19ubuntu1) ) #65-Ubuntu SMP Thu Oct 9 11:39:01 UTC 2014 (Ubuntu 3.13.0-38.65-generic 3.13.11.8)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] KERNEL supported cpus:
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   Intel GenuineIntel
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   AMD AuthenticAMD
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   NSC Geode by NSC
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   Cyrix CyrixInstead
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   Centaur CentaurHauls
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   Transmeta GenuineTMx86
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   Transmeta TransmetaCPU
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   UMC UMC UMC UMC
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] e820: BIOS-provided physical RAM map:
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] BIOS-e820: [mem 0x000000000009f000-0x000000000009ffff] reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000cfedffff] usable
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] BIOS-e820: [mem 0x00000000cfee0000-0x00000000cfee2fff] ACPI NVS
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] BIOS-e820: [mem 0x00000000cfee3000-0x00000000cfeeffff] ACPI data
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] BIOS-e820: [mem 0x00000000cfef0000-0x00000000cfefffff] reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000ffffffff] reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000012fffffff] usable
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] NX (Execute Disable) protection: active
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] SMBIOS 2.4 present.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] DMI: MICRO-STAR INTERNATIONAL CO., LTD MS-7235/MS-7235, BIOS 1.10 07/05/2007
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] e820: last_pfn = 0x130000 max_arch_pfn = 0x1000000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] MTRR default type: uncachable
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] MTRR fixed ranges enabled:
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   00000-9FFFF write-back
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   A0000-BFFFF uncachable
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   C0000-CDFFF write-protect
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   CE000-EFFFF uncachable
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   F0000-FFFFF write-through
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] MTRR variable ranges enabled:
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   0 base 100000000 mask FE0000000 write-back
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   1 base 120000000 mask FF0000000 write-back
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   2 base 000000000 mask F80000000 write-back
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   3 base 080000000 mask FC0000000 write-back
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   4 base 0C0000000 mask FF0000000 write-back
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   5 base 0CFF00000 mask FFFF00000 uncachable
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   6 disabled
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   7 disabled
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] original variable MTRRs
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] reg 0, base: 4GB, range: 512MB, type WB
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] reg 1, base: 4608MB, range: 256MB, type WB
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] reg 2, base: 0GB, range: 2GB, type WB
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] reg 3, base: 2GB, range: 1GB, type WB
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] reg 4, base: 3GB, range: 256MB, type WB
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] reg 5, base: 3327MB, range: 1MB, type UC
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] total RAM covered: 4095M
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Found optimal setting for mtrr clean up
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]  gran_size: 64K 	chunk_size: 2M 	num_reg: 6  	lose cover RAM: 0G
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] New variable MTRRs
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] reg 0, base: 0GB, range: 2GB, type WB
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] reg 1, base: 2GB, range: 1GB, type WB
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] reg 2, base: 3GB, range: 256MB, type WB
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] reg 3, base: 3327MB, range: 1MB, type UC
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] reg 4, base: 4GB, range: 512MB, type WB
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] reg 5, base: 4608MB, range: 256MB, type WB
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] e820: update [mem 0xcff00000-0xffffffff] usable ==> reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] found SMP MP-table at [mem 0x000f5240-0x000f524f] mapped at [c00f5240]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Scanning 1 areas for low memory corruption
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] initial memory mapped: [mem 0x00000000-0x01ffffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Base memory trampoline at [c009b000] 9b000 size 16384
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] init_memory_mapping: [mem 0x37800000-0x379fffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]  [mem 0x37800000-0x379fffff] page 2M
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] init_memory_mapping: [mem 0x34000000-0x377fffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]  [mem 0x34000000-0x377fffff] page 2M
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] init_memory_mapping: [mem 0x00100000-0x33ffffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]  [mem 0x00100000-0x001fffff] page 4k
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]  [mem 0x00200000-0x33ffffff] page 2M
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] init_memory_mapping: [mem 0x37a00000-0x37bfdfff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]  [mem 0x37a00000-0x37bfdfff] page 4k
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] BRK [0x01b93000, 0x01b93fff] PGTABLE
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] RAMDISK: [mem 0x34d98000-0x366c3fff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: RSDP 000f9210 000014 (v00 IntelR)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: RSDT cfee3040 00003C (v01 IntelR AWRDACPI 42302E31 AWRD 00000000)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: FACP cfee30c0 000074 (v01 IntelR AWRDACPI 42302E31 AWRD 00000000)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: DSDT cfee3180 004BB6 (v01 INTELR AWRDACPI 00001000 MSFT 0100000E)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: FACS cfee0000 000040
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: HPET cfee7e80 000038 (v01 IntelR AWRDACPI 42302E31 AWRD 00000098)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: MCFG cfee7f00 00003C (v01 IntelR AWRDACPI 42302E31 AWRD 00000000)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: APIC cfee7d80 000084 (v01 IntelR AWRDACPI 42302E31 AWRD 00000000)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: SSDT cfee7f80 00015C (v01  PmRef  Cpu0Ist 00003000 INTL 20060912)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: SSDT cfee8410 0002F1 (v01  PmRef    CpuPm 00003000 INTL 20040311)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: Local APIC address 0xfee00000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] 3972MB HIGHMEM available.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] 891MB LOWMEM available.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   mapped low ram: 0 - 37bfe000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   low ram: 0 - 37bfe000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] BRK [0x01b94000, 0x01b94fff] PGTABLE
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Zone ranges:
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   Normal   [mem 0x01000000-0x37bfdfff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   HighMem  [mem 0x37bfe000-0x2fffffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Movable zone start for each node
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Early memory node ranges
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   node   0: [mem 0x00001000-0x0009efff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   node   0: [mem 0x00100000-0xcfedffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   node   0: [mem 0x00000000-0x2fffffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] On node 0 totalpages: 1048190
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] free_area_init_node: node 0, pgdat c199b4c0, node_mem_map f2798020
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   DMA zone: 32 pages used for memmap
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   DMA zone: 0 pages reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   Normal zone: 1752 pages used for memmap
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   Normal zone: 224254 pages, LIFO batch:31
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   HighMem zone: 7945 pages used for memmap
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]   HighMem zone: 819938 pages, LIFO batch:31
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Using APIC driver default
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: PM-Timer IO Port: 0x408
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: Local APIC address 0xfee00000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] disabled)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x03] disabled)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: IOAPIC (id[0x04] address[0xfec00000] gsi_base[0])
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] IOAPIC[0]: apic_id 4, version 32, address 0xfec00000, GSI 0-23
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: IRQ0 used by override.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: IRQ2 used by override.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: IRQ9 used by override.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Using ACPI (MADT) for SMP configuration information
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] ACPI: HPET id: 0x10b9a201 base: 0xfed00000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] smpboot: Allowing 4 CPUs, 2 hotplug CPUs
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] nr_irqs_gsi: 40
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] PM: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000effff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] PM: Registered nosave memory: [mem 0x000f0000-0x000fffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] e820: [mem 0xcff00000-0xdfffffff] available for PCI devices
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Booting paravirtualized kernel on bare hardware
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:4 nr_node_ids:1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] PERCPU: Embedded 14 pages/cpu @f7bb4000 s36096 r0 d21248 u57344
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] pcpu-alloc: s36096 r0 d21248 u57344 alloc=14*4096
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 1046406
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-3.13.0-38-generic root=UUID=7b0559d9-fbbe-4635-b244-bda94aa0a640 ro quiet splash nomodeset vt.handoff=7
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Initializing CPU#0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] allocated 9961464 bytes of page_cgroup
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] please try 'cgroup_disable=memory' option if you don't want memory cgroups
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Initializing HighMem for node 0 (00037bfe:00130000)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Memory: 4105316K/4192760K available (6539K kernel code, 640K rwdata, 2764K rodata, 872K init, 924K bss, 87444K reserved, 3279752K highmem)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] virtual kernel memory layout:
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]     fixmap  : 0xfff14000 - 0xfffff000   ( 940 kB)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]     pkmap   : 0xffc00000 - 0xffe00000   (2048 kB)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]     vmalloc : 0xf83fe000 - 0xffbfe000   ( 120 MB)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]     lowmem  : 0xc0000000 - 0xf7bfe000   ( 891 MB)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]       .init : 0xc19b9000 - 0xc1a93000   ( 872 kB)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]       .data : 0xc16631f2 - 0xc19b8280   (3412 kB)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000]       .text : 0xc1000000 - 0xc16631f2   (6540 kB)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Checking if this processor honours the WP bit even in supervisor mode...Ok.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Hierarchical RCU implementation.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] 	RCU dyntick-idle grace-period acceleration is enabled.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] 	RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] NR_IRQS:2304 nr_irqs:712 16
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] CPU 0 irqstacks, hard=f6c08000 soft=f6c0a000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Console: colour dummy device 80x25
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] console [tty0] enabled
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] hpet clockevent registered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] tsc: Fast TSC calibration using PIT
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] tsc: Detected 1863.578 MHz processor
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004002] Calibrating delay loop (skipped), value calculated using timer frequency.. 3727.15 BogoMIPS (lpj=7454312)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004006] pid_max: default: 32768 minimum: 301
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004043] Security Framework initialized
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004064] AppArmor: AppArmor initialized
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004066] Yama: becoming mindful.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004124] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004127] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004421] Initializing cgroup subsys memory
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004430] Initializing cgroup subsys devices
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004433] Initializing cgroup subsys freezer
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004436] Initializing cgroup subsys blkio
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004439] Initializing cgroup subsys perf_event
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004442] Initializing cgroup subsys hugetlb
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004475] CPU: Physical Processor ID: 0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004477] CPU: Processor Core ID: 0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004481] mce: CPU supports 6 MCE banks
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004490] CPU0: Thermal monitoring enabled (TM1)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004503] Last level iTLB entries: 4KB 128, 2MB 4, 4MB 4
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004503] Last level dTLB entries: 4KB 256, 2MB 0, 4MB 32
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004503] tlb_flushall_shift: -1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.004856] Freeing SMP alternatives memory: 32K (c1a93000 - c1a9b000)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.006049] ACPI: Core revision 20131115
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.010226] ACPI: All ACPI Tables successfully acquired
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.012011] ftrace: allocating 27830 entries in 55 pages
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.020100] Enabling APIC mode:  Flat.  Using 1 I/O APICs
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.020467] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.061348] smpboot: CPU0: Intel(R) Core(TM)2 CPU          6300  @ 1.86GHz (fam: 06, model: 0f, stepping: 06)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.064000] Performance Events: PEBS fmt0-, 4-deep LBR, Core2 events, Intel PMU driver.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.064000] perf_event_intel: PEBS disabled due to CPU errata
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.064000] ... version:                2
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.064000] ... bit width:              40
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.064000] ... generic registers:      2
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.064000] ... value mask:             000000ffffffffff
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.064000] ... max period:             000000007fffffff
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.064000] ... fixed-purpose events:   3
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.064000] ... event mask:             0000000700000003
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.064000] CPU 1 irqstacks, hard=f6d00000 soft=f6d02000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.064000] x86: Booting SMP configuration:
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.008000] Initializing CPU#1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.064000] .... node  #0, CPUs:      #1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.075698] x86: Booted up 1 node, 2 CPUs
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.075704] smpboot: Total of 2 processors activated (7454.31 BogoMIPS)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.075800] NMI watchdog: enabled on all CPUs, permanently consumes one hw-PMU counter.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.076133] devtmpfs: initialized
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.076319] EVM: security.selinux
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.076322] EVM: security.SMACK64
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.076323] EVM: security.ima
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.076325] EVM: security.capability
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.076359] PM: Registering ACPI NVS region [mem 0xcfee0000-0xcfee2fff] (12288 bytes)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.077550] pinctrl core: initialized pinctrl subsystem
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.077647] regulator-dummy: no parameters
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.077681] RTC time: 21:57:05, date: 10/28/14
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.077734] NET: Registered protocol family 16
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.077734] EISA bus registered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.077734] cpuidle: using governor ladder
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.077734] cpuidle: using governor menu
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.077734] ACPI: bus type PCI registered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.077734] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.077734] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.077734] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.077734] PCI: Using MMCONFIG for extended config space
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.077734] PCI: Using configuration type 1 for base access
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.080083] bio: create slab <bio-0> at 0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.080124] ACPI: Added _OSI(Module Device)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.080127] ACPI: Added _OSI(Processor Device)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.080130] ACPI: Added _OSI(3.0 _SCP Extensions)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.080132] ACPI: Added _OSI(Processor Aggregator Device)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.083712] ACPI: SSDT cfee8380 000087 (v01  PmRef  Cpu1Ist 00003000 INTL 20060912)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.083992] ACPI: Dynamic OEM Table Load:
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.084003] ACPI: SSDT   (null) 000087 (v01  PmRef  Cpu1Ist 00003000 INTL 20060912)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.084204] ACPI: Interpreter enabled
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.084239] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S2_] (20131115/hwxface-580)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.084245] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S3_] (20131115/hwxface-580)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.084258] ACPI: (supports S0 S1 S4 S5)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.084260] ACPI: Using IOAPIC for interrupt routing
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.084295] PCI: Ignoring host bridge windows from ACPI; if necessary, use "pci=use_crs" and report a bug
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.084450] ACPI: No dock devices found.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.091695] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.091703] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.091710] acpi PNP0A08:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.091805] acpi PNP0A08:00: host bridge window [io  0x0000-0x0cf7] (ignored)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.091809] acpi PNP0A08:00: host bridge window [io  0x0d00-0xffff] (ignored)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.091813] acpi PNP0A08:00: host bridge window [mem 0x000a0000-0x000bffff] (ignored)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.091816] acpi PNP0A08:00: host bridge window [mem 0x000c0000-0x000dffff] (ignored)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.091819] acpi PNP0A08:00: host bridge window [mem 0xcff00000-0xfebfffff] (ignored)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.091822] PCI: root bus 00: using default resources
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092090] PCI host bridge to bus 0000:00
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092096] pci_bus 0000:00: root bus resource [bus 00-ff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092099] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092102] pci_bus 0000:00: root bus resource [mem 0x00000000-0xfffffffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092114] pci 0000:00:00.0: [8086:29a0] type 00 class 0x060000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092252] pci 0000:00:01.0: [8086:29a1] type 01 class 0x060400
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092302] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092430] pci 0000:00:1a.0: [8086:2834] type 00 class 0x0c0300
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092474] pci 0000:00:1a.0: reg 0x20: [io  0xff00-0xff1f]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092563] pci 0000:00:1a.0: System wakeup disabled by ACPI
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092607] pci 0000:00:1a.1: [8086:2835] type 00 class 0x0c0300
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092650] pci 0000:00:1a.1: reg 0x20: [io  0xfe00-0xfe1f]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092738] pci 0000:00:1a.1: System wakeup disabled by ACPI
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092792] pci 0000:00:1a.7: [8086:283a] type 00 class 0x0c0320
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092811] pci 0000:00:1a.7: reg 0x10: [mem 0xfdfff000-0xfdfff3ff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092889] pci 0000:00:1a.7: PME# supported from D0 D3hot D3cold
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.092959] pci 0000:00:1a.7: System wakeup disabled by ACPI
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093008] pci 0000:00:1b.0: [8086:284b] type 00 class 0x040300
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093026] pci 0000:00:1b.0: reg 0x10: [mem 0xfdff8000-0xfdffbfff 64bit]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093099] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093173] pci 0000:00:1b.0: System wakeup disabled by ACPI
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093220] pci 0000:00:1c.0: [8086:283f] type 01 class 0x060400
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093295] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093371] pci 0000:00:1c.0: System wakeup disabled by ACPI
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093421] pci 0000:00:1d.0: [8086:2830] type 00 class 0x0c0300
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093464] pci 0000:00:1d.0: reg 0x20: [io  0xfd00-0xfd1f]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093552] pci 0000:00:1d.0: System wakeup disabled by ACPI
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093594] pci 0000:00:1d.1: [8086:2831] type 00 class 0x0c0300
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093637] pci 0000:00:1d.1: reg 0x20: [io  0xfc00-0xfc1f]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093724] pci 0000:00:1d.1: System wakeup disabled by ACPI
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093768] pci 0000:00:1d.2: [8086:2832] type 00 class 0x0c0300
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093810] pci 0000:00:1d.2: reg 0x20: [io  0xfb00-0xfb1f]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093898] pci 0000:00:1d.2: System wakeup disabled by ACPI
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093950] pci 0000:00:1d.7: [8086:2836] type 00 class 0x0c0320
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.093969] pci 0000:00:1d.7: reg 0x10: [mem 0xfdffe000-0xfdffe3ff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094046] pci 0000:00:1d.7: PME# supported from D0 D3hot D3cold
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094117] pci 0000:00:1d.7: System wakeup disabled by ACPI
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094161] pci 0000:00:1e.0: [8086:244e] type 01 class 0x060401
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094278] pci 0000:00:1e.0: System wakeup disabled by ACPI
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094327] pci 0000:00:1f.0: [8086:2810] type 00 class 0x060100
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094409] pci 0000:00:1f.0: quirk: [io  0x0400-0x047f] claimed by ICH6 ACPI/GPIO/TCO
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094415] pci 0000:00:1f.0: quirk: [io  0x0480-0x04bf] claimed by ICH6 GPIO
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094420] pci 0000:00:1f.0: ICH7 LPC Generic IO decode 1 PIO at 0a00 (mask 00ff)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094554] pci 0000:00:1f.2: [8086:2820] type 00 class 0x01018f
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094569] pci 0000:00:1f.2: reg 0x10: [io  0xfa00-0xfa07]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094579] pci 0000:00:1f.2: reg 0x14: [io  0xf900-0xf903]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094588] pci 0000:00:1f.2: reg 0x18: [io  0xf800-0xf807]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094597] pci 0000:00:1f.2: reg 0x1c: [io  0xf700-0xf703]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094606] pci 0000:00:1f.2: reg 0x20: [io  0xf600-0xf60f]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094615] pci 0000:00:1f.2: reg 0x24: [io  0xf500-0xf50f]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094647] pci 0000:00:1f.2: PME# supported from D3hot
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094750] pci 0000:00:1f.3: [8086:283e] type 00 class 0x0c0500
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094764] pci 0000:00:1f.3: reg 0x10: [mem 0xfdffd000-0xfdffd0ff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094793] pci 0000:00:1f.3: reg 0x20: [io  0x0500-0x051f]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094919] pci 0000:00:1f.5: [8086:2825] type 00 class 0x010185
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094934] pci 0000:00:1f.5: reg 0x10: [io  0xf300-0xf307]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094944] pci 0000:00:1f.5: reg 0x14: [io  0xf200-0xf203]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094953] pci 0000:00:1f.5: reg 0x18: [io  0xf100-0xf107]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094962] pci 0000:00:1f.5: reg 0x1c: [io  0xf000-0xf003]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094971] pci 0000:00:1f.5: reg 0x20: [io  0xef00-0xef0f]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.094981] pci 0000:00:1f.5: reg 0x24: [io  0xee00-0xee0f]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095013] pci 0000:00:1f.5: PME# supported from D3hot
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095167] pci 0000:01:00.0: [10de:0392] type 00 class 0x030000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095179] pci 0000:01:00.0: reg 0x10: [mem 0xfa000000-0xfaffffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095192] pci 0000:01:00.0: reg 0x14: [mem 0xd0000000-0xdfffffff 64bit pref]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095204] pci 0000:01:00.0: reg 0x1c: [mem 0xfb000000-0xfbffffff 64bit]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095212] pci 0000:01:00.0: reg 0x24: [io  0xdf00-0xdf7f]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095221] pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095295] pci 0000:01:00.0: disabling ASPM on pre-1.1 PCIe device.  You can enable it with 'pcie_aspm=force'
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095303] pci 0000:00:01.0: PCI bridge to [bus 01]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095307] pci 0000:00:01.0:   bridge window [io  0xd000-0xdfff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095311] pci 0000:00:01.0:   bridge window [mem 0xfa000000-0xfcffffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095317] pci 0000:00:01.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095414] pci 0000:02:00.0: [197b:2361] type 00 class 0x010185
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095507] pci 0000:02:00.0: reg 0x24: [mem 0xfdbfe000-0xfdbfffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095574] pci 0000:02:00.0: PME# supported from D3hot
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095649] pci 0000:02:00.1: [197b:2361] type 00 class 0x010185
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095672] pci 0000:02:00.1: reg 0x10: [io  0xbf00-0xbf07]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095683] pci 0000:02:00.1: reg 0x14: [io  0xbe00-0xbe03]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095695] pci 0000:02:00.1: reg 0x18: [io  0xbd00-0xbd07]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095706] pci 0000:02:00.1: reg 0x1c: [io  0xbc00-0xbc03]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095718] pci 0000:02:00.1: reg 0x20: [io  0xbb00-0xbb0f]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095833] pci 0000:02:00.0: disabling ASPM on pre-1.1 PCIe device.  You can enable it with 'pcie_aspm=force'
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095845] pci 0000:00:1c.0: PCI bridge to [bus 02]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095850] pci 0000:00:1c.0:   bridge window [io  0xb000-0xbfff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095854] pci 0000:00:1c.0:   bridge window [mem 0xfdb00000-0xfdbfffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095861] pci 0000:00:1c.0:   bridge window [mem 0xfdc00000-0xfdcfffff 64bit pref]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095914] pci 0000:03:01.0: [1814:0302] type 00 class 0x028000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.095934] pci 0000:03:01.0: reg 0x10: [mem 0xfdef0000-0xfdef7fff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.096074] pci 0000:03:06.0: [10ec:8167] type 00 class 0x020000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.096093] pci 0000:03:06.0: reg 0x10: [io  0xce00-0xceff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.096104] pci 0000:03:06.0: reg 0x14: [mem 0xfdeff000-0xfdeff0ff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.096148] pci 0000:03:06.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.096178] pci 0000:03:06.0: supports D1 D2
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.096181] pci 0000:03:06.0: PME# supported from D1 D2 D3hot D3cold
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.096262] pci 0000:00:1e.0: PCI bridge to [bus 03] (subtractive decode)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.096268] pci 0000:00:1e.0:   bridge window [io  0xc000-0xcfff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.096272] pci 0000:00:1e.0:   bridge window [mem 0xfde00000-0xfdefffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.096279] pci 0000:00:1e.0:   bridge window [mem 0xfdd00000-0xfddfffff 64bit pref]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.096282] pci 0000:00:1e.0:   bridge window [io  0x0000-0xffff] (subtractive decode)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.096286] pci 0000:00:1e.0:   bridge window [mem 0x00000000-0xfffffffff] (subtractive decode)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.096305] pci_bus 0000:00: on NUMA node 0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.097070] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 7 9 *10 11 14 15)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.097153] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 7 9 *10 11 14 15)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.097235] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 7 9 10 *11 14 15)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.097316] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 7 9 10 *11 14 15)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.097397] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 7 9 10 11 14 15) *0, disabled.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.097479] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 *5 7 9 10 11 14 15)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.097560] ACPI: PCI Interrupt Link [LNK0] (IRQs 3 4 5 7 *9 10 11 14 15)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.097641] ACPI: PCI Interrupt Link [LNK1] (IRQs 3 4 5 7 9 10 11 14 15) *0, disabled.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.097853] ACPI: \_SB_.PCI0: notify handler is installed
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.097904] Found 1 acpi root devices
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.100023] vgaarb: device added: PCI:0000:01:00.0,decodes=io+mem,owns=io+mem,locks=none
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.100027] vgaarb: loaded
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.100029] vgaarb: bridge control possible 0000:01:00.0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.100302] SCSI subsystem initialized
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.100322] libata version 3.00 loaded.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.100322] ACPI: bus type USB registered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.100322] usbcore: registered new interface driver usbfs
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.100322] usbcore: registered new interface driver hub
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.100322] usbcore: registered new device driver usb
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.100322] PCI: Using ACPI for IRQ routing
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.108509] PCI: pci_cache_line_size set to 64 bytes
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.108571] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.108574] e820: reserve RAM buffer [mem 0xcfee0000-0xcfffffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.108696] NetLabel: Initializing
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.108698] NetLabel:  domain hash size = 128
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.108700] NetLabel:  protocols = UNLABELED CIPSOv4
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.108714] NetLabel:  unlabeled traffic allowed by default
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.108731] HPET: 3 timers in total, 0 timers will be used for per-cpu timer
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.108731] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.108731] hpet0: 3 comparators, 64-bit 14.318180 MHz counter
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.110172] Switched to clocksource hpet
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.118280] AppArmor: AppArmor Filesystem Enabled
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.118322] pnp: PnP ACPI init
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.118343] ACPI: bus type PNP registered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.118571] system 00:00: [io  0x04d0-0x04d1] has been reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.118575] system 00:00: [io  0x0a00-0x0a7f] has been reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.118579] system 00:00: [io  0x0880-0x088f] has been reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.118584] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.118601] pnp 00:01: [dma 4]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.118632] pnp 00:01: Plug and Play ACPI device, IDs PNP0200 (active)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.118743] pnp 00:02: Plug and Play ACPI device, IDs PNP0103 (active)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.118809] pnp 00:03: Plug and Play ACPI device, IDs PNP0b00 (active)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.118847] pnp 00:04: Plug and Play ACPI device, IDs PNP0800 (active)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.118889] pnp 00:05: Plug and Play ACPI device, IDs PNP0c04 (active)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.119015] pnp 00:06: [dma 2]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.119064] pnp 00:06: Plug and Play ACPI device, IDs PNP0700 (active)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.119300] pnp 00:07: Plug and Play ACPI device, IDs PNP0501 (active)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.119557] pnp 00:08: Plug and Play ACPI device, IDs PNP0501 (active)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.119926] pnp 00:09: Plug and Play ACPI device, IDs PNP0400 (active)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120124] system 00:0a: [io  0x0400-0x04bf] could not be reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120129] system 00:0a: Plug and Play ACPI device, IDs PNP0c02 (active)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120182] pnp 00:0b: Plug and Play ACPI device, IDs INT0800 (active)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120472] system 00:0c: [mem 0xe0000000-0xefffffff] has been reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120477] system 00:0c: Plug and Play ACPI device, IDs PNP0c02 (active)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120607] system 00:0d: [mem 0x000f0000-0x000fffff] could not be reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120611] system 00:0d: [mem 0xfed00000-0xfed000ff] has been reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120615] system 00:0d: [mem 0xcfee0000-0xcfefffff] could not be reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120618] system 00:0d: [mem 0x00000000-0x0009ffff] could not be reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120622] system 00:0d: [mem 0x00100000-0xcfedffff] could not be reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120626] system 00:0d: [mem 0xfec00000-0xfec00fff] could not be reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120630] system 00:0d: [mem 0xfed14000-0xfed1dfff] has been reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120633] system 00:0d: [mem 0xfed20000-0xfed9ffff] has been reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120637] system 00:0d: [mem 0xfee00000-0xfee00fff] has been reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120640] system 00:0d: [mem 0xffb00000-0xffb7ffff] has been reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120644] system 00:0d: [mem 0xfff00000-0xffffffff] has been reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120648] system 00:0d: [mem 0x000e0000-0x000effff] has been reserved
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120652] system 00:0d: Plug and Play ACPI device, IDs PNP0c01 (active)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120662] pnp: PnP ACPI: found 14 devices
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120665] ACPI: bus type PNP unregistered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.120670] PnPBIOS: Disabled by ACPI PNP
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157913] pci 0000:01:00.0: BAR 6: assigned [mem 0xfc000000-0xfc01ffff pref]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157918] pci 0000:00:01.0: PCI bridge to [bus 01]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157922] pci 0000:00:01.0:   bridge window [io  0xd000-0xdfff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157927] pci 0000:00:01.0:   bridge window [mem 0xfa000000-0xfcffffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157931] pci 0000:00:01.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157937] pci 0000:00:1c.0: PCI bridge to [bus 02]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157941] pci 0000:00:1c.0:   bridge window [io  0xb000-0xbfff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157947] pci 0000:00:1c.0:   bridge window [mem 0xfdb00000-0xfdbfffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157952] pci 0000:00:1c.0:   bridge window [mem 0xfdc00000-0xfdcfffff 64bit pref]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157960] pci 0000:03:06.0: BAR 6: assigned [mem 0xfdd00000-0xfdd1ffff pref]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157963] pci 0000:00:1e.0: PCI bridge to [bus 03]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157966] pci 0000:00:1e.0:   bridge window [io  0xc000-0xcfff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157972] pci 0000:00:1e.0:   bridge window [mem 0xfde00000-0xfdefffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157977] pci 0000:00:1e.0:   bridge window [mem 0xfdd00000-0xfddfffff 64bit pref]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157985] pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157988] pci_bus 0000:00: resource 5 [mem 0x00000000-0xfffffffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157991] pci_bus 0000:01: resource 0 [io  0xd000-0xdfff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157994] pci_bus 0000:01: resource 1 [mem 0xfa000000-0xfcffffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.157997] pci_bus 0000:01: resource 2 [mem 0xd0000000-0xdfffffff 64bit pref]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158000] pci_bus 0000:02: resource 0 [io  0xb000-0xbfff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158003] pci_bus 0000:02: resource 1 [mem 0xfdb00000-0xfdbfffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158006] pci_bus 0000:02: resource 2 [mem 0xfdc00000-0xfdcfffff 64bit pref]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158009] pci_bus 0000:03: resource 0 [io  0xc000-0xcfff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158012] pci_bus 0000:03: resource 1 [mem 0xfde00000-0xfdefffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158015] pci_bus 0000:03: resource 2 [mem 0xfdd00000-0xfddfffff 64bit pref]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158018] pci_bus 0000:03: resource 4 [io  0x0000-0xffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158021] pci_bus 0000:03: resource 5 [mem 0x00000000-0xfffffffff]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158068] NET: Registered protocol family 2
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158334] TCP established hash table entries: 8192 (order: 3, 32768 bytes)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158354] TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158383] TCP: Hash tables configured (established 8192 bind 8192)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158408] TCP: reno registered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158412] UDP hash table entries: 512 (order: 2, 16384 bytes)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158421] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.158496] NET: Registered protocol family 1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.159739] pci 0000:01:00.0: Boot video device
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.159754] PCI: CLS 64 bytes, default 64
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.159812] Trying to unpack rootfs image as initramfs...
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.791003] Freeing initrd memory: 25776K (f4d98000 - f66c4000)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.791311] microcode: CPU0 sig=0x6f6, pf=0x1, revision=0xc6
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.791323] microcode: CPU1 sig=0x6f6, pf=0x1, revision=0xc6
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.791409] microcode: Microcode Update Driver: v2.00 <tigran-ppwZ4lME3+KI6QP4U9MhSdBc4/FLrbF6@public.gmane.org>, Peter Oruba
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.791412] Scanning for low memory corruption every 60 seconds
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.791759] Initialise system trusted keyring
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.791813] audit: initializing netlink socket (disabled)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.791830] type=2000 audit(1414533425.788:1): initialized
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.821072] bounce pool size: 64 pages
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.821091] HugeTLB registered 2 MB page size, pre-allocated 0 pages
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.822958] zbud: loaded
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.823035] VFS: Disk quotas dquot_6.5.2
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.823103] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.823754] fuse init (API version 7.22)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.823866] msgmni has been set to 1662
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.823953] Key type big_key registered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.824410] Key type asymmetric registered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.824413] Asymmetric key parser 'x509' registered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.824459] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.824498] io scheduler noop registered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.824501] io scheduler deadline registered (default)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.824540] io scheduler cfq registered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.824787] pcieport 0000:00:01.0: irq 40 for MSI/MSI-X
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.824942] pcieport 0000:00:1c.0: irq 41 for MSI/MSI-X
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.825034] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.825055] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.825113] vesafb: mode is 1024x768x32, linelength=4096, pages=0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.825115] vesafb: scrolling: redraw
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.825118] vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.825378] vesafb: framebuffer at 0xd0000000, mapped to 0xf8480000, using 3072k, total 3072k
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.852334] Console: switching to colour frame buffer device 128x48
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.879190] fb0: VESA VGA frame buffer device
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.879215] intel_idle: does not run on family 6 model 15
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.879224] ipmi message handler version 39.2
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.879311] input: Power Button as /devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.879317] ACPI: Power Button [PWRB]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.879379] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.879383] ACPI: Power Button [PWRF]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.879437] ACPI: Fan [FAN] (on)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.880243] thermal LNXTHERM:00: registered as thermal_zone0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.880246] ACPI: Thermal Zone [THRM] (55 C)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.880280] GHES: HEST is not enabled!
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.880326] isapnp: Scanning for PnP cards...
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.888050] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.908495] 00:07: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.928893] 00:08: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.930512] Linux agpgart interface v0.103
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.932546] brd: module loaded
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.933523] loop: module loaded
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.933676] ata_piix 0000:00:1f.2: version 2.13
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.933776] ata_piix 0000:00:1f.2: MAP [ P0 P2 P1 P3 ]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.088817] scsi0 : ata_piix
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.088894] scsi1 : ata_piix
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.088943] ata1: SATA max UDMA/133 cmd 0xfa00 ctl 0xf900 bmdma 0xf600 irq 19
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.088948] ata2: SATA max UDMA/133 cmd 0xf800 ctl 0xf700 bmdma 0xf608 irq 19
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.089053] ata_piix 0000:00:1f.5: MAP [ P0 -- P1 -- ]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.089582] scsi2 : ata_piix
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.089649] scsi3 : ata_piix
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.089698] ata3: SATA max UDMA/133 cmd 0xf300 ctl 0xf200 bmdma 0xef00 irq 19
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.089702] ata4: SATA max UDMA/133 cmd 0xf100 ctl 0xf000 bmdma 0xef08 irq 19
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.090145] libphy: Fixed MDIO Bus: probed
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.090288] tun: Universal TUN/TAP device driver, 1.6
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.090290] tun: (C) 1999-2004 Max Krasnyansky <maxk-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.090411] PPP generic driver version 2.4.2
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.090459] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.090465] ehci-pci: EHCI PCI platform driver
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.090595] ehci-pci 0000:00:1a.7: EHCI Host Controller
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.090603] ehci-pci 0000:00:1a.7: new USB bus registered, assigned bus number 1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.094523] ehci-pci 0000:00:1a.7: cache line size of 64 is not supported
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.094542] ehci-pci 0000:00:1a.7: irq 18, io mem 0xfdfff000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.104017] ehci-pci 0000:00:1a.7: USB 2.0 started, EHCI 1.00
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.104073] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.104076] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.104079] usb usb1: Product: EHCI Host Controller
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.104082] usb usb1: Manufacturer: Linux 3.13.0-38-generic ehci_hcd
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.104085] usb usb1: SerialNumber: 0000:00:1a.7
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.104210] hub 1-0:1.0: USB hub found
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.104220] hub 1-0:1.0: 4 ports detected
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.104469] ehci-pci 0000:00:1d.7: EHCI Host Controller
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.104476] ehci-pci 0000:00:1d.7: new USB bus registered, assigned bus number 2
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.108380] ehci-pci 0000:00:1d.7: cache line size of 64 is not supported
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.108401] ehci-pci 0000:00:1d.7: irq 23, io mem 0xfdffe000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120016] ehci-pci 0000:00:1d.7: USB 2.0 started, EHCI 1.00
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120064] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120068] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120071] usb usb2: Product: EHCI Host Controller
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120074] usb usb2: Manufacturer: Linux 3.13.0-38-generic ehci_hcd
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120077] usb usb2: SerialNumber: 0000:00:1d.7
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120191] hub 2-0:1.0: USB hub found
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120201] hub 2-0:1.0: 6 ports detected
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120383] ehci-platform: EHCI generic platform driver
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120395] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120397] ohci-pci: OHCI PCI platform driver
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120412] ohci-platform: OHCI generic platform driver
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120423] uhci_hcd: USB Universal Host Controller Interface driver
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120530] uhci_hcd 0000:00:1a.0: UHCI Host Controller
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120537] uhci_hcd 0000:00:1a.0: new USB bus registered, assigned bus number 3
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120572] uhci_hcd 0000:00:1a.0: irq 16, io base 0x0000ff00
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120628] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120631] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120634] usb usb3: Product: UHCI Host Controller
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120637] usb usb3: Manufacturer: Linux 3.13.0-38-generic uhci_hcd
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120640] usb usb3: SerialNumber: 0000:00:1a.0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120753] hub 3-0:1.0: USB hub found
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120762] hub 3-0:1.0: 2 ports detected
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120961] uhci_hcd 0000:00:1a.1: UHCI Host Controller
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.120968] uhci_hcd 0000:00:1a.1: new USB bus registered, assigned bus number 4
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121002] uhci_hcd 0000:00:1a.1: irq 21, io base 0x0000fe00
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121058] usb usb4: New USB device found, idVendor=1d6b, idProduct=0001
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121061] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121064] usb usb4: Product: UHCI Host Controller
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121067] usb usb4: Manufacturer: Linux 3.13.0-38-generic uhci_hcd
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121070] usb usb4: SerialNumber: 0000:00:1a.1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121182] hub 4-0:1.0: USB hub found
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121194] hub 4-0:1.0: 2 ports detected
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121394] uhci_hcd 0000:00:1d.0: UHCI Host Controller
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121400] uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 5
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121424] uhci_hcd 0000:00:1d.0: irq 23, io base 0x0000fd00
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121479] usb usb5: New USB device found, idVendor=1d6b, idProduct=0001
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121482] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121485] usb usb5: Product: UHCI Host Controller
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121488] usb usb5: Manufacturer: Linux 3.13.0-38-generic uhci_hcd
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121491] usb usb5: SerialNumber: 0000:00:1d.0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121610] hub 5-0:1.0: USB hub found
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121620] hub 5-0:1.0: 2 ports detected
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121818] uhci_hcd 0000:00:1d.1: UHCI Host Controller
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121825] uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 6
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121849] uhci_hcd 0000:00:1d.1: irq 19, io base 0x0000fc00
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121904] usb usb6: New USB device found, idVendor=1d6b, idProduct=0001
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121908] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121911] usb usb6: Product: UHCI Host Controller
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121914] usb usb6: Manufacturer: Linux 3.13.0-38-generic uhci_hcd
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.121916] usb usb6: SerialNumber: 0000:00:1d.1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.122029] hub 6-0:1.0: USB hub found
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.122039] hub 6-0:1.0: 2 ports detected
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.122235] uhci_hcd 0000:00:1d.2: UHCI Host Controller
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.122241] uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 7
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.122265] uhci_hcd 0000:00:1d.2: irq 18, io base 0x0000fb00
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.122320] usb usb7: New USB device found, idVendor=1d6b, idProduct=0001
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.122323] usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.122326] usb usb7: Product: UHCI Host Controller
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.122329] usb usb7: Manufacturer: Linux 3.13.0-38-generic uhci_hcd
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.122332] usb usb7: SerialNumber: 0000:00:1d.2
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.122443] hub 7-0:1.0: USB hub found
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.122452] hub 7-0:1.0: 2 ports detected
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.122652] i8042: PNP: No PS/2 controller found. Probing ports directly.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.125520] serio: i8042 KBD port at 0x60,0x64 irq 1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.125527] serio: i8042 AUX port at 0x60,0x64 irq 12
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.125659] mousedev: PS/2 mouse device common for all mice
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.125817] rtc_cmos 00:03: RTC can wake from S4
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.125939] rtc_cmos 00:03: rtc core: registered rtc_cmos as rtc0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.125964] rtc_cmos 00:03: alarms up to one month, 242 bytes nvram, hpet irqs
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.126066] device-mapper: uevent: version 1.0.3
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.126149] device-mapper: ioctl: 4.27.0-ioctl (2013-10-30) initialised: dm-devel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.126175] platform eisa.0: Probing EISA bus 0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.126207] platform eisa.0: EISA: Detected 0 cards
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.126215] cpufreq-nforce2: No nForce2 chipset.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.126220] ledtrig-cpu: registered to indicate activity on CPUs
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.126401] TCP: cubic registered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.126540] NET: Registered protocol family 10
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.126808] NET: Registered protocol family 17
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.126821] Key type dns_resolver registered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.127053] Using IPI No-Shortcut mode
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.127150] Loading compiled-in X.509 certificates
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.131869] Loaded X.509 cert 'Magrathea: Glacier signing key: cb70b9e6a2cd98ded1a19024ca0da1b54c1e60ac'
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.131890] registered taskstats version 1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.134813] Key type trusted registered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.137319] Key type encrypted registered
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.139792] AppArmor: AppArmor sha1 policy hashing enabled
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.139796] IMA: No TPM chip found, activating TPM-bypass!
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.140135] regulator-dummy: disabling
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.140188]   Magic number: 2:800:1006
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.140230] serial 00:08: hash matches
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.140277] rtc_cmos 00:03: setting system clock to 2014-10-28 21:57:07 UTC (1414533427)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.140530] BIOS EDD facility v0.16 2004-Jun-25, 0 devices found
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.140533] EDD information not available.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.140573] PM: Hibernation image not present or could not be loaded.
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.189947] isapnp: No Plug & Play device found
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.422683] ata4: SATA link down (SStatus 0 SControl 300)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.433344] ata3: SATA link down (SStatus 0 SControl 300)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.742701] ata2.00: SATA link down (SStatus 0 SControl 300)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.742715] ata2.01: SATA link down (SStatus 4 SControl 300)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.748041] usb 2-5: new high-speed USB device number 4 using ehci-pci
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.788035] tsc: Refined TSC clocksource calibration: 1863.484 MHz
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.884084] ata1.00: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.884096] ata1.01: SATA link down (SStatus 4 SControl 300)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.892599] ata1.00: ATA-8: Hitachi HDS723020BLA642, MN6OA580, max UDMA/133
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.892604] ata1.00: 3907029168 sectors, multi 16: LBA48 NCQ (depth 0/32)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.908296] ata1.00: configured for UDMA/133
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.908447] scsi 0:0:0:0: Direct-Access     ATA      Hitachi HDS72302 MN6O PQ: 0 ANSI: 5
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.908595] sd 0:0:0:0: [sda] 3907029168 512-byte logical blocks: (2.00 TB/1.81 TiB)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.908623] sd 0:0:0:0: Attached scsi generic sg0 type 0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.908663] sd 0:0:0:0: [sda] Write Protect is off
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.908667] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.908701] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.935783]  sda: sda1 sda2 < sda5 sda6 sda7 >
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.936339] sd 0:0:0:0: [sda] Attached SCSI disk
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.936659] Freeing unused kernel memory: 872K (c19b9000 - c1a93000)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.936707] Write protecting the kernel text: 6544k
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.936818] Write protecting the kernel read-only data: 2768k
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.936819] NX-protecting the kernel data: 5744k
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.986837] pata_jmicron 0000:02:00.1: enabling device (0000 -> 0001)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.987335] scsi4 : pata_jmicron
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.987429] scsi5 : pata_jmicron
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.987487] ata5: PATA max UDMA/100 cmd 0xbf00 ctl 0xbe00 bmdma 0xbb00 irq 17
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    1.987490] ata6: PATA max UDMA/100 cmd 0xbd00 ctl 0xbc00 bmdma 0xbb08 irq 17
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.006686] ahci 0000:02:00.0: version 3.0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.006798] ahci 0000:02:00.0: JMB361 has only one port
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.006810] ahci 0000:02:00.0: forcing port_map 0x3 -> 0x1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.012107] usb 2-5: New USB device found, idVendor=090c, idProduct=1000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.012112] usb 2-5: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.013819] [drm] Initialized drm 1.1.0 20060810
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.020426] ahci 0000:02:00.0: AHCI 0001.0000 32 slots 2 ports 3 Gbps 0x1 impl SATA mode
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.020432] ahci 0000:02:00.0: flags: 64bit ncq pm led clo pmp pio slum part 
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.025166] scsi6 : ahci
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.029804] r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.029936] r8169 0000:03:06.0 (unregistered net_device): not PCI Express
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.030247] r8169 0000:03:06.0 eth0: RTL8169sc/8110sc at 0xf840e000, 00:16:17:98:cf:fa, XID 18000000 IRQ 21
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.030252] r8169 0000:03:06.0 eth0: jumbo features [frames: 7152 bytes, tx checksumming: ok]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.035650] scsi7 : ahci
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.035730] ata7: SATA max UDMA/133 abar m8192@0xfdbfe000 port 0xfdbfe100 irq 16
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.035734] ata8: DUMMY
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.036293] FDC 0 is a post-1991 82077
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.048588] wmi: Mapper loaded
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.116846] usb-storage 2-5:1.0: USB Mass Storage device detected
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.116931] scsi8 : usb-storage 2-5:1.0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.117024] usbcore: registered new interface driver usb-storage
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.280078] usb 5-2: new low-speed USB device number 2 using uhci_hcd
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.352065] ata7: SATA link down (SStatus 0 SControl 300)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.397253] ata5.00: ATA-5: QUANTUM FIREBALLlct15 15, A01.0F00, max UDMA/66
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.397258] ata5.00: 29336832 sectors, multi 0: LBA 
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.397266] ata5.01: ATAPI: SONY    DVD RW DW-Q120A, PYS1, max UDMA/66
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.413802] ata5.00: configured for UDMA/66
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.448580] ata5.01: configured for UDMA/66
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.449221] scsi 4:0:0:0: Direct-Access     ATA      QUANTUM FIREBALL A01. PQ: 0 ANSI: 5
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.449439] sd 4:0:0:0: [sdb] 29336832 512-byte logical blocks: (15.0 GB/13.9 GiB)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.449460] sd 4:0:0:0: Attached scsi generic sg1 type 0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.449508] sd 4:0:0:0: [sdb] Write Protect is off
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.449513] sd 4:0:0:0: [sdb] Mode Sense: 00 3a 00 00
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.449542] sd 4:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.450455] scsi 4:0:1:0: CD-ROM            SONY     DVD RW DW-Q120A  PYS1 PQ: 0 ANSI: 5
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.457506] usb 5-2: New USB device found, idVendor=0603, idProduct=00f2
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.457511] usb 5-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.457514] usb 5-2: Product: USB Keyboard
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.457518] usb 5-2: Manufacturer: NOVATEK
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.470716] hidraw: raw HID events driver (C) Jiri Kosina
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.477671]  sdb: sdb1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.480001] sr0: scsi3-mmc drive: 48x/48x writer cd/rw xa/form2 cdda tray
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.480006] cdrom: Uniform CD-ROM driver Revision: 3.20
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.480110] sd 4:0:0:0: [sdb] Attached SCSI disk
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.480178] sr 4:0:1:0: Attached scsi CD-ROM sr0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.480273] sr 4:0:1:0: Attached scsi generic sg2 type 5
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.516268] usbcore: registered new interface driver usbhid
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.516271] usbhid: USB HID core driver
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.522192] input: NOVATEK USB Keyboard as /devices/pci0000:00/0000:00:1d.0/usb5/5-2/5-2:1.0/input/input5
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.522310] hid-generic 0003:0603:00F2.0001: input,hidraw0: USB HID v1.10 Keyboard [NOVATEK USB Keyboard] on usb-0000:00:1d.0-2/input0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.536606] input: NOVATEK USB Keyboard as /devices/pci0000:00/0000:00:1d.0/usb5/5-2/5-2:1.1/input/input6
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.536797] hid-generic 0003:0603:00F2.0002: input,hiddev0,hidraw1: USB HID v1.10 Device [NOVATEK USB Keyboard] on usb-0000:00:1d.0-2/input1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.700058] usb 6-1: new full-speed USB device number 2 using uhci_hcd
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.788156] Switched to clocksource tsc
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.881949] usb 6-1: New USB device found, idVendor=046d, idProduct=c52f
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.881955] usb 6-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.881959] usb 6-1: Product: USB Receiver
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.881963] usb 6-1: Manufacturer: Logitech
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.891091] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:1d.1/usb6/6-1/6-1:1.0/input/input7
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.891243] hid-generic 0003:046D:C52F.0003: input,hidraw2: USB HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:00:1d.1-1/input0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.897087] input: Logitech USB Receiver as /devices/pci0000:00/0000:00:1d.1/usb6/6-1/6-1:1.1/input/input8
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    2.897244] hid-generic 0003:046D:C52F.0004: input,hiddev0,hidraw3: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:00:1d.1-1/input1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    3.881931] scsi 8:0:0:0: Direct-Access                               1100 PQ: 0 ANSI: 0 CCS
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    3.882284] sd 8:0:0:0: Attached scsi generic sg3 type 0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    3.883212] sd 8:0:0:0: [sdc] 1972224 512-byte logical blocks: (1.00 GB/963 MiB)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    3.884050] sd 8:0:0:0: [sdc] Write Protect is off
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    3.884055] sd 8:0:0:0: [sdc] Mode Sense: 43 00 00 00
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    3.884921] sd 8:0:0:0: [sdc] No Caching mode page found
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    3.884924] sd 8:0:0:0: [sdc] Assuming drive cache: write through
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    3.888172] sd 8:0:0:0: [sdc] No Caching mode page found
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    3.888176] sd 8:0:0:0: [sdc] Assuming drive cache: write through
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    3.889190]  sdc: sdc1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    3.893174] sd 8:0:0:0: [sdc] No Caching mode page found
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    3.893178] sd 8:0:0:0: [sdc] Assuming drive cache: write through
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    3.893181] sd 8:0:0:0: [sdc] Attached SCSI removable disk
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    9.325527] random: nonblocking pool is initialized
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    9.326252] EXT4-fs (sda7): INFO: recovery required on readonly filesystem
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    9.326255] EXT4-fs (sda7): write access will be enabled during recovery
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    9.972116] EXT4-fs (sda7): recovery complete
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    9.980162] EXT4-fs (sda7): mounted filesystem with ordered data mode. Opts: (null)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   14.794880] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.032181] EXT4-fs (sda7): re-mounted. Opts: errors=remount-ro
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.088410] lp: driver loaded but no devices found
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.112725] ppdev: user-space parallel port driver
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.128620] parport_pc 00:09: reported by Plug and Play ACPI
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.128676] parport0: PC-style at 0x378, irq 7 [PCSPP,TRISTATE]
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.224160] lp0: using parport0 (interrupt-driven).
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.302689] ACPI Warning: 0x00000428-0x0000042f SystemIO conflicts with Region \PM2S 1 (20131115/utaddress-251)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.302699] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.302706] ACPI Warning: 0x000004b0-0x000004bf SystemIO conflicts with Region \GPO2 1 (20131115/utaddress-251)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.302711] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.302714] ACPI Warning: 0x00000480-0x000004af SystemIO conflicts with Region \GPO_ 1 (20131115/utaddress-251)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.302718] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.302721] lpc_ich: Resource conflict(s) found affecting gpio_ich
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.338895] type=1400 audit(1414529841.692:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/sbin/dhclient" pid=397 comm="apparmor_parser"
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.338905] type=1400 audit(1414529841.692:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=397 comm="apparmor_parser"
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.338912] type=1400 audit(1414529841.692:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/connman/scripts/dhclient-script" pid=397 comm="apparmor_parser"
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.339562] type=1400 audit(1414529841.692:5): apparmor="STATUS" operation="profile_replace" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=397 comm="apparmor_parser"
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.339569] type=1400 audit(1414529841.692:6): apparmor="STATUS" operation="profile_replace" profile="unconfined" name="/usr/lib/connman/scripts/dhclient-script" pid=397 comm="apparmor_parser"
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.339895] type=1400 audit(1414529841.692:7): apparmor="STATUS" operation="profile_replace" profile="unconfined" name="/usr/lib/connman/scripts/dhclient-script" pid=397 comm="apparmor_parser"
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.351309] type=1400 audit(1414529841.704:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/ntpd" pid=400 comm="apparmor_parser"
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.356745] cfg80211: Calling CRDA to update world regulatory domain
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.443686] ieee80211 phy0: rt2x00_set_chip: Info - Chipset detected - rt: 2561, rf: 0003, rev: 000c
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.475587] ieee80211 phy0: Selected rate control algorithm 'minstrel_ht'
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.620698] snd_hda_intel 0000:00:1b.0: irq 42 for MSI/MSI-X
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675514] SKU: Nid=0x0 sku_cfg=0x00007235
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675518] SKU: port_connectivity=0x0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675520] SKU: enable_pcbeep=0x1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675522] SKU: check_sum=0x00000000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675524] SKU: customization=0x00000000
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675525] SKU: external_amp=0x6
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675527] SKU: platform_type=0x1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675529] SKU: swap=0x0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675531] SKU: override=0x1
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675935] autoconfig: line_outs=4 (0x14/0x15/0x16/0x17/0x0) type:line
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675938]    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675940]    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675942]    mono: mono_out=0x0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675944]    dig-out=0x1e/0x0
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675945]    inputs:
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675948]      Front Mic=0x19
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675950]      Rear Mic=0x18
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675952]      Line=0x1a
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.675955] realtek: Enabling init ASM_ID=0x7235 CODEC_ID=10ec0883
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.706616] EXT4-fs (sda5): mounted filesystem with ordered data mode. Opts: (null)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.923851] input: HDA Intel Front Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card0/input16
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.927221] input: HDA Intel Line Out Side as /devices/pci0000:00/0000:00:1b.0/sound/card0/input15
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.949606] input: HDA Intel Line Out CLFE as /devices/pci0000:00/0000:00:1b.0/sound/card0/input14
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.949773] input: HDA Intel Line Out Surround as /devices/pci0000:00/0000:00:1b.0/sound/card0/input13
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.949936] input: HDA Intel Line Out Front as /devices/pci0000:00/0000:00:1b.0/sound/card0/input12
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.977121] input: HDA Intel Line as /devices/pci0000:00/0000:00:1b.0/sound/card0/input11
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.978458] input: HDA Intel Rear Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input10
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   15.979061] input: HDA Intel Front Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input9
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.064965] coretemp coretemp.0: Using relative temperature scale!
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.064987] coretemp coretemp.0: Using relative temperature scale!
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.301782] cfg80211: World regulatory domain updated:
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.301787] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.301790] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.301793] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.301796] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (300 mBi, 2000 mBm)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.301798] cfg80211:   (5170000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.301801] cfg80211:   (5735000 KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.532630] Bluetooth: Core ver 2.17
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.532922] NET: Registered protocol family 31
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.532926] Bluetooth: HCI device and connection manager initialized
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.533284] Bluetooth: HCI socket layer initialized
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.533289] Bluetooth: L2CAP socket layer initialized
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.533297] Bluetooth: SCO socket layer initialized
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.568121] Bluetooth: RFCOMM TTY layer initialized
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.568133] Bluetooth: RFCOMM socket layer initialized
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.568141] Bluetooth: RFCOMM ver 1.11
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.580796] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.580801] Bluetooth: BNEP filters: protocol multicast
Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [   16.580811] Bluetooth: BNEP socket layer initialized
Oct 28 21:57:23 victorlefevre-MS-7235 kernel: [   16.803098] type=1400 audit(1414529843.156:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/cups/backend/cups-pdf" pid=691 comm="apparmor_parser"
Oct 28 21:57:23 victorlefevre-MS-7235 kernel: [   16.803110] type=1400 audit(1414529843.156:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/cupsd" pid=691 comm="apparmor_parser"
Oct 28 21:57:23 victorlefevre-MS-7235 kernel: [   16.803757] type=1400 audit(1414529843.156:11): apparmor="STATUS" operation="profile_replace" profile="unconfined" name="/usr/sbin/cupsd" pid=691 comm="apparmor_parser"
Oct 28 21:57:23 victorlefevre-MS-7235 kernel: [   17.427805] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
Oct 28 21:57:23 victorlefevre-MS-7235 kernel: [   17.478414] r8169 0000:03:06.0 eth0: link down
Oct 28 21:57:23 victorlefevre-MS-7235 kernel: [   17.478433] r8169 0000:03:06.0 eth0: link down
Oct 28 21:57:23 victorlefevre-MS-7235 kernel: [   17.478452] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
Oct 28 21:57:23 victorlefevre-MS-7235 kernel: [   17.487825] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
Oct 28 21:57:25 victorlefevre-MS-7235 kernel: [   19.292214] r8169 0000:03:06.0 eth0: link up
Oct 28 21:57:25 victorlefevre-MS-7235 kernel: [   19.292228] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
Oct 28 21:58:01 victorlefevre-MS-7235 kernel: [   55.093617] FAT-fs (sdc1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.

--------------090400050305050700030100
Content-Type: text/x-log;
 name="Xorg.0.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Xorg.0.log"

[    18.295] 
X.Org X Server 1.15.1
Release Date: 2014-04-13
[    18.295] X Protocol Version 11, Revision 0
[    18.295] Build Operating System: Linux 3.2.0-37-generic i686 Ubuntu
[    18.295] Current Operating System: Linux victorlefevre-MS-7235 3.13.0-38-generic #65-Ubuntu SMP Thu Oct 9 11:39:01 UTC 2014 i686
[    18.295] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-3.13.0-38-generic root=UUID=7b0559d9-fbbe-4635-b244-bda94aa0a640 ro quiet splash nomodeset vt.handoff=7
[    18.295] Build Date: 30 July 2014  12:19:53AM
[    18.295] xorg-server 2:1.15.1-0ubuntu2.1 (For technical support please see http://www.ubuntu.com/support) 
[    18.295] Current version of pixman: 0.30.2
[    18.295] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[    18.295] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    18.295] (==) Log file: "/var/log/Xorg.0.log", Time: Tue Oct 28 22:03:30 2014
[    18.305] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[    18.306] (==) No Layout section.  Using the first Screen section.
[    18.306] (==) No screen section available. Using defaults.
[    18.306] (**) |-->Screen "Default Screen Section" (0)
[    18.306] (**) |   |-->Monitor "<default monitor>"
[    18.307] (==) No monitor specified for screen "Default Screen Section".
	Using a default monitor configuration.
[    18.307] (==) Automatically adding devices
[    18.307] (==) Automatically enabling devices
[    18.307] (==) Automatically adding GPU devices
[    18.307] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[    18.307] 	Entry deleted from font path.
[    18.307] (WW) The directory "/usr/share/fonts/X11/100dpi/" does not exist.
[    18.307] 	Entry deleted from font path.
[    18.307] (WW) The directory "/usr/share/fonts/X11/75dpi/" does not exist.
[    18.307] 	Entry deleted from font path.
[    18.307] (WW) The directory "/usr/share/fonts/X11/100dpi" does not exist.
[    18.307] 	Entry deleted from font path.
[    18.307] (WW) The directory "/usr/share/fonts/X11/75dpi" does not exist.
[    18.307] 	Entry deleted from font path.
[    18.307] (==) FontPath set to:
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/Type1,
	built-ins
[    18.307] (==) ModulePath set to "/usr/lib/i386-linux-gnu/xorg/extra-modules,/usr/lib/xorg/extra-modules,/usr/lib/xorg/modules"
[    18.307] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[    18.307] (II) Loader magic: 0xb77f06c0
[    18.307] (II) Module ABI versions:
[    18.307] 	X.Org ANSI C Emulation: 0.4
[    18.307] 	X.Org Video Driver: 15.0
[    18.307] 	X.Org XInput driver : 20.0
[    18.307] 	X.Org Server Extension : 8.0
[    18.310] (--) PCI:*(0:1:0:0) 10de:0392:1043:8202 rev 161, Mem @ 0xfa000000/16777216, 0xd0000000/268435456, 0xfb000000/16777216, I/O @ 0x0000df00/128, BIOS @ 0x????????/131072
[    18.310] Initializing built-in extension Generic Event Extension
[    18.310] Initializing built-in extension SHAPE
[    18.310] Initializing built-in extension MIT-SHM
[    18.310] Initializing built-in extension XInputExtension
[    18.310] Initializing built-in extension XTEST
[    18.310] Initializing built-in extension BIG-REQUESTS
[    18.310] Initializing built-in extension SYNC
[    18.310] Initializing built-in extension XKEYBOARD
[    18.310] Initializing built-in extension XC-MISC
[    18.310] Initializing built-in extension SECURITY
[    18.310] Initializing built-in extension XINERAMA
[    18.310] Initializing built-in extension XFIXES
[    18.310] Initializing built-in extension RENDER
[    18.310] Initializing built-in extension RANDR
[    18.310] Initializing built-in extension COMPOSITE
[    18.310] Initializing built-in extension DAMAGE
[    18.311] Initializing built-in extension MIT-SCREEN-SAVER
[    18.311] Initializing built-in extension DOUBLE-BUFFER
[    18.311] Initializing built-in extension RECORD
[    18.311] Initializing built-in extension DPMS
[    18.311] Initializing built-in extension Present
[    18.311] Initializing built-in extension DRI3
[    18.311] Initializing built-in extension X-Resource
[    18.311] Initializing built-in extension XVideo
[    18.311] Initializing built-in extension XVideo-MotionCompensation
[    18.311] Initializing built-in extension SELinux
[    18.311] Initializing built-in extension XFree86-VidModeExtension
[    18.311] Initializing built-in extension XFree86-DGA
[    18.311] Initializing built-in extension XFree86-DRI
[    18.311] Initializing built-in extension DRI2
[    18.311] (II) LoadModule: "glx"
[    18.319] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[    18.385] (II) Module glx: vendor="X.Org Foundation"
[    18.386] 	compiled for 1.15.1, module version = 1.0.0
[    18.386] 	ABI class: X.Org Server Extension, version 8.0
[    18.386] (==) AIGLX enabled
[    18.386] Loading extension GLX
[    18.386] (==) Matched nvidia as autoconfigured driver 0
[    18.386] (==) Matched nouveau as autoconfigured driver 1
[    18.386] (==) Matched modesetting as autoconfigured driver 2
[    18.386] (==) Matched fbdev as autoconfigured driver 3
[    18.386] (==) Matched vesa as autoconfigured driver 4
[    18.386] (==) Assigned the driver to the xf86ConfigLayout
[    18.386] (II) LoadModule: "nvidia"
[    18.389] (WW) Warning, couldn't open module nvidia
[    18.389] (II) UnloadModule: "nvidia"
[    18.389] (II) Unloading nvidia
[    18.389] (EE) Failed to load module "nvidia" (module does not exist, 0)
[    18.389] (II) LoadModule: "nouveau"
[    18.389] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    18.399] (II) Module nouveau: vendor="X.Org Foundation"
[    18.399] 	compiled for 1.15.1, module version = 1.0.11
[    18.399] 	Module class: X.Org Video Driver
[    18.399] 	ABI class: X.Org Video Driver, version 15.0
[    18.399] (II) LoadModule: "modesetting"
[    18.399] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
[    18.399] (II) Module modesetting: vendor="X.Org Foundation"
[    18.399] 	compiled for 1.15.0, module version = 0.8.1
[    18.399] 	Module class: X.Org Video Driver
[    18.399] 	ABI class: X.Org Video Driver, version 15.0
[    18.399] (II) LoadModule: "fbdev"
[    18.399] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[    18.400] (II) Module fbdev: vendor="X.Org Foundation"
[    18.400] 	compiled for 1.15.0, module version = 0.4.4
[    18.400] 	Module class: X.Org Video Driver
[    18.400] 	ABI class: X.Org Video Driver, version 15.0
[    18.400] (II) LoadModule: "vesa"
[    18.400] (II) Loading /usr/lib/xorg/modules/drivers/vesa_drv.so
[    18.400] (II) Module vesa: vendor="X.Org Foundation"
[    18.400] 	compiled for 1.15.0, module version = 2.3.3
[    18.400] 	Module class: X.Org Video Driver
[    18.400] 	ABI class: X.Org Video Driver, version 15.0
[    18.400] (==) Matched nvidia as autoconfigured driver 0
[    18.400] (==) Matched nouveau as autoconfigured driver 1
[    18.400] (==) Matched modesetting as autoconfigured driver 2
[    18.400] (==) Matched fbdev as autoconfigured driver 3
[    18.400] (==) Matched vesa as autoconfigured driver 4
[    18.400] (==) Assigned the driver to the xf86ConfigLayout
[    18.400] (II) LoadModule: "nvidia"
[    18.401] (WW) Warning, couldn't open module nvidia
[    18.401] (II) UnloadModule: "nvidia"
[    18.401] (II) Unloading nvidia
[    18.401] (EE) Failed to load module "nvidia" (module does not exist, 0)
[    18.401] (II) LoadModule: "nouveau"
[    18.401] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    18.401] (II) Module nouveau: vendor="X.Org Foundation"
[    18.401] 	compiled for 1.15.1, module version = 1.0.11
[    18.401] 	Module class: X.Org Video Driver
[    18.401] 	ABI class: X.Org Video Driver, version 15.0
[    18.401] (II) UnloadModule: "nouveau"
[    18.401] (II) Unloading nouveau
[    18.401] (II) Failed to load module "nouveau" (already loaded, 0)
[    18.401] (II) LoadModule: "modesetting"
[    18.401] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
[    18.402] (II) Module modesetting: vendor="X.Org Foundation"
[    18.402] 	compiled for 1.15.0, module version = 0.8.1
[    18.402] 	Module class: X.Org Video Driver
[    18.402] 	ABI class: X.Org Video Driver, version 15.0
[    18.402] (II) UnloadModule: "modesetting"
[    18.402] (II) Unloading modesetting
[    18.402] (II) Failed to load module "modesetting" (already loaded, 0)
[    18.402] (II) LoadModule: "fbdev"
[    18.402] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[    18.402] (II) Module fbdev: vendor="X.Org Foundation"
[    18.402] 	compiled for 1.15.0, module version = 0.4.4
[    18.402] 	Module class: X.Org Video Driver
[    18.402] 	ABI class: X.Org Video Driver, version 15.0
[    18.402] (II) UnloadModule: "fbdev"
[    18.402] (II) Unloading fbdev
[    18.402] (II) Failed to load module "fbdev" (already loaded, 0)
[    18.402] (II) LoadModule: "vesa"
[    18.402] (II) Loading /usr/lib/xorg/modules/drivers/vesa_drv.so
[    18.402] (II) Module vesa: vendor="X.Org Foundation"
[    18.402] 	compiled for 1.15.0, module version = 2.3.3
[    18.402] 	Module class: X.Org Video Driver
[    18.402] 	ABI class: X.Org Video Driver, version 15.0
[    18.402] (II) UnloadModule: "vesa"
[    18.402] (II) Unloading vesa
[    18.402] (II) Failed to load module "vesa" (already loaded, 0)
[    18.402] (II) NOUVEAU driver 
[    18.402] (II) NOUVEAU driver for NVIDIA chipset families :
[    18.402] 	RIVA TNT        (NV04)
[    18.403] 	RIVA TNT2       (NV05)
[    18.403] 	GeForce 256     (NV10)
[    18.403] 	GeForce 2       (NV11, NV15)
[    18.403] 	GeForce 4MX     (NV17, NV18)
[    18.403] 	GeForce 3       (NV20)
[    18.403] 	GeForce 4Ti     (NV25, NV28)
[    18.403] 	GeForce FX      (NV3x)
[    18.403] 	GeForce 6       (NV4x)
[    18.403] 	GeForce 7       (G7x)
[    18.403] 	GeForce 8       (G8x)
[    18.403] 	GeForce GTX 200 (NVA0)
[    18.403] 	GeForce GTX 400 (NVC0)
[    18.403] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[    18.403] (II) FBDEV: driver for framebuffer: fbdev
[    18.403] (II) VESA: driver for VESA chipsets: vesa
[    18.403] (++) using VT number 7

[    18.403] (EE) [drm] KMS not enabled
[    18.403] (EE) [drm] KMS not enabled
[    18.403] (EE) open /dev/dri/card0: No such file or directory
[    18.404] (EE) open /dev/dri/card0: No such file or directory
[    18.404] (WW) Falling back to old probe method for modesetting
[    18.404] (EE) open /dev/dri/card0: No such file or directory
[    18.404] (EE) open /dev/dri/card0: No such file or directory
[    18.404] (II) Loading sub module "fbdevhw"
[    18.404] (II) LoadModule: "fbdevhw"
[    18.404] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[    18.404] (II) Module fbdevhw: vendor="X.Org Foundation"
[    18.404] 	compiled for 1.15.1, module version = 0.0.2
[    18.404] 	ABI class: X.Org Video Driver, version 15.0
[    18.404] (**) FBDEV(2): claimed PCI slot 1@0:0:0
[    18.404] (II) FBDEV(2): using default device
[    18.404] (WW) Falling back to old probe method for vesa
[    18.404] (EE) Screen 0 deleted because of no matching config section.
[    18.404] (II) UnloadModule: "modesetting"
[    18.404] (EE) Screen 0 deleted because of no matching config section.
[    18.404] (II) UnloadModule: "modesetting"
[    18.404] (II) FBDEV(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 24/32
[    18.404] (==) FBDEV(0): Depth 24, (==) framebuffer bpp 32
[    18.404] (==) FBDEV(0): RGB weight 888
[    18.404] (==) FBDEV(0): Default visual is TrueColor
[    18.404] (==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
[    18.404] (II) FBDEV(0): hardware: VESA VGA (video memory: 3072kB)
[    18.404] (II) FBDEV(0): checking modes against framebuffer device...
[    18.404] (II) FBDEV(0): checking modes against monitor...
[    18.404] (--) FBDEV(0): Virtual size is 1024x768 (pitch 1024)
[    18.404] (**) FBDEV(0):  Built-in mode "current": 78.7 MHz, 59.9 kHz, 75.7 Hz
[    18.404] (II) FBDEV(0): Modeline "current"x0.0   78.65  1024 1056 1184 1312  768 772 776 792 -hsync -vsync -csync (59.9 kHz b)
[    18.404] (==) FBDEV(0): DPI set to (96, 96)
[    18.404] (II) Loading sub module "fb"
[    18.404] (II) LoadModule: "fb"
[    18.405] (II) Loading /usr/lib/xorg/modules/libfb.so
[    18.405] (II) Module fb: vendor="X.Org Foundation"
[    18.405] 	compiled for 1.15.1, module version = 1.0.0
[    18.405] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    18.405] (**) FBDEV(0): using shadow framebuffer
[    18.405] (II) Loading sub module "shadow"
[    18.405] (II) LoadModule: "shadow"
[    18.405] (II) Loading /usr/lib/xorg/modules/libshadow.so
[    18.405] (II) Module shadow: vendor="X.Org Foundation"
[    18.405] 	compiled for 1.15.1, module version = 1.1.0
[    18.405] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    18.405] (II) UnloadModule: "vesa"
[    18.405] (II) Unloading vesa
[    18.405] (==) Depth 24 pixmap format is 32 bpp
[    18.405] (EE) FBDEV(0): FBIOBLANK: Invalid argument
[    18.406] (==) FBDEV(0): Backing store enabled
[    18.406] (==) FBDEV(0): DPMS enabled
[    18.406] (==) RandR enabled
[    18.416] (II) SELinux: Disabled on system
[    18.417] (II) AIGLX: Screen 0 is not DRI2 capable
[    18.417] (EE) AIGLX: reverting to software rendering
[    18.443] (II) AIGLX: Loaded and initialized swrast
[    18.443] (II) GLX: Initialized DRISWRAST GL provider for screen 0
[    18.463] (II) XKB: reuse xkmfile /var/lib/xkb/server-B20D7FC79C7F597315E3E501AEF10E0D866E8E92.xkm
[    18.468] (II) config/udev: Adding input device Power Button (/dev/input/event1)
[    18.468] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    18.468] (II) LoadModule: "evdev"
[    18.468] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    18.477] (II) Module evdev: vendor="X.Org Foundation"
[    18.477] 	compiled for 1.15.0, module version = 2.8.2
[    18.477] 	Module class: X.Org XInput Driver
[    18.477] 	ABI class: X.Org XInput driver, version 20.0
[    18.477] (II) Using input driver 'evdev' for 'Power Button'
[    18.477] (**) Power Button: always reports core events
[    18.477] (**) evdev: Power Button: Device: "/dev/input/event1"
[    18.477] (--) evdev: Power Button: Vendor 0 Product 0x1
[    18.477] (--) evdev: Power Button: Found keys
[    18.477] (II) evdev: Power Button: Configuring as keyboard
[    18.477] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1/event1"
[    18.478] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 6)
[    18.478] (**) Option "xkb_rules" "evdev"
[    18.478] (**) Option "xkb_model" "pc105"
[    18.478] (**) Option "xkb_layout" "fr"
[    18.478] (**) Option "xkb_variant" "oss"
[    18.483] (II) XKB: reuse xkmfile /var/lib/xkb/server-6CCE7350BC740BB33D520367F4A10E64192A358C.xkm
[    18.484] (II) config/udev: Adding input device Power Button (/dev/input/event0)
[    18.484] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    18.484] (II) Using input driver 'evdev' for 'Power Button'
[    18.484] (**) Power Button: always reports core events
[    18.484] (**) evdev: Power Button: Device: "/dev/input/event0"
[    18.484] (--) evdev: Power Button: Vendor 0 Product 0x1
[    18.484] (--) evdev: Power Button: Found keys
[    18.484] (II) evdev: Power Button: Configuring as keyboard
[    18.484] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input0/event0"
[    18.484] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 7)
[    18.484] (**) Option "xkb_rules" "evdev"
[    18.484] (**) Option "xkb_model" "pc105"
[    18.484] (**) Option "xkb_layout" "fr"
[    18.485] (**) Option "xkb_variant" "oss"
[    18.485] (II) config/udev: Adding input device HDA Intel Rear Mic (/dev/input/event12)
[    18.485] (II) No input driver specified, ignoring this device.
[    18.485] (II) This device may have been added with another device file.
[    18.486] (II) config/udev: Adding input device HDA Intel Line (/dev/input/event11)
[    18.486] (II) No input driver specified, ignoring this device.
[    18.486] (II) This device may have been added with another device file.
[    18.486] (II) config/udev: Adding input device HDA Intel Line Out Front (/dev/input/event10)
[    18.486] (II) No input driver specified, ignoring this device.
[    18.486] (II) This device may have been added with another device file.
[    18.486] (II) config/udev: Adding input device HDA Intel Line Out Surround (/dev/input/event9)
[    18.486] (II) No input driver specified, ignoring this device.
[    18.486] (II) This device may have been added with another device file.
[    18.487] (II) config/udev: Adding input device HDA Intel Line Out CLFE (/dev/input/event8)
[    18.487] (II) No input driver specified, ignoring this device.
[    18.487] (II) This device may have been added with another device file.
[    18.487] (II) config/udev: Adding input device HDA Intel Line Out Side (/dev/input/event7)
[    18.487] (II) No input driver specified, ignoring this device.
[    18.487] (II) This device may have been added with another device file.
[    18.488] (II) config/udev: Adding input device HDA Intel Front Headphone (/dev/input/event6)
[    18.488] (II) No input driver specified, ignoring this device.
[    18.488] (II) This device may have been added with another device file.
[    18.488] (II) config/udev: Adding input device HDA Intel Front Mic (/dev/input/event13)
[    18.488] (II) No input driver specified, ignoring this device.
[    18.488] (II) This device may have been added with another device file.
[    18.489] (II) config/udev: Adding input device NOVATEK USB Keyboard (/dev/input/event2)
[    18.489] (**) NOVATEK USB Keyboard: Applying InputClass "evdev keyboard catchall"
[    18.489] (II) Using input driver 'evdev' for 'NOVATEK USB Keyboard'
[    18.489] (**) NOVATEK USB Keyboard: always reports core events
[    18.489] (**) evdev: NOVATEK USB Keyboard: Device: "/dev/input/event2"
[    18.489] (--) evdev: NOVATEK USB Keyboard: Vendor 0x603 Product 0xf2
[    18.489] (--) evdev: NOVATEK USB Keyboard: Found keys
[    18.489] (II) evdev: NOVATEK USB Keyboard: Configuring as keyboard
[    18.489] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.0/usb5/5-2/5-2:1.0/input/input5/event2"
[    18.489] (II) XINPUT: Adding extended input device "NOVATEK USB Keyboard" (type: KEYBOARD, id 8)
[    18.489] (**) Option "xkb_rules" "evdev"
[    18.489] (**) Option "xkb_model" "pc105"
[    18.489] (**) Option "xkb_layout" "fr"
[    18.489] (**) Option "xkb_variant" "oss"
[    18.490] (II) config/udev: Adding input device NOVATEK USB Keyboard (/dev/input/event3)
[    18.490] (**) NOVATEK USB Keyboard: Applying InputClass "evdev keyboard catchall"
[    18.490] (II) Using input driver 'evdev' for 'NOVATEK USB Keyboard'
[    18.490] (**) NOVATEK USB Keyboard: always reports core events
[    18.490] (**) evdev: NOVATEK USB Keyboard: Device: "/dev/input/event3"
[    18.490] (--) evdev: NOVATEK USB Keyboard: Vendor 0x603 Product 0xf2
[    18.490] (--) evdev: NOVATEK USB Keyboard: Found 20 mouse buttons
[    18.490] (--) evdev: NOVATEK USB Keyboard: Found keys
[    18.490] (II) evdev: NOVATEK USB Keyboard: Forcing relative x/y axes to exist.
[    18.490] (II) evdev: NOVATEK USB Keyboard: Configuring as mouse
[    18.490] (II) evdev: NOVATEK USB Keyboard: Configuring as keyboard
[    18.490] (**) evdev: NOVATEK USB Keyboard: YAxisMapping: buttons 4 and 5
[    18.490] (**) evdev: NOVATEK USB Keyboard: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    18.490] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.0/usb5/5-2/5-2:1.1/input/input6/event3"
[    18.490] (II) XINPUT: Adding extended input device "NOVATEK USB Keyboard" (type: KEYBOARD, id 9)
[    18.490] (**) Option "xkb_rules" "evdev"
[    18.490] (**) Option "xkb_model" "pc105"
[    18.490] (**) Option "xkb_layout" "fr"
[    18.490] (**) Option "xkb_variant" "oss"
[    18.491] (II) config/udev: Adding input device Logitech USB Receiver (/dev/input/event4)
[    18.491] (**) Logitech USB Receiver: Applying InputClass "evdev pointer catchall"
[    18.491] (II) Using input driver 'evdev' for 'Logitech USB Receiver'
[    18.491] (**) Logitech USB Receiver: always reports core events
[    18.491] (**) evdev: Logitech USB Receiver: Device: "/dev/input/event4"
[    18.491] (--) evdev: Logitech USB Receiver: Vendor 0x46d Product 0xc52f
[    18.491] (--) evdev: Logitech USB Receiver: Found 20 mouse buttons
[    18.491] (--) evdev: Logitech USB Receiver: Found scroll wheel(s)
[    18.491] (--) evdev: Logitech USB Receiver: Found relative axes
[    18.491] (--) evdev: Logitech USB Receiver: Found x and y relative axes
[    18.491] (II) evdev: Logitech USB Receiver: Configuring as mouse
[    18.491] (II) evdev: Logitech USB Receiver: Adding scrollwheel support
[    18.491] (**) evdev: Logitech USB Receiver: YAxisMapping: buttons 4 and 5
[    18.491] (**) evdev: Logitech USB Receiver: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    18.491] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.1/usb6/6-1/6-1:1.0/input/input7/event4"
[    18.491] (II) XINPUT: Adding extended input device "Logitech USB Receiver" (type: MOUSE, id 10)
[    18.491] (II) evdev: Logitech USB Receiver: initialized for relative axes.
[    18.491] (**) Logitech USB Receiver: (accel) keeping acceleration scheme 1
[    18.491] (**) Logitech USB Receiver: (accel) acceleration profile 0
[    18.491] (**) Logitech USB Receiver: (accel) acceleration factor: 2.000
[    18.492] (**) Logitech USB Receiver: (accel) acceleration threshold: 4
[    18.492] (II) config/udev: Adding input device Logitech USB Receiver (/dev/input/mouse0)
[    18.492] (II) No input driver specified, ignoring this device.
[    18.492] (II) This device may have been added with another device file.
[    18.492] (II) config/udev: Adding input device Logitech USB Receiver (/dev/input/event5)
[    18.493] (**) Logitech USB Receiver: Applying InputClass "evdev keyboard catchall"
[    18.493] (II) Using input driver 'evdev' for 'Logitech USB Receiver'
[    18.493] (**) Logitech USB Receiver: always reports core events
[    18.493] (**) evdev: Logitech USB Receiver: Device: "/dev/input/event5"
[    18.493] (--) evdev: Logitech USB Receiver: Vendor 0x46d Product 0xc52f
[    18.493] (--) evdev: Logitech USB Receiver: Found 1 mouse buttons
[    18.493] (--) evdev: Logitech USB Receiver: Found scroll wheel(s)
[    18.493] (--) evdev: Logitech USB Receiver: Found relative axes
[    18.493] (II) evdev: Logitech USB Receiver: Forcing relative x/y axes to exist.
[    18.493] (--) evdev: Logitech USB Receiver: Found absolute axes
[    18.493] (II) evdev: Logitech USB Receiver: Forcing absolute x/y axes to exist.
[    18.493] (--) evdev: Logitech USB Receiver: Found keys
[    18.493] (II) evdev: Logitech USB Receiver: Configuring as mouse
[    18.493] (II) evdev: Logitech USB Receiver: Configuring as keyboard
[    18.493] (II) evdev: Logitech USB Receiver: Adding scrollwheel support
[    18.493] (**) evdev: Logitech USB Receiver: YAxisMapping: buttons 4 and 5
[    18.493] (**) evdev: Logitech USB Receiver: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    18.493] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.1/usb6/6-1/6-1:1.1/input/input8/event5"
[    18.493] (II) XINPUT: Adding extended input device "Logitech USB Receiver" (type: KEYBOARD, id 11)
[    18.493] (**) Option "xkb_rules" "evdev"
[    18.493] (**) Option "xkb_model" "pc105"
[    18.493] (**) Option "xkb_layout" "fr"
[    18.493] (**) Option "xkb_variant" "oss"
[    18.493] (II) evdev: Logitech USB Receiver: initialized for relative axes.
[    18.493] (WW) evdev: Logitech USB Receiver: ignoring absolute axes.
[    18.493] (**) Logitech USB Receiver: (accel) keeping acceleration scheme 1
[    18.493] (**) Logitech USB Receiver: (accel) acceleration profile 0
[    18.493] (**) Logitech USB Receiver: (accel) acceleration factor: 2.000
[    18.493] (**) Logitech USB Receiver: (accel) acceleration threshold: 4
[    18.500] (EE) FBDEV(0): FBIOBLANK: Invalid argument
[    18.646] (II) XKB: reuse xkmfile /var/lib/xkb/server-34CEB476A3CB596DA76FD7010A029F76732EF824.xkm
[    26.471] (II) XKB: reuse xkmfile /var/lib/xkb/server-54B674C93F06EBC49DA118B07234FD13C705906D.xkm

--------------090400050305050700030100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--------------090400050305050700030100--
