From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Thu, 21 Feb 2013 21:03:32 +0000
Message-ID: <bug-59168-8800-TpGdNaS8fF@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1767420582=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1767420582==
Content-Type: multipart/alternative; boundary="1361480613.eCEb08CF5.18211"; charset="us-ascii"


--1361480613.eCEb08CF5.18211
Date: Thu, 21 Feb 2013 21:03:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #22 from Ryan Turner <zdbiohazard2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I'm seeing what I think is the same problem on my Thinkpad T530.

When I resume the system, xscreensaver's lock screen always seems to look and
behave normally, but when I unlock the screen, either the whole screen is
corrupted, or all the previously opened windows will be drawn incorrectly. I
can even lock the screen again and xscreensaver still looks fine. When
unlocked, the system can still be used semi-blindly, and if I can feel my way
to a terminal, I can start some SDL and OpenGL apps that work fine, while
newly-opened GTK/etc apps are corrupted. Logging out or otherwise restarting X
gets everything back to normal.

Much like others that have tested, the proprietary nvidia driver works fine.

dmesg:
 [85334.271612] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x001fcfa000]
 [85334.271621] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
 *repeats numerous times*

lspci: (Thought I would chime in as I have a chip that hasn't been mentioned
yet.)
 01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [Quadro NVS 5400M]
(rev a1)

Packages: (Gentoo/~amd64) CFLAGS="-O2 -pipe -march=native"
 gentoo-sources      3.7.8    USE="-build -deblob -symlink"
 mesa                9.1_rc2  USE="classic egl gallium gles1 gles2 llvm nptl
openvg osmesa pax_kernel shared-glapi xa xorg xvmc -bindist -debug -gbm -pic
-r600-llvm-compiler (-selinux) -vdpau -wayland"
 libdrm              2.4.42   USE="libkms -static-libs"
 xorg-server         1.13.2   USE="ipv6 kdrive nptl suid udev xorg -dmx -doc
-minimal (-selinux) -static-libs -tslib -xnest -xvfb"
 xf86-video-nouveau  1.0.6

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361480613.eCEb08CF5.18211
Date: Thu, 21 Feb 2013 21:03:33 +0000
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
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:zdbiohazard2&#64;gmail.com" title="Ryan Turner &lt;zdbiohazard2&#64;gmail.com&gt;"> <span class="fn">Ryan Turner</span></a>
</span></b>
        <pre>I'm seeing what I think is the same problem on my Thinkpad T530.

When I resume the system, xscreensaver's lock screen always seems to look and
behave normally, but when I unlock the screen, either the whole screen is
corrupted, or all the previously opened windows will be drawn incorrectly. I
can even lock the screen again and xscreensaver still looks fine. When
unlocked, the system can still be used semi-blindly, and if I can feel my way
to a terminal, I can start some SDL and OpenGL apps that work fine, while
newly-opened GTK/etc apps are corrupted. Logging out or otherwise restarting X
gets everything back to normal.

Much like others that have tested, the proprietary nvidia driver works fine.

dmesg:
 [85334.271612] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x001fcfa000]
 [85334.271621] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
 *repeats numerous times*

lspci: (Thought I would chime in as I have a chip that hasn't been mentioned
yet.)
 01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [Quadro NVS 5400M]
(rev a1)

Packages: (Gentoo/~amd64) CFLAGS=&quot;-O2 -pipe -march=native&quot;
 gentoo-sources      3.7.8    USE=&quot;-build -deblob -symlink&quot;
 mesa                9.1_rc2  USE=&quot;classic egl gallium gles1 gles2 llvm nptl
openvg osmesa pax_kernel shared-glapi xa xorg xvmc -bindist -debug -gbm -pic
-r600-llvm-compiler (-selinux) -vdpau -wayland&quot;
 libdrm              2.4.42   USE=&quot;libkms -static-libs&quot;
 xorg-server         1.13.2   USE=&quot;ipv6 kdrive nptl suid udev xorg -dmx -doc
-minimal (-selinux) -static-libs -tslib -xnest -xvfb&quot;
 xf86-video-nouveau  1.0.6</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361480613.eCEb08CF5.18211--

--===============1767420582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1767420582==--
