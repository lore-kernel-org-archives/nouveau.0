From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61879] New: Python binding of gbm's
 gbm_create_device fail to create_device
Date: Tue, 05 Mar 2013 23:08:20 +0000
Message-ID: <bug-61879-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0555043466=="
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


--===============0555043466==
Content-Type: multipart/alternative; boundary="1362524900.567DBC1D0.27411"; charset="us-ascii"


--1362524900.567DBC1D0.27411
Date: Tue, 5 Mar 2013 23:08:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61879

          Priority: medium
            Bug ID: 61879
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Python binding of gbm's gbm_create_device fail to
                    create_device
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: amirouche.boubekki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 75991
  --> https://bugs.freedesktop.org/attachment.cgi?id=75991&action=edit
example script with cffi

I bound gbm_create_device with both cffi and cython of gbm_create_device and
they both fail at the same place

error: Program received signal SIGSEGV, Segmentation fault.

stacktrace:

#0  0x00007fffee18af07 in PUSH_DATA (push=0x13c0410, data=536952832) at
../../../../src/gallium/drivers/nouveau/nouveau_winsys.h:35
#1  0x00007fffee18b0b2 in BEGIN_NVC0 (push=0x13c0410, subc=2, mthd=0, size=1)
at nvc0_winsys.h:112
#2  0x00007fffee18c0c1 in nvc0_screen_create (dev=0x15f8690) at
nvc0_screen.c:496
#3  0x00007fffee0c4c3b in nouveau_drm_screen_create (fd=7) at
nouveau_drm_winsys.c:46
#4  0x00007fffeb0a6943 in create_screen (fd=7) at pipe_nouveau.c:11
#5  0x00007fffec4e5fdb in pipe_loader_drm_create_screen (dev=0x1750130,
library_paths=0x7fffecec0cf2 "/usr/lib64/gallium-pipe") at
pipe_loader_drm.c:270
#6  0x00007fffec4e570e in pipe_loader_create_screen (dev=0x1750130,
library_paths=0x7fffecec0cf2 "/usr/lib64/gallium-pipe") at pipe_loader.c:68
#7  0x00007fffec4e5539 in gallium_screen_create (gdrm=0x174fff0) at gbm.c:60
#8  0x00007fffec4e69a8 in gbm_gallium_drm_device_create (fd=7) at gbm_drm.c:248
#9  0x00007fffef338370 in _gbm_create_device (fd=7) at main/backend.c:124

version: 9.1 & git
linux: 3.8.2 gentoo

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362524900.567DBC1D0.27411
Date: Tue, 5 Mar 2013 23:08:20 +0000
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
   title="NEW --- - Python binding of gbm's gbm_create_device fail to create_device"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61879">61879</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Python binding of gbm's gbm_create_device fail to create_device
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>amirouche.boubekki&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=75991" name="attach_75991" title="example script with cffi">attachment 75991</a> <a href="attachment.cgi?id=75991&amp;action=edit" title="example script with cffi">[details]</a></span>
example script with cffi

I bound gbm_create_device with both cffi and cython of gbm_create_device and
they both fail at the same place

error: Program received signal SIGSEGV, Segmentation fault.

stacktrace:

#0  0x00007fffee18af07 in PUSH_DATA (push=0x13c0410, data=536952832) at
../../../../src/gallium/drivers/nouveau/nouveau_winsys.h:35
#1  0x00007fffee18b0b2 in BEGIN_NVC0 (push=0x13c0410, subc=2, mthd=0, size=1)
at nvc0_winsys.h:112
#2  0x00007fffee18c0c1 in nvc0_screen_create (dev=0x15f8690) at
nvc0_screen.c:496
#3  0x00007fffee0c4c3b in nouveau_drm_screen_create (fd=7) at
nouveau_drm_winsys.c:46
#4  0x00007fffeb0a6943 in create_screen (fd=7) at pipe_nouveau.c:11
#5  0x00007fffec4e5fdb in pipe_loader_drm_create_screen (dev=0x1750130,
library_paths=0x7fffecec0cf2 &quot;/usr/lib64/gallium-pipe&quot;) at
pipe_loader_drm.c:270
#6  0x00007fffec4e570e in pipe_loader_create_screen (dev=0x1750130,
library_paths=0x7fffecec0cf2 &quot;/usr/lib64/gallium-pipe&quot;) at pipe_loader.c:68
#7  0x00007fffec4e5539 in gallium_screen_create (gdrm=0x174fff0) at gbm.c:60
#8  0x00007fffec4e69a8 in gbm_gallium_drm_device_create (fd=7) at gbm_drm.c:248
#9  0x00007fffef338370 in _gbm_create_device (fd=7) at main/backend.c:124

version: 9.1 &amp; git
linux: 3.8.2 gentoo</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362524900.567DBC1D0.27411--

--===============0555043466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0555043466==--
