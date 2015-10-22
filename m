From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Thu, 22 Oct 2015 03:24:48 +0000
Message-ID: <bug-70354-8800-6vXzuMDafw@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1021226913=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1021226913==
Content-Type: multipart/alternative; boundary="1445484288.8f7D51.11409"; charset="UTF-8"


--1445484288.8f7D51.11409
Date: Thu, 22 Oct 2015 03:24:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #75 from Bozhan Boyadzhiev <bozhan-uiMcrn6V0Vs@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #70)
> (In reply to Bozhan Boyadzhiev from comment #69)

> Please provide the output of 'lspci -nnv -d 10de::300' so that we can add it
> to the workaround list by default.



bozhan@bozhan:~$ sudo lspci -nnv -d 10de::300
[sudo] password for bozhan: 
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107M [GeForce GT
755M] [10de:0fcd] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Lenovo Device [17aa:3801]
        Flags: bus master, fast devsel, latency 0, IRQ 33
        Memory at c0000000 (32-bit, non-prefetchable) [size=16M]
        Memory at 90000000 (64-bit, prefetchable) [size=256M]
        Memory at a0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at 4000 [size=128]
        Expansion ROM at c1000000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 <?>
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
<?>
        Capabilities: [900] #19
        Kernel driver in use: nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445484288.8f7D51.11409
Date: Thu, 22 Oct 2015 03:24:48 +0000
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
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c75">Comment # 75</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:bozhan&#64;abv.bg" title="Bozhan Boyadzhiev &lt;bozhan&#64;abv.bg&gt;"> <span class="fn">Bozhan Boyadzhiev</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=70354#c70">comment #70</a>)
<span class="quote">&gt; (In reply to Bozhan Boyadzhiev from <a href="show_bug.cgi?id=70354#c69">comment #69</a>)</span >

<span class="quote">&gt; Please provide the output of 'lspci -nnv -d 10de::300' so that we can add it
&gt; to the workaround list by default.</span >



bozhan&#64;bozhan:~$ sudo lspci -nnv -d 10de::300
[sudo] password for bozhan: 
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107M [GeForce GT
755M] [10de:0fcd] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Lenovo Device [17aa:3801]
        Flags: bus master, fast devsel, latency 0, IRQ 33
        Memory at c0000000 (32-bit, non-prefetchable) [size=16M]
        Memory at 90000000 (64-bit, prefetchable) [size=256M]
        Memory at a0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at 4000 [size=128]
        Expansion ROM at c1000000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
&lt;?&gt;
        Capabilities: [900] #19
        Kernel driver in use: nouveau</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445484288.8f7D51.11409--

--===============1021226913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1021226913==--
