From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82835] [NV92] GeForce 8800 GS VDPAU h264 decoding
	hang
Date: Wed, 03 Sep 2014 06:50:09 +0000
Message-ID: <bug-82835-8800-VjUtvxer4A@http.bugs.freedesktop.org/>
References: <bug-82835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0523173199=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0523173199==
Content-Type: multipart/alternative; boundary="1409727008.6f0B68f1.8648"; charset="us-ascii"


--1409727008.6f0B68f1.8648
Date: Wed, 3 Sep 2014 06:50:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82835

--- Comment #13 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
(In reply to comment #12)
> (In reply to comment #9)
> > Yes, I can confirm new dmesg still contain mentioned  value:
> > 
> > root@slax:~# cat nv92_dmesg_new_1.log | grep 0x1000f010
> > nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[4559]] subc 3
> > class 0x8297 mthd 0x1b0c data 0x1000f010
> > nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[4559]] subc 3
> > class 0x8297 mthd 0x1b0c data 0x1000f010
> > root@slax:~#
> 
> OK, and just to confirm... you're *sure* your new libvdpau_nouveau.so is
> being used? You can check by doing e.g. "strace -f -e open vdpauinfo" to see
> which file it's opening. Judging by your config log, it should be reading
> /usr/X11R7/lib/vdpau/libvdpau_nouveau.so.

guest@slax:~/New_hdd$ strace -f -e open vdpauinfo
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
open("/usr/X11R7/lib/libX11.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/usr/X11R7/lib/libvdpau.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/libstdc++.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/lib/libm.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/libgcc_s.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/usr/X11R7/lib/libxcb.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/usr/X11R7/lib/libXau.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/usr/X11R7/lib/libXdmcp.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/lib/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
open("/usr/X11R7/lib/libXext.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/home/guest/.Xauthority", O_RDONLY) = 4
display: :0   screen: 0
open("/usr/X11R7/lib/vdpau/libvdpau_nouveau.so.1", O_RDONLY|O_CLOEXEC) = 4
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 4
open("/usr/X11R7/lib/libX11-xcb.so.1", O_RDONLY|O_CLOEXEC) = 4
open("/usr/X11R7/lib/libxcb-dri2.so.0", O_RDONLY|O_CLOEXEC) = 4
open("/usr/lib/libexpat.so.1", O_RDONLY|O_CLOEXEC) = 4
open("/usr/X11R7/lib/libdrm_nouveau.so.2", O_RDONLY|O_CLOEXEC) = 4
open("/usr/lib/libz.so.1", O_RDONLY|O_CLOEXEC) = 4
open("/lib/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 4
open("/usr/lib/libncurses.so.5", O_RDONLY|O_CLOEXEC) = 4
open("/usr/lib/libelf.so.0", O_RDONLY|O_CLOEXEC) = 4
open("/usr/X11R7/lib/libdrm_radeon.so.1", O_RDONLY|O_CLOEXEC) = 4
open("/usr/X11R7/lib/libdrm.so.2", O_RDONLY|O_CLOEXEC) = 4
open("/lib/librt.so.1", O_RDONLY|O_CLOEXEC) = 4
open("/usr/lib/libLLVM-3.4.so", O_RDONLY|O_CLOEXEC) = 4
open("/dev/dri/card0", O_RDWR)          = 4
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 5
open("/lib/tls/i686/sse2/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
open("/lib/tls/i686/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
open("/lib/tls/sse2/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
open("/lib/tls/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or
directory)
open("/lib/i686/sse2/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
open("/lib/i686/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or
directory)
open("/lib/sse2/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or
directory)
open("/lib/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or
directory)
open("/usr/lib/tls/i686/sse2/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
open("/usr/lib/tls/i686/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
open("/usr/lib/tls/sse2/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
open("/usr/lib/tls/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file
or directory)
open("/usr/lib/i686/sse2/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
open("/usr/lib/i686/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
open("/usr/lib/sse2/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
open("/usr/lib/libudev.so.1", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or
directory)
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 5
open("/lib/libudev.so.0", O_RDONLY|O_CLOEXEC) = 5
open("/etc/udev/udev.conf", O_RDONLY|O_LARGEFILE) = 5
open("/sys/devices/pci0000:00/0000:00:0e.0/0000:05:00.0/uevent",
O_RDONLY|O_LARGEFILE) = 5
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 6
open("/usr/lib/libtxc_dxtn.so", O_RDONLY|O_CLOEXEC) = 6
open("/sys/devices/system/cpu/online", O_RDONLY|O_CLOEXEC) = 6
API version: 1
Information string: G3DVL VDPAU Driver Shared Library version 1.0
[snip]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409727008.6f0B68f1.8648
Date: Wed, 3 Sep 2014 06:50:08 +0000
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
   title="NEW --- - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835">bug 82835</a>
              from <span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=82835#c12">comment #12</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=82835#c9">comment #9</a>)
&gt; &gt; Yes, I can confirm new dmesg still contain mentioned  value:
&gt; &gt; 
&gt; &gt; root&#64;slax:~# cat nv92_dmesg_new_1.log | grep 0x1000f010
&gt; &gt; nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[4559]] subc 3
&gt; &gt; class 0x8297 mthd 0x1b0c data 0x1000f010
&gt; &gt; nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[4559]] subc 3
&gt; &gt; class 0x8297 mthd 0x1b0c data 0x1000f010
&gt; &gt; root&#64;slax:~#
&gt; 
&gt; OK, and just to confirm... you're *sure* your new libvdpau_nouveau.so is
&gt; being used? You can check by doing e.g. &quot;strace -f -e open vdpauinfo&quot; to see
&gt; which file it's opening. Judging by your config log, it should be reading
&gt; /usr/X11R7/lib/vdpau/libvdpau_nouveau.so.</span >

guest&#64;slax:~/New_hdd$ strace -f -e open vdpauinfo
open(&quot;/etc/ld.so.cache&quot;, O_RDONLY|O_CLOEXEC) = 3
open(&quot;/usr/X11R7/lib/libX11.so.6&quot;, O_RDONLY|O_CLOEXEC) = 3
open(&quot;/usr/X11R7/lib/libvdpau.so.1&quot;, O_RDONLY|O_CLOEXEC) = 3
open(&quot;/usr/lib/libstdc++.so.6&quot;, O_RDONLY|O_CLOEXEC) = 3
open(&quot;/lib/libm.so.6&quot;, O_RDONLY|O_CLOEXEC) = 3
open(&quot;/usr/lib/libgcc_s.so.1&quot;, O_RDONLY|O_CLOEXEC) = 3
open(&quot;/lib/libc.so.6&quot;, O_RDONLY|O_CLOEXEC) = 3
open(&quot;/usr/X11R7/lib/libxcb.so.1&quot;, O_RDONLY|O_CLOEXEC) = 3
open(&quot;/usr/X11R7/lib/libXau.so.6&quot;, O_RDONLY|O_CLOEXEC) = 3
open(&quot;/usr/X11R7/lib/libXdmcp.so.6&quot;, O_RDONLY|O_CLOEXEC) = 3
open(&quot;/lib/libdl.so.2&quot;, O_RDONLY|O_CLOEXEC) = 3
open(&quot;/usr/X11R7/lib/libXext.so.6&quot;, O_RDONLY|O_CLOEXEC) = 3
open(&quot;/home/guest/.Xauthority&quot;, O_RDONLY) = 4
display: :0   screen: 0
open(&quot;/usr/X11R7/lib/vdpau/libvdpau_nouveau.so.1&quot;, O_RDONLY|O_CLOEXEC) = 4
open(&quot;/etc/ld.so.cache&quot;, O_RDONLY|O_CLOEXEC) = 4
open(&quot;/usr/X11R7/lib/libX11-xcb.so.1&quot;, O_RDONLY|O_CLOEXEC) = 4
open(&quot;/usr/X11R7/lib/libxcb-dri2.so.0&quot;, O_RDONLY|O_CLOEXEC) = 4
open(&quot;/usr/lib/libexpat.so.1&quot;, O_RDONLY|O_CLOEXEC) = 4
open(&quot;/usr/X11R7/lib/libdrm_nouveau.so.2&quot;, O_RDONLY|O_CLOEXEC) = 4
open(&quot;/usr/lib/libz.so.1&quot;, O_RDONLY|O_CLOEXEC) = 4
open(&quot;/lib/libpthread.so.0&quot;, O_RDONLY|O_CLOEXEC) = 4
open(&quot;/usr/lib/libncurses.so.5&quot;, O_RDONLY|O_CLOEXEC) = 4
open(&quot;/usr/lib/libelf.so.0&quot;, O_RDONLY|O_CLOEXEC) = 4
open(&quot;/usr/X11R7/lib/libdrm_radeon.so.1&quot;, O_RDONLY|O_CLOEXEC) = 4
open(&quot;/usr/X11R7/lib/libdrm.so.2&quot;, O_RDONLY|O_CLOEXEC) = 4
open(&quot;/lib/librt.so.1&quot;, O_RDONLY|O_CLOEXEC) = 4
open(&quot;/usr/lib/libLLVM-3.4.so&quot;, O_RDONLY|O_CLOEXEC) = 4
open(&quot;/dev/dri/card0&quot;, O_RDWR)          = 4
open(&quot;/etc/ld.so.cache&quot;, O_RDONLY|O_CLOEXEC) = 5
open(&quot;/lib/tls/i686/sse2/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
open(&quot;/lib/tls/i686/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
open(&quot;/lib/tls/sse2/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
open(&quot;/lib/tls/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or
directory)
open(&quot;/lib/i686/sse2/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
open(&quot;/lib/i686/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or
directory)
open(&quot;/lib/sse2/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or
directory)
open(&quot;/lib/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or
directory)
open(&quot;/usr/lib/tls/i686/sse2/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
open(&quot;/usr/lib/tls/i686/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
open(&quot;/usr/lib/tls/sse2/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
open(&quot;/usr/lib/tls/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file
or directory)
open(&quot;/usr/lib/i686/sse2/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
open(&quot;/usr/lib/i686/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
open(&quot;/usr/lib/sse2/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
open(&quot;/usr/lib/libudev.so.1&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or
directory)
open(&quot;/etc/ld.so.cache&quot;, O_RDONLY|O_CLOEXEC) = 5
open(&quot;/lib/libudev.so.0&quot;, O_RDONLY|O_CLOEXEC) = 5
open(&quot;/etc/udev/udev.conf&quot;, O_RDONLY|O_LARGEFILE) = 5
open(&quot;/sys/devices/pci0000:00/0000:00:0e.0/0000:05:00.0/uevent&quot;,
O_RDONLY|O_LARGEFILE) = 5
open(&quot;/etc/ld.so.cache&quot;, O_RDONLY|O_CLOEXEC) = 6
open(&quot;/usr/lib/libtxc_dxtn.so&quot;, O_RDONLY|O_CLOEXEC) = 6
open(&quot;/sys/devices/system/cpu/online&quot;, O_RDONLY|O_CLOEXEC) = 6
API version: 1
Information string: G3DVL VDPAU Driver Shared Library version 1.0
[snip]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409727008.6f0B68f1.8648--

--===============0523173199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0523173199==--
