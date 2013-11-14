From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71620] New: nouveau_fence_wait_uevent NULL pointer
	dereference
Date: Thu, 14 Nov 2013 18:55:54 +0000
Message-ID: <bug-71620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1562120352=="
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


--===============1562120352==
Content-Type: multipart/alternative; boundary="1384455354.0F6adCcA0.16739"; charset="us-ascii"


--1384455354.0F6adCcA0.16739
Date: Thu, 14 Nov 2013 18:55:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71620

          Priority: medium
            Bug ID: 71620
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau_fence_wait_uevent NULL pointer dereference
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: kdatanasov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 89234
  --> https://bugs.freedesktop.org/attachment.cgi?id=89234&action=edit
patch_to_protect_fence_channel

Upon normal computer operation user session(GNOME-Shell) sometimes will just
terminate. Problem seems more common if two users are logged in(GNOME-Shell)
for a day.

GPU:
NVIDIA Corporation C77 [GeForce 8300] (rev a2)

kernel version:
3.12.0-upstream

Relevent dmesg output:
[29434.602169] Call Trace:
[29434.602188]  [<ffffffffa010b6db>] ?
nouveau_fence_wait_uevent.isra.1+0x1b/0x3f0 [nouveau]
[29434.602208]  [<ffffffffa010b676>] ? nouveau_fence_update+0x76/0x90 [nouveau]
[29434.602228]  [<ffffffffa010bb36>] nouveau_fence_wait+0x86/0x1a0 [nouveau]
[29434.602248]  [<ffffffffa010d7a5>] nouveau_bo_fence_wait+0x15/0x20 [nouveau]
[29434.602260]  [<ffffffffa00658a1>] ttm_bo_wait+0x91/0x190 [ttm]
[29434.602279]  [<ffffffffa0112e57>] nouveau_gem_ioctl_cpu_prep+0x57/0xe0
[nouveau]
[29434.602294]  [<ffffffffa0010c52>] drm_ioctl+0x502/0x630 [drm]
[29434.602313]  [<ffffffffa0108d11>] nouveau_drm_ioctl+0x51/0x90 [nouveau]
[29434.602324]  [<ffffffff811b3690>] do_vfs_ioctl+0x2e0/0x4c0
[29434.602332]  [<ffffffff811a2e2e>] ? ____fput+0xe/0x10
[29434.602340]  [<ffffffff81080544>] ? task_work_run+0xa4/0xe0
[29434.602347]  [<ffffffff811b38f1>] SyS_ioctl+0x81/0xa0
[29434.602356]  [<ffffffff814f81ad>] system_call_fastpath+0x1a/0x1f
[29434.602364] Code: c3 0f 1f 84 00 00 00 00 00 66 66 66 66 90 55 48 89 e5 41
57 49 89 f7 41 56 41 55 41 54 41 89 d4 53 48 89 fb 48 83 ec 58 48 8b 07 <48> 8b
48 08 48 8b 91 f8 00 00 00 4c 8b b1 b0 07 00 00 48 8b 42 

I'm trying some change(adding it as patch) - no problem so far, but since I
have zero experience in kernel/driver workflow definitely not sure if it's OK.

Regards, K

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384455354.0F6adCcA0.16739
Date: Thu, 14 Nov 2013 18:55:54 +0000
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
   title="NEW --- - nouveau_fence_wait_uevent NULL pointer dereference"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71620">71620</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau_fence_wait_uevent NULL pointer dereference
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
          <td>kdatanasov&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=89234" name="attach_89234" title="patch_to_protect_fence_channel">attachment 89234</a> <a href="attachment.cgi?id=89234&amp;action=edit" title="patch_to_protect_fence_channel">[details]</a></span>
patch_to_protect_fence_channel

Upon normal computer operation user session(GNOME-Shell) sometimes will just
terminate. Problem seems more common if two users are logged in(GNOME-Shell)
for a day.

GPU:
NVIDIA Corporation C77 [GeForce 8300] (rev a2)

kernel version:
3.12.0-upstream

Relevent dmesg output:
[29434.602169] Call Trace:
[29434.602188]  [&lt;ffffffffa010b6db&gt;] ?
nouveau_fence_wait_uevent.isra.1+0x1b/0x3f0 [nouveau]
[29434.602208]  [&lt;ffffffffa010b676&gt;] ? nouveau_fence_update+0x76/0x90 [nouveau]
[29434.602228]  [&lt;ffffffffa010bb36&gt;] nouveau_fence_wait+0x86/0x1a0 [nouveau]
[29434.602248]  [&lt;ffffffffa010d7a5&gt;] nouveau_bo_fence_wait+0x15/0x20 [nouveau]
[29434.602260]  [&lt;ffffffffa00658a1&gt;] ttm_bo_wait+0x91/0x190 [ttm]
[29434.602279]  [&lt;ffffffffa0112e57&gt;] nouveau_gem_ioctl_cpu_prep+0x57/0xe0
[nouveau]
[29434.602294]  [&lt;ffffffffa0010c52&gt;] drm_ioctl+0x502/0x630 [drm]
[29434.602313]  [&lt;ffffffffa0108d11&gt;] nouveau_drm_ioctl+0x51/0x90 [nouveau]
[29434.602324]  [&lt;ffffffff811b3690&gt;] do_vfs_ioctl+0x2e0/0x4c0
[29434.602332]  [&lt;ffffffff811a2e2e&gt;] ? ____fput+0xe/0x10
[29434.602340]  [&lt;ffffffff81080544&gt;] ? task_work_run+0xa4/0xe0
[29434.602347]  [&lt;ffffffff811b38f1&gt;] SyS_ioctl+0x81/0xa0
[29434.602356]  [&lt;ffffffff814f81ad&gt;] system_call_fastpath+0x1a/0x1f
[29434.602364] Code: c3 0f 1f 84 00 00 00 00 00 66 66 66 66 90 55 48 89 e5 41
57 49 89 f7 41 56 41 55 41 54 41 89 d4 53 48 89 fb 48 83 ec 58 48 8b 07 &lt;48&gt; 8b
48 08 48 8b 91 f8 00 00 00 4c 8b b1 b0 07 00 00 48 8b 42 

I'm trying some change(adding it as patch) - no problem so far, but since I
have zero experience in kernel/driver workflow definitely not sure if it's OK.

Regards, K</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384455354.0F6adCcA0.16739--

--===============1562120352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1562120352==--
