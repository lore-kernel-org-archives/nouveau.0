From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Wed, 21 Oct 2015 18:41:45 +0000
Message-ID: <bug-70354-8800-k6C4TF1wCu@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0128930187=="
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


--===============0128930187==
Content-Type: multipart/alternative; boundary="1445452905.46e2e1.22105"; charset="UTF-8"


--1445452905.46e2e1.22105
Date: Wed, 21 Oct 2015 18:41:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #69 from Bozhan Boyadzhiev <bozhan-uiMcrn6V0Vs@public.gmane.org> ---
^C
bozhan@bozhan:~$ dmesg | grep nouveau
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc5-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0
nouveau.config=War00C800_0=1 quiet splash
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc5-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0
nouveau.config=War00C800_0=1 quiet splash
[    8.800478] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[    8.800502] nouveau 0000:01:00.0: NVIDIA GK107 (0e70d0a2)
[    8.816187] nouveau 0000:01:00.0: bios: version 80.07.a8.00.0f
[    8.978677] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[    8.978754] nouveau 0000:01:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[    9.050234] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    9.050235] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    9.050238] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    9.050258] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    9.050259] nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
[    9.242859] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    9.242861] [drm] Initialized nouveau 1.3.0 20120801 for 0000:01:00.0 on
minor 1
[   16.711127] nouveau 0000:01:00.0: pmu: hw bug workaround enabled
[   16.823251] nouveau 0000:01:00.0: pmu: hw bug workaround enabled

nice :)


bozhan@bozhan:~$ DRI_PRIME=1 glxgears -info
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
GL_RENDERER   = Gallium 0.4 on NVE7
GL_VERSION    = 3.0 Mesa 10.6.8
GL_VENDOR     = nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445452905.46e2e1.22105
Date: Wed, 21 Oct 2015 18:41:45 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c69">Comment # 69</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:bozhan&#64;abv.bg" title="Bozhan Boyadzhiev &lt;bozhan&#64;abv.bg&gt;"> <span class="fn">Bozhan Boyadzhiev</span></a>
</span></b>
        <pre>^C
bozhan&#64;bozhan:~$ dmesg | grep nouveau
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc5-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0
nouveau.config=War00C800_0=1 quiet splash
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc5-amd64
root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0
nouveau.config=War00C800_0=1 quiet splash
[    8.800478] nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
[    8.800502] nouveau 0000:01:00.0: NVIDIA GK107 (0e70d0a2)
[    8.816187] nouveau 0000:01:00.0: bios: version 80.07.a8.00.0f
[    8.978677] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[    8.978754] nouveau 0000:01:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[    9.050234] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    9.050235] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    9.050238] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    9.050258] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    9.050259] nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
[    9.242859] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    9.242861] [drm] Initialized nouveau 1.3.0 20120801 for 0000:01:00.0 on
minor 1
[   16.711127] nouveau 0000:01:00.0: pmu: hw bug workaround enabled
[   16.823251] nouveau 0000:01:00.0: pmu: hw bug workaround enabled

nice :)


bozhan&#64;bozhan:~$ DRI_PRIME=1 glxgears -info
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
GL_RENDERER   = Gallium 0.4 on NVE7
GL_VERSION    = 3.0 Mesa 10.6.8
GL_VENDOR     = nouveau</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445452905.46e2e1.22105--

--===============0128930187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0128930187==--
