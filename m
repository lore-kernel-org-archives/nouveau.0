From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Thu, 25 Dec 2014 00:46:41 +0000
Message-ID: <bug-80901-8800-go0dEC8WFM@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0308756578=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80901-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0308756578==
Content-Type: multipart/alternative; boundary="1419468401.63EEc2.23751"; charset="UTF-8"


--1419468401.63EEc2.23751
Date: Thu, 25 Dec 2014 00:46:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80901

--- Comment #29 from Lars E Pettersson <lars-mDsk/mlFC80@public.gmane.org> ---
I am the original poster of the Fedora bug report mentioned by K.-P. Schrage,
https://bugzilla.redhat.com/show_bug.cgi?id=1121331

I have the exact same problem as the original poster of this bug report, but
using another graphical card. I.e. the fan on the card works nice using kernels
below 3.15, but all kernels from 3.15 and up will peg the fan.

Reverting the commit mentioned by K.-P. Schrage,
http://lists.freedesktop.org/archives/nouveau/2014-March/016589.html
solves the issue for me. The fan returns to how it behaved before kernel 3.15.

I am using a Nvidia GF106GL (Quadro 2000) card, lspci:
01:00.0 VGA compatible controller: NVIDIA Corporation GF106GL [Quadro 2000]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: NVIDIA Corporation Device 084a
    Flags: bus master, fast devsel, latency 0, IRQ 30
    Memory at f0000000 (32-bit, non-prefetchable) [size=32M]
    Memory at e0000000 (64-bit, prefetchable) [size=128M]
    Memory at e8000000 (64-bit, prefetchable) [size=64M]
    I/O ports at e000 [size=128]
    Expansion ROM at f2000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 <?>
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting <?>
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
    Kernel driver in use: nouveau
    Kernel modules: nouveau

At the moment I am using the following kernel
Linux tux 3.17.7-300.fc21.x86_64 #1 SMP Wed Dec 17 03:08:44 UTC 2014 x86_64
x86_64 x86_64 GNU/Linux

vbios.rom will follow...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419468401.63EEc2.23751
Date: Thu, 25 Dec 2014 00:46:41 +0000
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
   title="NEW - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901">bug 80901</a>
              from <span class="vcard"><a class="email" href="mailto:lars&#64;homer.se" title="Lars E Pettersson &lt;lars&#64;homer.se&gt;"> <span class="fn">Lars E Pettersson</span></a>
</span></b>
        <pre>I am the original poster of the Fedora bug report mentioned by K.-P. Schrage,
<a href="https://bugzilla.redhat.com/show_bug.cgi?id=1121331">https://bugzilla.redhat.com/show_bug.cgi?id=1121331</a>

I have the exact same problem as the original poster of this bug report, but
using another graphical card. I.e. the fan on the card works nice using kernels
below 3.15, but all kernels from 3.15 and up will peg the fan.

Reverting the commit mentioned by K.-P. Schrage,
<a href="http://lists.freedesktop.org/archives/nouveau/2014-March/016589.html">http://lists.freedesktop.org/archives/nouveau/2014-March/016589.html</a>
solves the issue for me. The fan returns to how it behaved before kernel 3.15.

I am using a Nvidia GF106GL (Quadro 2000) card, lspci:
01:00.0 VGA compatible controller: NVIDIA Corporation GF106GL [Quadro 2000]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: NVIDIA Corporation Device 084a
    Flags: bus master, fast devsel, latency 0, IRQ 30
    Memory at f0000000 (32-bit, non-prefetchable) [size=32M]
    Memory at e0000000 (64-bit, prefetchable) [size=128M]
    Memory at e8000000 (64-bit, prefetchable) [size=64M]
    I/O ports at e000 [size=128]
    Expansion ROM at f2000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting &lt;?&gt;
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 &lt;?&gt;
    Kernel driver in use: nouveau
    Kernel modules: nouveau

At the moment I am using the following kernel
Linux tux 3.17.7-300.fc21.x86_64 #1 SMP Wed Dec 17 03:08:44 UTC 2014 x86_64
x86_64 x86_64 GNU/Linux

vbios.rom will follow...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419468401.63EEc2.23751--

--===============0308756578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0308756578==--
