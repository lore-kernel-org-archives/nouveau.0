From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103689] New: there is an exploitable page fault that
 can be reliably triggered from the chromium sandbox can possibly lead to
 remote attackers causing a denial of service condition or possibly running
 system code.
Date: Sat, 11 Nov 2017 22:40:21 +0000
Message-ID: <bug-103689-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0531193974=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0531193974==
Content-Type: multipart/alternative; boundary="15104400220.DaBc18C8D.2786";
 charset="UTF-8"


--15104400220.DaBc18C8D.2786
Date: Sat, 11 Nov 2017 22:40:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103689

            Bug ID: 103689
           Summary: there is an exploitable page fault that can be
                    reliably triggered from the chromium sandbox can
                    possibly lead to remote attackers causing a denial of
                    service condition or possibly running system code.
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: yena0xc5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 135404
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D135404&action=3Dedit
reproduction

there is an exploitable page fault that can be reliably triggered from the
chromium sandbox can possibly lead to remote attackers causing a denial of
service condition or possibly running system code.

this was found while fuzzing the chromium browser.

in order to reproduce you should run the given html page:
https://drive.google.com/open?id=3D15NzlWcu0vUPLPpEDuOMCpCWjWM4QrAx3

with the default installation of ubuntu desktop (details of the ver of the
products given below..) with the Nouveau driver installed, this can be remo=
tely
exploitable.

this issue is referenced here:
https://bugs.chromium.org/p/chromium/issues/detail?id=3D784062=20=20

details:


this should effect chrom-os too,
https://chromium.googlesource.com/chromiumos/third_party/drm/+/292da616fe1f=
936ca78a3fa8e1b1b19883e343b6/nouveau/nouveau.h

this is the kernel stack:

comm=3D"webbrowser-app" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D1000=
 ouid=3D0
Nov 10 11:22:13 nitro kernel: [   53.352636] audit: type=3D1400
audit(1510305733.908:25): apparmor=3D"DENIED" operation=3D"connect"
profile=3D"webbrowser-app" pid=3D1903 comm=3D"webbrowser-app" family=3D"uni=
x"
sock_type=3D"stream" protocol=3D0 requested_mask=3D"send receive connect"
denied_mask=3D"send connect" addr=3Dnone peer_addr=3D"@/tmp/ibus/dbus-3hDyo=
Er1"
peer=3D"unconfined"
Nov 10 11:22:14 nitro kernel: [   53.450239] audit: type=3D1400
audit(1510305734.007:26): apparmor=3D"DENIED" operation=3D"open"
profile=3D"webbrowser-app" name=3D"/dev/dri/" pid=3D1903 comm=3D"webbrowser=
-app"
requested_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
Nov 10 11:22:14 nitro kernel: [   53.460449] audit: type=3D1400
audit(1510305734.015:27): apparmor=3D"DENIED" operation=3D"open"
profile=3D"webbrowser-app" name=3D"/dev/dri/" pid=3D1903 comm=3D"webbrowser=
-app"
requested_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
Nov 10 11:22:14 nitro kernel: [   53.460451] audit: type=3D1400
audit(1510305734.015:28): apparmor=3D"DENIED" operation=3D"open"
profile=3D"webbrowser-app" name=3D"/dev/dri/" pid=3D1903 comm=3D"webbrowser=
-app"
requested_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
Nov 10 11:22:14 nitro kernel: [   53.517029] audit: type=3D1400
audit(1510305734.071:29): apparmor=3D"DENIED" operation=3D"connect"
profile=3D"webbrowser-app" pid=3D1903 comm=3D"pool" family=3D"unix" sock_ty=
pe=3D"stream"
protocol=3D0 requested_mask=3D"send receive connect" denied_mask=3D"send co=
nnect"
addr=3Dnone peer_addr=3D"@/tmp/ibus/dbus-3hDyoEr1" peer=3D"unconfined"
Nov 10 11:22:14 nitro kernel: [   54.279158] audit: type=3D1400
audit(1510305734.830:30): apparmor=3D"DENIED" operation=3D"mkdir"
profile=3D"webbrowser-app" name=3D"/home/yn/.config/ubuntu-ui-toolkit/" pid=
=3D1903
comm=3D"webbrowser-app" requested_mask=3D"c" denied_mask=3D"c" fsuid=3D1000=
 ouid=3D1000
Nov 10 11:22:14 nitro kernel: [   54.279160] audit: type=3D1400
audit(1510305734.830:31): apparmor=3D"DENIED" operation=3D"mkdir"
profile=3D"webbrowser-app" name=3D"/home/yn/.config/ubuntu-ui-toolkit/" pid=
=3D1903
comm=3D"webbrowser-app" requested_mask=3D"c" denied_mask=3D"c" fsuid=3D1000=
 ouid=3D1000
Nov 10 11:22:16 nitro kernel: [   55.680138] audit: type=3D1400
audit(1510305736.218:32): apparmor=3D"DENIED" operation=3D"mkdir"
profile=3D"webbrowser-app" name=3D"/home/yn/.config/ubuntu-ui-toolkit/" pid=
=3D1903
comm=3D"webbrowser-app" requested_mask=3D"c" denied_mask=3D"c" fsuid=3D1000=
 ouid=3D1000
Nov 10 11:22:16 nitro kernel: [   55.680140] audit: type=3D1400
audit(1510305736.222:33): apparmor=3D"DENIED" operation=3D"open"
profile=3D"webbrowser-app" name=3D"/sys/bus/" pid=3D1903 comm=3D"webbrowser=
-app"
requested_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
Nov 10 11:22:18 nitro kernel: [   58.301903] kauditd_printk_skb: 4 callbacks
suppressed
Nov 10 11:22:18 nitro kernel: [   58.301905] audit: type=3D1400
audit(1510305738.835:38): apparmor=3D"DENIED" operation=3D"open"
profile=3D"webbrowser-app" name=3D"/proc/1943/task/1943/status" pid=3D1903
comm=3D"Chrome_FileUser" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D100=
0 ouid=3D0
Nov 10 11:22:18 nitro kernel: [   58.329002] audit: type=3D1400
audit(1510305738.863:39): apparmor=3D"DENIED" operation=3D"open"
profile=3D"webbrowser-app" name=3D"/proc/1943/task/1943/status" pid=3D1903
comm=3D"Chrome_FileUser" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D100=
0 ouid=3D0
Nov 10 11:22:18 nitro kernel: [   58.329004] audit: type=3D1400
audit(1510305738.863:40): apparmor=3D"DENIED" operation=3D"open"
profile=3D"webbrowser-app" name=3D"/proc/1943/task/1943/status" pid=3D1903
comm=3D"Chrome_FileUser" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D100=
0 ouid=3D0
Nov 10 11:22:19 nitro kernel: [   58.544021] audit: type=3D1400
audit(1510305739.075:41): apparmor=3D"DENIED" operation=3D"open"
profile=3D"webbrowser-app" name=3D"/home/yn/sus/foo.html" pid=3D1903
comm=3D"Chrome_FileThre" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D100=
0 ouid=3D1000
Nov 10 11:22:24 nitro kernel: [   63.790188] audit: type=3D1400
audit(1510305744.310:42): apparmor=3D"DENIED" operation=3D"open"
profile=3D"webbrowser-app" name=3D"/home/yn/sus/foo.html" pid=3D1903
comm=3D"Chrome_FileThre" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D100=
0 ouid=3D1000
Nov 10 11:22:25 nitro kernel: [   64.498110] audit: type=3D1400
audit(1510305745.013:43): apparmor=3D"DENIED" operation=3D"open"
profile=3D"webbrowser-app" name=3D"/home/yn/sus/foo.html" pid=3D1903
comm=3D"Chrome_FileThre" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D100=
0 ouid=3D1000
Nov 10 11:22:25 nitro kernel: [   65.002020] audit: type=3D1400
audit(1510305745.516:44): apparmor=3D"DENIED" operation=3D"open"
profile=3D"webbrowser-app" name=3D"/home/yn/sus/foo.html" pid=3D1903
comm=3D"Chrome_FileThre" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D100=
0 ouid=3D1000
Nov 10 11:22:34 nitro NetworkManager[803]: <warn>  [1510305754.6049] dhcp6
(eno1): request timed out
Nov 10 11:22:34 nitro NetworkManager[803]: <info>  [1510305754.6049] dhcp6
(eno1): state changed unknown -> timeout
Nov 10 11:22:34 nitro NetworkManager[803]: <info>  [1510305754.6057] dhcp6
(eno1): canceled DHCP transaction, DHCP client pid 1617
Nov 10 11:22:34 nitro NetworkManager[803]: <info>  [1510305754.6057] dhcp6
(eno1): state changed timeout -> done
Nov 10 11:24:37 nitro kernel: [  196.887267] nouveau 0000:01:00.0: fifo: re=
ad
fault at 002b8c0000 engine 00 [PGRAPH] client 10 [] reason 02
[PAGE_NOT_PRESENT] on channel 8 [003f986000 chromium-browse[2658]]
Nov 10 11:24:37 nitro kernel: [  196.887274] nouveau 0000:01:00.0: fifo: gr
engine fault on channel 8, recovering...
Nov 10 11:24:57 nitro kernel: [  216.884429] ------------[ cut here
]------------
Nov 10 11:24:57 nitro kernel: [  216.884467] WARNING: CPU: 2 PID: 1032 at
/build/linux-hwe-lyR8gz/linux-hwe-4.10.0/drivers/gpu/drm/nouveau/nouveau_bo=
.c:1212
nouveau_bo_move_ntfy+0xa3/0xb0 [nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884467] Modules linked in: nls_utf8 udf
crc_itu_t nls_iso8859_1 hid_multitouch intel_rapl x86_pkg_temp_thermal
intel_powerclamp joydev coretemp kvm uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_core irqbypass videodev media
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc snd_hda_codec_idt
snd_hda_codec_generic aesni_intel snd_hda_intel aes_x86_64 snd_hda_codec
crypto_simd glue_helper snd_hda_core cryptd snd_hwdep intel_cstate
intel_rapl_perf snd_pcm arc4 input_leds rt2800pci serio_raw snd_seq_midi
snd_seq_midi_event rt2800mmio rt2800lib rt2x00pci rt2x00mmio rt2x00lib mac8=
0211
cfg80211 rtsx_pci_ms lpc_ich memstick eeprom_93cx6 snd_rawmidi snd_seq
snd_seq_device snd_timer mac_hid snd shpchp mei_me ie31200_edac mei soundco=
re
edac_core parport_pc ppdev lp parport autofs4
Nov 10 11:24:57 nitro kernel: [  216.884494]  uas usb_storage hid_generic
usbhid hid nouveau rtsx_pci_sdmmc mxm_wmi i2c_algo_bit ttm drm_kms_helper
syscopyarea sysfillrect ahci sysimgblt fb_sys_fops libahci r8169 drm mii
rtsx_pci video fjes wmi
Nov 10 11:24:57 nitro kernel: [  216.884504] CPU: 2 PID: 1032 Comm: Xorg Not
tainted 4.10.0-38-generic #42~16.04.1-Ubuntu
Nov 10 11:24:57 nitro kernel: [  216.884505] Hardware name: Hewlett-Packard
23-d160ej/2ADC, BIOS 8.10 09/25/2012
Nov 10 11:24:57 nitro kernel: [  216.884514] Call Trace:
Nov 10 11:24:57 nitro kernel: [  216.884518]  dump_stack+0x63/0x90
Nov 10 11:24:57 nitro kernel: [  216.884520]  __warn+0xcb/0xf0
Nov 10 11:24:57 nitro kernel: [  216.884521]  warn_slowpath_null+0x1d/0x20
Nov 10 11:24:57 nitro kernel: [  216.884541]  nouveau_bo_move_ntfy+0xa3/0xb0
[nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884545]=20
ttm_bo_handle_move_mem+0x26c/0x610 [ttm]
Nov 10 11:24:57 nitro kernel: [  216.884547]  ttm_bo_evict+0x13b/0x2e0 [ttm]
Nov 10 11:24:57 nitro kernel: [  216.884567]  ? nvc0_fence_sync32+0x169/0x1=
a0
[nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884570]  ttm_mem_evict_first+0x171/0x1=
f0
[ttm]
Nov 10 11:24:57 nitro kernel: [  216.884572]  ttm_bo_mem_space+0x34a/0x4d0
[ttm]
Nov 10 11:24:57 nitro kernel: [  216.884575]  ttm_bo_validate+0xd5/0x150 [t=
tm]
Nov 10 11:24:57 nitro kernel: [  216.884577]  ttm_bo_init+0x2da/0x420 [ttm]
Nov 10 11:24:57 nitro kernel: [  216.884596]  nouveau_bo_new+0x1fb/0x310
[nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884613]  ?
nv10_bo_put_tile_region+0x80/0x80 [nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884631]  nouveau_gem_new+0x83/0x150
[nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884649]  nouveau_gem_ioctl_new+0x88/0x=
140
[nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884658]  drm_ioctl+0x21b/0x4d0 [drm]
Nov 10 11:24:57 nitro kernel: [  216.884676]  ? nouveau_gem_new+0x150/0x150
[nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884678]  ? ep_ptable_queue_proc+0xa0/0=
xa0
Nov 10 11:24:57 nitro kernel: [  216.884696]  nouveau_drm_ioctl+0x68/0xc0
[nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884698]  do_vfs_ioctl+0xa1/0x5f0
Nov 10 11:24:57 nitro kernel: [  216.884700]  ? __sys_recvmsg+0x80/0x90
Nov 10 11:24:57 nitro kernel: [  216.884701]  SyS_ioctl+0x79/0x90
Nov 10 11:24:57 nitro kernel: [  216.884703]=20
entry_SYSCALL_64_fastpath+0x1e/0xad
Nov 10 11:24:57 nitro kernel: [  216.884704] RIP: 0033:0x7fe5c4682f07
Nov 10 11:24:57 nitro kernel: [  216.884705] RSP: 002b:00007fffb32b1638 EFL=
AGS:
00003246 ORIG_RAX: 0000000000000010
Nov 10 11:24:57 nitro kernel: [  216.884706] RAX: ffffffffffffffda RBX:
0000000000000000 RCX: 00007fe5c4682f07
Nov 10 11:24:57 nitro kernel: [  216.884706] RDX: 00007fffb32b1690 RSI:
00000000c0306480 RDI: 000000000000000e
Nov 10 11:24:57 nitro kernel: [  216.884707] RBP: 0000558245e6bec0 R08:
00005582457911c0 R09: 00005582457912c0
Nov 10 11:24:57 nitro kernel: [  216.884707] R10: 0000000000000020 R11:
0000000000003246 R12: 0000000000000001
Nov 10 11:24:57 nitro kernel: [  216.884708] R13: 00007fffb32af1c0 R14:
0000000000000080 R15: 0000558245e6bec0
Nov 10 11:24:57 nitro kernel: [  216.884731] ---[ end trace 50dc9d1f84044e6c
]---
\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00=
\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00=
\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00


Chrome Version       : 62.0.3202.75 (Official Build) Built on Ubuntu
URLs (if applicable) :
Os: ubuntu 16.0.4 4.10.0-38-generic
Other browsers tested:
  Add OK or FAIL, along with the version, after other browsers where you
have tested this issue:
     Safari: ok
    Firefox: ok
       Edge: only linux

What steps will reproduce the problem?
(1) sudo apt install chromium-browser
(2) open chrome at the given html file.
(3)

What is the expected result?
error while parsing.

What happens instead?
kernel panic (pool overflow).


Please provide any additional information below. Attach a screenshot if
possible.
because the kernel will panic i cannot get an asan log from
asan-linux-release-514498.

i will note that this is a linux only problem.
additionally you may need to run this against a machine with 3rd party,
audio and graphics drivers (not on an aws box).

regards.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15104400220.DaBc18C8D.2786
Date: Sat, 11 Nov 2017 22:40:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - there is an exploitable page fault that can be reliably t=
riggered from the chromium sandbox can possibly lead to remote attackers ca=
using a denial of service condition or possibly running system code."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103689">103689</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>there is an exploitable page fault that can be reliably trigg=
ered from the chromium sandbox can possibly lead to remote attackers causin=
g a denial of service condition or possibly running system code.
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>yena0xc5&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D135404=
" name=3D"attach_135404" title=3D"reproduction">attachment 135404</a> <a hr=
ef=3D"attachment.cgi?id=3D135404&amp;action=3Dedit" title=3D"reproduction">=
[details]</a></span>
reproduction

there is an exploitable page fault that can be reliably triggered from the
chromium sandbox can possibly lead to remote attackers causing a denial of
service condition or possibly running system code.

this was found while fuzzing the chromium browser.

in order to reproduce you should run the given html page:
<a href=3D"https://drive.google.com/open?id=3D15NzlWcu0vUPLPpEDuOMCpCWjWM4Q=
rAx3">https://drive.google.com/open?id=3D15NzlWcu0vUPLPpEDuOMCpCWjWM4QrAx3<=
/a>

with the default installation of ubuntu desktop (details of the ver of the
products given below..) with the Nouveau driver installed, this can be remo=
tely
exploitable.

this issue is referenced here:
<a href=3D"https://bugs.chromium.org/p/chromium/issues/detail?id=3D784062">=
https://bugs.chromium.org/p/chromium/issues/detail?id=3D784062</a>=20=20

details:


this should effect chrom-os too,
<a href=3D"https://chromium.googlesource.com/chromiumos/third_party/drm/+/2=
92da616fe1f936ca78a3fa8e1b1b19883e343b6/nouveau/nouveau.h">https://chromium=
.googlesource.com/chromiumos/third_party/drm/+/292da616fe1f936ca78a3fa8e1b1=
b19883e343b6/nouveau/nouveau.h</a>

this is the kernel stack:

comm=3D&quot;webbrowser-app&quot; requested_mask=3D&quot;r&quot; denied_mas=
k=3D&quot;r&quot; fsuid=3D1000 ouid=3D0
Nov 10 11:22:13 nitro kernel: [   53.352636] audit: type=3D1400
audit(1510305733.908:25): apparmor=3D&quot;DENIED&quot; operation=3D&quot;c=
onnect&quot;
profile=3D&quot;webbrowser-app&quot; pid=3D1903 comm=3D&quot;webbrowser-app=
&quot; family=3D&quot;unix&quot;
sock_type=3D&quot;stream&quot; protocol=3D0 requested_mask=3D&quot;send rec=
eive connect&quot;
denied_mask=3D&quot;send connect&quot; addr=3Dnone peer_addr=3D&quot;&#64;/=
tmp/ibus/dbus-3hDyoEr1&quot;
peer=3D&quot;unconfined&quot;
Nov 10 11:22:14 nitro kernel: [   53.450239] audit: type=3D1400
audit(1510305734.007:26): apparmor=3D&quot;DENIED&quot; operation=3D&quot;o=
pen&quot;
profile=3D&quot;webbrowser-app&quot; name=3D&quot;/dev/dri/&quot; pid=3D190=
3 comm=3D&quot;webbrowser-app&quot;
requested_mask=3D&quot;r&quot; denied_mask=3D&quot;r&quot; fsuid=3D1000 oui=
d=3D0
Nov 10 11:22:14 nitro kernel: [   53.460449] audit: type=3D1400
audit(1510305734.015:27): apparmor=3D&quot;DENIED&quot; operation=3D&quot;o=
pen&quot;
profile=3D&quot;webbrowser-app&quot; name=3D&quot;/dev/dri/&quot; pid=3D190=
3 comm=3D&quot;webbrowser-app&quot;
requested_mask=3D&quot;r&quot; denied_mask=3D&quot;r&quot; fsuid=3D1000 oui=
d=3D0
Nov 10 11:22:14 nitro kernel: [   53.460451] audit: type=3D1400
audit(1510305734.015:28): apparmor=3D&quot;DENIED&quot; operation=3D&quot;o=
pen&quot;
profile=3D&quot;webbrowser-app&quot; name=3D&quot;/dev/dri/&quot; pid=3D190=
3 comm=3D&quot;webbrowser-app&quot;
requested_mask=3D&quot;r&quot; denied_mask=3D&quot;r&quot; fsuid=3D1000 oui=
d=3D0
Nov 10 11:22:14 nitro kernel: [   53.517029] audit: type=3D1400
audit(1510305734.071:29): apparmor=3D&quot;DENIED&quot; operation=3D&quot;c=
onnect&quot;
profile=3D&quot;webbrowser-app&quot; pid=3D1903 comm=3D&quot;pool&quot; fam=
ily=3D&quot;unix&quot; sock_type=3D&quot;stream&quot;
protocol=3D0 requested_mask=3D&quot;send receive connect&quot; denied_mask=
=3D&quot;send connect&quot;
addr=3Dnone peer_addr=3D&quot;&#64;/tmp/ibus/dbus-3hDyoEr1&quot; peer=3D&qu=
ot;unconfined&quot;
Nov 10 11:22:14 nitro kernel: [   54.279158] audit: type=3D1400
audit(1510305734.830:30): apparmor=3D&quot;DENIED&quot; operation=3D&quot;m=
kdir&quot;
profile=3D&quot;webbrowser-app&quot; name=3D&quot;/home/yn/.config/ubuntu-u=
i-toolkit/&quot; pid=3D1903
comm=3D&quot;webbrowser-app&quot; requested_mask=3D&quot;c&quot; denied_mas=
k=3D&quot;c&quot; fsuid=3D1000 ouid=3D1000
Nov 10 11:22:14 nitro kernel: [   54.279160] audit: type=3D1400
audit(1510305734.830:31): apparmor=3D&quot;DENIED&quot; operation=3D&quot;m=
kdir&quot;
profile=3D&quot;webbrowser-app&quot; name=3D&quot;/home/yn/.config/ubuntu-u=
i-toolkit/&quot; pid=3D1903
comm=3D&quot;webbrowser-app&quot; requested_mask=3D&quot;c&quot; denied_mas=
k=3D&quot;c&quot; fsuid=3D1000 ouid=3D1000
Nov 10 11:22:16 nitro kernel: [   55.680138] audit: type=3D1400
audit(1510305736.218:32): apparmor=3D&quot;DENIED&quot; operation=3D&quot;m=
kdir&quot;
profile=3D&quot;webbrowser-app&quot; name=3D&quot;/home/yn/.config/ubuntu-u=
i-toolkit/&quot; pid=3D1903
comm=3D&quot;webbrowser-app&quot; requested_mask=3D&quot;c&quot; denied_mas=
k=3D&quot;c&quot; fsuid=3D1000 ouid=3D1000
Nov 10 11:22:16 nitro kernel: [   55.680140] audit: type=3D1400
audit(1510305736.222:33): apparmor=3D&quot;DENIED&quot; operation=3D&quot;o=
pen&quot;
profile=3D&quot;webbrowser-app&quot; name=3D&quot;/sys/bus/&quot; pid=3D190=
3 comm=3D&quot;webbrowser-app&quot;
requested_mask=3D&quot;r&quot; denied_mask=3D&quot;r&quot; fsuid=3D1000 oui=
d=3D0
Nov 10 11:22:18 nitro kernel: [   58.301903] kauditd_printk_skb: 4 callbacks
suppressed
Nov 10 11:22:18 nitro kernel: [   58.301905] audit: type=3D1400
audit(1510305738.835:38): apparmor=3D&quot;DENIED&quot; operation=3D&quot;o=
pen&quot;
profile=3D&quot;webbrowser-app&quot; name=3D&quot;/proc/1943/task/1943/stat=
us&quot; pid=3D1903
comm=3D&quot;Chrome_FileUser&quot; requested_mask=3D&quot;r&quot; denied_ma=
sk=3D&quot;r&quot; fsuid=3D1000 ouid=3D0
Nov 10 11:22:18 nitro kernel: [   58.329002] audit: type=3D1400
audit(1510305738.863:39): apparmor=3D&quot;DENIED&quot; operation=3D&quot;o=
pen&quot;
profile=3D&quot;webbrowser-app&quot; name=3D&quot;/proc/1943/task/1943/stat=
us&quot; pid=3D1903
comm=3D&quot;Chrome_FileUser&quot; requested_mask=3D&quot;r&quot; denied_ma=
sk=3D&quot;r&quot; fsuid=3D1000 ouid=3D0
Nov 10 11:22:18 nitro kernel: [   58.329004] audit: type=3D1400
audit(1510305738.863:40): apparmor=3D&quot;DENIED&quot; operation=3D&quot;o=
pen&quot;
profile=3D&quot;webbrowser-app&quot; name=3D&quot;/proc/1943/task/1943/stat=
us&quot; pid=3D1903
comm=3D&quot;Chrome_FileUser&quot; requested_mask=3D&quot;r&quot; denied_ma=
sk=3D&quot;r&quot; fsuid=3D1000 ouid=3D0
Nov 10 11:22:19 nitro kernel: [   58.544021] audit: type=3D1400
audit(1510305739.075:41): apparmor=3D&quot;DENIED&quot; operation=3D&quot;o=
pen&quot;
profile=3D&quot;webbrowser-app&quot; name=3D&quot;/home/yn/sus/foo.html&quo=
t; pid=3D1903
comm=3D&quot;Chrome_FileThre&quot; requested_mask=3D&quot;r&quot; denied_ma=
sk=3D&quot;r&quot; fsuid=3D1000 ouid=3D1000
Nov 10 11:22:24 nitro kernel: [   63.790188] audit: type=3D1400
audit(1510305744.310:42): apparmor=3D&quot;DENIED&quot; operation=3D&quot;o=
pen&quot;
profile=3D&quot;webbrowser-app&quot; name=3D&quot;/home/yn/sus/foo.html&quo=
t; pid=3D1903
comm=3D&quot;Chrome_FileThre&quot; requested_mask=3D&quot;r&quot; denied_ma=
sk=3D&quot;r&quot; fsuid=3D1000 ouid=3D1000
Nov 10 11:22:25 nitro kernel: [   64.498110] audit: type=3D1400
audit(1510305745.013:43): apparmor=3D&quot;DENIED&quot; operation=3D&quot;o=
pen&quot;
profile=3D&quot;webbrowser-app&quot; name=3D&quot;/home/yn/sus/foo.html&quo=
t; pid=3D1903
comm=3D&quot;Chrome_FileThre&quot; requested_mask=3D&quot;r&quot; denied_ma=
sk=3D&quot;r&quot; fsuid=3D1000 ouid=3D1000
Nov 10 11:22:25 nitro kernel: [   65.002020] audit: type=3D1400
audit(1510305745.516:44): apparmor=3D&quot;DENIED&quot; operation=3D&quot;o=
pen&quot;
profile=3D&quot;webbrowser-app&quot; name=3D&quot;/home/yn/sus/foo.html&quo=
t; pid=3D1903
comm=3D&quot;Chrome_FileThre&quot; requested_mask=3D&quot;r&quot; denied_ma=
sk=3D&quot;r&quot; fsuid=3D1000 ouid=3D1000
Nov 10 11:22:34 nitro NetworkManager[803]: &lt;warn&gt;  [1510305754.6049] =
dhcp6
(eno1): request timed out
Nov 10 11:22:34 nitro NetworkManager[803]: &lt;info&gt;  [1510305754.6049] =
dhcp6
(eno1): state changed unknown -&gt; timeout
Nov 10 11:22:34 nitro NetworkManager[803]: &lt;info&gt;  [1510305754.6057] =
dhcp6
(eno1): canceled DHCP transaction, DHCP client pid 1617
Nov 10 11:22:34 nitro NetworkManager[803]: &lt;info&gt;  [1510305754.6057] =
dhcp6
(eno1): state changed timeout -&gt; done
Nov 10 11:24:37 nitro kernel: [  196.887267] nouveau 0000:01:00.0: fifo: re=
ad
fault at 002b8c0000 engine 00 [PGRAPH] client 10 [] reason 02
[PAGE_NOT_PRESENT] on channel 8 [003f986000 chromium-browse[2658]]
Nov 10 11:24:37 nitro kernel: [  196.887274] nouveau 0000:01:00.0: fifo: gr
engine fault on channel 8, recovering...
Nov 10 11:24:57 nitro kernel: [  216.884429] ------------[ cut here
]------------
Nov 10 11:24:57 nitro kernel: [  216.884467] WARNING: CPU: 2 PID: 1032 at
/build/linux-hwe-lyR8gz/linux-hwe-4.10.0/drivers/gpu/drm/nouveau/nouveau_bo=
.c:1212
nouveau_bo_move_ntfy+0xa3/0xb0 [nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884467] Modules linked in: nls_utf8 udf
crc_itu_t nls_iso8859_1 hid_multitouch intel_rapl x86_pkg_temp_thermal
intel_powerclamp joydev coretemp kvm uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_core irqbypass videodev media
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc snd_hda_codec_idt
snd_hda_codec_generic aesni_intel snd_hda_intel aes_x86_64 snd_hda_codec
crypto_simd glue_helper snd_hda_core cryptd snd_hwdep intel_cstate
intel_rapl_perf snd_pcm arc4 input_leds rt2800pci serio_raw snd_seq_midi
snd_seq_midi_event rt2800mmio rt2800lib rt2x00pci rt2x00mmio rt2x00lib mac8=
0211
cfg80211 rtsx_pci_ms lpc_ich memstick eeprom_93cx6 snd_rawmidi snd_seq
snd_seq_device snd_timer mac_hid snd shpchp mei_me ie31200_edac mei soundco=
re
edac_core parport_pc ppdev lp parport autofs4
Nov 10 11:24:57 nitro kernel: [  216.884494]  uas usb_storage hid_generic
usbhid hid nouveau rtsx_pci_sdmmc mxm_wmi i2c_algo_bit ttm drm_kms_helper
syscopyarea sysfillrect ahci sysimgblt fb_sys_fops libahci r8169 drm mii
rtsx_pci video fjes wmi
Nov 10 11:24:57 nitro kernel: [  216.884504] CPU: 2 PID: 1032 Comm: Xorg Not
tainted 4.10.0-38-generic #42~16.04.1-Ubuntu
Nov 10 11:24:57 nitro kernel: [  216.884505] Hardware name: Hewlett-Packard
23-d160ej/2ADC, BIOS 8.10 09/25/2012
Nov 10 11:24:57 nitro kernel: [  216.884514] Call Trace:
Nov 10 11:24:57 nitro kernel: [  216.884518]  dump_stack+0x63/0x90
Nov 10 11:24:57 nitro kernel: [  216.884520]  __warn+0xcb/0xf0
Nov 10 11:24:57 nitro kernel: [  216.884521]  warn_slowpath_null+0x1d/0x20
Nov 10 11:24:57 nitro kernel: [  216.884541]  nouveau_bo_move_ntfy+0xa3/0xb0
[nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884545]=20
ttm_bo_handle_move_mem+0x26c/0x610 [ttm]
Nov 10 11:24:57 nitro kernel: [  216.884547]  ttm_bo_evict+0x13b/0x2e0 [ttm]
Nov 10 11:24:57 nitro kernel: [  216.884567]  ? nvc0_fence_sync32+0x169/0x1=
a0
[nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884570]  ttm_mem_evict_first+0x171/0x1=
f0
[ttm]
Nov 10 11:24:57 nitro kernel: [  216.884572]  ttm_bo_mem_space+0x34a/0x4d0
[ttm]
Nov 10 11:24:57 nitro kernel: [  216.884575]  ttm_bo_validate+0xd5/0x150 [t=
tm]
Nov 10 11:24:57 nitro kernel: [  216.884577]  ttm_bo_init+0x2da/0x420 [ttm]
Nov 10 11:24:57 nitro kernel: [  216.884596]  nouveau_bo_new+0x1fb/0x310
[nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884613]  ?
nv10_bo_put_tile_region+0x80/0x80 [nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884631]  nouveau_gem_new+0x83/0x150
[nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884649]  nouveau_gem_ioctl_new+0x88/0x=
140
[nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884658]  drm_ioctl+0x21b/0x4d0 [drm]
Nov 10 11:24:57 nitro kernel: [  216.884676]  ? nouveau_gem_new+0x150/0x150
[nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884678]  ? ep_ptable_queue_proc+0xa0/0=
xa0
Nov 10 11:24:57 nitro kernel: [  216.884696]  nouveau_drm_ioctl+0x68/0xc0
[nouveau]
Nov 10 11:24:57 nitro kernel: [  216.884698]  do_vfs_ioctl+0xa1/0x5f0
Nov 10 11:24:57 nitro kernel: [  216.884700]  ? __sys_recvmsg+0x80/0x90
Nov 10 11:24:57 nitro kernel: [  216.884701]  SyS_ioctl+0x79/0x90
Nov 10 11:24:57 nitro kernel: [  216.884703]=20
entry_SYSCALL_64_fastpath+0x1e/0xad
Nov 10 11:24:57 nitro kernel: [  216.884704] RIP: 0033:0x7fe5c4682f07
Nov 10 11:24:57 nitro kernel: [  216.884705] RSP: 002b:00007fffb32b1638 EFL=
AGS:
00003246 ORIG_RAX: 0000000000000010
Nov 10 11:24:57 nitro kernel: [  216.884706] RAX: ffffffffffffffda RBX:
0000000000000000 RCX: 00007fe5c4682f07
Nov 10 11:24:57 nitro kernel: [  216.884706] RDX: 00007fffb32b1690 RSI:
00000000c0306480 RDI: 000000000000000e
Nov 10 11:24:57 nitro kernel: [  216.884707] RBP: 0000558245e6bec0 R08:
00005582457911c0 R09: 00005582457912c0
Nov 10 11:24:57 nitro kernel: [  216.884707] R10: 0000000000000020 R11:
0000000000003246 R12: 0000000000000001
Nov 10 11:24:57 nitro kernel: [  216.884708] R13: 00007fffb32af1c0 R14:
0000000000000080 R15: 0000558245e6bec0
Nov 10 11:24:57 nitro kernel: [  216.884731] ---[ end trace 50dc9d1f84044e6c
]---
\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00=
\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00=
\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00


Chrome Version       : 62.0.3202.75 (Official Build) Built on Ubuntu
URLs (if applicable) :
Os: ubuntu 16.0.4 4.10.0-38-generic
Other browsers tested:
  Add OK or FAIL, along with the version, after other browsers where you
have tested this issue:
     Safari: ok
    Firefox: ok
       Edge: only linux

What steps will reproduce the problem?
(1) sudo apt install chromium-browser
(2) open chrome at the given html file.
(3)

What is the expected result?
error while parsing.

What happens instead?
kernel panic (pool overflow).


Please provide any additional information below. Attach a screenshot if
possible.
because the kernel will panic i cannot get an asan log from
asan-linux-release-514498.

i will note that this is a linux only problem.
additionally you may need to run this against a machine with 3rd party,
audio and graphics drivers (not on an aws box).

regards.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15104400220.DaBc18C8D.2786--

--===============0531193974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0531193974==--
