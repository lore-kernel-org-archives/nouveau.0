From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] [NV34] failed to idle channel 0xcccc0000
	(also NV44A)
Date: Tue, 02 Sep 2014 20:03:55 +0000
Message-ID: <bug-70388-8800-uwedUixVCL@http.bugs.freedesktop.org/>
References: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0068342229=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70388-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0068342229==
Content-Type: multipart/alternative; boundary="1409688235.0da6E2D1.1125"; charset="us-ascii"


--1409688235.0da6E2D1.1125
Date: Tue, 2 Sep 2014 20:03:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70388

--- Comment #21 from Linas Vepstas <linasvepstas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Also, I'm on x86-64.
Also, I have TWO NV graphics cards in this system.  The problem occurs only for
the one plugged into the slower PCI channel.

Also:
[    0.256789] pci 0000:02:00.0: Boot video device
[    0.256791] PCI: CLS 32 bytes, default 64
[    0.256980] PCI-DMA: Disabling AGP.
[    0.257075] PCI-DMA: aperture base @ b4000000 size 65536 KB
[    0.257079] PCI-DMA: using GART IOMMU.
[    0.257083] PCI-DMA: Reserving 64MB of IOMMU area in the AGP aperture

so the device having problems is NOT the boot device. strange, because this is
the second device detected by nouveau...

Also: first nouveu error is during boot:

[    5.084189] nouveau E[   PFIFO][0000:01:06.0] DMA_PUSHER - ch 0 [DRM] get
0x00000000 put 0x00000188 state 0x80000000 (err: INVALID_CMD) push 0x00000000

and occurs before the second card is detected. No further problems until about
3 minutes later, after the first attempt at Xorg has failed, and the second
attempt to start X gets going.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409688235.0da6E2D1.1125
Date: Tue, 2 Sep 2014 20:03:55 +0000
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
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000 (also NV44A)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000 (also NV44A)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388">bug 70388</a>
              from <span class="vcard"><a class="email" href="mailto:linasvepstas&#64;gmail.com" title="Linas Vepstas &lt;linasvepstas&#64;gmail.com&gt;"> <span class="fn">Linas Vepstas</span></a>
</span></b>
        <pre>Also, I'm on x86-64.
Also, I have TWO NV graphics cards in this system.  The problem occurs only for
the one plugged into the slower PCI channel.

Also:
[    0.256789] pci 0000:02:00.0: Boot video device
[    0.256791] PCI: CLS 32 bytes, default 64
[    0.256980] PCI-DMA: Disabling AGP.
[    0.257075] PCI-DMA: aperture base &#64; b4000000 size 65536 KB
[    0.257079] PCI-DMA: using GART IOMMU.
[    0.257083] PCI-DMA: Reserving 64MB of IOMMU area in the AGP aperture

so the device having problems is NOT the boot device. strange, because this is
the second device detected by nouveau...

Also: first nouveu error is during boot:

[    5.084189] nouveau E[   PFIFO][0000:01:06.0] DMA_PUSHER - ch 0 [DRM] get
0x00000000 put 0x00000188 state 0x80000000 (err: INVALID_CMD) push 0x00000000

and occurs before the second card is detected. No further problems until about
3 minutes later, after the first attempt at Xorg has failed, and the second
attempt to start X gets going.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409688235.0da6E2D1.1125--

--===============0068342229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0068342229==--
