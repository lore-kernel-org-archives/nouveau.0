From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87819] [NVAC] EQ overflowing
Date: Fri, 02 Jan 2015 13:01:41 +0000
Message-ID: <bug-87819-8800-R9oOHIcyvo@http.bugs.freedesktop.org/>
References: <bug-87819-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1661369590=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87819-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1661369590==
Content-Type: multipart/alternative; boundary="1420203701.326dcCfB0.19131"; charset="UTF-8"


--1420203701.326dcCfB0.19131
Date: Fri, 2 Jan 2015 13:01:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87819

--- Comment #3 from Etienne URBAH <eurbah-GANU6spQydw@public.gmane.org> ---
In Firefox, I was NOT doing anything in particular.

I am NOT able to compile a Linux kernel, nor compile a custom module and
include it inside a Linux Kernel.

The machine equipped with NVAC is an iMac 9,1 used in production under Ubuntu
with package 'nvidia-331-updates'.
So, I am just able to test from time to time, at night, an upstream Linux
Kernel published as an Ubuntu package at
http://kernel.ubuntu.com/~kernel-ppa/mainline

Concerning the correct quantity of stolen memory to be used as VRAM :
Using the graphical driver coming from Ubuntu package 'nvidia-331-updates' :

The command 'nvidia-settings -q VideoRam -q GPUMemoryInterface' provides :
-  VideoRam           = 262144
-  GPUMemoryInterface = 128

$ sudo lspci -nn -vv -s 03:00
03:00.0 VGA compatible controller [0300]: NVIDIA Corporation C79 [GeForce 9400]
[10de:0867] (rev b1) (prog-if 00 [VGA controller])
    Subsystem: Apple Inc. iMac 9,1 [106b:00ad]
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Interrupt: pin A routed to IRQ 46
    Region 0: Memory at d2000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at d0000000 (64-bit, prefetchable) [size=32M]
    Region 5: I/O ports at 1000 [size=128]
    [virtual] Expansion ROM at d3000000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee0300c  Data: 4192
    Kernel driver in use: nvidia

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420203701.326dcCfB0.19131
Date: Fri, 2 Jan 2015 13:01:41 +0000
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
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819">bug 87819</a>
              from <span class="vcard"><a class="email" href="mailto:eurbah&#64;free.fr" title="Etienne URBAH &lt;eurbah&#64;free.fr&gt;"> <span class="fn">Etienne URBAH</span></a>
</span></b>
        <pre>In Firefox, I was NOT doing anything in particular.

I am NOT able to compile a Linux kernel, nor compile a custom module and
include it inside a Linux Kernel.

The machine equipped with NVAC is an iMac 9,1 used in production under Ubuntu
with package 'nvidia-331-updates'.
So, I am just able to test from time to time, at night, an upstream Linux
Kernel published as an Ubuntu package at
<a href="http://kernel.ubuntu.com/~kernel-ppa/mainline">http://kernel.ubuntu.com/~kernel-ppa/mainline</a>

Concerning the correct quantity of stolen memory to be used as VRAM :
Using the graphical driver coming from Ubuntu package 'nvidia-331-updates' :

The command 'nvidia-settings -q VideoRam -q GPUMemoryInterface' provides :
-  VideoRam           = 262144
-  GPUMemoryInterface = 128

$ sudo lspci -nn -vv -s 03:00
03:00.0 VGA compatible controller [0300]: NVIDIA Corporation C79 [GeForce 9400]
[10de:0867] (rev b1) (prog-if 00 [VGA controller])
    Subsystem: Apple Inc. iMac 9,1 [106b:00ad]
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast &gt;TAbort- &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
    Latency: 0
    Interrupt: pin A routed to IRQ 46
    Region 0: Memory at d2000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at d0000000 (64-bit, prefetchable) [size=32M]
    Region 5: I/O ports at 1000 [size=128]
    [virtual] Expansion ROM at d3000000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee0300c  Data: 4192
    Kernel driver in use: nvidia</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420203701.326dcCfB0.19131--

--===============1661369590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1661369590==--
