From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Mon, 30 Mar 2015 06:12:25 +0000
Message-ID: <bug-89730-8800-4nr9Fwk9wY@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1968630401=="
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


--===============1968630401==
Content-Type: multipart/alternative; boundary="1427695945.50B58Db1.905"; charset="UTF-8"


--1427695945.50B58Db1.905
Date: Mon, 30 Mar 2015 06:12:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #17 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

Apart from all this,

Option "EXANoUploadToScreen" "Yes"

[2.007] (II) Loading sub module "exa"
[2.007] (II) LoadModule: "exa"
[2.007] (II) Loading /usr/lib64/xorg/modules/libexa.so
[2.007] (II) Module exa: vendor="X.Org Foundation"
[2.007] (**) NOUVEAU(0): Option "EXANoUploadToScreen" "Yes"
[2.007] (**) NOUVEAU(0): EXA: Disabling UploadToScreen
[2.007] (II) EXA(0): Driver allocated offscreen pixmaps
[2.007] (II) EXA(0): Driver registered support for the following operations:
[2.007] (II)         Solid
[2.007] (II)         Copy
[2.007] (II)         Composite (RENDER acceleration)
[2.008] (II)         DownloadFromScreen
...
[7.390] (EE) 
[7.390] (EE) Backtrace:
[7.392] (EE) 0: /usr/libexec/Xorg.bin (OsLookupColor+0x119) [0x59c739]
[7.393] (EE) 1: /lib64/libc.so.6 (__restore_rt+0x0) [0x7f349a50095f]
[7.393] (EE) 2: /lib64/libc.so.6 (cfree+0x5d8) [0x7f349a54fa18]
[7.394] (EE) 3: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x30f0)
[0x7f3494e05790]
[7.394] (EE) 4: /usr/libexec/Xorg.bin (DamageDestroy+0x222) [0x51dd42]
[7.394] (EE) 5: /usr/libexec/Xorg.bin (ShmRegisterFbFuncs+0x739) [0x4db449]
[7.401] (EE) 6: /usr/libexec/Xorg.bin (FreePicture+0x158) [0x50d578]
[7.401] (EE) 7: /usr/lib64/xorg/modules/libexa.so
(exaEnableDisableFBAccess+0x26b6) [0x7f3494e0cd76]
[7.402] (EE) 8: /usr/libexec/Xorg.bin (AddTraps+0x4d8c) [0x51a1fc]
[7.402] (EE) 9: /usr/libexec/Xorg.bin (SendErrorToClient+0x2f7) [0x4391b7]
[7.402] (EE) 10: /usr/libexec/Xorg.bin (remove_fs_handlers+0x416) [0x43d316]
[7.402] (EE) 11: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7f349a4ebfe0]
[7.403] (EE) 12: /usr/libexec/Xorg.bin (_start+0x29) [0x4276ee]
[7.403] (EE) 13: ? (?+0x29) [0x29]
[7.403] (EE) 
[7.403] (EE) Segmentation fault at address 0x117
[7.403] (EE) 
Fatal server error:
[7.403] (EE) Caught signal 11 (Segmentation fault). Server aborting
[7.403] (EE) 
[7.403] (EE) 
Please consult the Fedora Project support 
     at http://wiki.x.org
 for help. 
[7.403] (EE) Please also check the log file at "/var/log/Xorg.0.log" for
additional information.
[7.403] (EE) 
[7.404] (II) AIGLX: Suspending AIGLX clients for VT switch
[7.404] (II) NOUVEAU(0): NVLeaveVT is called.
[7.504] (EE) Server terminated with error (1). Closing log file.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Option "EXANoDownloadFromScreen" "Yes"

[5.578] (II) Loading sub module "exa"
[5.578] (II) LoadModule: "exa"
[5.578] (II) Loading /usr/lib64/xorg/modules/libexa.so
[5.578] (II) Module exa: vendor="X.Org Foundation"
[5.578]     compiled for 1.16.3, module version = 2.6.0
[5.578]     ABI class: X.Org Video Driver, version 18.0
[5.578] (**) NOUVEAU(0): Option "EXANoDownloadFromScreen" "Yes"
[5.578] (**) NOUVEAU(0): EXA: Disabling DownloadFromScreen
[5.578] (II) EXA(0): Driver allocated offscreen pixmaps
[5.578] (II) EXA(0): Driver registered support for the following operations:
[5.578] (II)         Solid
[5.578] (II)         Copy
[5.578] (II)         Composite (RENDER acceleration)
[5.578] (II)         UploadToScreen
...
[6.309] (EE) 
[6.309] (EE) Backtrace:
[6.310] (EE) 0: /usr/libexec/Xorg.bin (OsLookupColor+0x119) [0x59c739]
[6.312] (EE) 1: /lib64/libc.so.6 (__restore_rt+0x0) [0x7f97cfdf295f]
[6.313] (EE) 2: /lib64/libc.so.6 (__memcpy_sse2_unaligned+0x20)
[0x7f97cfe59ce0]
[6.313] (EE) 3: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0xe9e)
[0x7f97ca6f331e]
[6.313] (EE) 4: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x1363)
[0x7f97ca6f39c3]
[6.314] (EE) 5: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x39df)
[0x7f97ca6f880f]
[6.314] (EE) 6: /usr/lib64/xorg/modules/libexa.so
(exaEnableDisableFBAccess+0x2af1) [0x7f97ca6ff731]
[6.314] (EE) 7: /usr/lib64/xorg/modules/libexa.so
(exaEnableDisableFBAccess+0x4286) [0x7f97ca702766]
[6.314] (EE) 8: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x6892)
[0x7f97ca6fe682]
[6.315] (EE) 9: /usr/libexec/Xorg.bin (miFillUniqueSpanGroup+0x19c8) [0x58a4d8]
[6.315] (EE) 10: /usr/libexec/Xorg.bin (xf86I2CGetScreenBuses+0x1d9a)
[0x4cad3a]
[6.315] (EE) 11: /usr/libexec/Xorg.bin (AddTraps+0x2e55) [0x515de5]
[6.315] (EE) 12: /usr/libexec/Xorg.bin (SendErrorToClient+0x2f7) [0x4391b7]
[6.315] (EE) 13: /usr/libexec/Xorg.bin (remove_fs_handlers+0x416) [0x43d316]
[6.316] (EE) 14: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7f97cfdddfe0]
[6.316] (EE) 15: /usr/libexec/Xorg.bin (_start+0x29) [0x4276ee]
[6.317] (EE) 16: ? (?+0x29) [0x29]
[6.317] (EE) 
[6.317] (EE) Segmentation fault at address 0x0
[6.317] (EE) 
Fatal server error:
[6.317] (EE) Caught signal 11 (Segmentation fault). Server aborting
[6.317] (EE) 
[6.317] (EE) 
Please consult the Fedora Project support 
     at http://wiki.x.org
 for help. 
[6.317] (EE) Please also check the log file at "/var/log/Xorg.0.log" for
additional information.
[6.317] (EE) 
[6.317] (EE) Server terminated with error (1). Closing log file.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427695945.50B58Db1.905
Date: Mon, 30 Mar 2015 06:12:25 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
Apart from all this,

Option &quot;EXANoUploadToScreen&quot; &quot;Yes&quot;

[2.007] (II) Loading sub module &quot;exa&quot;
[2.007] (II) LoadModule: &quot;exa&quot;
[2.007] (II) Loading /usr/lib64/xorg/modules/libexa.so
[2.007] (II) Module exa: vendor=&quot;X.Org Foundation&quot;
[2.007] (**) NOUVEAU(0): Option &quot;EXANoUploadToScreen&quot; &quot;Yes&quot;
[2.007] (**) NOUVEAU(0): EXA: Disabling UploadToScreen
[2.007] (II) EXA(0): Driver allocated offscreen pixmaps
[2.007] (II) EXA(0): Driver registered support for the following operations:
[2.007] (II)         Solid
[2.007] (II)         Copy
[2.007] (II)         Composite (RENDER acceleration)
[2.008] (II)         DownloadFromScreen
...
[7.390] (EE) 
[7.390] (EE) Backtrace:
[7.392] (EE) 0: /usr/libexec/Xorg.bin (OsLookupColor+0x119) [0x59c739]
[7.393] (EE) 1: /lib64/libc.so.6 (__restore_rt+0x0) [0x7f349a50095f]
[7.393] (EE) 2: /lib64/libc.so.6 (cfree+0x5d8) [0x7f349a54fa18]
[7.394] (EE) 3: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x30f0)
[0x7f3494e05790]
[7.394] (EE) 4: /usr/libexec/Xorg.bin (DamageDestroy+0x222) [0x51dd42]
[7.394] (EE) 5: /usr/libexec/Xorg.bin (ShmRegisterFbFuncs+0x739) [0x4db449]
[7.401] (EE) 6: /usr/libexec/Xorg.bin (FreePicture+0x158) [0x50d578]
[7.401] (EE) 7: /usr/lib64/xorg/modules/libexa.so
(exaEnableDisableFBAccess+0x26b6) [0x7f3494e0cd76]
[7.402] (EE) 8: /usr/libexec/Xorg.bin (AddTraps+0x4d8c) [0x51a1fc]
[7.402] (EE) 9: /usr/libexec/Xorg.bin (SendErrorToClient+0x2f7) [0x4391b7]
[7.402] (EE) 10: /usr/libexec/Xorg.bin (remove_fs_handlers+0x416) [0x43d316]
[7.402] (EE) 11: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7f349a4ebfe0]
[7.403] (EE) 12: /usr/libexec/Xorg.bin (_start+0x29) [0x4276ee]
[7.403] (EE) 13: ? (?+0x29) [0x29]
[7.403] (EE) 
[7.403] (EE) Segmentation fault at address 0x117
[7.403] (EE) 
Fatal server error:
[7.403] (EE) Caught signal 11 (Segmentation fault). Server aborting
[7.403] (EE) 
[7.403] (EE) 
Please consult the Fedora Project support 
     at <a href="http://wiki.x.org">http://wiki.x.org</a>
 for help. 
[7.403] (EE) Please also check the log file at &quot;/var/log/Xorg.0.log&quot; for
additional information.
[7.403] (EE) 
[7.404] (II) AIGLX: Suspending AIGLX clients for VT switch
[7.404] (II) NOUVEAU(0): NVLeaveVT is called.
[7.504] (EE) Server terminated with error (1). Closing log file.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Option &quot;EXANoDownloadFromScreen&quot; &quot;Yes&quot;

[5.578] (II) Loading sub module &quot;exa&quot;
[5.578] (II) LoadModule: &quot;exa&quot;
[5.578] (II) Loading /usr/lib64/xorg/modules/libexa.so
[5.578] (II) Module exa: vendor=&quot;X.Org Foundation&quot;
[5.578]     compiled for 1.16.3, module version = 2.6.0
[5.578]     ABI class: X.Org Video Driver, version 18.0
[5.578] (**) NOUVEAU(0): Option &quot;EXANoDownloadFromScreen&quot; &quot;Yes&quot;
[5.578] (**) NOUVEAU(0): EXA: Disabling DownloadFromScreen
[5.578] (II) EXA(0): Driver allocated offscreen pixmaps
[5.578] (II) EXA(0): Driver registered support for the following operations:
[5.578] (II)         Solid
[5.578] (II)         Copy
[5.578] (II)         Composite (RENDER acceleration)
[5.578] (II)         UploadToScreen
...
[6.309] (EE) 
[6.309] (EE) Backtrace:
[6.310] (EE) 0: /usr/libexec/Xorg.bin (OsLookupColor+0x119) [0x59c739]
[6.312] (EE) 1: /lib64/libc.so.6 (__restore_rt+0x0) [0x7f97cfdf295f]
[6.313] (EE) 2: /lib64/libc.so.6 (__memcpy_sse2_unaligned+0x20)
[0x7f97cfe59ce0]
[6.313] (EE) 3: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0xe9e)
[0x7f97ca6f331e]
[6.313] (EE) 4: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x1363)
[0x7f97ca6f39c3]
[6.314] (EE) 5: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x39df)
[0x7f97ca6f880f]
[6.314] (EE) 6: /usr/lib64/xorg/modules/libexa.so
(exaEnableDisableFBAccess+0x2af1) [0x7f97ca6ff731]
[6.314] (EE) 7: /usr/lib64/xorg/modules/libexa.so
(exaEnableDisableFBAccess+0x4286) [0x7f97ca702766]
[6.314] (EE) 8: /usr/lib64/xorg/modules/libexa.so (exaMoveOutPixmap+0x6892)
[0x7f97ca6fe682]
[6.315] (EE) 9: /usr/libexec/Xorg.bin (miFillUniqueSpanGroup+0x19c8) [0x58a4d8]
[6.315] (EE) 10: /usr/libexec/Xorg.bin (xf86I2CGetScreenBuses+0x1d9a)
[0x4cad3a]
[6.315] (EE) 11: /usr/libexec/Xorg.bin (AddTraps+0x2e55) [0x515de5]
[6.315] (EE) 12: /usr/libexec/Xorg.bin (SendErrorToClient+0x2f7) [0x4391b7]
[6.315] (EE) 13: /usr/libexec/Xorg.bin (remove_fs_handlers+0x416) [0x43d316]
[6.316] (EE) 14: /lib64/libc.so.6 (__libc_start_main+0xf0) [0x7f97cfdddfe0]
[6.316] (EE) 15: /usr/libexec/Xorg.bin (_start+0x29) [0x4276ee]
[6.317] (EE) 16: ? (?+0x29) [0x29]
[6.317] (EE) 
[6.317] (EE) Segmentation fault at address 0x0
[6.317] (EE) 
Fatal server error:
[6.317] (EE) Caught signal 11 (Segmentation fault). Server aborting
[6.317] (EE) 
[6.317] (EE) 
Please consult the Fedora Project support 
     at <a href="http://wiki.x.org">http://wiki.x.org</a>
 for help. 
[6.317] (EE) Please also check the log file at &quot;/var/log/Xorg.0.log&quot; for
additional information.
[6.317] (EE) 
[6.317] (EE) Server terminated with error (1). Closing log file.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427695945.50B58Db1.905--

--===============1968630401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1968630401==--
