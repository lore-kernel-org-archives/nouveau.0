From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89969] New: vaDriverInit fails with gallium/nouveau
	driver
Date: Thu, 09 Apr 2015 15:14:13 +0000
Message-ID: <bug-89969-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1443652413=="
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


--===============1443652413==
Content-Type: multipart/alternative; boundary="1428592453.EcFbAd5f0.28412"; charset="UTF-8"


--1428592453.EcFbAd5f0.28412
Date: Thu, 9 Apr 2015 15:14:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89969

            Bug ID: 89969
           Summary: vaDriverInit fails with gallium/nouveau driver
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: julien.isorce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 114987
  --> https://bugs.freedesktop.org/attachment.cgi?id=114987&action=edit
build: enable va with nouveau driver

When running vainfo:

libva info: VA-API version 0.37.1
libva info: va_getDriverName() returns 0
libva info: User requested driver 'gallium'
libva info: Trying to open /usr/local/lib/dri/gallium_drv_video.so
libva info: Found init function __vaDriverInit_0_37
libva error: /usr/local/lib/dri/gallium_drv_video.so init failed
libva info: va_openDriver() returns 2
vaInitialize failed with error code 2 (resource allocation failed),exit

"vl_screen_create" calls "dd_create_screen" which returns NULL because the
block

#if defined(GALLIUM_NOUVEAU)
   if (strcmp(driver_name, "nouveau") == 0)
      return pipe_nouveau_create_screen(fd);
   else
#endif

is not compiled for va target. Indeed GALLIUM_NOUVEAU is not defined at this
point. See following patch.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1428592453.EcFbAd5f0.28412
Date: Thu, 9 Apr 2015 15:14:13 +0000
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
   title="NEW - vaDriverInit fails with gallium/nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89969">89969</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>vaDriverInit fails with gallium/nouveau driver
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
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
          <td>julien.isorce&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=114987" name="attach_114987" title="build: enable va with nouveau driver">attachment 114987</a> <a href="attachment.cgi?id=114987&amp;action=edit" title="build: enable va with nouveau driver">[details]</a></span>
build: enable va with nouveau driver

When running vainfo:

libva info: VA-API version 0.37.1
libva info: va_getDriverName() returns 0
libva info: User requested driver 'gallium'
libva info: Trying to open /usr/local/lib/dri/gallium_drv_video.so
libva info: Found init function __vaDriverInit_0_37
libva error: /usr/local/lib/dri/gallium_drv_video.so init failed
libva info: va_openDriver() returns 2
vaInitialize failed with error code 2 (resource allocation failed),exit

&quot;vl_screen_create&quot; calls &quot;dd_create_screen&quot; which returns NULL because the
block

#if defined(GALLIUM_NOUVEAU)
   if (strcmp(driver_name, &quot;nouveau&quot;) == 0)
      return pipe_nouveau_create_screen(fd);
   else
#endif

is not compiled for va target. Indeed GALLIUM_NOUVEAU is not defined at this
point. See following patch.</pre>
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

--1428592453.EcFbAd5f0.28412--

--===============1443652413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1443652413==--
