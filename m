From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Tue, 23 Dec 2014 17:07:57 +0000
Message-ID: <bug-80901-8800-tPlm327VV1@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1194808415=="
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


--===============1194808415==
Content-Type: multipart/alternative; boundary="1419354477.8D0c58d2.12393"; charset="UTF-8"


--1419354477.8D0c58d2.12393
Date: Tue, 23 Dec 2014 17:07:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80901

--- Comment #25 from K.-P. Schrage <kpschrage-Mmb7MZpHnFY@public.gmane.org> ---
It seems that I am struck by this very bug as well since several months now.

Fedora 21, kernel-3.17.7-300.fc21.x86_64 (but it started on Fedora 20, around
kernel-3.15.5-200.fc20.x86_64)

Graphics card:
01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [GeForce GT 630]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Micro-Star International Co., Ltd. [MSI] Device 8a90
        Flags: bus master, fast devsel, latency 0, IRQ 43
        Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e8000000 (64-bit, prefetchable) [size=128M]
        Memory at f0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at e000 [size=128]
        Expansion ROM at f7000000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 <?>
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
<?>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

It seems as if problems started with this commit:
http://lists.freedesktop.org/archives/nouveau/2014-March/016589.html
At least reverting this patch to the nouveau source is a workaround, see
discussion on Redhat bugzilla:
https://bugzilla.redhat.com/show_bug.cgi?id=1121331

BTW, isn't bug 84721 a duplicate of this one? It is the very same NVIDIA
controller as mine that is affected.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419354477.8D0c58d2.12393
Date: Tue, 23 Dec 2014 17:07:57 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901">bug 80901</a>
              from <span class="vcard"><a class="email" href="mailto:kpschrage&#64;gmx.de" title="K.-P. Schrage &lt;kpschrage&#64;gmx.de&gt;"> <span class="fn">K.-P. Schrage</span></a>
</span></b>
        <pre>It seems that I am struck by this very bug as well since several months now.

Fedora 21, kernel-3.17.7-300.fc21.x86_64 (but it started on Fedora 20, around
kernel-3.15.5-200.fc20.x86_64)

Graphics card:
01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [GeForce GT 630]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Micro-Star International Co., Ltd. [MSI] Device 8a90
        Flags: bus master, fast devsel, latency 0, IRQ 43
        Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e8000000 (64-bit, prefetchable) [size=128M]
        Memory at f0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at e000 [size=128]
        Expansion ROM at f7000000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
&lt;?&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau

It seems as if problems started with this commit:
<a href="http://lists.freedesktop.org/archives/nouveau/2014-March/016589.html">http://lists.freedesktop.org/archives/nouveau/2014-March/016589.html</a>
At least reverting this patch to the nouveau source is a workaround, see
discussion on Redhat bugzilla:
<a href="https://bugzilla.redhat.com/show_bug.cgi?id=1121331">https://bugzilla.redhat.com/show_bug.cgi?id=1121331</a>

BTW, isn't <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - [NVC1] Nvidia Geforce GT 630 using nouveau on 3.16 kernel. dangerous Fan speed"
   href="show_bug.cgi?id=84721">bug 84721</a> a duplicate of this one? It is the very same NVIDIA
controller as mine that is affected.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419354477.8D0c58d2.12393--

--===============1194808415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1194808415==--
