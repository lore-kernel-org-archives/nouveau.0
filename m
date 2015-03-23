From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Mon, 23 Mar 2015 19:41:22 +0000
Message-ID: <bug-89558-8800-L2o7R0BSSX@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1479763502=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89558-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1479763502==
Content-Type: multipart/alternative; boundary="1427139682.8d8473.30311"; charset="UTF-8"


--1427139682.8d8473.30311
Date: Mon, 23 Mar 2015 19:41:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89558

--- Comment #20 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
That trace is interesting...

[0] 72.213698 MMIO32 R 0x000000 0x118010a2 PMC.ID => { STEPPING = 0xa2 |
DEVICE_ID = 0x1 | CHIPSET = GM108 | FOUNDRY = TSMC }
[0] 72.213703 MMIO32 R 0x100800 0x00000001 PFFB.PART_CONFIG => { PART_COUNT =
0x1 | MEM_SPLIT_PART = 0 }
[0] 72.213708 MMIO32 R 0x11020c 0x00001000 PBFB[0].MEM_AMOUNT => 0x100000000
[0] 72.213712 MMIO32 R 0x100800 0x00000001 PFFB.PART_CONFIG => { PART_COUNT =
0x1 | MEM_SPLIT_PART = 0 }
[0] 72.213720 MMIO32 R 0x10f590 0x00000901 PBFB_BROADCAST+0x590 => 0x901
[0] 72.213726 MMIO32 R 0x101000 0x80400092 PSTRAPS.STRAPS0_PRIMARY => { VALUE =
{ PCI_SUB_BIOS | RAMCFG = 0x4 | CRYSTAL = 0 | DEVICE_ID_0_3 = 0 |
 BAR1_SIZE = 64MB | ROM_TYPE = SPI | FP_CONFIG = 0 | DEVICE_ID_4 = 0 |
DEVICE_ID_5 = 0 | 0x80 } | OVERRIDE_ENABLE }

So this suggests that you (SMF) have 4GB of VRAM. Is that correct?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427139682.8d8473.30311
Date: Mon, 23 Mar 2015 19:41:22 +0000
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
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>That trace is interesting...

[0] 72.213698 MMIO32 R 0x000000 0x118010a2 PMC.ID =&gt; { STEPPING = 0xa2 |
DEVICE_ID = 0x1 | CHIPSET = GM108 | FOUNDRY = TSMC }
[0] 72.213703 MMIO32 R 0x100800 0x00000001 PFFB.PART_CONFIG =&gt; { PART_COUNT =
0x1 | MEM_SPLIT_PART = 0 }
[0] 72.213708 MMIO32 R 0x11020c 0x00001000 PBFB[0].MEM_AMOUNT =&gt; 0x100000000
[0] 72.213712 MMIO32 R 0x100800 0x00000001 PFFB.PART_CONFIG =&gt; { PART_COUNT =
0x1 | MEM_SPLIT_PART = 0 }
[0] 72.213720 MMIO32 R 0x10f590 0x00000901 PBFB_BROADCAST+0x590 =&gt; 0x901
[0] 72.213726 MMIO32 R 0x101000 0x80400092 PSTRAPS.STRAPS0_PRIMARY =&gt; { VALUE =
{ PCI_SUB_BIOS | RAMCFG = 0x4 | CRYSTAL = 0 | DEVICE_ID_0_3 = 0 |
 BAR1_SIZE = 64MB | ROM_TYPE = SPI | FP_CONFIG = 0 | DEVICE_ID_4 = 0 |
DEVICE_ID_5 = 0 | 0x80 } | OVERRIDE_ENABLE }

So this suggests that you (SMF) have 4GB of VRAM. Is that correct?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427139682.8d8473.30311--

--===============1479763502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1479763502==--
