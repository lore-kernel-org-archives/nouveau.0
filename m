From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73200] New: vdpau-GL interop fails due to different
 screen objects
Date: Wed, 01 Jan 2014 05:41:46 +0000
Message-ID: <bug-73200-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0596986098=="
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


--===============0596986098==
Content-Type: multipart/alternative; boundary="1388554906.D801D0.27284"; charset="us-ascii"


--1388554906.D801D0.27284
Date: Wed, 1 Jan 2014 05:41:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73200

          Priority: medium
            Bug ID: 73200
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: vdpau-GL interop fails due to different screen objects
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: ystreet00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: 10.0
         Component: Drivers/DRI/nouveau
           Product: Mesa

Basically I'm trying out the GL_NV_vdpau_interop extension and it's failing
with GL_INVALID_OPERATION inside mesa/state_tracker/st_vdpau.c:121
st_vdpau_map_surface() because the GL screen and the vdpau screen are
different.

Things I've tried:
 - Straight vdpau/x11 (no GL) - works nicely
 - #if 0 the screen equal check - Fails with 'Kernel rejected pushbuf'.  From
this I made the assumption that the screen represents some gpu context and thus
the object space that is addressable.  Also what I gathered from the libdrm
code.
 - Copying the fd hash table from the radeon_drm_winsys_create() into
nouveau_drm_screen_create().  That fails to work because vl_screen_create() and
dri2CreateScreen() both create seperate drm fds resulting in different entries
in the hash table (that's not the same - see next point)
 - static screen singleton (ignoring subsequent drm fds) however
nouveau_drm_screen_create is duplicated in both
/usr/lib/vdpau/libvdpau_nouveau.so and /usr/lib/xorg/modules/dri/nouveau_dri.so
and thus have different locations.

So all of my attempts to get the screens the same have so far failed and I am
not all that familiar with mesa internals to suggest a solution :)

Versions:
$ uname -a
Linux matt-arch 3.12.6-1-ARCH #1 SMP PREEMPT Fri Dec 20 19:39:00 CET 2013
x86_64 GNU/Linux
$ pacman -Si mesa | grep Version
Version        : 10.0.1-1
$ pacman -Si libdrm | grep Version
Version        : 2.4.50-1

Some logs follow.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1388554906.D801D0.27284
Date: Wed, 1 Jan 2014 05:41:46 +0000
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
   title="NEW --- - vdpau-GL interop fails due to different screen objects"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73200">73200</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>vdpau-GL interop fails due to different screen objects
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
          <td>ystreet00&#64;gmail.com
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
          <td>10.0
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
        <pre>Basically I'm trying out the GL_NV_vdpau_interop extension and it's failing
with GL_INVALID_OPERATION inside mesa/state_tracker/st_vdpau.c:121
st_vdpau_map_surface() because the GL screen and the vdpau screen are
different.

Things I've tried:
 - Straight vdpau/x11 (no GL) - works nicely
 - #if 0 the screen equal check - Fails with 'Kernel rejected pushbuf'.  From
this I made the assumption that the screen represents some gpu context and thus
the object space that is addressable.  Also what I gathered from the libdrm
code.
 - Copying the fd hash table from the radeon_drm_winsys_create() into
nouveau_drm_screen_create().  That fails to work because vl_screen_create() and
dri2CreateScreen() both create seperate drm fds resulting in different entries
in the hash table (that's not the same - see next point)
 - static screen singleton (ignoring subsequent drm fds) however
nouveau_drm_screen_create is duplicated in both
/usr/lib/vdpau/libvdpau_nouveau.so and /usr/lib/xorg/modules/dri/nouveau_dri.so
and thus have different locations.

So all of my attempts to get the screens the same have so far failed and I am
not all that familiar with mesa internals to suggest a solution :)

Versions:
$ uname -a
Linux matt-arch 3.12.6-1-ARCH #1 SMP PREEMPT Fri Dec 20 19:39:00 CET 2013
x86_64 GNU/Linux
$ pacman -Si mesa | grep Version
Version        : 10.0.1-1
$ pacman -Si libdrm | grep Version
Version        : 2.4.50-1

Some logs follow.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1388554906.D801D0.27284--

--===============0596986098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0596986098==--
