From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Tue, 24 Mar 2015 06:46:21 +0000
Message-ID: <bug-89730-8800-JQuF8V4NZU@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1813678521=="
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


--===============1813678521==
Content-Type: multipart/alternative; boundary="1427179581.ABa4DE211.25546"; charset="UTF-8"


--1427179581.ABa4DE211.25546
Date: Tue, 24 Mar 2015 06:46:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #6 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

Thanks for the "not accelerated?" clarification.

I also tested Greeter Background loading with these two options,

a) Option "AccelMethod" "none" - works.

b) Option "AccelMethod" "glamor" - works conditionally,
with:
Xfwm4 - Xfce4 window manager
- enabled display compositing
- enabled synchronize drawing to the vertical blank

when 'glxinfo' starts, X crashes:

X.Org X Server 1.16.3

(**) NOUVEAU(0): Option "AccelMethod" "glamor"
(II) Loading sub module "glamoregl"
(II) LoadModule: "glamoregl"
(II) Loading /usr/lib64/xorg/modules/libglamoregl.so
(II) Module glamoregl: vendor="X.Org Foundation"
(II) glamor: OpenGL accelerated X.org driver based.
(II) glamor: EGL version 1.4 (DRI2):
(II) NOUVEAU(0): [GLAMOR] EGL initialised
(==) NOUVEAU(0): GLX sync to VBlank enabled.

(EE) NOUVEAU(0): [COPY] failed to allocate class.
(II) NOUVEAU(0): [GLAMOR] initialised

(II) AIGLX: Screen 0 is not DRI2 capable
(EE) AIGLX: reverting to software rendering
(II) AIGLX: Loaded and initialized swrast
(II) GLX: Initialized DRISWRAST GL provider for screen 0

(EE) 
(EE) Backtrace:
(EE) 0: /usr/libexec/Xorg.bin (OsLookupColor+0x119) [0x59c739]
(EE) 1: /lib64/libc.so.6 (__restore_rt+0x0) [0x7f55eb9b795f]
(EE) 2: /usr/libexec/Xorg.bin (present_event_notify+0xb88) [0x51be48]
(EE) 3: /usr/libexec/Xorg.bin (RegisterResourceName+0x232) [0x45c302]
(EE) 4: /usr/libexec/Xorg.bin (FreeClientResources+0x6c) [0x45d1fc]
(EE) 5: /usr/libexec/Xorg.bin (CloseDownClient+0x70) [0x438610]
(EE) 6: /usr/libexec/Xorg.bin (SendErrorToClient+0x32e) [0x4391ee]
(EE) 7: /usr/libexec/Xorg.bin (remove_fs_handlers+0x416) [0x43d316]
(EE) 8: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7f55eb9a2fe0]
(EE) 9: /usr/libexec/Xorg.bin (_start+0x29) [0x4276ee]
(EE) 10: ? (?+0x29) [0x29]
(EE) 
(EE) Segmentation fault at address 0x84969893a9
(EE) 
Fatal server error:
(EE) Caught signal 11 (Segmentation fault). Server aborting
(EE) 
(EE) 
Please consult the Fedora Project support 
     at http://wiki.x.org
 for help. 
(EE) Please also check the log file at "/var/log/Xorg.0.log" for additional
information.
(EE) 
(II) NOUVEAU(0): NVLeaveVT is called.
(EE) Server terminated with error (1). Closing log file.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427179581.ABa4DE211.25546
Date: Tue, 24 Mar 2015 06:46:21 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
Thanks for the &quot;not accelerated?&quot; clarification.

I also tested Greeter Background loading with these two options,

a) Option &quot;AccelMethod&quot; &quot;none&quot; - works.

b) Option &quot;AccelMethod&quot; &quot;glamor&quot; - works conditionally,
with:
Xfwm4 - Xfce4 window manager
- enabled display compositing
- enabled synchronize drawing to the vertical blank

when 'glxinfo' starts, X crashes:

X.Org X Server 1.16.3

(**) NOUVEAU(0): Option &quot;AccelMethod&quot; &quot;glamor&quot;
(II) Loading sub module &quot;glamoregl&quot;
(II) LoadModule: &quot;glamoregl&quot;
(II) Loading /usr/lib64/xorg/modules/libglamoregl.so
(II) Module glamoregl: vendor=&quot;X.Org Foundation&quot;
(II) glamor: OpenGL accelerated X.org driver based.
(II) glamor: EGL version 1.4 (DRI2):
(II) NOUVEAU(0): [GLAMOR] EGL initialised
(==) NOUVEAU(0): GLX sync to VBlank enabled.

(EE) NOUVEAU(0): [COPY] failed to allocate class.
(II) NOUVEAU(0): [GLAMOR] initialised

(II) AIGLX: Screen 0 is not DRI2 capable
(EE) AIGLX: reverting to software rendering
(II) AIGLX: Loaded and initialized swrast
(II) GLX: Initialized DRISWRAST GL provider for screen 0

(EE) 
(EE) Backtrace:
(EE) 0: /usr/libexec/Xorg.bin (OsLookupColor+0x119) [0x59c739]
(EE) 1: /lib64/libc.so.6 (__restore_rt+0x0) [0x7f55eb9b795f]
(EE) 2: /usr/libexec/Xorg.bin (present_event_notify+0xb88) [0x51be48]
(EE) 3: /usr/libexec/Xorg.bin (RegisterResourceName+0x232) [0x45c302]
(EE) 4: /usr/libexec/Xorg.bin (FreeClientResources+0x6c) [0x45d1fc]
(EE) 5: /usr/libexec/Xorg.bin (CloseDownClient+0x70) [0x438610]
(EE) 6: /usr/libexec/Xorg.bin (SendErrorToClient+0x32e) [0x4391ee]
(EE) 7: /usr/libexec/Xorg.bin (remove_fs_handlers+0x416) [0x43d316]
(EE) 8: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7f55eb9a2fe0]
(EE) 9: /usr/libexec/Xorg.bin (_start+0x29) [0x4276ee]
(EE) 10: ? (?+0x29) [0x29]
(EE) 
(EE) Segmentation fault at address 0x84969893a9
(EE) 
Fatal server error:
(EE) Caught signal 11 (Segmentation fault). Server aborting
(EE) 
(EE) 
Please consult the Fedora Project support 
     at <a href="http://wiki.x.org">http://wiki.x.org</a>
 for help. 
(EE) Please also check the log file at &quot;/var/log/Xorg.0.log&quot; for additional
information.
(EE) 
(II) NOUVEAU(0): NVLeaveVT is called.
(EE) Server terminated with error (1). Closing log file.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427179581.ABa4DE211.25546--

--===============1813678521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1813678521==--
