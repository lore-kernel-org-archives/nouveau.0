From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Fri, 27 Mar 2015 07:40:05 +0000
Message-ID: <bug-89730-8800-wOFpnZJUIg@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1412202277=="
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


--===============1412202277==
Content-Type: multipart/alternative; boundary="1427442005.1C13a1.22133"; charset="UTF-8"


--1427442005.1C13a1.22133
Date: Fri, 27 Mar 2015 07:40:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #11 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

This also works but it looks like another variations on a theme - not
accelerated.

Section "Device"
    Identifier "video0"
    Driver     "nouveau"
    Option "ShadowFB" "on"
EndSection

Option "ShadowFB" "boolean"
    Enable or disable use of the shadow framebuffer layer.  Default: off.
    If this option is enabled, the driver will cause the CPU to do each drawing
operation first into
    a shadow frame buffer in system virtual memory and then copy the result
into video memory.
    If this option is not active, the CPU will draw directly into video memory.
    Enabling this option is beneficial for those systems where reading from
video memory is, on average, 
    slower than the corresponding read/modify/write operation in system virtual
memory.
    This is normally the case for PCI or AGP adapters, and, so, this option is
enabled by default unless acceleration is enabled.


[0.706] X Protocol Version 11, Revision 0
[0.706] Build ID: xorg-x11-server 1.17.1-9.fc21 
[0.706] Current version of pixman: 0.32.6
[0.859] (II) Module ABI versions:
[0.859]     X.Org ANSI C Emulation: 0.4
[0.859]     X.Org Video Driver: 19.0
[0.859]     X.Org Server Extension : 9.0
[0.863] (II) LoadModule: "glx"
[0.863] (II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
[0.864] (II) Module glx: vendor="X.Org Foundation"
[0.865]     compiled for 1.17.1, module version = 1.0.0
[0.865]     ABI class: X.Org Server Extension, version 9.0
[0.865] (==) AIGLX enabled
[0.865] (II) LoadModule: "nouveau"
[1.364] (II) Loading /usr/lib64/xorg/modules/drivers/nouveau_drv.so
[1.372] (II) Module nouveau: vendor="X.Org Foundation"
[1.372]     compiled for 1.17.1, module version = 1.0.11
[1.372]     Module class: X.Org Video Driver
[1.372]     ABI class: X.Org Video Driver, version 19.0
[1.372] (II) NOUVEAU driver 
[1.373] (II) [drm] nouveau interface version: 1.2.1
[1.373] (II) Loading sub module "dri2"
[1.373] (II) LoadModule: "dri2"
[1.373] (II) Module "dri2" already built-in
[1.373] (--) NOUVEAU(0): Chipset: "NVIDIA NV98"
[1.373] (**) NOUVEAU(0): Option "ShadowFB" "on"
[1.373] (**) NOUVEAU(0): Using "Shadow Framebuffer" - acceleration disabled
[1.373] (==) NOUVEAU(0): Page flipping enabled
[1.373] (==) NOUVEAU(0): Swap limit set to 1 [Max allowed 2]
[1.373] (==) NOUVEAU(0): Page flipping synced to vblank by kernel.
[1.373] (II) NOUVEAU(0): Initializing outputs ...
[1.534] (II) Loading sub module "shadowfb"
[1.534] (II) LoadModule: "shadowfb"
[1.534] (II) Loading /usr/lib64/xorg/modules/libshadowfb.so
[1.534] (II) Module shadowfb: vendor="X.Org Foundation"
[1.534]     compiled for 1.17.1, module version = 1.0.0
[1.534]     ABI class: X.Org ANSI C Emulation, version 0.4
[1.534] (--) Depth 24 pixmap format is 32 bpp
[1.534] (**) NOUVEAU(0): [COPY] acceleration disabled
[1.535] (==) NOUVEAU(0): Backing store enabled
[1.535] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled
message.
[1.535] (--) RandR disabled
[1.539] (II) AIGLX: Screen 0 is not DRI2 capable
[1.539] (EE) AIGLX: reverting to software rendering
[3.245] (II) AIGLX: Loaded and initialized swrast
[3.284] (II) GLX: Initialized DRISWRAST GL provider for screen 0
...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427442005.1C13a1.22133
Date: Fri, 27 Mar 2015 07:40:05 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
This also works but it looks like another variations on a theme - not
accelerated.

Section &quot;Device&quot;
    Identifier &quot;video0&quot;
    Driver     &quot;nouveau&quot;
    Option &quot;ShadowFB&quot; &quot;on&quot;
EndSection

Option &quot;ShadowFB&quot; &quot;boolean&quot;
    Enable or disable use of the shadow framebuffer layer.  Default: off.
    If this option is enabled, the driver will cause the CPU to do each drawing
operation first into
    a shadow frame buffer in system virtual memory and then copy the result
into video memory.
    If this option is not active, the CPU will draw directly into video memory.
    Enabling this option is beneficial for those systems where reading from
video memory is, on average, 
    slower than the corresponding read/modify/write operation in system virtual
memory.
    This is normally the case for PCI or AGP adapters, and, so, this option is
enabled by default unless acceleration is enabled.


[0.706] X Protocol Version 11, Revision 0
[0.706] Build ID: xorg-x11-server 1.17.1-9.fc21 
[0.706] Current version of pixman: 0.32.6
[0.859] (II) Module ABI versions:
[0.859]     X.Org ANSI C Emulation: 0.4
[0.859]     X.Org Video Driver: 19.0
[0.859]     X.Org Server Extension : 9.0
[0.863] (II) LoadModule: &quot;glx&quot;
[0.863] (II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
[0.864] (II) Module glx: vendor=&quot;X.Org Foundation&quot;
[0.865]     compiled for 1.17.1, module version = 1.0.0
[0.865]     ABI class: X.Org Server Extension, version 9.0
[0.865] (==) AIGLX enabled
[0.865] (II) LoadModule: &quot;nouveau&quot;
[1.364] (II) Loading /usr/lib64/xorg/modules/drivers/nouveau_drv.so
[1.372] (II) Module nouveau: vendor=&quot;X.Org Foundation&quot;
[1.372]     compiled for 1.17.1, module version = 1.0.11
[1.372]     Module class: X.Org Video Driver
[1.372]     ABI class: X.Org Video Driver, version 19.0
[1.372] (II) NOUVEAU driver 
[1.373] (II) [drm] nouveau interface version: 1.2.1
[1.373] (II) Loading sub module &quot;dri2&quot;
[1.373] (II) LoadModule: &quot;dri2&quot;
[1.373] (II) Module &quot;dri2&quot; already built-in
[1.373] (--) NOUVEAU(0): Chipset: &quot;NVIDIA NV98&quot;
[1.373] (**) NOUVEAU(0): Option &quot;ShadowFB&quot; &quot;on&quot;
[1.373] (**) NOUVEAU(0): Using &quot;Shadow Framebuffer&quot; - acceleration disabled
[1.373] (==) NOUVEAU(0): Page flipping enabled
[1.373] (==) NOUVEAU(0): Swap limit set to 1 [Max allowed 2]
[1.373] (==) NOUVEAU(0): Page flipping synced to vblank by kernel.
[1.373] (II) NOUVEAU(0): Initializing outputs ...
[1.534] (II) Loading sub module &quot;shadowfb&quot;
[1.534] (II) LoadModule: &quot;shadowfb&quot;
[1.534] (II) Loading /usr/lib64/xorg/modules/libshadowfb.so
[1.534] (II) Module shadowfb: vendor=&quot;X.Org Foundation&quot;
[1.534]     compiled for 1.17.1, module version = 1.0.0
[1.534]     ABI class: X.Org ANSI C Emulation, version 0.4
[1.534] (--) Depth 24 pixmap format is 32 bpp
[1.534] (**) NOUVEAU(0): [COPY] acceleration disabled
[1.535] (==) NOUVEAU(0): Backing store enabled
[1.535] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled
message.
[1.535] (--) RandR disabled
[1.539] (II) AIGLX: Screen 0 is not DRI2 capable
[1.539] (EE) AIGLX: reverting to software rendering
[3.245] (II) AIGLX: Loaded and initialized swrast
[3.284] (II) GLX: Initialized DRISWRAST GL provider for screen 0
...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427442005.1C13a1.22133--

--===============1412202277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1412202277==--
