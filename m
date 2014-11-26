From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86537] [NV96] Unable to handle page request from
 nv50_crtc_prepare
Date: Wed, 26 Nov 2014 17:34:26 +0000
Message-ID: <bug-86537-8800-vfa99OhElG@http.bugs.freedesktop.org/>
References: <bug-86537-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1233091217=="
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


--===============1233091217==
Content-Type: multipart/alternative; boundary="1417023266.BfD41C2e1.31538"; charset="UTF-8"


--1417023266.BfD41C2e1.31538
Date: Wed, 26 Nov 2014 17:34:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86537

--- Comment #5 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to l3iggs from comment #4)
> I've found a workaround for this bug (tested with 3.18-rc5):
> 
> (1) Append 'modprobe.blacklist=nouveau' to the kernel boot parameters
> This allows the system to boot.
> (2) Once booted, as root, reset the 9600M GPU: 'echo 1 >
> /sys/bus/pci/devices/0000:02:00.0/reset'
> (3) 'echo 1 > /sys/bus/pci/devices/0000:02:00.0/rescan'
> (4) 'modprobe nouveau'

It does work indeed, and seems to solve some other issues related to that card
(powering it down using vgaswitcheroo, suspending the laptop - resuming doesn't
work though).

> 
> Note that 0000:02:00.0 is the PCI bus address of my 9600M GT GPU, which I
> learned by inspecting the output of lspci.
> 
> The trick here is getting the GPU into the proper state before the nouveau
> module is loaded. I've found that the internal state of the GPU can
> frequently be inconsistent across reboots making troubleshooting difficult.
> Resetting and then rescanning it before loading nouveau seems to solve
> things for every scenario I've tested.
> 
> With the above workaround I can start a display manager (GDM for gnome
> 3.14.2) and everything seems to work as expected, ex. glxgears.
> 
> The 9400M GPU can optionally be disabled between steps (3) and (4): 'echo 1
> > /sys/bus/pci/devices/0000:03:00.0/remove'
> 
> where 0000:03:00.0 is the PCI address of my 9400M.

vgaswitcheroo should be able to connect the integrated to the display (look at
http://nouveau.freedesktop.org/wiki/Optimus/) using apple-gmux driver.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1417023266.BfD41C2e1.31538
Date: Wed, 26 Nov 2014 17:34:26 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86537#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Unable to handle page request from nv50_crtc_prepare"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86537">bug 86537</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to l3iggs from <a href="show_bug.cgi?id=86537#c4">comment #4</a>)
<span class="quote">&gt; I've found a workaround for this bug (tested with 3.18-rc5):
&gt; 
&gt; (1) Append 'modprobe.blacklist=nouveau' to the kernel boot parameters
&gt; This allows the system to boot.
&gt; (2) Once booted, as root, reset the 9600M GPU: 'echo 1 &gt;
&gt; /sys/bus/pci/devices/0000:02:00.0/reset'
&gt; (3) 'echo 1 &gt; /sys/bus/pci/devices/0000:02:00.0/rescan'
&gt; (4) 'modprobe nouveau'</span >

It does work indeed, and seems to solve some other issues related to that card
(powering it down using vgaswitcheroo, suspending the laptop - resuming doesn't
work though).

<span class="quote">&gt; 
&gt; Note that 0000:02:00.0 is the PCI bus address of my 9600M GT GPU, which I
&gt; learned by inspecting the output of lspci.
&gt; 
&gt; The trick here is getting the GPU into the proper state before the nouveau
&gt; module is loaded. I've found that the internal state of the GPU can
&gt; frequently be inconsistent across reboots making troubleshooting difficult.
&gt; Resetting and then rescanning it before loading nouveau seems to solve
&gt; things for every scenario I've tested.
&gt; 
&gt; With the above workaround I can start a display manager (GDM for gnome
&gt; 3.14.2) and everything seems to work as expected, ex. glxgears.
&gt; 
&gt; The 9400M GPU can optionally be disabled between steps (3) and (4): 'echo 1
&gt; &gt; /sys/bus/pci/devices/0000:03:00.0/remove'
&gt; 
&gt; where 0000:03:00.0 is the PCI address of my 9400M.</span >

vgaswitcheroo should be able to connect the integrated to the display (look at
<a href="http://nouveau.freedesktop.org/wiki/Optimus/">http://nouveau.freedesktop.org/wiki/Optimus/</a>) using apple-gmux driver.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1417023266.BfD41C2e1.31538--

--===============1233091217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1233091217==--
