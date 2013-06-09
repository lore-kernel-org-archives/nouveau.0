From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 65576] New: [NV11] no EGL with nouveau_vieux_dri -
	no DRI_IMAGE
Date: Sun, 09 Jun 2013 16:56:05 +0000
Message-ID: <bug-65576-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0627181878=="
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


--===============0627181878==
Content-Type: multipart/alternative; boundary="1370796965.1cBC0.13705"; charset="us-ascii"


--1370796965.1cBC0.13705
Date: Sun, 9 Jun 2013 16:56:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=65576

          Priority: medium
            Bug ID: 65576
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV11] no EGL with nouveau_vieux_dri - no DRI_IMAGE
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: chris-Tc38MJj1weLQT0dZR+AlfA@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

If I try and run any EGL program using the egl_dri2 driver, I get errors about
EGL_IMAGE. eg:

$ EGL_LOG_LEVEL=debug src/egl/opengl/eglinfo 
libEGL debug: Native platform type: x11 (build-time configuration)
libEGL debug: EGL search path is /usr/lib/egl
libEGL debug: added egl_dri2 to module array
libEGL debug: added egl_glx to module array
libEGL debug: DRI2: dlopen(/usr/lib/dri/nouveau_vieux_dri.so)
libEGL debug: DRI2: found extension `DRI_Core'
libEGL info: DRI2: found extension DRI_Core version 1
libEGL debug: DRI2: found extension `DRI_DRI2'
libEGL info: DRI2: found extension DRI_DRI2 version 3
libEGL debug: DRI2: found extension `DRI2_Flush'
libEGL info: DRI2: found extension DRI2_Flush version 3
libEGL debug: DRI2: found extension `DRI_TexBuffer'
libEGL info: DRI2: found extension DRI_TexBuffer version 2
libEGL debug: DRI2: found extension `DRI_CONFIG_QUERY'
libEGL fatal: DRI2: did not find extension DRI_IMAGE version 1

I'm running latest git kernel, drm, mesa, xf86-video-nouveau & mesa/demos.
Everything else from Fedora 18. My card is an NV11 [GeForce2 Go].

Desktop GL works at least a little (glxgears works). I do have problems with
slow rendering in some programs with the nouveau X driver which don't occur
with the modesetting X driver (eg: rectangle selection animation in GIMP causes
a big slow down), but the desktop is basically functional.

Ultimately, I'm trying to get wayland/weston working on my ancient hardware to
see if it's a feasible proposition. Functioning EGL is the current hurdle.

Chris.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1370796965.1cBC0.13705
Date: Sun, 9 Jun 2013 16:56:05 +0000
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
   title="NEW --- - [NV11] no EGL with nouveau_vieux_dri - no DRI_IMAGE"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65576">65576</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV11] no EGL with nouveau_vieux_dri - no DRI_IMAGE
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
          <td>chris&#64;edesix.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
        <pre>If I try and run any EGL program using the egl_dri2 driver, I get errors about
EGL_IMAGE. eg:

$ EGL_LOG_LEVEL=debug src/egl/opengl/eglinfo 
libEGL debug: Native platform type: x11 (build-time configuration)
libEGL debug: EGL search path is /usr/lib/egl
libEGL debug: added egl_dri2 to module array
libEGL debug: added egl_glx to module array
libEGL debug: DRI2: dlopen(/usr/lib/dri/nouveau_vieux_dri.so)
libEGL debug: DRI2: found extension `DRI_Core'
libEGL info: DRI2: found extension DRI_Core version 1
libEGL debug: DRI2: found extension `DRI_DRI2'
libEGL info: DRI2: found extension DRI_DRI2 version 3
libEGL debug: DRI2: found extension `DRI2_Flush'
libEGL info: DRI2: found extension DRI2_Flush version 3
libEGL debug: DRI2: found extension `DRI_TexBuffer'
libEGL info: DRI2: found extension DRI_TexBuffer version 2
libEGL debug: DRI2: found extension `DRI_CONFIG_QUERY'
libEGL fatal: DRI2: did not find extension DRI_IMAGE version 1

I'm running latest git kernel, drm, mesa, xf86-video-nouveau &amp; mesa/demos.
Everything else from Fedora 18. My card is an NV11 [GeForce2 Go].

Desktop GL works at least a little (glxgears works). I do have problems with
slow rendering in some programs with the nouveau X driver which don't occur
with the modesetting X driver (eg: rectangle selection animation in GIMP causes
a big slow down), but the desktop is basically functional.

Ultimately, I'm trying to get wayland/weston working on my ancient hardware to
see if it's a feasible proposition. Functioning EGL is the current hurdle.

Chris.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1370796965.1cBC0.13705--

--===============0627181878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0627181878==--
