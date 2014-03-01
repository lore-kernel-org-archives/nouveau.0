From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Sat, 01 Mar 2014 14:38:49 +0000
Message-ID: <bug-75279-8800-It78zlOamJ@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1525821751=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75279-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1525821751==
Content-Type: multipart/alternative; boundary="1393684729.f8F84aDa3.5873"; charset="us-ascii"


--1393684729.f8F84aDa3.5873
Date: Sat, 1 Mar 2014 14:38:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75279

--- Comment #27 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #26)
[...]
> It happens when I try to connect to my youtube account. And after 30 seconds
> or so, plugin-container works as expected.
> 
> Here is bt full log :
> 
> (gdb) bt full
> #0  0x00007fb478a49337 in sched_yield () from /usr/lib/libc.so.6
> No symbol table info available.
> #1  0x00007fb46670ee41 in ?? () from /usr/lib/vdpau/libvdpau_nouveau.so.1
> No symbol table info available.
> #2  0x00007fb46679eca5 in ?? () from /usr/lib/vdpau/libvdpau_nouveau.so.1
> No symbol table info available.
> #3  0x00007fb4666019c1 in vl_screen_destroy ()
>    from /usr/lib/vdpau/libvdpau_nouveau.so.1
> No symbol table info available.
> #4  0x00007fb4667073a1 in vlVdpDeviceDestroy ()
>    from /usr/lib/vdpau/libvdpau_nouveau.so.1
> No symbol table info available.
> #5  0x00007fb46b4252a8 in ?? () from
> /usr/lib/mozilla/plugins/libflashplayer.so
> No symbol table info available.
> #6  0x00007fb46b0871b5 in ?? () from
> /usr/lib/mozilla/plugins/libflashplayer.so
> No symbol table info available.
> #7  0x00007fb46b088000 in ?? () from
> /usr/lib/mozilla/plugins/libflashplayer.so
> No symbol table info available.
> #8  0x00007fb46b6167c8 in ?? () from
> /usr/lib/mozilla/plugins/libflashplayer.so
> No symbol table info available.
> #9  0x00007fb46b61cf7d in ?? () from
> /usr/lib/mozilla/plugins/libflashplayer.so
> No symbol table info available.
> #10 0x00007fb46b61ea6b in ?? () from
> /usr/lib/mozilla/plugins/libflashplayer.so
> No symbol table info available.
> Cannot access memory at address 0x7fffc4f85b78
> 
I was afraid that your mesa build does not have debug symbols. Would you mind
rebuilding and installing the debug symbols ?

* Can you grab the PKGBUILD [1]
* Add "options=('debug')" around the source line
* rebuild (makepkg) and install (do not forget the -debug* packages)

> Some technical infos : nouveau 1.0.10, mesa 10.0.3
> 
> All this on an archlinux 64 bits, up-to-date.

FWIW I cannot reproduce the crash, although sched_yield is still around

Cheers

[1]
https://projects.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/mesa

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393684729.f8F84aDa3.5873
Date: Sat, 1 Mar 2014 14:38:49 +0000
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
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279">bug 75279</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=75279#c26">comment #26</a>)
[...]
<span class="quote">&gt; It happens when I try to connect to my youtube account. And after 30 seconds
&gt; or so, plugin-container works as expected.
&gt; 
&gt; Here is bt full log :
&gt; 
&gt; (gdb) bt full
&gt; #0  0x00007fb478a49337 in sched_yield () from /usr/lib/libc.so.6
&gt; No symbol table info available.
&gt; #1  0x00007fb46670ee41 in ?? () from /usr/lib/vdpau/libvdpau_nouveau.so.1
&gt; No symbol table info available.
&gt; #2  0x00007fb46679eca5 in ?? () from /usr/lib/vdpau/libvdpau_nouveau.so.1
&gt; No symbol table info available.
&gt; #3  0x00007fb4666019c1 in vl_screen_destroy ()
&gt;    from /usr/lib/vdpau/libvdpau_nouveau.so.1
&gt; No symbol table info available.
&gt; #4  0x00007fb4667073a1 in vlVdpDeviceDestroy ()
&gt;    from /usr/lib/vdpau/libvdpau_nouveau.so.1
&gt; No symbol table info available.
&gt; #5  0x00007fb46b4252a8 in ?? () from
&gt; /usr/lib/mozilla/plugins/libflashplayer.so
&gt; No symbol table info available.
&gt; #6  0x00007fb46b0871b5 in ?? () from
&gt; /usr/lib/mozilla/plugins/libflashplayer.so
&gt; No symbol table info available.
&gt; #7  0x00007fb46b088000 in ?? () from
&gt; /usr/lib/mozilla/plugins/libflashplayer.so
&gt; No symbol table info available.
&gt; #8  0x00007fb46b6167c8 in ?? () from
&gt; /usr/lib/mozilla/plugins/libflashplayer.so
&gt; No symbol table info available.
&gt; #9  0x00007fb46b61cf7d in ?? () from
&gt; /usr/lib/mozilla/plugins/libflashplayer.so
&gt; No symbol table info available.
&gt; #10 0x00007fb46b61ea6b in ?? () from
&gt; /usr/lib/mozilla/plugins/libflashplayer.so
&gt; No symbol table info available.
&gt; Cannot access memory at address 0x7fffc4f85b78
&gt; </span >
I was afraid that your mesa build does not have debug symbols. Would you mind
rebuilding and installing the debug symbols ?

* Can you grab the PKGBUILD [1]
* Add &quot;options=('debug')&quot; around the source line
* rebuild (makepkg) and install (do not forget the -debug* packages)

<span class="quote">&gt; Some technical infos : nouveau 1.0.10, mesa 10.0.3
&gt; 
&gt; All this on an archlinux 64 bits, up-to-date.</span >

FWIW I cannot reproduce the crash, although sched_yield is still around

Cheers

[1]
<a href="https://projects.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/mesa">https://projects.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/mesa</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393684729.f8F84aDa3.5873--

--===============1525821751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1525821751==--
