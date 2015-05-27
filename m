From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90682] failed to idle channel 0xcccc0001 then crash
Date: Wed, 27 May 2015 14:45:00 +0000
Message-ID: <bug-90682-8800-RVEL2hCvid@http.bugs.freedesktop.org/>
References: <bug-90682-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0022600637=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90682-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0022600637==
Content-Type: multipart/alternative; boundary="1432737900.6513d3bD2.9782"; charset="UTF-8"


--1432737900.6513d3bD2.9782
Date: Wed, 27 May 2015 14:45:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90682

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I think that some things are being confused here... you mention multi-stream,
presumably in reference to DP-MST, but that doesn't work on nouveau, only intel
and radeon. Are you actually using nouveau for anything? Can you attach an xorg
log and xrandr output, that should make things a bit clearer.

runpm is a very crude form of power management -- it'll turn the GPU off when
the driver decides it hasn't been used for ~5s or so (maybe 10? I forget). It
can do this using ACPI calls. It will then wake the GPU back up when it wants
to use something.

Now you have a Lenovo + GK106 combo, which is well known to have lots of
trouble bringing up acceleration. In fact, your logs show

[    4.472623] nouveau E[     PGR][0000:01:00.0] grctx template channel unload
timeout

which means that PGRAPH doesn't come up. You could save nouveau some trouble
and just use nouveau.noaccel=1. You should still be able to use reverse-prime
in this case.

Now, none of that has to do with you seeing the crash, just trying to help you
achieve a working system. We shouldn't be crashing even when PGRAPH fails to
come up.

[   52.772499] nouveau E[     DRM] failed to idle channel 0xcccc0000 [DRM]
[   52.788584] pci_pm_runtime_suspend(): nouveau_pmops_runtime_suspend+0x0/0xf0
[nouveau] returns -16

OK, so it tries to suspend but it can't shut down the main DRM channel. Because
PGRAPH is dead to begin with. Although it begs the question of why it even
tries to idle the channel, that means there's an active fence on it. I'm
guessing that the remaining messages are due to improper cleanup of a failed
runtime suspend.

If the above is in the vicinity of correct, nouveau.noaccel=1 should "fix" it,
I think.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432737900.6513d3bD2.9782
Date: Wed, 27 May 2015 14:45:00 +0000
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
   title="NEW - failed to idle channel 0xcccc0001 then crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90682#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - failed to idle channel 0xcccc0001 then crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90682">bug 90682</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I think that some things are being confused here... you mention multi-stream,
presumably in reference to DP-MST, but that doesn't work on nouveau, only intel
and radeon. Are you actually using nouveau for anything? Can you attach an xorg
log and xrandr output, that should make things a bit clearer.

runpm is a very crude form of power management -- it'll turn the GPU off when
the driver decides it hasn't been used for ~5s or so (maybe 10? I forget). It
can do this using ACPI calls. It will then wake the GPU back up when it wants
to use something.

Now you have a Lenovo + GK106 combo, which is well known to have lots of
trouble bringing up acceleration. In fact, your logs show

[    4.472623] nouveau E[     PGR][0000:01:00.0] grctx template channel unload
timeout

which means that PGRAPH doesn't come up. You could save nouveau some trouble
and just use nouveau.noaccel=1. You should still be able to use reverse-prime
in this case.

Now, none of that has to do with you seeing the crash, just trying to help you
achieve a working system. We shouldn't be crashing even when PGRAPH fails to
come up.

[   52.772499] nouveau E[     DRM] failed to idle channel 0xcccc0000 [DRM]
[   52.788584] pci_pm_runtime_suspend(): nouveau_pmops_runtime_suspend+0x0/0xf0
[nouveau] returns -16

OK, so it tries to suspend but it can't shut down the main DRM channel. Because
PGRAPH is dead to begin with. Although it begs the question of why it even
tries to idle the channel, that means there's an active fence on it. I'm
guessing that the remaining messages are due to improper cleanup of a failed
runtime suspend.

If the above is in the vicinity of correct, nouveau.noaccel=1 should &quot;fix&quot; it,
I think.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432737900.6513d3bD2.9782--

--===============0022600637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0022600637==--
