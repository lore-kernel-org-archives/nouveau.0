From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Fri, 09 Oct 2015 17:50:25 +0000
Message-ID: <bug-70354-8800-EB7P2YKjtK@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0955424974=="
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


--===============0955424974==
Content-Type: multipart/alternative; boundary="1444413025.00A2F1.25042"; charset="UTF-8"


--1444413025.00A2F1.25042
Date: Fri, 9 Oct 2015 17:50:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #65 from Bozhan Boyadzhiev <bozhan-uiMcrn6V0Vs@public.gmane.org> ---
Sorry for delay.


[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc4-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet splash
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc4-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet splash
[   17.692733] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[   17.692756] nouveau 0000:01:00.0: NVIDIA GK107 (0e70d0a2)
[   17.705157] nouveau 0000:01:00.0: bios: version 80.07.a8.00.0f
[   17.867615] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[   17.867692] nouveau 0000:01:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[   17.938396] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   17.938397] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   17.938399] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[   17.938417] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   17.938418] nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
[   18.168394] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   18.168400] [drm] Initialized nouveau 1.3.0 20120801 for 0000:01:00.0 on
minor 1
[   25.809299] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   27.810911] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   29.812527] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   31.814138] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   33.815894] nouveau 0000:01:00.0: timeout at
/home/bozhan/nouveau/drm/nouveau/nvkm/engine/gr/ctxgf100.c:1365/gf100_grctx_generate()!
[   33.815947] nouveau 0000:01:00.0: gr: failed to construct context
[   33.815951] nouveau 0000:01:00.0: gr: init failed, -16


This is with your tree.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444413025.00A2F1.25042
Date: Fri, 9 Oct 2015 17:50:25 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c65">Comment # 65</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:bozhan&#64;abv.bg" title="Bozhan Boyadzhiev &lt;bozhan&#64;abv.bg&gt;"> <span class="fn">Bozhan Boyadzhiev</span></a>
</span></b>
        <pre>Sorry for delay.


[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc4-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet splash
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc4-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet splash
[   17.692733] nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
[   17.692756] nouveau 0000:01:00.0: NVIDIA GK107 (0e70d0a2)
[   17.705157] nouveau 0000:01:00.0: bios: version 80.07.a8.00.0f
[   17.867615] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[   17.867692] nouveau 0000:01:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[   17.938396] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   17.938397] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   17.938399] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[   17.938417] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   17.938418] nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
[   18.168394] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   18.168400] [drm] Initialized nouveau 1.3.0 20120801 for 0000:01:00.0 on
minor 1
[   25.809299] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   27.810911] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   29.812527] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   31.814138] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   33.815894] nouveau 0000:01:00.0: timeout at
/home/bozhan/nouveau/drm/nouveau/nvkm/engine/gr/ctxgf100.c:1365/gf100_grctx_generate()!
[   33.815947] nouveau 0000:01:00.0: gr: failed to construct context
[   33.815951] nouveau 0000:01:00.0: gr: init failed, -16


This is with your tree.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444413025.00A2F1.25042--

--===============0955424974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0955424974==--
