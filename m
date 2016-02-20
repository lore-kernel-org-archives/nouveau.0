From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94225] New: Mesa crash with "nouveau" driver and
	Minetest
Date: Sat, 20 Feb 2016 03:03:47 +0000
Message-ID: <bug-94225-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0984430256=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0984430256==
Content-Type: multipart/alternative; boundary="14559374270.b16Ec6285.17018";
 charset="UTF-8"


--14559374270.b16Ec6285.17018
Date: Sat, 20 Feb 2016 03:03:47 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94225

            Bug ID: 94225
           Summary: Mesa crash with "nouveau" driver and Minetest
           Product: Mesa
           Version: 10.2
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: yugiohjcj-D/iA7guW19M@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Hello,

I remark that Minetest 0.4.13 is crashing often (about 1 time by hour) when I
am using the "nouveau" driver.
I have already reported this bug to Minetest [1].
As Minetest is using Irrlicht as its engine, I suspect Irrlicht to be a
possible cause of my problem.
For this reason, I have also reported this bug to Irrlicht [2].
But regarding the log, I also see that Mesa itself could be suspected as it is
present at the top of the backtrace.

Here is the crash log:

$ gdb minetest
GNU gdb (GDB) 7.6.1
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i486-slackware-linux".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /usr/bin/minetest...done.
(gdb) run
Starting program: /usr/bin/minetest 
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/libthread_db.so.1".
Automatically selecting world at [/home/yugiohjcj/.minetest/worlds/toto]
AL lib: alcOpenDevice: Option 'format' is deprecated, please use 'channels' and
'sample-type'
[New Thread 0xb1517b40 (LWP 7062)]
[New Thread 0xacbfeb40 (LWP 7063)]
[New Thread 0xac3feb40 (LWP 7064)]
[New Thread 0xab7ffb40 (LWP 7065)]
[New Thread 0xaafffb40 (LWP 7066)]
[New Thread 0xaa7ffb40 (LWP 7067)]
[Thread 0xacbfeb40 (LWP 7063) exited]
[Thread 0xb1517b40 (LWP 7062) exited]
[Thread 0xac3feb40 (LWP 7064) exited]
[Thread 0xaafffb40 (LWP 7066) exited]
[Thread 0xaa7ffb40 (LWP 7067) exited]
[Thread 0xab7ffb40 (LWP 7065) exited]
AL lib: alcOpenDevice: Option 'format' is deprecated, please use 'channels' and
'sample-type'
[New Thread 0xaa7ffb40 (LWP 7068)]
[New Thread 0xaafffb40 (LWP 7069)]
[New Thread 0xab7ffb40 (LWP 7070)]
[New Thread 0xac3feb40 (LWP 7071)]
[New Thread 0xb1517b40 (LWP 7072)]
[New Thread 0xa7bf0b40 (LWP 7073)]
2016-02-19 17:48:30: ACTION[main]: Irrlicht: Could not open file of texture:
character.png
2016-02-19 17:48:30: ACTION[main]: Irrlicht: Could not open file of texture:
character.png
2016-02-19 17:49:41: ACTION[main]: Irrlicht: Could not open file of texture:
character.png
2016-02-19 17:49:41: ACTION[main]: Irrlicht: Could not open file of texture:
character.png
2016-02-19 17:53:45: ACTION[main]: Irrlicht: Could not open file of texture:
character.png
2016-02-19 17:53:45: ACTION[main]: Irrlicht: Could not open file of texture:
character.png

Program received signal SIGSEGV, Segmentation fault.
0xb5cebcf8 in PUSH_DATA (push=0x8614038, data=268496912)
    at ./nouveau_winsys.h:35
35  ./nouveau_winsys.h: No such file or directory.
(gdb) bt
#0  0xb5cebcf8 in PUSH_DATA (push=0x8614038, data=268496912)
    at ./nouveau_winsys.h:35
#1  nvc0_screen_fence_emit (pscreen=0x8613cf8, sequence=0xe0faa30)
    at nvc0/nvc0_screen.c:491
#2  0xb5c16747 in nouveau_fence_emit (fence=0xe0faa20) at nouveau_fence.c:102
#3  0xb5c16a08 in nouveau_fence_next (screen=screen@entry=0x8613cf8)
    at nouveau_fence.c:227
#4  0xb5ce9a83 in nvc0_default_kick_notify (push=0x8614038)
    at nvc0/nvc0_context.c:170
#5  0xb5b8a04e in pushbuf_submit (push=push@entry=0x8614038, 
    chan=<optimized out>, chan=<optimized out>) at pushbuf.c:325
#6  0xb5b8a39a in pushbuf_flush (push=push@entry=0x8614038) at pushbuf.c:402
#7  0xb5b8ad27 in nouveau_pushbuf_space (push=push@entry=0x8614038, dwords=0, 
    relocs=0, pushes=<optimized out>, pushes@entry=0) at pushbuf.c:676
#8  0xb5b8ade3 in pushbuf_validate (push=0x8614038, retry=<optimized out>)
    at pushbuf.c:492
#9  0xb5b8b13e in nouveau_pushbuf_validate (push=0x8614038) at pushbuf.c:749
#10 0xb5cf3906 in nvc0_state_validate (nvc0=nvc0@entry=0x8625880, 
    mask=mask@entry=4294967295, words=words@entry=8)
    at nvc0/nvc0_state_validate.c:619
#11 0xb5cfdc1c in nvc0_draw_vbo (pipe=0x8625880, info=0xbfffdca0)
    at nvc0/nvc0_vbo.c:829
#12 0xb5f1d5c0 in cso_draw_vbo (cso=0x8692948, info=info@entry=0xbfffdca0)
---Type <return> to continue, or q <return> to quit---
    at cso_cache/cso_context.c:1428
#13 0xb5e468ba in st_draw_vbo (ctx=0x8650160, prims=0xbfffdd74, nr_prims=1, 
    ib=0xbfffdd64, index_bounds_valid=0 '\000', min_index=0, max_index=2431, 
    tfb_vertcount=0x0, indirect=0x0) at state_tracker/st_draw.c:276
#14 0xb5e1a7a0 in vbo_handle_primitive_restart (ctx=ctx@entry=0x8650160, 
    prim=prim@entry=0xbfffdd74, nr_prims=nr_prims@entry=1, 
    ib=ib@entry=0xbfffdd64, index_bounds_valid=0 '\000', 
    min_index=min_index@entry=4294967295, max_index=max_index@entry=4294967295)
    at vbo/vbo_exec_array.c:591
#15 0xb5e1be7c in vbo_validated_drawrangeelements (ctx=ctx@entry=0x8650160, 
    mode=mode@entry=4, index_bounds_valid=index_bounds_valid@entry=0 '\000', 
    start=start@entry=4294967295, end=end@entry=4294967295, 
    count=count@entry=3648, type=type@entry=5123, 
    indices=indices@entry=0x1717d500, basevertex=basevertex@entry=0, 
    numInstances=numInstances@entry=1, baseInstance=baseInstance@entry=0)
    at vbo/vbo_exec_array.c:1014
#16 0xb5e1c509 in vbo_exec_DrawElements (mode=4, count=3648, type=5123, 
    indices=0x1717d500) at vbo/vbo_exec_array.c:1164
#17 0xb7cb1820 in irr::video::COpenGLDriver::renderArray (this=0x868b8d0, 
    indexList=0x1717d500, primitiveCount=1216, 
    pType=irr::scene::EPT_TRIANGLES, iType=irr::video::EIT_16BIT)
    at COpenGLDriver.cpp:1743
#18 0xb7cb1372 in irr::video::COpenGLDriver::drawVertexPrimitiveList (
---Type <return> to continue, or q <return> to quit---
    this=0x868b8d0, vertices=0x1b312db0, vertexCount=2432, 
    indexList=0x1717d500, primitiveCount=1216, vType=irr::video::EVT_TANGENTS, 
    pType=irr::scene::EPT_TRIANGLES, iType=irr::video::EIT_16BIT)
    at COpenGLDriver.cpp:1586
#19 0xb7ca5ab2 in irr::video::CNullDriver::drawMeshBuffer (this=0x868b8d0, mb=
    0xc3ac3c0) at CNullDriver.cpp:1521
#20 0x08222581 in ClientMap::renderMap(irr::video::IVideoDriver*, int) ()
#21 0x08228ef4 in ClientMap::render() ()
#22 0xb7c638a9 in irr::scene::CSceneManager::drawAll (this=0x86e3880)
    at CSceneManager.cpp:1501
#23 0x082914e2 in draw_scene(irr::video::IVideoDriver*,
irr::scene::ISceneManager*, Camera&, Client&, LocalPlayer*, Hud&, Mapper&,
irr::gui::IGUIEnvironment*, std::vector<irr::core::aabbox3d<float>,
std::allocator<irr::core::aabbox3d<float> > >, irr::core::vector2d<unsigned
int> const&, irr::video::SColor, bool, bool)
    ()
#24 0x082ca1c9 in Game::updateFrame(std::vector<irr::core::aabbox3d<float>,
std::allocator<irr::core::aabbox3d<float> > >&, ProfilerGraph*, RunStats*,
GameRunData*, float, VolatileRunFlags const&, CameraOrientation const&) ()
#25 0x082ce688 in Game::run() ()
#26 0x082cee6a in the_game(bool*, bool, InputHandler*, irr::IrrlichtDevice*,
std::string const&, std::string const&, std::string const&, std::string const&,
unsigned short, std::string&, ChatBackend&, bool*, SubgameSpec const&, bool) ()
#27 0x080e8e3c in ClientLauncher::run(GameParams&, Settings const&) ()
---Type <return> to continue, or q <return> to quit---
#28 0x080e1c39 in main ()
(gdb) quit
A debugging session is active.

    Inferior 1 [process 7058] will be killed.

Quit anyway? (y or n) y

Here is my configuration:

    minetest-0.4.13
    mesa-10.2.5
    libdrm-2.4.56
    xf86-video-nouveau-1.0.11
    irrlicht-1.8.1

I let you verify through this log that Mesa is or not the cause of the crash.
If you have a better/smaller example than Minetest/Irrlicht to reproduce the
bug please tell me.

Thank you.
Best regards.

[1] https://github.com/minetest/minetest/issues/3744
[2] https://sourceforge.net/p/irrlicht/bugs/438

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14559374270.b16Ec6285.17018
Date: Sat, 20 Feb 2016 03:03:47 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Mesa crash with &quot;nouveau&quot; driver and Minetest"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94225">94225</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Mesa crash with &quot;nouveau&quot; driver and Minetest
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.2
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>yugiohjcj&#64;1s.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello,

I remark that Minetest 0.4.13 is crashing often (about 1 time by hour) when I
am using the &quot;nouveau&quot; driver.
I have already reported this bug to Minetest [1].
As Minetest is using Irrlicht as its engine, I suspect Irrlicht to be a
possible cause of my problem.
For this reason, I have also reported this bug to Irrlicht [2].
But regarding the log, I also see that Mesa itself could be suspected as it is
present at the top of the backtrace.

Here is the crash log:

$ gdb minetest
GNU gdb (GDB) 7.6.1
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later &lt;<a href="http://gnu.org/licenses/gpl.html">http://gnu.org/licenses/gpl.html</a>&gt;
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type &quot;show copying&quot;
and &quot;show warranty&quot; for details.
This GDB was configured as &quot;i486-slackware-linux&quot;.
For bug reporting instructions, please see:
&lt;<a href="http://www.gnu.org/software/gdb/bugs/">http://www.gnu.org/software/gdb/bugs/</a>&gt;...
Reading symbols from /usr/bin/minetest...done.
(gdb) run
Starting program: /usr/bin/minetest 
[Thread debugging using libthread_db enabled]
Using host libthread_db library &quot;/lib/libthread_db.so.1&quot;.
Automatically selecting world at [/home/yugiohjcj/.minetest/worlds/toto]
AL lib: alcOpenDevice: Option 'format' is deprecated, please use 'channels' and
'sample-type'
[New Thread 0xb1517b40 (LWP 7062)]
[New Thread 0xacbfeb40 (LWP 7063)]
[New Thread 0xac3feb40 (LWP 7064)]
[New Thread 0xab7ffb40 (LWP 7065)]
[New Thread 0xaafffb40 (LWP 7066)]
[New Thread 0xaa7ffb40 (LWP 7067)]
[Thread 0xacbfeb40 (LWP 7063) exited]
[Thread 0xb1517b40 (LWP 7062) exited]
[Thread 0xac3feb40 (LWP 7064) exited]
[Thread 0xaafffb40 (LWP 7066) exited]
[Thread 0xaa7ffb40 (LWP 7067) exited]
[Thread 0xab7ffb40 (LWP 7065) exited]
AL lib: alcOpenDevice: Option 'format' is deprecated, please use 'channels' and
'sample-type'
[New Thread 0xaa7ffb40 (LWP 7068)]
[New Thread 0xaafffb40 (LWP 7069)]
[New Thread 0xab7ffb40 (LWP 7070)]
[New Thread 0xac3feb40 (LWP 7071)]
[New Thread 0xb1517b40 (LWP 7072)]
[New Thread 0xa7bf0b40 (LWP 7073)]
2016-02-19 17:48:30: ACTION[main]: Irrlicht: Could not open file of texture:
character.png
2016-02-19 17:48:30: ACTION[main]: Irrlicht: Could not open file of texture:
character.png
2016-02-19 17:49:41: ACTION[main]: Irrlicht: Could not open file of texture:
character.png
2016-02-19 17:49:41: ACTION[main]: Irrlicht: Could not open file of texture:
character.png
2016-02-19 17:53:45: ACTION[main]: Irrlicht: Could not open file of texture:
character.png
2016-02-19 17:53:45: ACTION[main]: Irrlicht: Could not open file of texture:
character.png

Program received signal SIGSEGV, Segmentation fault.
0xb5cebcf8 in PUSH_DATA (push=0x8614038, data=268496912)
    at ./nouveau_winsys.h:35
35  ./nouveau_winsys.h: No such file or directory.
(gdb) bt
#0  0xb5cebcf8 in PUSH_DATA (push=0x8614038, data=268496912)
    at ./nouveau_winsys.h:35
#1  nvc0_screen_fence_emit (pscreen=0x8613cf8, sequence=0xe0faa30)
    at nvc0/nvc0_screen.c:491
#2  0xb5c16747 in nouveau_fence_emit (fence=0xe0faa20) at nouveau_fence.c:102
#3  0xb5c16a08 in nouveau_fence_next (screen=screen&#64;entry=0x8613cf8)
    at nouveau_fence.c:227
#4  0xb5ce9a83 in nvc0_default_kick_notify (push=0x8614038)
    at nvc0/nvc0_context.c:170
#5  0xb5b8a04e in pushbuf_submit (push=push&#64;entry=0x8614038, 
    chan=&lt;optimized out&gt;, chan=&lt;optimized out&gt;) at pushbuf.c:325
#6  0xb5b8a39a in pushbuf_flush (push=push&#64;entry=0x8614038) at pushbuf.c:402
#7  0xb5b8ad27 in nouveau_pushbuf_space (push=push&#64;entry=0x8614038, dwords=0, 
    relocs=0, pushes=&lt;optimized out&gt;, pushes&#64;entry=0) at pushbuf.c:676
#8  0xb5b8ade3 in pushbuf_validate (push=0x8614038, retry=&lt;optimized out&gt;)
    at pushbuf.c:492
#9  0xb5b8b13e in nouveau_pushbuf_validate (push=0x8614038) at pushbuf.c:749
#10 0xb5cf3906 in nvc0_state_validate (nvc0=nvc0&#64;entry=0x8625880, 
    mask=mask&#64;entry=4294967295, words=words&#64;entry=8)
    at nvc0/nvc0_state_validate.c:619
#11 0xb5cfdc1c in nvc0_draw_vbo (pipe=0x8625880, info=0xbfffdca0)
    at nvc0/nvc0_vbo.c:829
#12 0xb5f1d5c0 in cso_draw_vbo (cso=0x8692948, info=info&#64;entry=0xbfffdca0)
---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---
    at cso_cache/cso_context.c:1428
#13 0xb5e468ba in st_draw_vbo (ctx=0x8650160, prims=0xbfffdd74, nr_prims=1, 
    ib=0xbfffdd64, index_bounds_valid=0 '\000', min_index=0, max_index=2431, 
    tfb_vertcount=0x0, indirect=0x0) at state_tracker/st_draw.c:276
#14 0xb5e1a7a0 in vbo_handle_primitive_restart (ctx=ctx&#64;entry=0x8650160, 
    prim=prim&#64;entry=0xbfffdd74, nr_prims=nr_prims&#64;entry=1, 
    ib=ib&#64;entry=0xbfffdd64, index_bounds_valid=0 '\000', 
    min_index=min_index&#64;entry=4294967295, max_index=max_index&#64;entry=4294967295)
    at vbo/vbo_exec_array.c:591
#15 0xb5e1be7c in vbo_validated_drawrangeelements (ctx=ctx&#64;entry=0x8650160, 
    mode=mode&#64;entry=4, index_bounds_valid=index_bounds_valid&#64;entry=0 '\000', 
    start=start&#64;entry=4294967295, end=end&#64;entry=4294967295, 
    count=count&#64;entry=3648, type=type&#64;entry=5123, 
    indices=indices&#64;entry=0x1717d500, basevertex=basevertex&#64;entry=0, 
    numInstances=numInstances&#64;entry=1, baseInstance=baseInstance&#64;entry=0)
    at vbo/vbo_exec_array.c:1014
#16 0xb5e1c509 in vbo_exec_DrawElements (mode=4, count=3648, type=5123, 
    indices=0x1717d500) at vbo/vbo_exec_array.c:1164
#17 0xb7cb1820 in irr::video::COpenGLDriver::renderArray (this=0x868b8d0, 
    indexList=0x1717d500, primitiveCount=1216, 
    pType=irr::scene::EPT_TRIANGLES, iType=irr::video::EIT_16BIT)
    at COpenGLDriver.cpp:1743
#18 0xb7cb1372 in irr::video::COpenGLDriver::drawVertexPrimitiveList (
---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---
    this=0x868b8d0, vertices=0x1b312db0, vertexCount=2432, 
    indexList=0x1717d500, primitiveCount=1216, vType=irr::video::EVT_TANGENTS, 
    pType=irr::scene::EPT_TRIANGLES, iType=irr::video::EIT_16BIT)
    at COpenGLDriver.cpp:1586
#19 0xb7ca5ab2 in irr::video::CNullDriver::drawMeshBuffer (this=0x868b8d0, mb=
    0xc3ac3c0) at CNullDriver.cpp:1521
#20 0x08222581 in ClientMap::renderMap(irr::video::IVideoDriver*, int) ()
#21 0x08228ef4 in ClientMap::render() ()
#22 0xb7c638a9 in irr::scene::CSceneManager::drawAll (this=0x86e3880)
    at CSceneManager.cpp:1501
#23 0x082914e2 in draw_scene(irr::video::IVideoDriver*,
irr::scene::ISceneManager*, Camera&amp;, Client&amp;, LocalPlayer*, Hud&amp;, Mapper&amp;,
irr::gui::IGUIEnvironment*, std::vector&lt;irr::core::aabbox3d&lt;float&gt;,
std::allocator&lt;irr::core::aabbox3d&lt;float&gt; &gt; &gt;, irr::core::vector2d&lt;unsigned
int&gt; const&amp;, irr::video::SColor, bool, bool)
    ()
#24 0x082ca1c9 in Game::updateFrame(std::vector&lt;irr::core::aabbox3d&lt;float&gt;,
std::allocator&lt;irr::core::aabbox3d&lt;float&gt; &gt; &gt;&amp;, ProfilerGraph*, RunStats*,
GameRunData*, float, VolatileRunFlags const&amp;, CameraOrientation const&amp;) ()
#25 0x082ce688 in Game::run() ()
#26 0x082cee6a in the_game(bool*, bool, InputHandler*, irr::IrrlichtDevice*,
std::string const&amp;, std::string const&amp;, std::string const&amp;, std::string const&amp;,
unsigned short, std::string&amp;, ChatBackend&amp;, bool*, SubgameSpec const&amp;, bool) ()
#27 0x080e8e3c in ClientLauncher::run(GameParams&amp;, Settings const&amp;) ()
---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---
#28 0x080e1c39 in main ()
(gdb) quit
A debugging session is active.

    Inferior 1 [process 7058] will be killed.

Quit anyway? (y or n) y

Here is my configuration:

    minetest-0.4.13
    mesa-10.2.5
    libdrm-2.4.56
    xf86-video-nouveau-1.0.11
    irrlicht-1.8.1

I let you verify through this log that Mesa is or not the cause of the crash.
If you have a better/smaller example than Minetest/Irrlicht to reproduce the
bug please tell me.

Thank you.
Best regards.

[1] <a href="https://github.com/minetest/minetest/issues/3744">https://github.com/minetest/minetest/issues/3744</a>
[2] <a href="https://sourceforge.net/p/irrlicht/bugs/438">https://sourceforge.net/p/irrlicht/bugs/438</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14559374270.b16Ec6285.17018--

--===============0984430256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0984430256==--
