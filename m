From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56546] New: crash at the second render when applying
 gamma correction
Date: Mon, 29 Oct 2012 21:23:24 +0000
Message-ID: <bug-56546-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0948991828=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0948991828==
Content-Type: multipart/alternative; boundary="1351545804.b3666dD0.25342"; charset="us-ascii"


--1351545804.b3666dD0.25342
Date: Mon, 29 Oct 2012 21:23:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56546

          Priority: medium
            Bug ID: 56546
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: crash at the second render when applying gamma
                    correction
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: yves-RFxl5bZtqS5Wk0Htik3J/w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 8.0
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 69256
  --> https://bugs.freedesktop.org/attachment.cgi?id=69256&action=edit
example of the crash

Here a very simple program which illustrate a bug in
driver 2.1 Mesa 8.0.4 when applying a gamma value with opengl.

(The program is OK with driver NVIDIA).

In attachment, the file utc24.tga used by the program glut_gamma_bug.cpp.

Compile the program with the command:

g++ -L/usr/lib64 -lGL -lGLU -lglut -lX11 -lXi -lxcb-glx -lxcb-xlib -ldl
glut_gamma_bug.cpp

Start it with: ./a.out

It will open a small window with an image composed of vertical strips.

Press the enter key (it apply a gamma correction of 3 to the image):

a) it will print a message: KEY_ENTER
b) it will print another message: current error GL: no error
c) the same image will be brightness
d) at the second message: current error GL: no error, it will crash


Crash in:

==17340== Invalid read of size 4
==17340==    at 0xE5D4ABE: set_sampler_views.isra.2 (u_atomic.h:62)
==17340==    by 0xE5B72E8: draw_textured_quad.isra.8 (st_cb_drawpixels.c:777)
==17340==    by 0xE5B9596: st_DrawPixels (st_cb_drawpixels.c:1156)
==17340==    by 0xE56BE98: _mesa_DrawPixels (drawpix.c:131)

=17340==  Address 0x101a95b0 is 0 bytes inside a block of size 96 free'd
==17340==    at 0x4C2A5C6: free (vg_replace_malloc.c:446)
==17340==    by 0xE5B95FB: st_DrawPixels (u_inlines.h:134)
==17340==    by 0xE56BE98: _mesa_DrawPixels (drawpix.c:131)


Thanks.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351545804.b3666dD0.25342
Date: Mon, 29 Oct 2012 21:23:24 +0000
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
   title="NEW --- - crash at the second render when applying gamma correction"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56546">56546</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>crash at the second render when applying gamma correction
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>yves&#64;3delight.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>8.0
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
        <pre>Created <span class=""><a href="attachment.cgi?id=69256" name="attach_69256" title="example of the crash">attachment 69256</a> <a href="attachment.cgi?id=69256&amp;action=edit" title="example of the crash">[details]</a></span>
example of the crash

Here a very simple program which illustrate a bug in
driver 2.1 Mesa 8.0.4 when applying a gamma value with opengl.

(The program is OK with driver NVIDIA).

In attachment, the file utc24.tga used by the program glut_gamma_bug.cpp.

Compile the program with the command:

g++ -L/usr/lib64 -lGL -lGLU -lglut -lX11 -lXi -lxcb-glx -lxcb-xlib -ldl
glut_gamma_bug.cpp

Start it with: ./a.out

It will open a small window with an image composed of vertical strips.

Press the enter key (it apply a gamma correction of 3 to the image):

a) it will print a message: KEY_ENTER
b) it will print another message: current error GL: no error
c) the same image will be brightness
d) at the second message: current error GL: no error, it will crash


Crash in:

==17340== Invalid read of size 4
==17340==    at 0xE5D4ABE: set_sampler_views.isra.2 (u_atomic.h:62)
==17340==    by 0xE5B72E8: draw_textured_quad.isra.8 (st_cb_drawpixels.c:777)
==17340==    by 0xE5B9596: st_DrawPixels (st_cb_drawpixels.c:1156)
==17340==    by 0xE56BE98: _mesa_DrawPixels (drawpix.c:131)

=17340==  Address 0x101a95b0 is 0 bytes inside a block of size 96 free'd
==17340==    at 0x4C2A5C6: free (vg_replace_malloc.c:446)
==17340==    by 0xE5B95FB: st_DrawPixels (u_inlines.h:134)
==17340==    by 0xE56BE98: _mesa_DrawPixels (drawpix.c:131)


Thanks.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351545804.b3666dD0.25342--

--===============0948991828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0948991828==--
