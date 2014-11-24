From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86537] [NV96] Unable to handle page request from
 nv50_crtc_prepare
Date: Mon, 24 Nov 2014 13:22:40 +0000
Message-ID: <bug-86537-8800-pkRewlPGB1@http.bugs.freedesktop.org/>
References: <bug-86537-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0897268410=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86537-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0897268410==
Content-Type: multipart/alternative; boundary="1416835360.Ab0b31.4271"; charset="UTF-8"


--1416835360.Ab0b31.4271
Date: Mon, 24 Nov 2014 13:22:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86537

--- Comment #4 from l3iggs <j@greyltc.com> ---
I've found a workaround for this bug (tested with 3.18-rc5):

(1) Append 'modprobe.blacklist=nouveau' to the kernel boot parameters
This allows the system to boot.
(2) Once booted, as root, reset the 9600M GPU: 'echo 1 >
/sys/bus/pci/devices/0000:02:00.0/reset'
(3) 'echo 1 > /sys/bus/pci/devices/0000:02:00.0/rescan'
(4) 'modprobe nouveau'

Note that 0000:02:00.0 is the PCI bus address of my 9600M GT GPU, which I
learned by inspecting the output of lspci.

The trick here is getting the GPU into the proper state before the nouveau
module is loaded. I've found that the internal state of the GPU can frequently
be inconsistent across reboots making troubleshooting difficult. Resetting and
then rescanning it before loading nouveau seems to solve things for every
scenario I've tested.

With the above workaround I can start a display manager (GDM for gnome 3.14.2)
and everything seems to work as expected, ex. glxgears.

The 9400M GPU can optionally be disabled between steps (3) and (4): 'echo 1 >
/sys/bus/pci/devices/0000:03:00.0/remove'

where 0000:03:00.0 is the PCI address of my 9400M.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416835360.Ab0b31.4271
Date: Mon, 24 Nov 2014 13:22:40 +0000
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
   title="NEW - [NV96] Unable to handle page request from nv50_crtc_prepare"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86537#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Unable to handle page request from nv50_crtc_prepare"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86537">bug 86537</a>
              from <span class="vcard"><a class="email" href="mailto:j&#64;greyltc.com" title="l3iggs &lt;j&#64;greyltc.com&gt;"> <span class="fn">l3iggs</span></a>
</span></b>
        <pre>I've found a workaround for this bug (tested with 3.18-rc5):

(1) Append 'modprobe.blacklist=nouveau' to the kernel boot parameters
This allows the system to boot.
(2) Once booted, as root, reset the 9600M GPU: 'echo 1 &gt;
/sys/bus/pci/devices/0000:02:00.0/reset'
(3) 'echo 1 &gt; /sys/bus/pci/devices/0000:02:00.0/rescan'
(4) 'modprobe nouveau'

Note that 0000:02:00.0 is the PCI bus address of my 9600M GT GPU, which I
learned by inspecting the output of lspci.

The trick here is getting the GPU into the proper state before the nouveau
module is loaded. I've found that the internal state of the GPU can frequently
be inconsistent across reboots making troubleshooting difficult. Resetting and
then rescanning it before loading nouveau seems to solve things for every
scenario I've tested.

With the above workaround I can start a display manager (GDM for gnome 3.14.2)
and everything seems to work as expected, ex. glxgears.

The 9400M GPU can optionally be disabled between steps (3) and (4): 'echo 1 &gt;
/sys/bus/pci/devices/0000:03:00.0/remove'

where 0000:03:00.0 is the PCI address of my 9400M.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416835360.Ab0b31.4271--

--===============0897268410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0897268410==--
