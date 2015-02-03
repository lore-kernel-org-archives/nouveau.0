From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88868] PowerPC e5500, kernel crash, GT520, GT610
Date: Tue, 03 Feb 2015 16:00:52 +0000
Message-ID: <bug-88868-8800-5cQgRvsSX4@http.bugs.freedesktop.org/>
References: <bug-88868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1771785295=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88868-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1771785295==
Content-Type: multipart/alternative; boundary="1422979252.BaBEc11.2386"; charset="UTF-8"


--1422979252.BaBEc11.2386
Date: Tue, 3 Feb 2015 16:00:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88868

--- Comment #21 from Dmitriy <oboturoff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
for example some debug in function "nouveau_bios_shadow_pramin" in kernel
3.18.5:

    if (device->card_type >= NV_50) {
        if (device->card_type >= NV_C0 && device->card_type < GM100) {
            printk ("%s(%d)\n",__FUNCTION__,__LINE__);
            if (nv_rd32(bios, 0x022500) & 0x00000001)
                return;
        } else
        if (device->card_type >= GM100) {
            printk ("##%s(%d)\n",__FUNCTION__,__LINE__);
            if (nv_rd32(bios, 0x021c04) & 0x00000001)
                return;
        }

        addr = nv_rd32(bios, 0x619f04);
        printk ("addr0=%x\n",addr);

               .....

        bar0 = nv_mask(bios, 0x001700, 0xffffffff, addr >> 16);
        printk ("bar0=%x\n",bar0);

log from x86_64:
[    0.279595] [drm] Initialized drm 1.1.0 20060810
[    0.280027] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d90a0a1
[    0.280196] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119 (NVD9)
[    0.280361] nouveau  [  DEVICE][0000:01:00.0] Family : NVC0
[    0.280533] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    0.280723] nouveau_bios_shadow_pramin(94)
[    0.280881] addr=3ffe09
[    0.281032] bar0=3ff0
[    0.358740] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    0.358913] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    0.359161] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    0.359333] nouveau  [   VBIOS][0000:01:00.0] version 75.19.55.00.02
[    0.359705] nouveau 0000:01:00.0: irq 25 for MSI/MSI-X
[    0.359712] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    0.359974] nouveau W[     PFB][0000:01:00.0][0x00000000][ffff88021385e800]
reclocking of this ram type unsupported
[    0.360322] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[    0.360542] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
[    0.360794] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    0.362663] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 900000uv
[    0.412297] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    0.412543] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    0.412822] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    0.413119] nouveau  [     CLK][0000:01:00.0] 07: core 270 MHz memory 405
MHz
[    0.413454] nouveau  [     CLK][0000:01:00.0] 0f: core 810 MHz memory 500
MHz
[    0.413951] nouveau  [     CLK][0000:01:00.0] --: core 270 MHz memory 405
MHz



log from powerpc e5500 64bit:
[drm] Initialized drm 1.1.0 20060810
nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d90a0a1
nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119 (NVD9)
nouveau  [  DEVICE][0000:01:00.0] Family : NVC0
nouveau  [   VBIOS][0000:01:00.0] checking OpenFirmware for image...
nouveau  [   VBIOS][0000:01:00.0] Unable to get the OF node
nouveau  [   VBIOS][0000:01:00.0] ... signature not found
nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
nouveau_bios_shadow_pramin(94)
addr0=1
nouveau  [   VBIOS][0000:01:00.0] ... signature not found
nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
nouveau  [   VBIOS][0000:01:00.0] using image from PROM
nouveau  [   VBIOS][0000:01:00.0] BIT signature found
nouveau  [   VBIOS][0000:01:00.0] version 75.19.55.00.02
nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
nouveau  [   VBIOS][0000:01:00.0] running init tables
nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
nouveau W[     PFB][0000:01:00.0][0x00000000][c0000001fe53c000] reclocking of
this ram type unsupported
nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
nouveau  [    VOLT][0000:01:00.0] GPU voltage: 900000uv
nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
nouveau  [     CLK][0000:01:00.0] 07: core 270 MHz memory 405 MHz 
nouveau  [     CLK][0000:01:00.0] 0f: core 810 MHz memory 500 MHz 
nouveau  [     CLK][0000:01:00.0] --: core 270 MHz memory 405 MHz 


result of operation:
addr = nv_rd32(bios, 0x619f04);

for x86: addr=3ffe09
for ppc: addr0=1

Why do the results of reading operation differ from each other?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422979252.BaBEc11.2386
Date: Tue, 3 Feb 2015 16:00:52 +0000
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
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868">bug 88868</a>
              from <span class="vcard"><a class="email" href="mailto:oboturoff&#64;gmail.com" title="Dmitriy &lt;oboturoff&#64;gmail.com&gt;"> <span class="fn">Dmitriy</span></a>
</span></b>
        <pre>for example some debug in function &quot;nouveau_bios_shadow_pramin&quot; in kernel
3.18.5:

    if (device-&gt;card_type &gt;= NV_50) {
        if (device-&gt;card_type &gt;= NV_C0 &amp;&amp; device-&gt;card_type &lt; GM100) {
            printk (&quot;%s(%d)\n&quot;,__FUNCTION__,__LINE__);
            if (nv_rd32(bios, 0x022500) &amp; 0x00000001)
                return;
        } else
        if (device-&gt;card_type &gt;= GM100) {
            printk (&quot;##%s(%d)\n&quot;,__FUNCTION__,__LINE__);
            if (nv_rd32(bios, 0x021c04) &amp; 0x00000001)
                return;
        }

        addr = nv_rd32(bios, 0x619f04);
        printk (&quot;addr0=%x\n&quot;,addr);

               .....

        bar0 = nv_mask(bios, 0x001700, 0xffffffff, addr &gt;&gt; 16);
        printk (&quot;bar0=%x\n&quot;,bar0);

log from x86_64:
[    0.279595] [drm] Initialized drm 1.1.0 20060810
[    0.280027] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d90a0a1
[    0.280196] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119 (NVD9)
[    0.280361] nouveau  [  DEVICE][0000:01:00.0] Family : NVC0
[    0.280533] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    0.280723] nouveau_bios_shadow_pramin(94)
[    0.280881] addr=3ffe09
[    0.281032] bar0=3ff0
[    0.358740] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    0.358913] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    0.359161] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    0.359333] nouveau  [   VBIOS][0000:01:00.0] version 75.19.55.00.02
[    0.359705] nouveau 0000:01:00.0: irq 25 for MSI/MSI-X
[    0.359712] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    0.359974] nouveau W[     PFB][0000:01:00.0][0x00000000][ffff88021385e800]
reclocking of this ram type unsupported
[    0.360322] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[    0.360542] nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
[    0.360794] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    0.362663] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 900000uv
[    0.412297] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    0.412543] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    0.412822] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    0.413119] nouveau  [     CLK][0000:01:00.0] 07: core 270 MHz memory 405
MHz
[    0.413454] nouveau  [     CLK][0000:01:00.0] 0f: core 810 MHz memory 500
MHz
[    0.413951] nouveau  [     CLK][0000:01:00.0] --: core 270 MHz memory 405
MHz



log from powerpc e5500 64bit:
[drm] Initialized drm 1.1.0 20060810
nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d90a0a1
nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119 (NVD9)
nouveau  [  DEVICE][0000:01:00.0] Family : NVC0
nouveau  [   VBIOS][0000:01:00.0] checking OpenFirmware for image...
nouveau  [   VBIOS][0000:01:00.0] Unable to get the OF node
nouveau  [   VBIOS][0000:01:00.0] ... signature not found
nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
nouveau_bios_shadow_pramin(94)
addr0=1
nouveau  [   VBIOS][0000:01:00.0] ... signature not found
nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
nouveau  [   VBIOS][0000:01:00.0] using image from PROM
nouveau  [   VBIOS][0000:01:00.0] BIT signature found
nouveau  [   VBIOS][0000:01:00.0] version 75.19.55.00.02
nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised
nouveau  [   VBIOS][0000:01:00.0] running init tables
nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
nouveau W[     PFB][0000:01:00.0][0x00000000][c0000001fe53c000] reclocking of
this ram type unsupported
nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
nouveau  [    VOLT][0000:01:00.0] GPU voltage: 900000uv
nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
nouveau  [     CLK][0000:01:00.0] 07: core 270 MHz memory 405 MHz 
nouveau  [     CLK][0000:01:00.0] 0f: core 810 MHz memory 500 MHz 
nouveau  [     CLK][0000:01:00.0] --: core 270 MHz memory 405 MHz 


result of operation:
addr = nv_rd32(bios, 0x619f04);

for x86: addr=3ffe09
for ppc: addr0=1

Why do the results of reading operation differ from each other?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422979252.BaBEc11.2386--

--===============1771785295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1771785295==--
