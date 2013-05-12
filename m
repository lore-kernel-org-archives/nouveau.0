From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64488] New: 3.10.0-rc1: WARNING: at
 drivers/gpu/drm/drm_crtc.c:84 drm_fb_helper_restore_fbdev_mode+0x10/0x40()
Date: Sun, 12 May 2013 10:15:30 +0000
Message-ID: <bug-64488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1464654562=="
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


--===============1464654562==
Content-Type: multipart/alternative; boundary="1368353730.AfEB11.15856"; charset="us-ascii"


--1368353730.AfEB11.15856
Date: Sun, 12 May 2013 10:15:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64488

          Priority: medium
            Bug ID: 64488
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: 3.10.0-rc1: WARNING: at drivers/gpu/drm/drm_crtc.c:84
                    drm_fb_helper_restore_fbdev_mode+0x10/0x40()
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 79192
  --> https://bugs.freedesktop.org/attachment.cgi?id=79192&action=edit
Last DRM warning (typed over from a photo). Note the tainted flags(!)

Since a few cycles, it seems that nouveau is preventing the kernel from
correctly displaying OOPS, BUGS and Warnings etc etc.

This is because the DRM system seems to provide warnings each time the kernel
kills X and moves to console to display these messages.

Today, I enabled some debug options and captured the last WARNING by this
system. NOTE: The oops is typed over from a camera photo, so it might not be
entirely accurate.

This is an 32bit UP system with the notorious(?) Geforce FX5200 (NV34). I
attached the Warning as an attachment.

I modified rsyslog to log directly to disk, hoping to capture more information.
When that happens, I will post more.

I think this is also a regression, usually I got errors about page faults and
stuff.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368353730.AfEB11.15856
Date: Sun, 12 May 2013 10:15:30 +0000
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
   title="NEW --- - 3.10.0-rc1: WARNING: at drivers/gpu/drm/drm_crtc.c:84 drm_fb_helper_restore_fbdev_mode+0x10/0x40()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64488">64488</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>3.10.0-rc1: WARNING: at drivers/gpu/drm/drm_crtc.c:84 drm_fb_helper_restore_fbdev_mode+0x10/0x40()
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
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
          <td>ronald645&#64;gmail.com
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
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=79192" name="attach_79192" title="Last DRM warning (typed over from a photo). Note the tainted flags(!)">attachment 79192</a> <a href="attachment.cgi?id=79192&amp;action=edit" title="Last DRM warning (typed over from a photo). Note the tainted flags(!)">[details]</a></span>
Last DRM warning (typed over from a photo). Note the tainted flags(!)

Since a few cycles, it seems that nouveau is preventing the kernel from
correctly displaying OOPS, BUGS and Warnings etc etc.

This is because the DRM system seems to provide warnings each time the kernel
kills X and moves to console to display these messages.

Today, I enabled some debug options and captured the last WARNING by this
system. NOTE: The oops is typed over from a camera photo, so it might not be
entirely accurate.

This is an 32bit UP system with the notorious(?) Geforce FX5200 (NV34). I
attached the Warning as an attachment.

I modified rsyslog to log directly to disk, hoping to capture more information.
When that happens, I will post more.

I think this is also a regression, usually I got errors about page faults and
stuff.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368353730.AfEB11.15856--

--===============1464654562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1464654562==--
