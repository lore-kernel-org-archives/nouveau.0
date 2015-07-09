From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91284] New: xf86-video-nouveau fails to build with
	latest xorg
Date: Thu, 09 Jul 2015 15:30:06 +0000
Message-ID: <bug-91284-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0448143149=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0448143149==
Content-Type: multipart/alternative; boundary="1436455807.6b231.1759"; charset="UTF-8"


--1436455807.6b231.1759
Date: Thu, 9 Jul 2015 15:30:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91284

            Bug ID: 91284
           Summary: xf86-video-nouveau fails to build with latest xorg
           Product: xorg
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: vrutkovs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

../../src/nv_driver.c: In function 'redisplay_dirty':
../../src/nv_driver.c:560:2: error: too many arguments to function
'PixmapSyncDirtyHelper'
  PixmapSyncDirtyHelper(dirty, &pixregion);
  ^
In file included from /usr/include/xorg/gc.h:54:0,
                 from /usr/include/xorg/dix.h:51,
                 from /usr/include/xorg/privates.h:151,
                 from /usr/include/xorg/cursor.h:53,
                 from /usr/include/xorg/scrnintstr.h:53,
                 from /usr/include/xorg/xf86str.h:39,
                 from /usr/include/xorg/xf86.h:44,
                 from ../../src/nv_include.h:15,
                 from ../../src/nv_driver.c:26:
/usr/include/xorg/pixmap.h:131:1: note: declared here
 PixmapSyncDirtyHelper(PixmapDirtyUpdatePtr dirty);
 ^
Makefile:619: recipe for target 'nv_driver.lo' failed


See https://bugs.freedesktop.org/show_bug.cgi?id=91276 for similar break in
radeon driver

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436455807.6b231.1759
Date: Thu, 9 Jul 2015 15:30:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - xf86-video-nouveau fails to build with latest xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91284">91284</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>xf86-video-nouveau fails to build with latest xorg
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>vrutkovs&#64;redhat.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>../../src/nv_driver.c: In function 'redisplay_dirty':
../../src/nv_driver.c:560:2: error: too many arguments to function
'PixmapSyncDirtyHelper'
  PixmapSyncDirtyHelper(dirty, &amp;pixregion);
  ^
In file included from /usr/include/xorg/gc.h:54:0,
                 from /usr/include/xorg/dix.h:51,
                 from /usr/include/xorg/privates.h:151,
                 from /usr/include/xorg/cursor.h:53,
                 from /usr/include/xorg/scrnintstr.h:53,
                 from /usr/include/xorg/xf86str.h:39,
                 from /usr/include/xorg/xf86.h:44,
                 from ../../src/nv_include.h:15,
                 from ../../src/nv_driver.c:26:
/usr/include/xorg/pixmap.h:131:1: note: declared here
 PixmapSyncDirtyHelper(PixmapDirtyUpdatePtr dirty);
 ^
Makefile:619: recipe for target 'nv_driver.lo' failed


See <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - xf86-video-ati (git version) fails to build"
   href="show_bug.cgi?id=91276">https://bugs.freedesktop.org/show_bug.cgi?id=91276</a> for similar break in
radeon driver</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436455807.6b231.1759--

--===============0448143149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0448143149==--
