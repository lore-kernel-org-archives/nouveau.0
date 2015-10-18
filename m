From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Sun, 18 Oct 2015 23:40:14 +0000
Message-ID: <bug-70354-8800-7pibZZtfBe@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1978230068=="
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


--===============1978230068==
Content-Type: multipart/alternative; boundary="1445211613.d6c7a81.12170"; charset="UTF-8"


--1445211613.d6c7a81.12170
Date: Sun, 18 Oct 2015 23:40:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #67 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Bozhan Boyadzhiev from comment #65)
> Sorry for delay.
> 
> 
> [    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc4-amd64
> root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet
> splash
> [    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc4-amd64
> root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet
> splash
> [   17.692733] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
> [   17.692756] nouveau 0000:01:00.0: NVIDIA GK107 (0e70d0a2)
> [   17.705157] nouveau 0000:01:00.0: bios: version 80.07.a8.00.0f
> [   17.867615] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
> [   17.867692] nouveau 0000:01:00.0: bus: MMIO write of 00000002 FAULT at
> 4188ac [ IBUS ]
> [   17.938396] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
> [   17.938397] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
> [   17.938399] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
> [   17.938417] nouveau 0000:01:00.0: DRM: DCB version 4.0
> [   17.938418] nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
> [   18.168394] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
> [   18.168400] [drm] Initialized nouveau 1.3.0 20120801 for 0000:01:00.0 on
> minor 1
> [   25.809299] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1,
> ctxsw: 0, busy: 1)
> [   27.810911] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1,
> ctxsw: 0, busy: 1)
> [   29.812527] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1,
> ctxsw: 0, busy: 1)
> [   31.814138] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1,
> ctxsw: 0, busy: 1)
> [   33.815894] nouveau 0000:01:00.0: timeout at
> /home/bozhan/nouveau/drm/nouveau/nvkm/engine/gr/ctxgf100.c:1365/
> gf100_grctx_generate()!
> [   33.815947] nouveau 0000:01:00.0: gr: failed to construct context
> [   33.815951] nouveau 0000:01:00.0: gr: init failed, -16
> 
> 
> This is with your tree.

If you add "nouveau.config=War00C800_0=1" to your kernel options, does that
help?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445211613.d6c7a81.12170
Date: Sun, 18 Oct 2015 23:40:13 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c67">Comment # 67</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to Bozhan Boyadzhiev from <a href="show_bug.cgi?id=70354#c65">comment #65</a>)
<span class="quote">&gt; Sorry for delay.
&gt; 
&gt; 
&gt; [    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc4-amd64
&gt; root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet
&gt; splash
&gt; [    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-rc4-amd64
&gt; root=UUID=d059e904-eec5-49ea-9e05-d3370455329c ro nouveau.runpm=0 quiet
&gt; splash
&gt; [   17.692733] nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
&gt; [   17.692756] nouveau 0000:01:00.0: NVIDIA GK107 (0e70d0a2)
&gt; [   17.705157] nouveau 0000:01:00.0: bios: version 80.07.a8.00.0f
&gt; [   17.867615] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
&gt; [   17.867692] nouveau 0000:01:00.0: bus: MMIO write of 00000002 FAULT at
&gt; 4188ac [ IBUS ]
&gt; [   17.938396] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
&gt; [   17.938397] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
&gt; [   17.938399] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
&gt; [   17.938417] nouveau 0000:01:00.0: DRM: DCB version 4.0
&gt; [   17.938418] nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
&gt; [   18.168394] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
&gt; [   18.168400] [drm] Initialized nouveau 1.3.0 20120801 for 0000:01:00.0 on
&gt; minor 1
&gt; [   25.809299] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1,
&gt; ctxsw: 0, busy: 1)
&gt; [   27.810911] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1,
&gt; ctxsw: 0, busy: 1)
&gt; [   29.812527] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1,
&gt; ctxsw: 0, busy: 1)
&gt; [   31.814138] nouveau 0000:01:00.0: gr: wait for idle timeout (en: 1,
&gt; ctxsw: 0, busy: 1)
&gt; [   33.815894] nouveau 0000:01:00.0: timeout at
&gt; /home/bozhan/nouveau/drm/nouveau/nvkm/engine/gr/ctxgf100.c:1365/
&gt; gf100_grctx_generate()!
&gt; [   33.815947] nouveau 0000:01:00.0: gr: failed to construct context
&gt; [   33.815951] nouveau 0000:01:00.0: gr: init failed, -16
&gt; 
&gt; 
&gt; This is with your tree.</span >

If you add &quot;nouveau.config=War00C800_0=1&quot; to your kernel options, does that
help?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445211613.d6c7a81.12170--

--===============1978230068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1978230068==--
