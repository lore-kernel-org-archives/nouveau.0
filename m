From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Sat, 01 Mar 2014 10:18:59 +0000
Message-ID: <bug-75279-8800-DvAnEgW9jE@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1454751737=="
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


--===============1454751737==
Content-Type: multipart/alternative; boundary="1393669139.86B0A822.19123"; charset="us-ascii"


--1393669139.86B0A822.19123
Date: Sat, 1 Mar 2014 10:18:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75279

--- Comment #23 from Frederic Bezies <fredbezies-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Don't know if it is related, but I'm facing a plugin container hang and nouveau
seems to be guilty in some way.

Got this thread with gdb :

Thread 1 (Thread 0x7f4dd7b37940 (LWP 2961)):
#0  0x00007f4dd2294337 in sched_yield () from /usr/lib/libc.so.6
#1  0x00007f4dbff0ee41 in ?? () from /usr/lib/vdpau/libvdpau_nouveau.so.1
#2  0x00007f4dbff9eca5 in ?? () from /usr/lib/vdpau/libvdpau_nouveau.so.1
#3  0x00007f4dbfe019c1 in vl_screen_destroy ()
   from /usr/lib/vdpau/libvdpau_nouveau.so.1
#4  0x00007f4dbff073a1 in vlVdpDeviceDestroy ()
   from /usr/lib/vdpau/libvdpau_nouveau.so.1
#5  0x00007f4dc4c252a8 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
#6  0x00007f4dc48871b5 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
#7  0x00007f4dc4888000 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
#8  0x00007f4dc4e167c8 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
#9  0x00007f4dc4e1cf7d in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
#10 0x00007f4dc4e1ea6b in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
Cannot access memory at address 0x7ffff106a948

Or is it a flash plugin bug ?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393669139.86B0A822.19123
Date: Sat, 1 Mar 2014 10:18:59 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279">bug 75279</a>
              from <span class="vcard"><a class="email" href="mailto:fredbezies&#64;gmail.com" title="Frederic Bezies &lt;fredbezies&#64;gmail.com&gt;"> <span class="fn">Frederic Bezies</span></a>
</span></b>
        <pre>Don't know if it is related, but I'm facing a plugin container hang and nouveau
seems to be guilty in some way.

Got this thread with gdb :

Thread 1 (Thread 0x7f4dd7b37940 (LWP 2961)):
#0  0x00007f4dd2294337 in sched_yield () from /usr/lib/libc.so.6
#1  0x00007f4dbff0ee41 in ?? () from /usr/lib/vdpau/libvdpau_nouveau.so.1
#2  0x00007f4dbff9eca5 in ?? () from /usr/lib/vdpau/libvdpau_nouveau.so.1
#3  0x00007f4dbfe019c1 in vl_screen_destroy ()
   from /usr/lib/vdpau/libvdpau_nouveau.so.1
#4  0x00007f4dbff073a1 in vlVdpDeviceDestroy ()
   from /usr/lib/vdpau/libvdpau_nouveau.so.1
#5  0x00007f4dc4c252a8 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
#6  0x00007f4dc48871b5 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
#7  0x00007f4dc4888000 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
#8  0x00007f4dc4e167c8 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
#9  0x00007f4dc4e1cf7d in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
#10 0x00007f4dc4e1ea6b in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
Cannot access memory at address 0x7ffff106a948

Or is it a flash plugin bug ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393669139.86B0A822.19123--

--===============1454751737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1454751737==--
