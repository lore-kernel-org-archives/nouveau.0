From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90276] [NVE4] read fault error, bisected
Date: Sun, 13 Dec 2015 20:40:14 +0000
Message-ID: <bug-90276-8800-2j8ZCBvDSq@http.bugs.freedesktop.org/>
References: <bug-90276-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1110553193=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90276-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1110553193==
Content-Type: multipart/alternative; boundary="1450039213.70B82fbc2.2753"; charset="UTF-8"


--1450039213.70B82fbc2.2753
Date: Sun, 13 Dec 2015 20:40:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90276

--- Comment #24 from abi <enitarzi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I have exactly the same problem with screens freeze, inability to shutdown
desktop from remote and read fault at 0x00bca00000 [UNSUPPORTED_KIND] from
CE2/GR_CE on channel 0x007f6ef000 [unknown] in the logs.

4.2.5-1-ARCH

mesa 11.0.7-1
libdrm 2.4.65-1
xf86-video-nouveau 1.0.11+31+g1ff13a9-1

04:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 770]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: ASUSTeK Computer Inc. Device 8465
    Physical Slot: 4
    Flags: bus master, fast devsel, latency 0, IRQ 70
    Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
    Memory at f0000000 (64-bit, prefetchable) [size=128M]
    Memory at f8000000 (64-bit, prefetchable) [size=32M]
    I/O ports at e000 [size=128]
    Expansion ROM at fb000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 <?>
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting <?>
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
    Capabilities: [900] #19
    Kernel driver in use: nouveau
    Kernel modules: nouveau

Game triggers the issue is Wasteland 2 (native, x64). This is the only game I
have, so I can't extrapolate.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1450039213.70B82fbc2.2753
Date: Sun, 13 Dec 2015 20:40:13 +0000
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
   title="NEW - [NVE4] read fault error, bisected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90276#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] read fault error, bisected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90276">bug 90276</a>
              from <span class="vcard"><a class="email" href="mailto:enitarzi&#64;gmail.com" title="abi &lt;enitarzi&#64;gmail.com&gt;"> <span class="fn">abi</span></a>
</span></b>
        <pre>I have exactly the same problem with screens freeze, inability to shutdown
desktop from remote and read fault at 0x00bca00000 [UNSUPPORTED_KIND] from
CE2/GR_CE on channel 0x007f6ef000 [unknown] in the logs.

4.2.5-1-ARCH

mesa 11.0.7-1
libdrm 2.4.65-1
xf86-video-nouveau 1.0.11+31+g1ff13a9-1

04:00.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 770]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: ASUSTeK Computer Inc. Device 8465
    Physical Slot: 4
    Flags: bus master, fast devsel, latency 0, IRQ 70
    Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
    Memory at f0000000 (64-bit, prefetchable) [size=128M]
    Memory at f8000000 (64-bit, prefetchable) [size=32M]
    I/O ports at e000 [size=128]
    Expansion ROM at fb000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting &lt;?&gt;
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 &lt;?&gt;
    Capabilities: [900] #19
    Kernel driver in use: nouveau
    Kernel modules: nouveau

Game triggers the issue is Wasteland 2 (native, x64). This is the only game I
have, so I can't extrapolate.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1450039213.70B82fbc2.2753--

--===============1110553193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1110553193==--
