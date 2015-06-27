From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91125] New: Nouveau read fault after suspend
Date: Sat, 27 Jun 2015 12:15:44 +0000
Message-ID: <bug-91125-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1945222134=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1945222134==
Content-Type: multipart/alternative; boundary="1435407344.2Ba26E1.24404"; charset="UTF-8"


--1435407344.2Ba26E1.24404
Date: Sat, 27 Jun 2015 12:15:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91125

            Bug ID: 91125
           Summary: Nouveau read fault after suspend
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: exi+freedesktop-LwM2R4sIHAOzQB+pC5nmwQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

This just happened to me after a suspend/resume cycle.
I cannot reproduce the read fault, it happened right after opening a plasma
context menu but i still wanted it documented:

Kernel:
Linux bugbox 4.0.5-1-ARCH #1 SMP PREEMPT Sat Jun 6 18:37:49 CEST 2015 x86_64
GNU/Linux

Xorg -version:
X.Org X Server 1.17.2
Release Date: 2015-06-16
X Protocol Version 11, Revision 0
Build Operating System: Linux 4.0.4-2-ARCH x86_64 
Current Operating System: Linux bugbox 4.0.5-1-ARCH #1 SMP PREEMPT Sat Jun 6
18:37:49 CEST 2015 x86_64
Kernel command line: BOOT_IMAGE=/boot/vmlinuz-linux
root=UUID=073feb51-816c-4a86-8de3-5e9ed3145571 rw
resume=UUID=ba1b46a0-89f5-4ddd-adc0-5982d576f73c libahci.ignore_sss=1
swapaccount=1 quiet
Build Date: 16 June 2015  05:24:27PM
Current version of pixman: 0.32.6
        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.

Mesa: mesa 10.6.0-1
Nouveau: xf86-video-nouveau 1.0.11-3

Dmesg error messages:
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] suspending console...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] suspending display...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] evicting buffers...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] waiting for kernel channels
to go idle...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] suspending client object
trees...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] suspending kernel object
tree...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] re-enabling device...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] resuming kernel object
tree...
Jun 27 13:19:35 bugbox kernel: nouveau  [   VBIOS][0000:01:00.0] running init
tables
Jun 27 13:19:35 bugbox kernel: nouveau  [    VOLT][0000:01:00.0] GPU voltage:
875000uv
Jun 27 13:19:35 bugbox kernel: nouveau  [  PTHERM][0000:01:00.0] fan
management: automatic
Jun 27 13:19:35 bugbox kernel: nouveau  [     CLK][0000:01:00.0] --: core 405
MHz memory 648 MHz 
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] resuming client object
trees...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] resuming display...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] resuming console...
Jun 27 13:19:35 bugbox kernel: Modules linked in: xt_multiport ipt_REJECT
nf_reject_ipv4 xt_comment hid_lenovo rfcomm ecb bnep hid_apple nouveau mxm_wmi
ttm drm_kms_helper drm i2c_algo_bit veth tun fuse ctr ccm btrfs xor
ipt_MASQUERADE nf_nat_masquerade_ipv4 iptable_nat nf_nat_ipv4 nf_nat xt_tcpudp
nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack iptable_filter
snd_hda_codec_hdmi bridge stp llc raid6_pq snd_hda_codec_realtek joydev
mousedev snd_hda_codec_generic psmouse serio_raw nls_iso8859_1 atkbd nls_cp437
iTCO_wdt hid_generic iTCO_vendor_support libps2 vfat fat intel_rapl iosf_mbi
uvcvideo x86_pkg_temp_thermal arc4 videobuf2_vmalloc intel_powerclamp usbhid
videobuf2_memops btusb coretemp videobuf2_core v4l2_common videodev hid
kvm_intel bluetooth media rtl8192ce rtl_pci kvm rtl8192c_common
crct10dif_pclmul
Jun 27 13:19:38 bugbox kernel: nouveau E[plasmashell[11934]] fail set_domain
Jun 27 13:19:38 bugbox kernel: nouveau E[plasmashell[11934]] validating bo list
Jun 27 13:19:38 bugbox kernel: nouveau E[plasmashell[11934]] validate: -22
Jun 27 13:19:38 bugbox kernel: nouveau E[plasmashell[11934]] fail set_domain
Jun 27 13:19:38 bugbox kernel: nouveau E[plasmashell[11934]] validating bo list
Jun 27 13:19:38 bugbox kernel: nouveau E[plasmashell[11934]] validate: -22
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] fail set_domain
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] validating bo list
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] validate: -22
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] fail set_domain
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] validating bo list
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] validate: -22
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] fail set_domain
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] validating bo list
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] validate: -22
Jun 27 13:31:13 bugbox kernel: nouveau E[   PFIFO][0000:01:00.0] read fault at
0x0000ae1000 [PTE] from GR/GPC0/T1_0 on channel 0x007f74b000
[plasmashell[11934]]
Jun 27 13:31:13 bugbox kernel: nouveau E[   PFIFO][0000:01:00.0] PGR engine
fault on channel 8, recovering...
Jun 27 13:31:13 bugbox kernel: nouveau E[     PGR][0000:01:00.0] TRAP ch 8
[0x007f74b000 plasmashell[11934]]
Jun 27 13:31:13 bugbox kernel: nouveau E[     PGR][0000:01:00.0] GPC0/TPC0/TEX:
0x80000049
Jun 27 13:32:57 bugbox kernel: nouveau E[plasmashell[11934]] failed to idle
channel 0xcccc0000 [plasmashell[11934]]
Jun 27 13:33:12 bugbox kernel: nouveau E[plasmashell[11934]] failed to idle
channel 0xcccc0000 [plasmashell[11934]]



The "validate bo list" errors happen on every suspend/resume, so i can
reproduce them.
The read fault and "failed to idle channel" error happened the first time and
froze my screen.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1435407344.2Ba26E1.24404
Date: Sat, 27 Jun 2015 12:15:44 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau read fault after suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91125">91125</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau read fault after suspend
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
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
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
          <td>exi+freedesktop&#64;wthack.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>This just happened to me after a suspend/resume cycle.
I cannot reproduce the read fault, it happened right after opening a plasma
context menu but i still wanted it documented:

Kernel:
Linux bugbox 4.0.5-1-ARCH #1 SMP PREEMPT Sat Jun 6 18:37:49 CEST 2015 x86_64
GNU/Linux

Xorg -version:
X.Org X Server 1.17.2
Release Date: 2015-06-16
X Protocol Version 11, Revision 0
Build Operating System: Linux 4.0.4-2-ARCH x86_64 
Current Operating System: Linux bugbox 4.0.5-1-ARCH #1 SMP PREEMPT Sat Jun 6
18:37:49 CEST 2015 x86_64
Kernel command line: BOOT_IMAGE=/boot/vmlinuz-linux
root=UUID=073feb51-816c-4a86-8de3-5e9ed3145571 rw
resume=UUID=ba1b46a0-89f5-4ddd-adc0-5982d576f73c libahci.ignore_sss=1
swapaccount=1 quiet
Build Date: 16 June 2015  05:24:27PM
Current version of pixman: 0.32.6
        Before reporting problems, check <a href="http://wiki.x.org">http://wiki.x.org</a>
        to make sure that you have the latest version.

Mesa: mesa 10.6.0-1
Nouveau: xf86-video-nouveau 1.0.11-3

Dmesg error messages:
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] suspending console...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] suspending display...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] evicting buffers...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] waiting for kernel channels
to go idle...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] suspending client object
trees...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] suspending kernel object
tree...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] re-enabling device...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] resuming kernel object
tree...
Jun 27 13:19:35 bugbox kernel: nouveau  [   VBIOS][0000:01:00.0] running init
tables
Jun 27 13:19:35 bugbox kernel: nouveau  [    VOLT][0000:01:00.0] GPU voltage:
875000uv
Jun 27 13:19:35 bugbox kernel: nouveau  [  PTHERM][0000:01:00.0] fan
management: automatic
Jun 27 13:19:35 bugbox kernel: nouveau  [     CLK][0000:01:00.0] --: core 405
MHz memory 648 MHz 
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] resuming client object
trees...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] resuming display...
Jun 27 13:19:35 bugbox kernel: nouveau  [     DRM] resuming console...
Jun 27 13:19:35 bugbox kernel: Modules linked in: xt_multiport ipt_REJECT
nf_reject_ipv4 xt_comment hid_lenovo rfcomm ecb bnep hid_apple nouveau mxm_wmi
ttm drm_kms_helper drm i2c_algo_bit veth tun fuse ctr ccm btrfs xor
ipt_MASQUERADE nf_nat_masquerade_ipv4 iptable_nat nf_nat_ipv4 nf_nat xt_tcpudp
nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack iptable_filter
snd_hda_codec_hdmi bridge stp llc raid6_pq snd_hda_codec_realtek joydev
mousedev snd_hda_codec_generic psmouse serio_raw nls_iso8859_1 atkbd nls_cp437
iTCO_wdt hid_generic iTCO_vendor_support libps2 vfat fat intel_rapl iosf_mbi
uvcvideo x86_pkg_temp_thermal arc4 videobuf2_vmalloc intel_powerclamp usbhid
videobuf2_memops btusb coretemp videobuf2_core v4l2_common videodev hid
kvm_intel bluetooth media rtl8192ce rtl_pci kvm rtl8192c_common
crct10dif_pclmul
Jun 27 13:19:38 bugbox kernel: nouveau E[plasmashell[11934]] fail set_domain
Jun 27 13:19:38 bugbox kernel: nouveau E[plasmashell[11934]] validating bo list
Jun 27 13:19:38 bugbox kernel: nouveau E[plasmashell[11934]] validate: -22
Jun 27 13:19:38 bugbox kernel: nouveau E[plasmashell[11934]] fail set_domain
Jun 27 13:19:38 bugbox kernel: nouveau E[plasmashell[11934]] validating bo list
Jun 27 13:19:38 bugbox kernel: nouveau E[plasmashell[11934]] validate: -22
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] fail set_domain
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] validating bo list
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] validate: -22
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] fail set_domain
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] validating bo list
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] validate: -22
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] fail set_domain
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] validating bo list
Jun 27 13:31:13 bugbox kernel: nouveau E[plasmashell[11934]] validate: -22
Jun 27 13:31:13 bugbox kernel: nouveau E[   PFIFO][0000:01:00.0] read fault at
0x0000ae1000 [PTE] from GR/GPC0/T1_0 on channel 0x007f74b000
[plasmashell[11934]]
Jun 27 13:31:13 bugbox kernel: nouveau E[   PFIFO][0000:01:00.0] PGR engine
fault on channel 8, recovering...
Jun 27 13:31:13 bugbox kernel: nouveau E[     PGR][0000:01:00.0] TRAP ch 8
[0x007f74b000 plasmashell[11934]]
Jun 27 13:31:13 bugbox kernel: nouveau E[     PGR][0000:01:00.0] GPC0/TPC0/TEX:
0x80000049
Jun 27 13:32:57 bugbox kernel: nouveau E[plasmashell[11934]] failed to idle
channel 0xcccc0000 [plasmashell[11934]]
Jun 27 13:33:12 bugbox kernel: nouveau E[plasmashell[11934]] failed to idle
channel 0xcccc0000 [plasmashell[11934]]



The &quot;validate bo list&quot; errors happen on every suspend/resume, so i can
reproduce them.
The read fault and &quot;failed to idle channel&quot; error happened the first time and
froze my screen.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1435407344.2Ba26E1.24404--

--===============1945222134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1945222134==--
