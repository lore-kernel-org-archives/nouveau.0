From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71172] New: Segfault when running glxinfo. NV25GL
 [Quadro4 900 XGL]
Date: Sat, 02 Nov 2013 20:46:48 +0000
Message-ID: <bug-71172-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2128757434=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============2128757434==
Content-Type: multipart/alternative; boundary="1383425208.872D6EC0.10937"; charset="us-ascii"


--1383425208.872D6EC0.10937
Date: Sat, 2 Nov 2013 20:46:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71172

          Priority: medium
            Bug ID: 71172
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Segfault when running glxinfo. NV25GL [Quadro4 900
                    XGL]
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: simon-wM4F9T/ekXmXDw4h08c5KA@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 88535
  --> https://bugs.freedesktop.org/attachment.cgi?id=88535&action=edit
dmesg of machine

Using this PPA on top of 13.10 Xubuntu:
https://launchpad.net/~oibaf/+archive/graphics-drivers


When I run glxinfo, I get the following segfault.
--
simon@crankshaft:~$ gdb glxinfo 
GNU gdb (GDB) 7.6.1-ubuntu
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i686-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /usr/bin/glxinfo...(no debugging symbols found)...done.
(gdb) r
Starting program: /usr/bin/glxinfo 
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/i386-linux-gnu/libthread_db.so.1".
name of display: :0.0

Program received signal SIGSEGV, Segmentation fault.
0xb79ff07d in nouveau_init_screen2 (dri_screen=0x806d1f8)
    at ../../../../../../../src/mesa/drivers/dri/nouveau/nouveau_screen.c:105
105    ../../../../../../../src/mesa/drivers/dri/nouveau/nouveau_screen.c: No
such file or directory.
(gdb) bt
#0  0xb79ff07d in nouveau_init_screen2 (dri_screen=0x806d1f8)
    at ../../../../../../../src/mesa/drivers/dri/nouveau/nouveau_screen.c:105
#1  0xb78fa1f8 in dri2CreateNewScreen2 (scrn=0, fd=8, extensions=0x805bcd0, 
    driver_extensions=0xb7b81bbc <nouveau_driver_extensions>, 
    driver_configs=0xbfffeef0, data=0x805bda0)
    at ../../../../../../../src/mesa/drivers/dri/common/dri_util.c:156
#2  0xb7facde8 in ?? () from /usr/lib/i386-linux-gnu/mesa/libGL.so.1
#3  0xb7f85c1a in ?? () from /usr/lib/i386-linux-gnu/mesa/libGL.so.1
#4  0xb7f821ed in ?? () from /usr/lib/i386-linux-gnu/mesa/libGL.so.1
#5  0xb7f82a4e in glXChooseVisual ()
   from /usr/lib/i386-linux-gnu/mesa/libGL.so.1
#6  0x08049068 in ?? ()
#7  0xb7c9d905 in __libc_start_main (main=0x8048ef0, argc=1, 
    ubp_av=0xbffff294, init=0x804bff0, fini=0x804c060, 
    rtld_fini=0xb7fed5f0 <_dl_fini>, stack_end=0xbffff28c) at libc-start.c:260
#8  0x080499f5 in ?? ()
(gdb)
--

Dmesg attached, which show machine details. Any other info needed?
Simon

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383425208.872D6EC0.10937
Date: Sat, 2 Nov 2013 20:46:48 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Segfault when running glxinfo. NV25GL [Quadro4 900 XGL]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71172">71172</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Segfault when running glxinfo. NV25GL [Quadro4 900 XGL]
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>simon&#64;mungewell.org
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=88535" name="attach_88535" title="dmesg of machine">attachment 88535</a> <a href="attachment.cgi?id=88535&amp;action=edit" title="dmesg of machine">[details]</a></span>
dmesg of machine

Using this PPA on top of 13.10 Xubuntu:
<a href="https://launchpad.net/~oibaf/+archive/graphics-drivers">https://launchpad.net/~oibaf/+archive/graphics-drivers</a>


When I run glxinfo, I get the following segfault.
--
simon&#64;crankshaft:~$ gdb glxinfo 
GNU gdb (GDB) 7.6.1-ubuntu
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later &lt;<a href="http://gnu.org/licenses/gpl.html">http://gnu.org/licenses/gpl.html</a>&gt;
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type &quot;show copying&quot;
and &quot;show warranty&quot; for details.
This GDB was configured as &quot;i686-linux-gnu&quot;.
For bug reporting instructions, please see:
&lt;<a href="http://www.gnu.org/software/gdb/bugs/">http://www.gnu.org/software/gdb/bugs/</a>&gt;...
Reading symbols from /usr/bin/glxinfo...(no debugging symbols found)...done.
(gdb) r
Starting program: /usr/bin/glxinfo 
[Thread debugging using libthread_db enabled]
Using host libthread_db library &quot;/lib/i386-linux-gnu/libthread_db.so.1&quot;.
name of display: :0.0

Program received signal SIGSEGV, Segmentation fault.
0xb79ff07d in nouveau_init_screen2 (dri_screen=0x806d1f8)
    at ../../../../../../../src/mesa/drivers/dri/nouveau/nouveau_screen.c:105
105    ../../../../../../../src/mesa/drivers/dri/nouveau/nouveau_screen.c: No
such file or directory.
(gdb) bt
#0  0xb79ff07d in nouveau_init_screen2 (dri_screen=0x806d1f8)
    at ../../../../../../../src/mesa/drivers/dri/nouveau/nouveau_screen.c:105
#1  0xb78fa1f8 in dri2CreateNewScreen2 (scrn=0, fd=8, extensions=0x805bcd0, 
    driver_extensions=0xb7b81bbc &lt;nouveau_driver_extensions&gt;, 
    driver_configs=0xbfffeef0, data=0x805bda0)
    at ../../../../../../../src/mesa/drivers/dri/common/dri_util.c:156
#2  0xb7facde8 in ?? () from /usr/lib/i386-linux-gnu/mesa/libGL.so.1
#3  0xb7f85c1a in ?? () from /usr/lib/i386-linux-gnu/mesa/libGL.so.1
#4  0xb7f821ed in ?? () from /usr/lib/i386-linux-gnu/mesa/libGL.so.1
#5  0xb7f82a4e in glXChooseVisual ()
   from /usr/lib/i386-linux-gnu/mesa/libGL.so.1
#6  0x08049068 in ?? ()
#7  0xb7c9d905 in __libc_start_main (main=0x8048ef0, argc=1, 
    ubp_av=0xbffff294, init=0x804bff0, fini=0x804c060, 
    rtld_fini=0xb7fed5f0 &lt;_dl_fini&gt;, stack_end=0xbffff28c) at libc-start.c:260
#8  0x080499f5 in ?? ()
(gdb)
--

Dmesg attached, which show machine details. Any other info needed?
Simon</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383425208.872D6EC0.10937--

--===============2128757434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2128757434==--
