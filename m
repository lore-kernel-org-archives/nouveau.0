From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Mon, 24 Nov 2014 21:08:20 +0000
Message-ID: <bug-27501-8800-QPRrOXzSGX@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0308451687=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0308451687==
Content-Type: multipart/alternative; boundary="1416863300.82355.13009"; charset="UTF-8"


--1416863300.82355.13009
Date: Mon, 24 Nov 2014 21:08:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #56 from l3iggs <j@greyltc.com> ---
Created attachment 109963
  --> https://bugs.freedesktop.org/attachment.cgi?id=109963&action=edit
9400M dmesg

What follows is my partially working workaround for my 9400M in my MacBook Pro
5,1. For my fully working workaround for my 9600M GT see
https://bugs.freedesktop.org/show_bug.cgi?id=86537

The following was tested with a kernel 3.18-rc6 (without applying any of the
patches here):

(1) Append 'modprobe.blacklist=nouveau' to the kernel boot parameters
This allows the system to boot.
(2) Once booted, as root, reset the 9400M GPU: 'echo 1 >
/sys/bus/pci/devices/0000:03:00.0/reset'
(3) 'echo 1 > /sys/bus/pci/devices/0000:03:00.0/rescan'
(4) 'echo 1 > /sys/bus/pci/devices/0000:02:00.0/remove'
This completely removes the 9600M GT GPU from the system so nouveau does not
use in when we load the module in the next step.
(5) 'modprobe nouveau'

where
0000:03:00.0 is the PCI address of my 9400M
and
0000:02:00.0 is the PCI address of my 9600M GT.

Nouveau seemingly loads fine for the 9400M, however I find myself unable to
actually use my 9400M GPU for anything (while repeating the same above steps
for my 9600M GT works fine). For example, starting gdm with the 9400M does
nothing. I believe this is because the 9400M GPU is not "connected" to any
display (since it was not selected in OSX). I've attached dmesg logs for
loading nouveau for each of the GPUs in my laptop here. Notice that for the
working 9600M GT, the log shows:
nouveau  [     DRM] allocated 1440x900 fb: 0x70000, bo ffff88014750d400
1449x900 is the native resolution of my laptop's display.

while for the non-working 9400M, the log shows:
nouveau 0000:03:00.0: No connectors reported connected with modes
[drm] Cannot find any crtc or sizes - going 1024x768
nouveau  [     DRM] allocated 1024x768 fb: 0x50000, bo ffff88014715a400

I think I'm pretty close to having a universal working solution for both GPUs
here. Does anyone know how I can "connect" my 9400M GPU with my display?

I've tried fiddling a bit with xrandr after loading nouveau for the 9400M, but
it seems to always report no displays found.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416863300.82355.13009
Date: Mon, 24 Nov 2014 21:08:20 +0000
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
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c56">Comment # 56</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:j&#64;greyltc.com" title="l3iggs &lt;j&#64;greyltc.com&gt;"> <span class="fn">l3iggs</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=109963" name="attach_109963" title="9400M dmesg">attachment 109963</a> <a href="attachment.cgi?id=109963&amp;action=edit" title="9400M dmesg">[details]</a></span>
9400M dmesg

What follows is my partially working workaround for my 9400M in my MacBook Pro
5,1. For my fully working workaround for my 9600M GT see
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Unable to handle page request from nv50_crtc_prepare"
   href="show_bug.cgi?id=86537">https://bugs.freedesktop.org/show_bug.cgi?id=86537</a>

The following was tested with a kernel 3.18-rc6 (without applying any of the
patches here):

(1) Append 'modprobe.blacklist=nouveau' to the kernel boot parameters
This allows the system to boot.
(2) Once booted, as root, reset the 9400M GPU: 'echo 1 &gt;
/sys/bus/pci/devices/0000:03:00.0/reset'
(3) 'echo 1 &gt; /sys/bus/pci/devices/0000:03:00.0/rescan'
(4) 'echo 1 &gt; /sys/bus/pci/devices/0000:02:00.0/remove'
This completely removes the 9600M GT GPU from the system so nouveau does not
use in when we load the module in the next step.
(5) 'modprobe nouveau'

where
0000:03:00.0 is the PCI address of my 9400M
and
0000:02:00.0 is the PCI address of my 9600M GT.

Nouveau seemingly loads fine for the 9400M, however I find myself unable to
actually use my 9400M GPU for anything (while repeating the same above steps
for my 9600M GT works fine). For example, starting gdm with the 9400M does
nothing. I believe this is because the 9400M GPU is not &quot;connected&quot; to any
display (since it was not selected in OSX). I've attached dmesg logs for
loading nouveau for each of the GPUs in my laptop here. Notice that for the
working 9600M GT, the log shows:
nouveau  [     DRM] allocated 1440x900 fb: 0x70000, bo ffff88014750d400
1449x900 is the native resolution of my laptop's display.

while for the non-working 9400M, the log shows:
nouveau 0000:03:00.0: No connectors reported connected with modes
[drm] Cannot find any crtc or sizes - going 1024x768
nouveau  [     DRM] allocated 1024x768 fb: 0x50000, bo ffff88014715a400

I think I'm pretty close to having a universal working solution for both GPUs
here. Does anyone know how I can &quot;connect&quot; my 9400M GPU with my display?

I've tried fiddling a bit with xrandr after loading nouveau for the 9400M, but
it seems to always report no displays found.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416863300.82355.13009--

--===============0308451687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0308451687==--
