From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Sat, 01 Mar 2014 13:53:09 +0000
Message-ID: <bug-75279-8800-1Loi66Om3J@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0925830708=="
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


--===============0925830708==
Content-Type: multipart/alternative; boundary="1393681988.AFcC61A2.29070"; charset="us-ascii"


--1393681988.AFcC61A2.29070
Date: Sat, 1 Mar 2014 13:53:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75279

--- Comment #26 from Frederic Bezies <fredbezies-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #24)
[...]
> 
> Seems to be stuck at the same spot with identical call stack, minus the
> state tracker bits.
> 
> The memory access message looks interesting, shame there is no indication of
> what nouveau was doing to provoke this. (gdb) bt full, info locals or
> disassemble should be able to catch what is going on here.
> 
> How often do you get this ? Please attach the gdb output of the above three
> as the problem occurs.

It happens when I try to connect to my youtube account. And after 30 seconds or
so, plugin-container works as expected.

Here is bt full log :

(gdb) bt full
#0  0x00007fb478a49337 in sched_yield () from /usr/lib/libc.so.6
No symbol table info available.
#1  0x00007fb46670ee41 in ?? () from /usr/lib/vdpau/libvdpau_nouveau.so.1
No symbol table info available.
#2  0x00007fb46679eca5 in ?? () from /usr/lib/vdpau/libvdpau_nouveau.so.1
No symbol table info available.
#3  0x00007fb4666019c1 in vl_screen_destroy ()
   from /usr/lib/vdpau/libvdpau_nouveau.so.1
No symbol table info available.
#4  0x00007fb4667073a1 in vlVdpDeviceDestroy ()
   from /usr/lib/vdpau/libvdpau_nouveau.so.1
No symbol table info available.
#5  0x00007fb46b4252a8 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#6  0x00007fb46b0871b5 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#7  0x00007fb46b088000 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#8  0x00007fb46b6167c8 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#9  0x00007fb46b61cf7d in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#10 0x00007fb46b61ea6b in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
Cannot access memory at address 0x7fffc4f85b78

Some technical infos : nouveau 1.0.10, mesa 10.0.3

All this on an archlinux 64 bits, up-to-date.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393681988.AFcC61A2.29070
Date: Sat, 1 Mar 2014 13:53:08 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279">bug 75279</a>
              from <span class="vcard"><a class="email" href="mailto:fredbezies&#64;gmail.com" title="Frederic Bezies &lt;fredbezies&#64;gmail.com&gt;"> <span class="fn">Frederic Bezies</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=75279#c24">comment #24</a>)
[...]
<span class="quote">&gt; 
&gt; Seems to be stuck at the same spot with identical call stack, minus the
&gt; state tracker bits.
&gt; 
&gt; The memory access message looks interesting, shame there is no indication of
&gt; what nouveau was doing to provoke this. (gdb) bt full, info locals or
&gt; disassemble should be able to catch what is going on here.
&gt; 
&gt; How often do you get this ? Please attach the gdb output of the above three
&gt; as the problem occurs.</span >

It happens when I try to connect to my youtube account. And after 30 seconds or
so, plugin-container works as expected.

Here is bt full log :

(gdb) bt full
#0  0x00007fb478a49337 in sched_yield () from /usr/lib/libc.so.6
No symbol table info available.
#1  0x00007fb46670ee41 in ?? () from /usr/lib/vdpau/libvdpau_nouveau.so.1
No symbol table info available.
#2  0x00007fb46679eca5 in ?? () from /usr/lib/vdpau/libvdpau_nouveau.so.1
No symbol table info available.
#3  0x00007fb4666019c1 in vl_screen_destroy ()
   from /usr/lib/vdpau/libvdpau_nouveau.so.1
No symbol table info available.
#4  0x00007fb4667073a1 in vlVdpDeviceDestroy ()
   from /usr/lib/vdpau/libvdpau_nouveau.so.1
No symbol table info available.
#5  0x00007fb46b4252a8 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#6  0x00007fb46b0871b5 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#7  0x00007fb46b088000 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#8  0x00007fb46b6167c8 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#9  0x00007fb46b61cf7d in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#10 0x00007fb46b61ea6b in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
Cannot access memory at address 0x7fffc4f85b78

Some technical infos : nouveau 1.0.10, mesa 10.0.3

All this on an archlinux 64 bits, up-to-date.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393681988.AFcC61A2.29070--

--===============0925830708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0925830708==--
