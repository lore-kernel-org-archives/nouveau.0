From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Sun, 29 Mar 2015 23:15:02 +0000
Message-ID: <bug-89730-8800-HkWZUVs9Et@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0254877821=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89730-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0254877821==
Content-Type: multipart/alternative; boundary="1427670901.6Af41.11174"; charset="UTF-8"


--1427670901.6Af41.11174
Date: Sun, 29 Mar 2015 23:15:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #15 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

I also tested all these extensions:

$ Xorg -extension ?
...
[mi] Only the following extensions can be run-time disabled:
[mi]    Generic Events
[mi]    Composite
[mi]    DAMAGE
[mi]    DOUBLE-BUFFER
[mi]    DPMS
[mi]    GLX
[mi]    MIT-SCREEN-SAVER
[mi]    MIT-SHM
[mi]    RANDR
[mi]    RENDER
[mi]    X-Resource
[mi]    XFree86-DGA
[mi]    XFree86-DRI
[mi]    XFree86-VidModeExtension
[mi]    XFIXES
[mi]    XINERAMA
[mi]    SELinux
[mi]    XTEST
[mi]    XVideo
...

RENDER disabled has a positive effect on Greeter Background image loading,
BUT it also turns off Xfwm4 compositing within Desktop session.

Section "Extensions"
    Option "RENDER" "Disable"
EndSection

[9.516] (**) Extension "RENDER" is disabled

~~~~~~~~~~~~~~~~~~~

Apart from all this, with XVideo disabled, X crashes.

Section "Extensions"
    Option "XVideo" "Disable"
EndSection

[9.251] (EE) 
[9.251] (EE) Backtrace:
[9.251] (EE) 0: /usr/libexec/Xorg (OsSigHandler+0x29) [0x598659]
[9.251] (EE) 1: /lib64/libpthread.so.0 (__restore_rt+0x0) [0x7f7961a060cf]
[9.252] (EE) 2: /usr/libexec/Xorg (xf86XvMCScreenInit+0x24) [0x494494]
[9.252] (EE) 3: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(vlInitXvMC+0x69) [0x7f795d532929]
[9.252] (EE) 4: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(NVInitVideo+0x138) [0x7f795d514808]
[9.252] (EE) 5: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(NVScreenInit+0x3c6) [0x7f795d51a086]
[9.252] (EE) 6: /usr/libexec/Xorg (AddScreen+0x101) [0x43a4e1]
[9.253] (EE) 7: /usr/libexec/Xorg (InitOutput+0x3e1) [0x47c501]
[9.253] (EE) 8: /usr/libexec/Xorg (dix_main+0x1ea) [0x43e0ca]
[9.253] (EE) 9: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7f7961658fe0]
[9.254] (EE) 10: /usr/libexec/Xorg (_start+0x29) [0x42876e]
[9.254] (EE) 11: ? (?+0x29) [0x29]
[9.254] (EE) 
[9.254] (EE) Segmentation fault at address 0x4
[9.254] (EE) 
Fatal server error:
[9.254] (EE) Caught signal 11 (Segmentation fault). Server aborting
[9.254] (EE) 
[9.254] (EE) 
Please consult the Fedora Project support 
     at http://wiki.x.org
 for help. 
[9.254] (EE) Please also check the log file at "/var/log/Xorg.0.log" for
additional information.
[9.254] (EE) 
[9.259] (EE) Server terminated with error (1). Closing log file.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427670901.6Af41.11174
Date: Sun, 29 Mar 2015 23:15:01 +0000
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
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
I also tested all these extensions:

$ Xorg -extension ?
...
[mi] Only the following extensions can be run-time disabled:
[mi]    Generic Events
[mi]    Composite
[mi]    DAMAGE
[mi]    DOUBLE-BUFFER
[mi]    DPMS
[mi]    GLX
[mi]    MIT-SCREEN-SAVER
[mi]    MIT-SHM
[mi]    RANDR
[mi]    RENDER
[mi]    X-Resource
[mi]    XFree86-DGA
[mi]    XFree86-DRI
[mi]    XFree86-VidModeExtension
[mi]    XFIXES
[mi]    XINERAMA
[mi]    SELinux
[mi]    XTEST
[mi]    XVideo
...

RENDER disabled has a positive effect on Greeter Background image loading,
BUT it also turns off Xfwm4 compositing within Desktop session.

Section &quot;Extensions&quot;
    Option &quot;RENDER&quot; &quot;Disable&quot;
EndSection

[9.516] (**) Extension &quot;RENDER&quot; is disabled

~~~~~~~~~~~~~~~~~~~

Apart from all this, with XVideo disabled, X crashes.

Section &quot;Extensions&quot;
    Option &quot;XVideo&quot; &quot;Disable&quot;
EndSection

[9.251] (EE) 
[9.251] (EE) Backtrace:
[9.251] (EE) 0: /usr/libexec/Xorg (OsSigHandler+0x29) [0x598659]
[9.251] (EE) 1: /lib64/libpthread.so.0 (__restore_rt+0x0) [0x7f7961a060cf]
[9.252] (EE) 2: /usr/libexec/Xorg (xf86XvMCScreenInit+0x24) [0x494494]
[9.252] (EE) 3: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(vlInitXvMC+0x69) [0x7f795d532929]
[9.252] (EE) 4: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(NVInitVideo+0x138) [0x7f795d514808]
[9.252] (EE) 5: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(NVScreenInit+0x3c6) [0x7f795d51a086]
[9.252] (EE) 6: /usr/libexec/Xorg (AddScreen+0x101) [0x43a4e1]
[9.253] (EE) 7: /usr/libexec/Xorg (InitOutput+0x3e1) [0x47c501]
[9.253] (EE) 8: /usr/libexec/Xorg (dix_main+0x1ea) [0x43e0ca]
[9.253] (EE) 9: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7f7961658fe0]
[9.254] (EE) 10: /usr/libexec/Xorg (_start+0x29) [0x42876e]
[9.254] (EE) 11: ? (?+0x29) [0x29]
[9.254] (EE) 
[9.254] (EE) Segmentation fault at address 0x4
[9.254] (EE) 
Fatal server error:
[9.254] (EE) Caught signal 11 (Segmentation fault). Server aborting
[9.254] (EE) 
[9.254] (EE) 
Please consult the Fedora Project support 
     at <a href="http://wiki.x.org">http://wiki.x.org</a>
 for help. 
[9.254] (EE) Please also check the log file at &quot;/var/log/Xorg.0.log&quot; for
additional information.
[9.254] (EE) 
[9.259] (EE) Server terminated with error (1). Closing log file.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427670901.6Af41.11174--

--===============0254877821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0254877821==--
