From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Fri, 13 Dec 2013 12:45:32 +0000
Message-ID: <bug-58378-8800-A7DSRucDVR@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1627562609=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1627562609==
Content-Type: multipart/alternative; boundary="1386938732.DF5dB5.2105"; charset="us-ascii"


--1386938732.DF5dB5.2105
Date: Fri, 13 Dec 2013 12:45:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #19 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Hello,

I would like to join discussions in this bug, as I have found myself affected
after the recent update from Red Hat Enterprise Linux/Oracle Linux 6.4 (stock
RHEL kernel 2.6.32-358.23.2) to RHEL/OL 6.5 (RHEL kernel 2.6.32-431).

My graphics card is NVidia Quadro NVS 130M:
BOOT0  : 0x086a00a2
Chipset: G86 (NV86)
Family : NV50

It seems that RHEL 6.5 kernel 2.6.32-431 has updated its kernel modules for
nouveau DRM to a codebase level that matches official Linux kernels 3.7, and
therefore introduced this severe graphics distortion issue into mainline RHEL
6.

In order to verify that it indeed is the nouveau DRM kernel module resonsible
for the distortion, I have upgraded my OL6 packages to the following versions:

* mesa-9.2.0.5 (including support for nouveau, which is commented out by
default in RHEL6)
* libdrm-2.4.50
* xorg-x11-drv-nouveau-1.0.9

but this does NOT affect the issue at all.

But reverting back to RHEL stock kernel 2.6.32-358.23.2 makes the issue vanish,
also when using the above updated library versions.

I then tried Oracle's UEK kernels, and while the current UEK2 kernel
(2.6.39-400.211.2) does NOT have the issue, the current UEK3 kernel
(3.8.13-16.2.2) also shows it.

I then tried to find out about the exact "versions" (git commit levels?) of the
nouveau libdrm modules, and found out the following:

(1) Oracle UEK2 kernel 2.6.39-400.211.2 - NO ISSUE:
[drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0

(2) RHEL stock kernel 2.6.32-358.23.2 - NO ISSUE:
[drm] Initialized nouveau 1.0.0 20120316 for 0000:01:00.0 on minor 0

(3) RHEL stock kernel 2.6.32-431 - DOES SHOW THE ISSUE:
[drm] Initialized nouveau 1.1.0 20120801 for 0000:01:00.0 on minor 0

(4) more recent kernels, such as Oracle UEK3 (3.8.13-16.2.2) and the most
recent Oracle "playground" kernel from public-yum.oracle.com
(3.12.4-3.12.y.20131210) all DO SHOW THE ISSUE:
[drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on minor 0

So to me it now seems as if the issue has been introduced with the massive
changes to nouveau/DRM that went into 3.7:

http://www.phoronix.com/scan.php?page=news_item&px=MTE1NDg

and affects ALL subsequent versions since then... :-(

I would be very interested and willing to help in debugging/tracking this down,
but I don't have any git background, so you would have to guide me through how
to do the "bisect"...

Hope this helps & looking forward to your feedback! :-)

Best regards,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386938732.DF5dB5.2105
Date: Fri, 13 Dec 2013 12:45:32 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Hello,

I would like to join discussions in this bug, as I have found myself affected
after the recent update from Red Hat Enterprise Linux/Oracle Linux 6.4 (stock
RHEL kernel 2.6.32-358.23.2) to RHEL/OL 6.5 (RHEL kernel 2.6.32-431).

My graphics card is NVidia Quadro NVS 130M:
BOOT0  : 0x086a00a2
Chipset: G86 (NV86)
Family : NV50

It seems that RHEL 6.5 kernel 2.6.32-431 has updated its kernel modules for
nouveau DRM to a codebase level that matches official Linux kernels 3.7, and
therefore introduced this severe graphics distortion issue into mainline RHEL
6.

In order to verify that it indeed is the nouveau DRM kernel module resonsible
for the distortion, I have upgraded my OL6 packages to the following versions:

* mesa-9.2.0.5 (including support for nouveau, which is commented out by
default in RHEL6)
* libdrm-2.4.50
* xorg-x11-drv-nouveau-1.0.9

but this does NOT affect the issue at all.

But reverting back to RHEL stock kernel 2.6.32-358.23.2 makes the issue vanish,
also when using the above updated library versions.

I then tried Oracle's UEK kernels, and while the current UEK2 kernel
(2.6.39-400.211.2) does NOT have the issue, the current UEK3 kernel
(3.8.13-16.2.2) also shows it.

I then tried to find out about the exact &quot;versions&quot; (git commit levels?) of the
nouveau libdrm modules, and found out the following:

(1) Oracle UEK2 kernel 2.6.39-400.211.2 - NO ISSUE:
[drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0

(2) RHEL stock kernel 2.6.32-358.23.2 - NO ISSUE:
[drm] Initialized nouveau 1.0.0 20120316 for 0000:01:00.0 on minor 0

(3) RHEL stock kernel 2.6.32-431 - DOES SHOW THE ISSUE:
[drm] Initialized nouveau 1.1.0 20120801 for 0000:01:00.0 on minor 0

(4) more recent kernels, such as Oracle UEK3 (3.8.13-16.2.2) and the most
recent Oracle &quot;playground&quot; kernel from public-yum.oracle.com
(3.12.4-3.12.y.20131210) all DO SHOW THE ISSUE:
[drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on minor 0

So to me it now seems as if the issue has been introduced with the massive
changes to nouveau/DRM that went into 3.7:

<a href="http://www.phoronix.com/scan.php?page=news_item&amp;px=MTE1NDg">http://www.phoronix.com/scan.php?page=news_item&amp;px=MTE1NDg</a>

and affects ALL subsequent versions since then... :-(

I would be very interested and willing to help in debugging/tracking this down,
but I don't have any git background, so you would have to guide me through how
to do the &quot;bisect&quot;...

Hope this helps &amp; looking forward to your feedback! :-)

Best regards,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386938732.DF5dB5.2105--

--===============1627562609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1627562609==--
