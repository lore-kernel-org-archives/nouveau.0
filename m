From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91598] Broken Rendering of Plasma 5 Desktop
Date: Tue, 11 Aug 2015 23:40:39 +0000
Message-ID: <bug-91598-8800-M447O3FIhD@http.bugs.freedesktop.org/>
References: <bug-91598-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1807545936=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91598-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1807545936==
Content-Type: multipart/alternative; boundary="1439336439.2bBcbbA1.9331"; charset="UTF-8"


--1439336439.2bBcbbA1.9331
Date: Tue, 11 Aug 2015 23:40:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91598

--- Comment #3 from David March <davidmarch007-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Just wanted to add that I likewise am seeing the same issue.  As Andreas said
the problems increase as time goes on.  I do notice the corruption of menus and
such seems to be cumulative.  Eventually after many days in my experience
sometimes the problem can cause a full crash.  It makes no difference for me
whether or not compositing is on or off.

Here is a portion of the dmesg output:

[48838.708929] nouveau E[plasmashell[1827]] fail set_domain
[48838.708936] nouveau E[plasmashell[1827]] validating bo list
[48838.708959] nouveau E[plasmashell[1827]] validate: -22
[48838.757948] nouveau E[plasmashell[1827]] fail set_domain
[48838.757956] nouveau E[plasmashell[1827]] validating bo list
[48838.757964] nouveau E[plasmashell[1827]] validate: -22
[48839.000699] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020529000
on channel 0x0000f64f [plasmashell[1827]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[48839.054871] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020529000
on channel 0x0000f64f [plasmashell[1827]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[48839.690129] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020529000
on channel 0x0000fb33 [X[1641]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT

----------------

Hardware info:

01:00.0 VGA compatible controller: NVIDIA Corporation G84GL [Quadro FX 570]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: NVIDIA Corporation G84GL [Quadro FX 570]
        Flags: bus master, fast devsel, latency 0, IRQ 28
        Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
        I/O ports at dc80 [size=128]
        Expansion ROM at fde00000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
<?>
        Kernel driver in use: nouveau

---------

Software info:

x11-drivers/xf86-video-nouveau-1.0.11
media-libs/mesa-10.6.3
x11-apps/mesa-progs-8.2.0
kde-plasma/plasma-desktop-9999 (pulled from master 12:29:55 PM 08/09/2015) 

Linux gentoo 4.1.4-gentoo #1 SMP Tue Aug 4 15:36:28 EDT 2015 x86_64 Intel(R)
Core(TM)2 Quad CPU Q6600 @ 2.40GHz GenuineIntel GNU/Linux

---------

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1439336439.2bBcbbA1.9331
Date: Tue, 11 Aug 2015 23:40:39 +0000
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
   title="NEW - Broken Rendering of Plasma 5 Desktop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91598#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Broken Rendering of Plasma 5 Desktop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91598">bug 91598</a>
              from <span class="vcard"><a class="email" href="mailto:davidmarch007&#64;gmail.com" title="David March &lt;davidmarch007&#64;gmail.com&gt;"> <span class="fn">David March</span></a>
</span></b>
        <pre>Just wanted to add that I likewise am seeing the same issue.  As Andreas said
the problems increase as time goes on.  I do notice the corruption of menus and
such seems to be cumulative.  Eventually after many days in my experience
sometimes the problem can cause a full crash.  It makes no difference for me
whether or not compositing is on or off.

Here is a portion of the dmesg output:

[48838.708929] nouveau E[plasmashell[1827]] fail set_domain
[48838.708936] nouveau E[plasmashell[1827]] validating bo list
[48838.708959] nouveau E[plasmashell[1827]] validate: -22
[48838.757948] nouveau E[plasmashell[1827]] fail set_domain
[48838.757956] nouveau E[plasmashell[1827]] validating bo list
[48838.757964] nouveau E[plasmashell[1827]] validate: -22
[48839.000699] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020529000
on channel 0x0000f64f [plasmashell[1827]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[48839.054871] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020529000
on channel 0x0000f64f [plasmashell[1827]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[48839.690129] nouveau E[     PFB][0000:01:00.0] trapped read at 0x0020529000
on channel 0x0000fb33 [X[1641]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT

----------------

Hardware info:

01:00.0 VGA compatible controller: NVIDIA Corporation G84GL [Quadro FX 570]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: NVIDIA Corporation G84GL [Quadro FX 570]
        Flags: bus master, fast devsel, latency 0, IRQ 28
        Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
        I/O ports at dc80 [size=128]
        Expansion ROM at fde00000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
&lt;?&gt;
        Kernel driver in use: nouveau

---------

Software info:

x11-drivers/xf86-video-nouveau-1.0.11
media-libs/mesa-10.6.3
x11-apps/mesa-progs-8.2.0
kde-plasma/plasma-desktop-9999 (pulled from master 12:29:55 PM 08/09/2015) 

Linux gentoo 4.1.4-gentoo #1 SMP Tue Aug 4 15:36:28 EDT 2015 x86_64 Intel(R)
Core(TM)2 Quad CPU Q6600 &#64; 2.40GHz GenuineIntel GNU/Linux

---------</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1439336439.2bBcbbA1.9331--

--===============1807545936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1807545936==--
