From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81690] nouveau GPU locks up under memory pressure
Date: Fri, 25 Sep 2015 14:37:46 +0000
Message-ID: <bug-81690-8800-Os9Q96IQjW@http.bugs.freedesktop.org/>
References: <bug-81690-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1611973404=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81690-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1611973404==
Content-Type: multipart/alternative; boundary="1443191866.dd11Efb23.29339"; charset="UTF-8"


--1443191866.dd11Efb23.29339
Date: Fri, 25 Sep 2015 14:37:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81690

--- Comment #7 from Woden Cafe <wodencafe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi guys,

I have been receiving this error which appears to be the same error.

It causes the system to completely hang, video completely frozen.

The system log says it's related to Chromium, I had it happen to me twice
within a half hour. I wasn't doing anything too intensive, mostly had Chromium
open with Eclipse and Thunderbird.

First, some info about my system:

~$ lsb_release -a
LSB Version:   
core-2.0-amd64:core-2.0-noarch:core-3.0-amd64:core-3.0-noarch:core-3.1-amd64:core-3.1-noarch:core-3.2-amd64:core-3.2-noarch:core-4.0-amd64:core-4.0-noarch:core-4.1-amd64:core-4.1-noarch:security-4.0-amd64:security-4.0-noarch:security-4.1-amd64:security-4.1-noarch
Distributor ID:    Ubuntu
Description:    Ubuntu 15.04
Release:    15.04
Codename:    vivid

~$ uname -a
Linux kubuntu-cboyd 3.19.3-031903-generic #201503261036 SMP Thu Mar 26 14:37:55
UTC 2015 x86_64 x86_64 x86_64 GNU/Linux

~$ lspci -v
06:00.0 VGA compatible controller: NVIDIA Corporation GF106 [GeForce GT 440]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: Micro-Star International Co., Ltd. [MSI] Device 2312
    Flags: bus master, fast devsel, latency 0, IRQ 37
    Memory at f8000000 (32-bit, non-prefetchable) [size=16M]
    Memory at c8000000 (64-bit, prefetchable) [size=128M]
    Memory at c4000000 (64-bit, prefetchable) [size=32M]
    I/O ports at dc00 [size=128]
    Expansion ROM at fbd00000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 <?>
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting <?>
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
    Kernel driver in use: nouveau

~$ lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                8
On-line CPU(s) list:   0-7
Thread(s) per core:    2
Core(s) per socket:    4
Socket(s):             1
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 26
Model name:            Intel(R) Core(TM) i7 CPU         950  @ 3.07GHz
Stepping:              5
CPU MHz:               1733.000
CPU max MHz:           3068.0000
CPU min MHz:           1600.0000
BogoMIPS:              6118.10
Virtualization:        VT-x
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              8192K
NUMA node0 CPU(s):     0-7

~$ cat /proc/meminfo | grep MemTotal
MemTotal:       20552364 kB

Here is the syslog info, note the issue happens twice:

Sep 25 08:51:56 kubuntu-cboyd kernel: [62867.937071] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:52:06 kubuntu-cboyd kernel: [62877.996104] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:52:16 kubuntu-cboyd kernel: [62888.047116] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:52:26 kubuntu-cboyd kernel: [62898.102679] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:52:36 kubuntu-cboyd kernel: [62908.157635] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:52:47 kubuntu-cboyd kernel: [62918.213027] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:52:57 kubuntu-cboyd kernel: [62928.268037] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:53:07 kubuntu-cboyd kernel: [62938.323730] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:53:14 kubuntu-cboyd kernel: [62945.920019] nouveau
E[chromium-browse[4468]] multiple instances of buffer 113 on validation list
Sep 25 08:53:14 kubuntu-cboyd kernel: [62945.920024] nouveau
E[chromium-browse[4468]] validate_init
Sep 25 08:53:14 kubuntu-cboyd kernel: [62945.920026] nouveau
E[chromium-browse[4468]] validate: -22
Sep 25 08:53:14 kubuntu-cboyd kernel: [62945.928974] nouveau E[  
PFIFO][0000:06:00.0] write fault at 0x00078c0000 [PAGE_NOT_PRESENT] from
PGRAPH/GPC0/PROP on channel 0x00bf9b3000 [chromium-browse[4468]]
Sep 25 08:53:14 kubuntu-cboyd kernel: [62945.928977] nouveau E[  
PFIFO][0000:06:00.0] PGRAPH engine fault on channel 5, recovering...
Sep 25 08:53:17 kubuntu-cboyd kernel: [62948.378624] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:53:27 kubuntu-cboyd kernel: [62958.434144] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1443191866.dd11Efb23.29339
Date: Fri, 25 Sep 2015 14:37:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau GPU locks up under memory pressure"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81690#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau GPU locks up under memory pressure"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81690">bug 81690</a>
              from <span class="vcard"><a class="email" href="mailto:wodencafe&#64;gmail.com" title="Woden Cafe &lt;wodencafe&#64;gmail.com&gt;"> <span class="fn">Woden Cafe</span></a>
</span></b>
        <pre>Hi guys,

I have been receiving this error which appears to be the same error.

It causes the system to completely hang, video completely frozen.

The system log says it's related to Chromium, I had it happen to me twice
within a half hour. I wasn't doing anything too intensive, mostly had Chromium
open with Eclipse and Thunderbird.

First, some info about my system:

~$ lsb_release -a
LSB Version:   
core-2.0-amd64:core-2.0-noarch:core-3.0-amd64:core-3.0-noarch:core-3.1-amd64:core-3.1-noarch:core-3.2-amd64:core-3.2-noarch:core-4.0-amd64:core-4.0-noarch:core-4.1-amd64:core-4.1-noarch:security-4.0-amd64:security-4.0-noarch:security-4.1-amd64:security-4.1-noarch
Distributor ID:    Ubuntu
Description:    Ubuntu 15.04
Release:    15.04
Codename:    vivid

~$ uname -a
Linux kubuntu-cboyd 3.19.3-031903-generic #201503261036 SMP Thu Mar 26 14:37:55
UTC 2015 x86_64 x86_64 x86_64 GNU/Linux

~$ lspci -v
06:00.0 VGA compatible controller: NVIDIA Corporation GF106 [GeForce GT 440]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: Micro-Star International Co., Ltd. [MSI] Device 2312
    Flags: bus master, fast devsel, latency 0, IRQ 37
    Memory at f8000000 (32-bit, non-prefetchable) [size=16M]
    Memory at c8000000 (64-bit, prefetchable) [size=128M]
    Memory at c4000000 (64-bit, prefetchable) [size=32M]
    I/O ports at dc00 [size=128]
    Expansion ROM at fbd00000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting &lt;?&gt;
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 &lt;?&gt;
    Kernel driver in use: nouveau

~$ lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                8
On-line CPU(s) list:   0-7
Thread(s) per core:    2
Core(s) per socket:    4
Socket(s):             1
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 26
Model name:            Intel(R) Core(TM) i7 CPU         950  &#64; 3.07GHz
Stepping:              5
CPU MHz:               1733.000
CPU max MHz:           3068.0000
CPU min MHz:           1600.0000
BogoMIPS:              6118.10
Virtualization:        VT-x
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              8192K
NUMA node0 CPU(s):     0-7

~$ cat /proc/meminfo | grep MemTotal
MemTotal:       20552364 kB

Here is the syslog info, note the issue happens twice:

Sep 25 08:51:56 kubuntu-cboyd kernel: [62867.937071] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:52:06 kubuntu-cboyd kernel: [62877.996104] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:52:16 kubuntu-cboyd kernel: [62888.047116] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:52:26 kubuntu-cboyd kernel: [62898.102679] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:52:36 kubuntu-cboyd kernel: [62908.157635] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:52:47 kubuntu-cboyd kernel: [62918.213027] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:52:57 kubuntu-cboyd kernel: [62928.268037] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:53:07 kubuntu-cboyd kernel: [62938.323730] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:53:14 kubuntu-cboyd kernel: [62945.920019] nouveau
E[chromium-browse[4468]] multiple instances of buffer 113 on validation list
Sep 25 08:53:14 kubuntu-cboyd kernel: [62945.920024] nouveau
E[chromium-browse[4468]] validate_init
Sep 25 08:53:14 kubuntu-cboyd kernel: [62945.920026] nouveau
E[chromium-browse[4468]] validate: -22
Sep 25 08:53:14 kubuntu-cboyd kernel: [62945.928974] nouveau E[  
PFIFO][0000:06:00.0] write fault at 0x00078c0000 [PAGE_NOT_PRESENT] from
PGRAPH/GPC0/PROP on channel 0x00bf9b3000 [chromium-browse[4468]]
Sep 25 08:53:14 kubuntu-cboyd kernel: [62945.928977] nouveau E[  
PFIFO][0000:06:00.0] PGRAPH engine fault on channel 5, recovering...
Sep 25 08:53:17 kubuntu-cboyd kernel: [62948.378624] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1
Sep 25 08:53:27 kubuntu-cboyd kernel: [62958.434144] nouveau E[     DRM] DDC
responded, but no EDID for VGA-1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443191866.dd11Efb23.29339--

--===============1611973404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1611973404==--
