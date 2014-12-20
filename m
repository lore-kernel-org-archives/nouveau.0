From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87469] [NV34] Invisible cursor on Xorg
Date: Sat, 20 Dec 2014 00:55:34 +0000
Message-ID: <bug-87469-8800-KLAmHLVyBk@http.bugs.freedesktop.org/>
References: <bug-87469-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0978756977=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87469-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0978756977==
Content-Type: multipart/alternative; boundary="1419036934.dCdeC2f2.908"; charset="UTF-8"


--1419036934.dCdeC2f2.908
Date: Sat, 20 Dec 2014 00:55:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87469

--- Comment #11 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Fernando Rodriguez from comment #10)
> Thanks for the help. I got the cursor back, and for the first time in this
> machine, acceleration is also working. The solution was to compile
> amd64-agpgart as a module (not built-in). So unless you consider that a bug
> you can close this bug. 

Hmmmm.... very odd. I have no idea why that would happen. Mind providing a boot
log with that? In your current 3.17.3 log it says:


[    0.449093] agpgart-amd64 0000:00:00.0: AGP 3.0 bridge
[    0.449104] agpgart-amd64 0000:00:00.0: putting AGP V3 device into 8x mode
[    0.449146] nouveau 0000:01:00.0: putting AGP V3 device into 8x mode
[    0.449222] [TTM] Zone  kernel: Available graphics memory: 1022436 kiB
[    0.449224] [TTM] Initializing pool allocator
[    0.449231] [TTM] Initializing DMA pool allocator
[    0.449250] nouveau  [     DRM] VRAM: 127 MiB
[    0.449252] nouveau  [     DRM] GART: 128 MiB

[Hm, that "available graphics memory" thing seems high... 1GB? Is that how much
system ram you have?]

> Btw, it also requires and SMP enabled kernel for me
> even though it's a single core. If I disable SMP it hangs as soon as the
> module is loaded.

Known issue. Patch available. Everyone keeps thinking someone else will merge
it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419036934.dCdeC2f2.908
Date: Sat, 20 Dec 2014 00:55:34 +0000
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
   title="NEW - [NV34] Invisible cursor on Xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87469#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV34] Invisible cursor on Xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87469">bug 87469</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Fernando Rodriguez from <a href="show_bug.cgi?id=87469#c10">comment #10</a>)
<span class="quote">&gt; Thanks for the help. I got the cursor back, and for the first time in this
&gt; machine, acceleration is also working. The solution was to compile
&gt; amd64-agpgart as a module (not built-in). So unless you consider that a bug
&gt; you can close this bug. </span >

Hmmmm.... very odd. I have no idea why that would happen. Mind providing a boot
log with that? In your current 3.17.3 log it says:


[    0.449093] agpgart-amd64 0000:00:00.0: AGP 3.0 bridge
[    0.449104] agpgart-amd64 0000:00:00.0: putting AGP V3 device into 8x mode
[    0.449146] nouveau 0000:01:00.0: putting AGP V3 device into 8x mode
[    0.449222] [TTM] Zone  kernel: Available graphics memory: 1022436 kiB
[    0.449224] [TTM] Initializing pool allocator
[    0.449231] [TTM] Initializing DMA pool allocator
[    0.449250] nouveau  [     DRM] VRAM: 127 MiB
[    0.449252] nouveau  [     DRM] GART: 128 MiB

[Hm, that &quot;available graphics memory&quot; thing seems high... 1GB? Is that how much
system ram you have?]

<span class="quote">&gt; Btw, it also requires and SMP enabled kernel for me
&gt; even though it's a single core. If I disable SMP it hangs as soon as the
&gt; module is loaded.</span >

Known issue. Patch available. Everyone keeps thinking someone else will merge
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

--1419036934.dCdeC2f2.908--

--===============0978756977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0978756977==--
