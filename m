From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92178] nouveau framebuffer fails to initialize
 properly on GeForce 2 Go (NV11M)
Date: Thu, 10 Dec 2015 22:38:37 +0000
Message-ID: <bug-92178-8800-VIkjr4ALUe@http.bugs.freedesktop.org/>
References: <bug-92178-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1262510922=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92178-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1262510922==
Content-Type: multipart/alternative; boundary="1449787117.Be8Cb5d2.31771"; charset="UTF-8"


--1449787117.Be8Cb5d2.31771
Date: Thu, 10 Dec 2015 22:38:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92178

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The interesting bits from the log:

[   128.852] (II) NV(0): I2C bus "DDC" initialized.
[   128.852] (II) NV(0): Probing for EDID on I2C bus A...
[   128.852] (II) NV(0): I2C device "DDC:ddc2" registered at address 0xA0.
[   128.855] (II) NV(0):   ... none found
[   128.855] (II) NV(0): Probing for EDID on I2C bus B...
[   129.092] (II) NV(0):   ... none found
[   129.092] (--) NV(0): CRTC 1 is currently programmed for DFP
[   129.092] (II) NV(0): Using DFP on CRTC 1
[   129.092] (--) NV(0): Panel size is 1400 x 1050
[   129.092] (II) NV(0): NOTE: This driver cannot reconfigure the
BIOS-programmed size.
[   129.092] (II) NV(0): These dimensions will be used as the panel size for
mode validation.
[   129.092] (II) NV(0): Panel is LVDS


Note that the xf86-video-nv recognizes device id 112 (and a boatlod of others)
as mobile, and for those it forces pNv->FlatPanel = 1, which in turn causes:

             if(pNv->FlatPanel) pNv->CRTCnumber = 1;

    if(pNv->FlatPanel && !pNv->Television) {
       pNv->fpWidth = pNv->PRAMDAC[0x0820/4] + 1;
       pNv->fpHeight = pNv->PRAMDAC[0x0800/4] + 1;
       pNv->fpVTotal = pNv->PRAMDAC[0x804/4] + 1;
       pNv->fpSyncs = pNv->PRAMDAC[0x0848/4] & 0x30000033;
       xf86DrvMsg(pScrn->scrnIndex, X_PROBED, "Panel size is %i x %i\n",
                  pNv->fpWidth, pNv->fpHeight);
       xf86DrvMsg(pScrn->scrnIndex, X_INFO, "NOTE: This driver cannot "
                  "reconfigure the BIOS-programmed size.\n");
       xf86DrvMsg(pScrn->scrnIndex, X_INFO, "These dimensions will be used as "
                  "the panel size for mode validation.\n");
    }

    if(monitorA)
      xf86SetDDCproperties(pScrn, monitorA);

    if(!pNv->FlatPanel || (pScrn->depth != 24) || !pNv->twoHeads)
        pNv->FPDither = FALSE;

    pNv->LVDS = FALSE;
    if(pNv->FlatPanel && pNv->twoHeads) {
        pNv->PRAMDAC0[0x08B0/4] = 0x00010004;
        if(pNv->PRAMDAC0[0x08B4/4] & 1)
           pNv->LVDS = TRUE;
        xf86DrvMsg(pScrn->scrnIndex, X_INFO, "Panel is %s\n", 
                   pNv->LVDS ? "LVDS" : "TMDS");
    }


and later on

    if(pNv->FlatPanel == 1) {
       vertStart = vertTotal - 3;  
       vertEnd = vertTotal - 2;
       vertBlankStart = vertStart;
       horizStart = horizTotal - 5;
       horizEnd = horizTotal - 2;   
       horizBlankEnd = horizTotal + 4;
       if(pNv->Architecture == NV_ARCH_30)
           horizTotal += 2;
    }

We should figure out what all this maps to in nouveau and how to properly fake
it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1449787117.Be8Cb5d2.31771
Date: Thu, 10 Dec 2015 22:38:37 +0000
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
   title="NEW - nouveau framebuffer fails to initialize properly on GeForce 2 Go (NV11M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92178#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau framebuffer fails to initialize properly on GeForce 2 Go (NV11M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92178">bug 92178</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The interesting bits from the log:

[   128.852] (II) NV(0): I2C bus &quot;DDC&quot; initialized.
[   128.852] (II) NV(0): Probing for EDID on I2C bus A...
[   128.852] (II) NV(0): I2C device &quot;DDC:ddc2&quot; registered at address 0xA0.
[   128.855] (II) NV(0):   ... none found
[   128.855] (II) NV(0): Probing for EDID on I2C bus B...
[   129.092] (II) NV(0):   ... none found
[   129.092] (--) NV(0): CRTC 1 is currently programmed for DFP
[   129.092] (II) NV(0): Using DFP on CRTC 1
[   129.092] (--) NV(0): Panel size is 1400 x 1050
[   129.092] (II) NV(0): NOTE: This driver cannot reconfigure the
BIOS-programmed size.
[   129.092] (II) NV(0): These dimensions will be used as the panel size for
mode validation.
[   129.092] (II) NV(0): Panel is LVDS


Note that the xf86-video-nv recognizes device id 112 (and a boatlod of others)
as mobile, and for those it forces pNv-&gt;FlatPanel = 1, which in turn causes:

             if(pNv-&gt;FlatPanel) pNv-&gt;CRTCnumber = 1;

    if(pNv-&gt;FlatPanel &amp;&amp; !pNv-&gt;Television) {
       pNv-&gt;fpWidth = pNv-&gt;PRAMDAC[0x0820/4] + 1;
       pNv-&gt;fpHeight = pNv-&gt;PRAMDAC[0x0800/4] + 1;
       pNv-&gt;fpVTotal = pNv-&gt;PRAMDAC[0x804/4] + 1;
       pNv-&gt;fpSyncs = pNv-&gt;PRAMDAC[0x0848/4] &amp; 0x30000033;
       xf86DrvMsg(pScrn-&gt;scrnIndex, X_PROBED, &quot;Panel size is %i x %i\n&quot;,
                  pNv-&gt;fpWidth, pNv-&gt;fpHeight);
       xf86DrvMsg(pScrn-&gt;scrnIndex, X_INFO, &quot;NOTE: This driver cannot &quot;
                  &quot;reconfigure the BIOS-programmed size.\n&quot;);
       xf86DrvMsg(pScrn-&gt;scrnIndex, X_INFO, &quot;These dimensions will be used as &quot;
                  &quot;the panel size for mode validation.\n&quot;);
    }

    if(monitorA)
      xf86SetDDCproperties(pScrn, monitorA);

    if(!pNv-&gt;FlatPanel || (pScrn-&gt;depth != 24) || !pNv-&gt;twoHeads)
        pNv-&gt;FPDither = FALSE;

    pNv-&gt;LVDS = FALSE;
    if(pNv-&gt;FlatPanel &amp;&amp; pNv-&gt;twoHeads) {
        pNv-&gt;PRAMDAC0[0x08B0/4] = 0x00010004;
        if(pNv-&gt;PRAMDAC0[0x08B4/4] &amp; 1)
           pNv-&gt;LVDS = TRUE;
        xf86DrvMsg(pScrn-&gt;scrnIndex, X_INFO, &quot;Panel is %s\n&quot;, 
                   pNv-&gt;LVDS ? &quot;LVDS&quot; : &quot;TMDS&quot;);
    }


and later on

    if(pNv-&gt;FlatPanel == 1) {
       vertStart = vertTotal - 3;  
       vertEnd = vertTotal - 2;
       vertBlankStart = vertStart;
       horizStart = horizTotal - 5;
       horizEnd = horizTotal - 2;   
       horizBlankEnd = horizTotal + 4;
       if(pNv-&gt;Architecture == NV_ARCH_30)
           horizTotal += 2;
    }

We should figure out what all this maps to in nouveau and how to properly fake
it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1449787117.Be8Cb5d2.31771--

--===============1262510922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1262510922==--
