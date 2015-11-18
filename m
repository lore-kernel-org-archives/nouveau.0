From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92991] Nouveau module loading regression in 4.4-rc1
 on optimus system
Date: Wed, 18 Nov 2015 22:26:54 +0000
Message-ID: <bug-92991-8800-i0XafMFAjN@http.bugs.freedesktop.org/>
References: <bug-92991-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1353818367=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92991-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1353818367==
Content-Type: multipart/alternative; boundary="1447885614.18b6F2a1.2298"; charset="UTF-8"


--1447885614.18b6F2a1.2298
Date: Wed, 18 Nov 2015 22:26:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92991

--- Comment #4 from Oliver Neukum <oliver-GvhC2dPhHPQdnm+yROfE0A@public.gmane.org> ---
lspci -nnv -d 10de:11b6
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK104GLM [Quadro
K3100M] [10de:11b6] (rev a1) (prog-if 00 [VGA controller])                      
        Subsystem: Hewlett-Packard Company Device [103c:190a]                   
        Flags: fast devsel, IRQ 10                                              
        Memory at cb000000 (32-bit, non-prefetchable) [disabled] [size=16M]     
        Memory at 50000000 (64-bit, prefetchable) [disabled] [size=256M]        
        Memory at 60000000 (64-bit, prefetchable) [disabled] [size=32M]
        I/O ports at 5000 [disabled] [size=128]
        Expansion ROM at cc080000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 <?>
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
<?>
        Capabilities: [900] #19
        Kernel modules: nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447885614.18b6F2a1.2298
Date: Wed, 18 Nov 2015 22:26:54 +0000
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
   title="NEW - Nouveau module loading regression in 4.4-rc1 on optimus system"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92991#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau module loading regression in 4.4-rc1 on optimus system"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92991">bug 92991</a>
              from <span class="vcard"><a class="email" href="mailto:oliver&#64;neukum.org" title="Oliver Neukum &lt;oliver&#64;neukum.org&gt;"> <span class="fn">Oliver Neukum</span></a>
</span></b>
        <pre>lspci -nnv -d 10de:11b6
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK104GLM [Quadro
K3100M] [10de:11b6] (rev a1) (prog-if 00 [VGA controller])                      
        Subsystem: Hewlett-Packard Company Device [103c:190a]                   
        Flags: fast devsel, IRQ 10                                              
        Memory at cb000000 (32-bit, non-prefetchable) [disabled] [size=16M]     
        Memory at 50000000 (64-bit, prefetchable) [disabled] [size=256M]        
        Memory at 60000000 (64-bit, prefetchable) [disabled] [size=32M]
        I/O ports at 5000 [disabled] [size=128]
        Expansion ROM at cc080000 [disabled] [size=512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
&lt;?&gt;
        Capabilities: [900] #19
        Kernel modules: nouveau</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447885614.18b6F2a1.2298--

--===============1353818367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1353818367==--
