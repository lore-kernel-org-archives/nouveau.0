From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93557] Kernel Panic on Linux Kernel 4.4 when loading
 KDE/KDM on Nvidia GeForce 7025 / nForce 630a
Date: Mon, 04 Jan 2016 17:18:35 +0000
Message-ID: <bug-93557-8800-I076AWqHMJ@http.bugs.freedesktop.org/>
References: <bug-93557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1446280622=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93557-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1446280622==
Content-Type: multipart/alternative; boundary="1451927915.CE14E2.8214"; charset="UTF-8"


--1451927915.CE14E2.8214
Date: Mon, 4 Jan 2016 17:18:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93557

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to xgfwtvdh from comment #3)
> The bug is half solved!
> I compiled a new kernel image. I did not get the kernel panic any more but
> still get the full dmesg full of errors like:
> 
> [ 1059.265197] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
> 00b020
> [ 1059.265516] nouveau 0000:00:0d.0: bus: MMIO write of 010d0001 FAULT at
> 00b010
> [ 1060.724984] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
> 00b010
> [ 1060.847845] nouveau 0000:00:0d.0: bus: MMIO write of 010a0001 FAULT at
> 00b010
> [ 1060.848340] nouveau 0000:00:0d.0: bus: MMIO write of 010c0001 FAULT at
> 00b020
> [ 1061.073132] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
> 00b010
> [ 1061.073350] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
> 00b020
> [ 1061.265858] nouveau 0000:00:0d.0: bus: MMIO write of 01890001 FAULT at
> 00b010
> [ 1061.266331] nouveau 0000:00:0d.0: bus: MMIO write of 018c0001 FAULT at
> 00b020
> [ 1061.266954] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
> 00b010
> [ 1068.679841] nouveau 0000:00:0d.0: bus: MMIO write of 01890001 FAULT at
> 00b010
> [ 1068.691605] nouveau 0000:00:0d.0: bus: MMIO write of 018b0001 FAULT at
> 00b030
> [ 1069.007856] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
> 00b010
> [ 1069.008076] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
> 00b030
> [ 1069.009128] nouveau 0000:00:0d.0: bus: MMIO write of 04200001 FAULT at
> 00b010
> [ 1071.267098] nouveau 0000:00:0d.0: bus: MMIO write of 01890001 FAULT at
> 00b030
> [ 1071.267686] nouveau 0000:00:0d.0: bus: MMIO write of 018b0001 FAULT at
> 00b040
> [ 1075.811130] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
> 00b030
> [ 1075.811472] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
> 00b040

These are unrelated and should be nothing to worry about.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1451927915.CE14E2.8214
Date: Mon, 4 Jan 2016 17:18:35 +0000
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
   title="NEW - Kernel Panic on Linux Kernel 4.4 when loading KDE/KDM on Nvidia GeForce 7025 / nForce 630a"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93557#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Kernel Panic on Linux Kernel 4.4 when loading KDE/KDM on Nvidia GeForce 7025 / nForce 630a"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93557">bug 93557</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to xgfwtvdh from <a href="show_bug.cgi?id=93557#c3">comment #3</a>)
<span class="quote">&gt; The bug is half solved!
&gt; I compiled a new kernel image. I did not get the kernel panic any more but
&gt; still get the full dmesg full of errors like:
&gt; 
&gt; [ 1059.265197] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
&gt; 00b020
&gt; [ 1059.265516] nouveau 0000:00:0d.0: bus: MMIO write of 010d0001 FAULT at
&gt; 00b010
&gt; [ 1060.724984] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
&gt; 00b010
&gt; [ 1060.847845] nouveau 0000:00:0d.0: bus: MMIO write of 010a0001 FAULT at
&gt; 00b010
&gt; [ 1060.848340] nouveau 0000:00:0d.0: bus: MMIO write of 010c0001 FAULT at
&gt; 00b020
&gt; [ 1061.073132] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
&gt; 00b010
&gt; [ 1061.073350] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
&gt; 00b020
&gt; [ 1061.265858] nouveau 0000:00:0d.0: bus: MMIO write of 01890001 FAULT at
&gt; 00b010
&gt; [ 1061.266331] nouveau 0000:00:0d.0: bus: MMIO write of 018c0001 FAULT at
&gt; 00b020
&gt; [ 1061.266954] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
&gt; 00b010
&gt; [ 1068.679841] nouveau 0000:00:0d.0: bus: MMIO write of 01890001 FAULT at
&gt; 00b010
&gt; [ 1068.691605] nouveau 0000:00:0d.0: bus: MMIO write of 018b0001 FAULT at
&gt; 00b030
&gt; [ 1069.007856] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
&gt; 00b010
&gt; [ 1069.008076] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
&gt; 00b030
&gt; [ 1069.009128] nouveau 0000:00:0d.0: bus: MMIO write of 04200001 FAULT at
&gt; 00b010
&gt; [ 1071.267098] nouveau 0000:00:0d.0: bus: MMIO write of 01890001 FAULT at
&gt; 00b030
&gt; [ 1071.267686] nouveau 0000:00:0d.0: bus: MMIO write of 018b0001 FAULT at
&gt; 00b040
&gt; [ 1075.811130] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
&gt; 00b030
&gt; [ 1075.811472] nouveau 0000:00:0d.0: bus: MMIO write of 00000000 FAULT at
&gt; 00b040</span >

These are unrelated and should be nothing to worry about.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1451927915.CE14E2.8214--

--===============1446280622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1446280622==--
