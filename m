From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87771] [NV63] X freezes after login
Date: Sun, 28 Dec 2014 05:33:52 +0000
Message-ID: <bug-87771-8800-dfY0MIWvP6@http.bugs.freedesktop.org/>
References: <bug-87771-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0016860816=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87771-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0016860816==
Content-Type: multipart/alternative; boundary="1419744832.00e35e1.6662"; charset="UTF-8"


--1419744832.00e35e1.6662
Date: Sun, 28 Dec 2014 05:33:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87771

--- Comment #7 from Vivek <vivek.asci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 111418
  --> https://bugs.freedesktop.org/attachment.cgi?id=111418&action=edit
Netconsole log

I booted with the parameter nouveau.config=NvMSI=0 
Now I am not even getting to the login screen. The screen freezes showing:


[    3.104591] nouveau  [     CLK][0000:00:10.0] --: core 24 MHz  
[    3.110538] [TTM] Zone  kernel: Available graphics memory: 1409596 kiB
[    3.110623] [TTM] Initializing pool allocator
[    3.110693] [TTM] Initializing DMA pool allocator
[    3.110776] nouveau  [     DRM] VRAM: 253 MiB
[    3.110840] nouveau  [     DRM] GART: 512 MiB
[    3.110908] nouveau  [     DRM] TMDS table version 1.1
[    3.110971] nouveau W[     DRM] TMDS table script pointers not stubbed
[    3.111040] nouveau  [     DRM] DCB version 3.0
[    3.111103] nouveau  [     DRM] DCB outp 00: 01000110 00000023
[    3.112925] nouveau  [     DRM] DCB conn 00: 0000
[    3.113040] nouveau  [     DRM] DCB conn 01: 1161
[    3.113156] nouveau W[     DRM] Pointer to flat panel table invalid
[    3.113537] nouveau  [     DRM] Saving VGA fonts
[    3.150665] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.150748] [drm] Driver supports precise vblank timestamp query.
[    3.152664] nouveau  [     DRM] MM: using M2MF for buffer copies
[    3.161916] systemd-logind[773]: Watching system buttons on
/dev/input/event1 (Power Button)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419744832.00e35e1.6662
Date: Sun, 28 Dec 2014 05:33:52 +0000
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
   title="NEW - [NV63] X freezes after login"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87771#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV63] X freezes after login"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87771">bug 87771</a>
              from <span class="vcard"><a class="email" href="mailto:vivek.asci&#64;gmail.com" title="Vivek &lt;vivek.asci&#64;gmail.com&gt;"> <span class="fn">Vivek</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=111418" name="attach_111418" title="Netconsole log">attachment 111418</a> <a href="attachment.cgi?id=111418&amp;action=edit" title="Netconsole log">[details]</a></span>
Netconsole log

I booted with the parameter nouveau.config=NvMSI=0 
Now I am not even getting to the login screen. The screen freezes showing:


[    3.104591] nouveau  [     CLK][0000:00:10.0] --: core 24 MHz  
[    3.110538] [TTM] Zone  kernel: Available graphics memory: 1409596 kiB
[    3.110623] [TTM] Initializing pool allocator
[    3.110693] [TTM] Initializing DMA pool allocator
[    3.110776] nouveau  [     DRM] VRAM: 253 MiB
[    3.110840] nouveau  [     DRM] GART: 512 MiB
[    3.110908] nouveau  [     DRM] TMDS table version 1.1
[    3.110971] nouveau W[     DRM] TMDS table script pointers not stubbed
[    3.111040] nouveau  [     DRM] DCB version 3.0
[    3.111103] nouveau  [     DRM] DCB outp 00: 01000110 00000023
[    3.112925] nouveau  [     DRM] DCB conn 00: 0000
[    3.113040] nouveau  [     DRM] DCB conn 01: 1161
[    3.113156] nouveau W[     DRM] Pointer to flat panel table invalid
[    3.113537] nouveau  [     DRM] Saving VGA fonts
[    3.150665] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.150748] [drm] Driver supports precise vblank timestamp query.
[    3.152664] nouveau  [     DRM] MM: using M2MF for buffer copies
[    3.161916] systemd-logind[773]: Watching system buttons on
/dev/input/event1 (Power Button)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419744832.00e35e1.6662--

--===============0016860816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0016860816==--
