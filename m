From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56535] Resident evil 4 with wine: crash
Date: Thu, 01 Nov 2012 21:30:24 +0000
Message-ID: <bug-56535-8800-BI8S1KdU5z@http.bugs.freedesktop.org/>
References: <bug-56535-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2077085165=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56535-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2077085165==
Content-Type: multipart/alternative; boundary="1351805423.FE80630.22383"; charset="us-ascii"


--1351805423.FE80630.22383
Date: Thu, 1 Nov 2012 21:30:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56535

--- Comment #3 from KinG-InFeT <king.infet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
perhaps I did:

GNU gdb (GDB) 7.5
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i686-pc-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /usr/bin/wine...(no debugging symbols found)...done.
(gdb) Starting program: /usr/bin/wine game.exe
warning: Could not load shared library symbols for linux-gate.so.1.
Do you need "set solib-search-path" or "set sysroot"?
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/usr/lib/libthread_db.so.1".
[New Thread 0xb7ca9b40 (LWP 1288)]
[Thread 0xb7ca9b40 (LWP 1288) exited]
process 1284 is executing new program: /usr/bin/wine-preloader
fixme:d3d:init_driver_info Unable to find a driver/device info for
vendor_id=0x10de device_id=0x421 for driver_model=2
fixme:win:EnumDisplayDevicesW ((null),0,0x7c7f608,0x00000000), stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1b55a0 stub!
[New LWP 1320]

Program received signal SIGUSR1, User defined signal 1.
[Switching to LWP 1320]
0xb7fff424 in ?? ()
(gdb) #0  0xb7fff424 in ?? ()
#1  0xb7e84d08 in ?? ()
#2  0xb7dc13fe in ?? ()
(gdb) quit
A debugging session is active.

    Inferior 1 [process 1284] will be killed.

Quit anyway? (y or n) [answered Y; input not from terminal]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351805423.FE80630.22383
Date: Thu, 1 Nov 2012 21:30:23 +0000
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
   title="NEW --- - Resident evil 4 with wine: crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56535#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Resident evil 4 with wine: crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56535">bug 56535</a>
              from <span class="vcard"><a class="email" href="mailto:king.infet&#64;gmail.com" title="KinG-InFeT &lt;king.infet&#64;gmail.com&gt;"> <span class="fn">KinG-InFeT</span></a>
</span></b>
        <pre>perhaps I did:

GNU gdb (GDB) 7.5
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later &lt;<a href="http://gnu.org/licenses/gpl.html">http://gnu.org/licenses/gpl.html</a>&gt;
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type &quot;show copying&quot;
and &quot;show warranty&quot; for details.
This GDB was configured as &quot;i686-pc-linux-gnu&quot;.
For bug reporting instructions, please see:
&lt;<a href="http://www.gnu.org/software/gdb/bugs/">http://www.gnu.org/software/gdb/bugs/</a>&gt;...
Reading symbols from /usr/bin/wine...(no debugging symbols found)...done.
(gdb) Starting program: /usr/bin/wine game.exe
warning: Could not load shared library symbols for linux-gate.so.1.
Do you need &quot;set solib-search-path&quot; or &quot;set sysroot&quot;?
[Thread debugging using libthread_db enabled]
Using host libthread_db library &quot;/usr/lib/libthread_db.so.1&quot;.
[New Thread 0xb7ca9b40 (LWP 1288)]
[Thread 0xb7ca9b40 (LWP 1288) exited]
process 1284 is executing new program: /usr/bin/wine-preloader
fixme:d3d:init_driver_info Unable to find a driver/device info for
vendor_id=0x10de device_id=0x421 for driver_model=2
fixme:win:EnumDisplayDevicesW ((null),0,0x7c7f608,0x00000000), stub!
fixme:d3d_texture:wined3d_texture_generate_mipmaps texture 0x1b55a0 stub!
[New LWP 1320]

Program received signal SIGUSR1, User defined signal 1.
[Switching to LWP 1320]
0xb7fff424 in ?? ()
(gdb) #0  0xb7fff424 in ?? ()
#1  0xb7e84d08 in ?? ()
#2  0xb7dc13fe in ?? ()
(gdb) quit
A debugging session is active.

    Inferior 1 [process 1284] will be killed.

Quit anyway? (y or n) [answered Y; input not from terminal]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351805423.FE80630.22383--

--===============2077085165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2077085165==--
