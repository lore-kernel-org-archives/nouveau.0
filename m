From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70875] New: [NVC0] NOUVEAU(0): [drm] failed to set
 drm interface version
Date: Fri, 25 Oct 2013 21:10:53 +0000
Message-ID: <bug-70875-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1219209094=="
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


--===============1219209094==
Content-Type: multipart/alternative; boundary="1382735453.447d104e1.17004"; charset="us-ascii"


--1382735453.447d104e1.17004
Date: Fri, 25 Oct 2013 21:10:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70875

          Priority: medium
            Bug ID: 70875
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVC0] NOUVEAU(0): [drm] failed to set drm interface
                    version
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: mszpak-5tc4TXWwyLM@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 88126
  --> https://bugs.freedesktop.org/attachment.cgi?id=88126&action=edit
/var/log/messages (a part)

I'm unable to run X server with nouveau dirver.

[   480.562] (II) [drm] nouveau interface version: 1.1.1
[   480.562] (II) Loading sub module "dri2"
[   480.562] (II) LoadModule: "dri2"
[   480.562] (II) Module "dri2" already built-in
[   480.615] (EE) NOUVEAU(0): [drm] failed to set drm interface version.
[   480.615] (EE) NOUVEAU(0): [drm] error opening the drm
[   480.615] (EE) NOUVEAU(0): 835: 
[   480.615] (II) UnloadModule: "nouveau"
[   480.615] (EE) Screen(s) found, but none have a usable configuration.

System specification:
Asus N43SN
GeForce GT 550M + integrated Intel card using i915 driver (NVidia Optimus)
kernel-3.11.6-200.fc19.x86_64
xorg-x11-drv-nouveau-1.0.9-1.fc19.x86_64
xorg-x11-server-Xorg-1.14.3-1.fc19.x86_64

$ /sbin/lspci | egrep 'VGA'
00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core
Processor Family Integrated Graphics Controller (rev 09)
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 550M]
(rev a1)

X server works fine with the intel driver. A try to run it with NVidia card and
the nouveau driver (using bumblebee bumblebee-3.2.1) causes mentioned error.

A comment in Fedora issue tracker suggests it is an issue with the nouveau
driver and newer kernels, but I wasn't able to find a confirmation in other
sources.
https://bugzilla.redhat.com/show_bug.cgi?id=964012#c13

Atached more detailed logs. I can provide more detailed information if needed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382735453.447d104e1.17004
Date: Fri, 25 Oct 2013 21:10:53 +0000
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
   title="NEW --- - [NVC0] NOUVEAU(0): [drm] failed to set drm interface version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70875">70875</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVC0] NOUVEAU(0): [drm] failed to set drm interface version
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>mszpak&#64;wp.pl
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
        <pre>Created <span class=""><a href="attachment.cgi?id=88126" name="attach_88126" title="/var/log/messages (a part)">attachment 88126</a> <a href="attachment.cgi?id=88126&amp;action=edit" title="/var/log/messages (a part)">[details]</a></span>
/var/log/messages (a part)

I'm unable to run X server with nouveau dirver.

[   480.562] (II) [drm] nouveau interface version: 1.1.1
[   480.562] (II) Loading sub module &quot;dri2&quot;
[   480.562] (II) LoadModule: &quot;dri2&quot;
[   480.562] (II) Module &quot;dri2&quot; already built-in
[   480.615] (EE) NOUVEAU(0): [drm] failed to set drm interface version.
[   480.615] (EE) NOUVEAU(0): [drm] error opening the drm
[   480.615] (EE) NOUVEAU(0): 835: 
[   480.615] (II) UnloadModule: &quot;nouveau&quot;
[   480.615] (EE) Screen(s) found, but none have a usable configuration.

System specification:
Asus N43SN
GeForce GT 550M + integrated Intel card using i915 driver (NVidia Optimus)
kernel-3.11.6-200.fc19.x86_64
xorg-x11-drv-nouveau-1.0.9-1.fc19.x86_64
xorg-x11-server-Xorg-1.14.3-1.fc19.x86_64

$ /sbin/lspci | egrep 'VGA'
00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core
Processor Family Integrated Graphics Controller (rev 09)
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 550M]
(rev a1)

X server works fine with the intel driver. A try to run it with NVidia card and
the nouveau driver (using bumblebee bumblebee-3.2.1) causes mentioned error.

A comment in Fedora issue tracker suggests it is an issue with the nouveau
driver and newer kernels, but I wasn't able to find a confirmation in other
sources.
<a href="https://bugzilla.redhat.com/show_bug.cgi?id=964012#c13">https://bugzilla.redhat.com/show_bug.cgi?id=964012#c13</a>

Atached more detailed logs. I can provide more detailed information if needed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382735453.447d104e1.17004--

--===============1219209094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1219209094==--
