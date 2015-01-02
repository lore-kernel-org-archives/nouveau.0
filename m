From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87983] nouveau E[Xorg.bin[1119]] failed to idle
 channel 0xcccc0001 on G86 [GeForce 8500 GT] (rev a1)
Date: Fri, 02 Jan 2015 22:22:51 +0000
Message-ID: <bug-87983-8800-BZ4l09n6YI@http.bugs.freedesktop.org/>
References: <bug-87983-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0846275885=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87983-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0846275885==
Content-Type: multipart/alternative; boundary="1420237371.1eeB6Fdf2.26334"; charset="UTF-8"


--1420237371.1eeB6Fdf2.26334
Date: Fri, 2 Jan 2015 22:22:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87983

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[    5.563485] nouveau  [     DRM] allocated 1280x1024 fb: 0x60000, bo
ffff8800364dfc00
[    5.563734] fbcon: nouveaufb (fb0) is primary device
[   11.680075] nouveau E[     DRM] GPU lockup - switching to software fbcon
[   11.682438] Console: switching to colour frame buffer device 160x64
[   11.686343] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[   11.686346] nouveau 0000:02:00.0: registered panic notifier
[   11.689057] [drm] Initialized nouveau 1.2.0 20120801 for 0000:02:00.0 on
minor 0

Hmmm... so it hangs right on start.

Did this particular GPU work with older kernels?

Perhaps MSI is messed up for some reason? Can you try booting with
nouveau.config=NvMSI=0 (or pci=nomsi)?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420237371.1eeB6Fdf2.26334
Date: Fri, 2 Jan 2015 22:22:51 +0000
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
   title="NEW - nouveau E[Xorg.bin[1119]] failed to idle channel 0xcccc0001 on G86 [GeForce 8500 GT] (rev a1)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87983#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau E[Xorg.bin[1119]] failed to idle channel 0xcccc0001 on G86 [GeForce 8500 GT] (rev a1)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87983">bug 87983</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[    5.563485] nouveau  [     DRM] allocated 1280x1024 fb: 0x60000, bo
ffff8800364dfc00
[    5.563734] fbcon: nouveaufb (fb0) is primary device
[   11.680075] nouveau E[     DRM] GPU lockup - switching to software fbcon
[   11.682438] Console: switching to colour frame buffer device 160x64
[   11.686343] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[   11.686346] nouveau 0000:02:00.0: registered panic notifier
[   11.689057] [drm] Initialized nouveau 1.2.0 20120801 for 0000:02:00.0 on
minor 0

Hmmm... so it hangs right on start.

Did this particular GPU work with older kernels?

Perhaps MSI is messed up for some reason? Can you try booting with
nouveau.config=NvMSI=0 (or pci=nomsi)?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420237371.1eeB6Fdf2.26334--

--===============0846275885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0846275885==--
