From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Thu, 22 Oct 2015 04:01:31 +0000
Message-ID: <bug-70354-8800-i4Z28UQ5I3@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1644346182=="
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


--===============1644346182==
Content-Type: multipart/alternative; boundary="1445486491.f3B31.20738"; charset="UTF-8"


--1445486491.f3B31.20738
Date: Thu, 22 Oct 2015 04:01:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #77 from Bozhan Boyadzhiev <bozhan-uiMcrn6V0Vs@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #76)

> 
> Weird, someone with a fairly identical GPU and nouveau comes up fine for
> them: https://bugs.launchpad.net/ubuntu/+source/compiz/+bug/1327624

dmesg without workaround:

bozhan@bozhan:~$ dmesg | grep nouveau
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc5-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet splash
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc5-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet splash
[    6.429245] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[    6.429268] nouveau 0000:01:00.0: NVIDIA GK107 (0e70d0a2)
[    6.443237] nouveau 0000:01:00.0: bios: version 80.07.a8.00.0f
[    6.605738] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[    6.605815] nouveau 0000:01:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[    6.676883] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    6.676884] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    6.676886] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    6.676904] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    6.676906] nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
[    6.914366] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    6.914370] [drm] Initialized nouveau 1.3.0 20120801 for 0000:01:00.0 on
minor 1
[   14.829712] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   16.831328] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   18.832940] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   20.834557] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   22.836319] nouveau 0000:01:00.0: timeout at
/home/bozhan/nouveau/drm/nouveau/nvkm/engine/gr/ctxgf100.c:1365/gf100_grctx_generate()!
[   22.836389] nouveau 0000:01:00.0: gr: failed to construct context
[   22.836393] nouveau 0000:01:00.0: gr: init failed, -16


What in that bug report in launchpad is related to this one?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445486491.f3B31.20738
Date: Thu, 22 Oct 2015 04:01:31 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c77">Comment # 77</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:bozhan&#64;abv.bg" title="Bozhan Boyadzhiev &lt;bozhan&#64;abv.bg&gt;"> <span class="fn">Bozhan Boyadzhiev</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=70354#c76">comment #76</a>)

<span class="quote">&gt; 
&gt; Weird, someone with a fairly identical GPU and nouveau comes up fine for
&gt; them: <a href="https://bugs.launchpad.net/ubuntu/+source/compiz/+bug/1327624">https://bugs.launchpad.net/ubuntu/+source/compiz/+bug/1327624</a></span >

dmesg without workaround:

bozhan&#64;bozhan:~$ dmesg | grep nouveau
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc5-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet splash
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc5-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet splash
[    6.429245] nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
[    6.429268] nouveau 0000:01:00.0: NVIDIA GK107 (0e70d0a2)
[    6.443237] nouveau 0000:01:00.0: bios: version 80.07.a8.00.0f
[    6.605738] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[    6.605815] nouveau 0000:01:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[    6.676883] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    6.676884] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    6.676886] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    6.676904] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    6.676906] nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
[    6.914366] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    6.914370] [drm] Initialized nouveau 1.3.0 20120801 for 0000:01:00.0 on
minor 1
[   14.829712] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   16.831328] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   18.832940] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   20.834557] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1, ctxsw:
0, busy: 1)
[   22.836319] nouveau 0000:01:00.0: timeout at
/home/bozhan/nouveau/drm/nouveau/nvkm/engine/gr/ctxgf100.c:1365/gf100_grctx_generate()!
[   22.836389] nouveau 0000:01:00.0: gr: failed to construct context
[   22.836393] nouveau 0000:01:00.0: gr: init failed, -16


What in that bug report in launchpad is related to this one?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445486491.f3B31.20738--

--===============1644346182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1644346182==--
