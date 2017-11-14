From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
Date: Tue, 14 Nov 2017 11:20:12 +0000
Message-ID: <bug-100567-8800-Sod0IMpDDc@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1454028928=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100567-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1454028928==
Content-Type: multipart/alternative; boundary="15106584120.e7fC3B06.27718";
 charset="UTF-8"


--15106584120.e7fC3B06.27718
Date: Tue, 14 Nov 2017 11:20:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #10 from G=C3=A9za B=C3=BAza <bghome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
It must be a driver bug, as I see the same error on different kernel and
different graphic hardware.


dmesg output:

nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:01:00.0: fifo: channel 12: killed
nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery


lspci -vv -s 01:00.0

VGA compatible controller: NVIDIA Corporation GK106GLM [Quadro K2100M] (rev=
 a1)
(prog-if 00 [VGA controller])
Subsystem: Dell GK106GLM [Quadro K2100M]
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppin=
g-
SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
Latency: 0, Cache Line Size: 64 bytes
Interrupt: pin A routed to IRQ 25
Region 0: Memory at f5000000 (32-bit, non-prefetchable) [size=3D16M]
Region 1: Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
Region 3: Memory at f0000000 (64-bit, prefetchable) [size=3D32M]
Region 5: I/O ports at e000 [size=3D128]
Expansion ROM at 000c0000 [disabled] [size=3D128K]
Capabilities: <access denied>
Kernel driver in use: nouveau
Kernel modules: nouveau


uname -a

Linux Geza-DellM4700 4.13.11-1-ARCH #1 SMP PREEMPT Thu Nov 2 10:25:56 CET 2=
017
x86_64 GNU/Linux


lsmod

Module                  Size  Used by
fuse                   94208  3
ccm                    20480  9
cmac                   16384  1
rfcomm                 69632  32
ipt_MASQUERADE         16384  1
nf_nat_masquerade_ipv4    16384  1 ipt_MASQUERADE
nf_conntrack_netlink    36864  0
nfnetlink              16384  2 nf_conntrack_netlink
xfrm_user              32768  1
xfrm_algo              16384  1 xfrm_user
iptable_nat            16384  1
nf_conntrack_ipv4      16384  3
nf_defrag_ipv4         16384  1 nf_conntrack_ipv4
nf_nat_ipv4            16384  1 iptable_nat
xt_addrtype            16384  2
iptable_filter         16384  1
xt_conntrack           16384  1
nf_nat                 24576  2 nf_nat_masquerade_ipv4,nf_nat_ipv4
nf_conntrack          110592  7
nf_conntrack_ipv4,ipt_MASQUERADE,nf_conntrack_netlink,nf_nat_masquerade_ipv=
4,xt_conntrack,nf_nat_ipv4,nf_nat
libcrc32c              16384  2 nf_conntrack,nf_nat
crc32c_generic         16384  0
br_netfilter           24576  0
bridge                139264  1 br_netfilter
stp                    16384  1 bridge
llc                    16384  2 bridge,stp
joydev                 20480  0
mousedev               20480  0
snd_hda_codec_hdmi     49152  1
snd_hda_codec_idt      49152  1
snd_hda_codec_generic    69632  1 snd_hda_codec_idt
bnep                   20480  2
arc4                   16384  2
hid_logitech_hidpp     32768  0
mei_wdt                16384  0
iTCO_wdt               16384  0
iTCO_vendor_support    16384  1 iTCO_wdt
ppdev                  20480  0
intel_rapl             20480  0
x86_pkg_temp_thermal    16384  0
intel_powerclamp       16384  0
dell_laptop            20480  0
coretemp               16384  0
dell_smm_hwmon         16384  0
kvm_intel             192512  0
iwlmvm                299008  0
kvm                   516096  1 kvm_intel
mac80211              688128  1 iwlmvm
irqbypass              16384  1 kvm
crct10dif_pclmul       16384  0
crc32_pclmul           16384  0
ghash_clmulni_intel    16384  0
pcbc                   16384  0
snd_hda_intel          36864  8
snd_hda_codec         106496  4
snd_hda_intel,snd_hda_codec_idt,snd_hda_codec_hdmi,snd_hda_codec_generic
aesni_intel           184320  8
uvcvideo               86016  0
snd_hda_core           65536  5
snd_hda_intel,snd_hda_codec,snd_hda_codec_idt,snd_hda_codec_hdmi,snd_hda_co=
dec_generic
aes_x86_64             20480  1 aesni_intel
videobuf2_vmalloc      16384  1 uvcvideo
crypto_simd            16384  1 aesni_intel
snd_hwdep              20480  1 snd_hda_codec
btusb                  40960  0
glue_helper            16384  1 aesni_intel
videobuf2_memops       16384  1 videobuf2_vmalloc
e1000e                225280  0
nls_iso8859_1          16384  1
btrtl                  16384  1 btusb
cryptd                 20480  3 crypto_simd,ghash_clmulni_intel,aesni_intel
videobuf2_v4l2         20480  1 uvcvideo
iwlwifi               217088  1 iwlmvm
intel_cstate           16384  0
snd_pcm                86016  4
snd_hda_intel,snd_hda_codec,snd_hda_core,snd_hda_codec_hdmi
videobuf2_core         36864  2 uvcvideo,videobuf2_v4l2
btbcm                  16384  1 btusb
nls_cp437              20480  1
btintel                16384  1 btusb
dell_wmi               16384  0
dell_smbios            16384  2 dell_wmi,dell_laptop
bluetooth             479232  68 btrtl,btintel,bnep,btbcm,rfcomm,btusb
vfat                   20480  1
snd_timer              28672  1 snd_pcm
fat                    65536  1 vfat
videodev              155648  3 uvcvideo,videobuf2_core,videobuf2_v4l2
intel_rapl_perf        16384  0
snd                    73728  24
snd_hda_intel,snd_hwdep,snd_hda_codec,snd_hda_codec_idt,snd_timer,snd_hda_c=
odec_hdmi,snd_hda_codec_generic,snd_pcm
dcdbas                 16384  1 dell_smbios
ecdh_generic           24576  1 bluetooth
mei_me                 36864  1
media                  32768  2 uvcvideo,videodev
psmouse               135168  0
input_leds             16384  0
sparse_keymap          16384  1 dell_wmi
wmi_bmof               16384  0
cfg80211              532480  3 iwlmvm,iwlwifi,mac80211
crc16                  16384  1 bluetooth
hid_logitech_dj        20480  0
ptp                    20480  1 e1000e
lpc_ich                24576  0
i2c_i801               24576  0
soundcore              16384  1 snd
mei                    81920  3 mei_me,mei_wdt
pps_core               20480  1 ptp
shpchp                 32768  0
parport_pc             28672  0
parport                40960  2 parport_pc,ppdev
dell_smo8800           16384  0
thermal                20480  0
dell_rbtn              16384  0
rfkill                 20480  10 bluetooth,dell_laptop,dell_rbtn,cfg80211
battery                20480  0
ac                     16384  0
evdev                  24576  39
mac_hid                16384  0
squashfs               49152  1
loop                   28672  2
sch_fq_codel           20480  6
vboxnetflt             28672  0
vboxnetadp             28672  0
pci_stub               16384  1
vboxpci                24576  0
vboxdrv               393216  3 vboxnetadp,vboxnetflt,vboxpci
nfsd                  315392  13
auth_rpcgss            57344  1 nfsd
overlay                65536  0
oid_registry           16384  1 auth_rpcgss
nfs_acl                16384  1 nfsd
lockd                  86016  1 nfsd
sg                     36864  0
grace                  16384  2 nfsd,lockd
crypto_user            16384  0
sunrpc                282624  19 auth_rpcgss,nfsd,nfs_acl,lockd
ip_tables              24576  2 iptable_filter,iptable_nat
x_tables               32768  5
ip_tables,iptable_filter,ipt_MASQUERADE,xt_addrtype,xt_conntrack
btrfs                1036288  1
xor                    24576  1 btrfs
raid6_pq              114688  1 btrfs
sr_mod                 24576  0
cdrom                  53248  1 sr_mod
sd_mod                 49152  3
usbhid                 45056  0
hid                   114688  4 usbhid,hid_logitech_dj,hid_logitech_hidpp
serio_raw              16384  0
atkbd                  24576  0
libps2                 16384  2 atkbd,psmouse
ahci                   36864  2
libahci                28672  1 ahci
firewire_ohci          40960  0
crc32c_intel           24576  2
libata                208896  2 ahci,libahci
xhci_pci               16384  0
sdhci_pci              28672  0
sdhci                  40960  1 sdhci_pci
ehci_pci               16384  0
xhci_hcd              188416  1 xhci_pci
scsi_mod              155648  4 sd_mod,libata,sr_mod,sg
ehci_hcd               73728  1 ehci_pci
firewire_core          57344  1 firewire_ohci
mmc_core              122880  2 sdhci,sdhci_pci
crc_itu_t              16384  1 firewire_core
usbcore               208896  7
uvcvideo,usbhid,ehci_hcd,xhci_pci,btusb,xhci_hcd,ehci_pci
usb_common             16384  1 usbcore
i8042                  24576  1 dell_laptop
serio                  20480  6 serio_raw,atkbd,psmouse,i8042
nouveau              1564672  44
button                 16384  1 nouveau
video                  36864  3 dell_wmi,dell_laptop,nouveau
led_class              16384  5 iwlmvm,sdhci,input_leds,dell_laptop,nouveau
mxm_wmi                16384  1 nouveau
wmi                    20480  4 dell_wmi,wmi_bmof,mxm_wmi,nouveau
i2c_algo_bit           16384  1 nouveau
drm_kms_helper        131072  1 nouveau
syscopyarea            16384  1 drm_kms_helper
sysfillrect            16384  1 drm_kms_helper
sysimgblt              16384  1 drm_kms_helper
fb_sys_fops            16384  1 drm_kms_helper
ttm                    81920  1 nouveau
drm                   303104  29 nouveau,ttm,drm_kms_helper
agpgart                36864  3 nouveau,ttm,drm

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15106584120.e7fC3B06.27718
Date: Tue, 14 Nov 2017 11:20:12 +0000
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
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bghome&#64;gmail.com" title=3D"G=C3=A9za B=C3=BAza &lt;bghome&#64;gmail.com=
&gt;"> <span class=3D"fn">G=C3=A9za B=C3=BAza</span></a>
</span></b>
        <pre>It must be a driver bug, as I see the same error on different =
kernel and
different graphic hardware.


dmesg output:

nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
nouveau 0000:01:00.0: fifo: channel 12: killed
nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery


lspci -vv -s 01:00.0

VGA compatible controller: NVIDIA Corporation GK106GLM [Quadro K2100M] (rev=
 a1)
(prog-if 00 [VGA controller])
Subsystem: Dell GK106GLM [Quadro K2100M]
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppin=
g-
SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort- &lt;TAb=
ort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
Latency: 0, Cache Line Size: 64 bytes
Interrupt: pin A routed to IRQ 25
Region 0: Memory at f5000000 (32-bit, non-prefetchable) [size=3D16M]
Region 1: Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
Region 3: Memory at f0000000 (64-bit, prefetchable) [size=3D32M]
Region 5: I/O ports at e000 [size=3D128]
Expansion ROM at 000c0000 [disabled] [size=3D128K]
Capabilities: &lt;access denied&gt;
Kernel driver in use: nouveau
Kernel modules: nouveau


uname -a

Linux Geza-DellM4700 4.13.11-1-ARCH #1 SMP PREEMPT Thu Nov 2 10:25:56 CET 2=
017
x86_64 GNU/Linux


lsmod

Module                  Size  Used by
fuse                   94208  3
ccm                    20480  9
cmac                   16384  1
rfcomm                 69632  32
ipt_MASQUERADE         16384  1
nf_nat_masquerade_ipv4    16384  1 ipt_MASQUERADE
nf_conntrack_netlink    36864  0
nfnetlink              16384  2 nf_conntrack_netlink
xfrm_user              32768  1
xfrm_algo              16384  1 xfrm_user
iptable_nat            16384  1
nf_conntrack_ipv4      16384  3
nf_defrag_ipv4         16384  1 nf_conntrack_ipv4
nf_nat_ipv4            16384  1 iptable_nat
xt_addrtype            16384  2
iptable_filter         16384  1
xt_conntrack           16384  1
nf_nat                 24576  2 nf_nat_masquerade_ipv4,nf_nat_ipv4
nf_conntrack          110592  7
nf_conntrack_ipv4,ipt_MASQUERADE,nf_conntrack_netlink,nf_nat_masquerade_ipv=
4,xt_conntrack,nf_nat_ipv4,nf_nat
libcrc32c              16384  2 nf_conntrack,nf_nat
crc32c_generic         16384  0
br_netfilter           24576  0
bridge                139264  1 br_netfilter
stp                    16384  1 bridge
llc                    16384  2 bridge,stp
joydev                 20480  0
mousedev               20480  0
snd_hda_codec_hdmi     49152  1
snd_hda_codec_idt      49152  1
snd_hda_codec_generic    69632  1 snd_hda_codec_idt
bnep                   20480  2
arc4                   16384  2
hid_logitech_hidpp     32768  0
mei_wdt                16384  0
iTCO_wdt               16384  0
iTCO_vendor_support    16384  1 iTCO_wdt
ppdev                  20480  0
intel_rapl             20480  0
x86_pkg_temp_thermal    16384  0
intel_powerclamp       16384  0
dell_laptop            20480  0
coretemp               16384  0
dell_smm_hwmon         16384  0
kvm_intel             192512  0
iwlmvm                299008  0
kvm                   516096  1 kvm_intel
mac80211              688128  1 iwlmvm
irqbypass              16384  1 kvm
crct10dif_pclmul       16384  0
crc32_pclmul           16384  0
ghash_clmulni_intel    16384  0
pcbc                   16384  0
snd_hda_intel          36864  8
snd_hda_codec         106496  4
snd_hda_intel,snd_hda_codec_idt,snd_hda_codec_hdmi,snd_hda_codec_generic
aesni_intel           184320  8
uvcvideo               86016  0
snd_hda_core           65536  5
snd_hda_intel,snd_hda_codec,snd_hda_codec_idt,snd_hda_codec_hdmi,snd_hda_co=
dec_generic
aes_x86_64             20480  1 aesni_intel
videobuf2_vmalloc      16384  1 uvcvideo
crypto_simd            16384  1 aesni_intel
snd_hwdep              20480  1 snd_hda_codec
btusb                  40960  0
glue_helper            16384  1 aesni_intel
videobuf2_memops       16384  1 videobuf2_vmalloc
e1000e                225280  0
nls_iso8859_1          16384  1
btrtl                  16384  1 btusb
cryptd                 20480  3 crypto_simd,ghash_clmulni_intel,aesni_intel
videobuf2_v4l2         20480  1 uvcvideo
iwlwifi               217088  1 iwlmvm
intel_cstate           16384  0
snd_pcm                86016  4
snd_hda_intel,snd_hda_codec,snd_hda_core,snd_hda_codec_hdmi
videobuf2_core         36864  2 uvcvideo,videobuf2_v4l2
btbcm                  16384  1 btusb
nls_cp437              20480  1
btintel                16384  1 btusb
dell_wmi               16384  0
dell_smbios            16384  2 dell_wmi,dell_laptop
bluetooth             479232  68 btrtl,btintel,bnep,btbcm,rfcomm,btusb
vfat                   20480  1
snd_timer              28672  1 snd_pcm
fat                    65536  1 vfat
videodev              155648  3 uvcvideo,videobuf2_core,videobuf2_v4l2
intel_rapl_perf        16384  0
snd                    73728  24
snd_hda_intel,snd_hwdep,snd_hda_codec,snd_hda_codec_idt,snd_timer,snd_hda_c=
odec_hdmi,snd_hda_codec_generic,snd_pcm
dcdbas                 16384  1 dell_smbios
ecdh_generic           24576  1 bluetooth
mei_me                 36864  1
media                  32768  2 uvcvideo,videodev
psmouse               135168  0
input_leds             16384  0
sparse_keymap          16384  1 dell_wmi
wmi_bmof               16384  0
cfg80211              532480  3 iwlmvm,iwlwifi,mac80211
crc16                  16384  1 bluetooth
hid_logitech_dj        20480  0
ptp                    20480  1 e1000e
lpc_ich                24576  0
i2c_i801               24576  0
soundcore              16384  1 snd
mei                    81920  3 mei_me,mei_wdt
pps_core               20480  1 ptp
shpchp                 32768  0
parport_pc             28672  0
parport                40960  2 parport_pc,ppdev
dell_smo8800           16384  0
thermal                20480  0
dell_rbtn              16384  0
rfkill                 20480  10 bluetooth,dell_laptop,dell_rbtn,cfg80211
battery                20480  0
ac                     16384  0
evdev                  24576  39
mac_hid                16384  0
squashfs               49152  1
loop                   28672  2
sch_fq_codel           20480  6
vboxnetflt             28672  0
vboxnetadp             28672  0
pci_stub               16384  1
vboxpci                24576  0
vboxdrv               393216  3 vboxnetadp,vboxnetflt,vboxpci
nfsd                  315392  13
auth_rpcgss            57344  1 nfsd
overlay                65536  0
oid_registry           16384  1 auth_rpcgss
nfs_acl                16384  1 nfsd
lockd                  86016  1 nfsd
sg                     36864  0
grace                  16384  2 nfsd,lockd
crypto_user            16384  0
sunrpc                282624  19 auth_rpcgss,nfsd,nfs_acl,lockd
ip_tables              24576  2 iptable_filter,iptable_nat
x_tables               32768  5
ip_tables,iptable_filter,ipt_MASQUERADE,xt_addrtype,xt_conntrack
btrfs                1036288  1
xor                    24576  1 btrfs
raid6_pq              114688  1 btrfs
sr_mod                 24576  0
cdrom                  53248  1 sr_mod
sd_mod                 49152  3
usbhid                 45056  0
hid                   114688  4 usbhid,hid_logitech_dj,hid_logitech_hidpp
serio_raw              16384  0
atkbd                  24576  0
libps2                 16384  2 atkbd,psmouse
ahci                   36864  2
libahci                28672  1 ahci
firewire_ohci          40960  0
crc32c_intel           24576  2
libata                208896  2 ahci,libahci
xhci_pci               16384  0
sdhci_pci              28672  0
sdhci                  40960  1 sdhci_pci
ehci_pci               16384  0
xhci_hcd              188416  1 xhci_pci
scsi_mod              155648  4 sd_mod,libata,sr_mod,sg
ehci_hcd               73728  1 ehci_pci
firewire_core          57344  1 firewire_ohci
mmc_core              122880  2 sdhci,sdhci_pci
crc_itu_t              16384  1 firewire_core
usbcore               208896  7
uvcvideo,usbhid,ehci_hcd,xhci_pci,btusb,xhci_hcd,ehci_pci
usb_common             16384  1 usbcore
i8042                  24576  1 dell_laptop
serio                  20480  6 serio_raw,atkbd,psmouse,i8042
nouveau              1564672  44
button                 16384  1 nouveau
video                  36864  3 dell_wmi,dell_laptop,nouveau
led_class              16384  5 iwlmvm,sdhci,input_leds,dell_laptop,nouveau
mxm_wmi                16384  1 nouveau
wmi                    20480  4 dell_wmi,wmi_bmof,mxm_wmi,nouveau
i2c_algo_bit           16384  1 nouveau
drm_kms_helper        131072  1 nouveau
syscopyarea            16384  1 drm_kms_helper
sysfillrect            16384  1 drm_kms_helper
sysimgblt              16384  1 drm_kms_helper
fb_sys_fops            16384  1 drm_kms_helper
ttm                    81920  1 nouveau
drm                   303104  29 nouveau,ttm,drm_kms_helper
agpgart                36864  3 nouveau,ttm,drm</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15106584120.e7fC3B06.27718--

--===============1454028928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1454028928==--
