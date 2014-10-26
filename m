From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85471] New: nouveau/kernel 3.18.0-rc1: nouveau
 deadlocks on 2nd Xorg start or reboot
Date: Sun, 26 Oct 2014 09:37:15 +0000
Message-ID: <bug-85471-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0678870544=="
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


--===============0678870544==
Content-Type: multipart/alternative; boundary="1414316235.bfEd41.549"; charset="UTF-8"


--1414316235.bfEd41.549
Date: Sun, 26 Oct 2014 09:37:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85471

            Bug ID: 85471
           Summary: nouveau/kernel 3.18.0-rc1: nouveau deadlocks on 2nd
                    Xorg start or reboot
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: vogelchr-InfKab39H3A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 108436
  --> https://bugs.freedesktop.org/attachment.cgi?id=108436&action=edit
Dump of serial console during bootup... up to hang on shutdown.

Summary: I can start Xorg *once* just fine, also switch to/from text-consoles.
But once this X-server ends, both monitors will turn black and go to powersave.

After this has happened, a new X-server will hang. Also a clean reboot is no
longer possible, because also the shutdown-code running in the Kernel will hang
with a similar stack trace.

This bug is reproducible 100%.

Hardware: NVIDIA Corporation G86 [Quadro NVS 290] (rev a1)
          BOOT0  : 0x086f00a2
          Chipset: G86 (NV86)
          Family : NV50

Platform:     amd64
Linux-Kernel: 3.18.0-rc1
Distribution: Arch-Linux

Xorg server: xorg-server 1.16.1-1 (from Archlinux repository)
Xorg driver: xf86-video-nouveau 1.0.11-2 (from Archlinux repository)

Everything looks pretty unremarkable while using the computer normally running
X which is very stable, can run for days. Also terminating the X server looks
uneventful.

***
*** Starting the second X-server hangs...
***

[root@optiplex ~]# ps axf | grep X
 4173 pts/1    D+     0:00  |                   \_ /usr/bin/Xorg.wrap

[root@optiplex ~]# cat /proc/4173/wchan 
rpm_resume

[root@optiplex ~]# cat /proc/4173/syscall 
2 0x7fffc7a788c0 0x2 0x7fffc7a788ce 0x690 0x7f0c3e0ed140 0x0 0x7fffc7a77fb0
0x7f0c3e06a330

[root@optiplex ~]# cat /proc/4173/stack 
[<ffffffff8146b222>] rpm_resume+0x220/0x4b7
[<ffffffff8146b4fb>] __pm_runtime_resume+0x42/0x5e
[<ffffffff8143064d>] nouveau_drm_open+0x3d/0x249
[<ffffffff8138fc3d>] drm_open+0x235/0x43e
[<ffffffff8139543f>] drm_stub_open+0xc1/0xee
[<ffffffff81169cb1>] chrdev_open+0x151/0x18b
[<ffffffff81163cde>] do_dentry_open+0x245/0x2b7
[<ffffffff81163fb3>] finish_open+0x35/0x40
[<ffffffff81171e14>] do_last.isra.32+0x83a/0xa7c
[<ffffffff8117226e>] path_openat+0x218/0x5cd
[<ffffffff811735fd>] do_filp_open+0x49/0xad
[<ffffffff81164fec>] do_sys_open+0x15a/0x1fd
[<ffffffff811650ad>] SyS_open+0x1e/0x20
[<ffffffff815c7529>] system_call_fastpath+0x12/0x17
[<ffffffffffffffff>] 0xffffffffffffffff

***
*** Alternatively, after a new reboot, not trying to start a 2nd X-server,
*** and shutting down the machine, this hangcheck info appears on the serial
*** console two minutes after the shutdown...
***

[  240.486671] INFO: task kworker/0:3:126 blocked for more than 120 seconds.
[  240.493460]       Not tainted 3.18.0-rc1-cv+ #4
[  240.497980] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[  240.505796] kworker/0:3     D ffff880127c143c0     0   126      2 0x00000000
[  240.512849] Workqueue: pm pm_runtime_work
[  240.516858]  ffff8800cb3cfbd8 0000000000000046 00000000000003ff
ffff8800cb3cffd8
[  240.524264]  ffff8800cb1ae5c0 00000000000143c0 ffffffff81a18540
ffff8800cb1ae5c0
[  240.531668]  0000000000000000 0000000000000000 0000000000000000
0000000000000000
[  240.539087] Call Trace:
[  240.541538]  [<ffffffff812b3001>] ? cpumask_next_and+0x20/0x3e
[  240.547357]  [<ffffffff81082838>] ? load_balance+0x20e/0x893
[  240.552999]  [<ffffffff81019bd3>] ? native_sched_clock+0x28/0x93
[  240.558987]  [<ffffffff815c3e43>] schedule+0x69/0x6b
[  240.563936]  [<ffffffff8146b222>] rpm_resume+0x220/0x4b7
[  240.569231]  [<ffffffff81088191>] ? __wake_up_sync+0x12/0x12
[  240.574871]  [<ffffffff8146b710>] pm_runtime_forbid+0x42/0x4f
[  240.580599]  [<ffffffff8142f6cd>] nouveau_pmops_runtime_suspend+0x32/0xd2
[  240.587366]  [<ffffffff812e2972>] pci_pm_runtime_suspend+0x63/0x110
[  240.593612]  [<ffffffff812e290f>] ? pci_legacy_suspend+0xbe/0xbe
[  240.599598]  [<ffffffff8146a40c>] __rpm_callback+0x3a/0x62
[  240.605064]  [<ffffffff8146a4a8>] rpm_callback+0x74/0x8a
[  240.610357]  [<ffffffff8146aa60>] rpm_suspend+0x25b/0x459
[  240.615738]  [<ffffffff8146b9d5>] pm_runtime_work+0x7b/0x88
[  240.621292]  [<ffffffff8106a735>] process_one_work+0x1b5/0x365
[  240.627105]  [<ffffffff8106b281>] worker_thread+0x29d/0x381
[  240.632657]  [<ffffffff8106afe4>] ? rescuer_thread+0x24c/0x24c
[  240.638472]  [<ffffffff8106ed95>] kthread+0xf3/0xfb
[  240.643333]  [<ffffffff8106eca2>] ? kthread_create_on_node+0x1a9/0x1a9
[  240.649839]  [<ffffffff815c747c>] ret_from_fork+0x7c/0xb0
[  240.655219]  [<ffffffff8106eca2>] ? kthread_create_on_node+0x1a9/0x1a9

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414316235.bfEd41.549
Date: Sun, 26 Oct 2014 09:37:15 +0000
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
   title="NEW - nouveau/kernel 3.18.0-rc1: nouveau deadlocks on 2nd Xorg start or reboot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85471">85471</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau/kernel 3.18.0-rc1: nouveau deadlocks on 2nd Xorg start or reboot
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>vogelchr&#64;vogel.cx
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=108436" name="attach_108436" title="Dump of serial console during bootup... up to hang on shutdown.">attachment 108436</a> <a href="attachment.cgi?id=108436&amp;action=edit" title="Dump of serial console during bootup... up to hang on shutdown.">[details]</a></span>
Dump of serial console during bootup... up to hang on shutdown.

Summary: I can start Xorg *once* just fine, also switch to/from text-consoles.
But once this X-server ends, both monitors will turn black and go to powersave.

After this has happened, a new X-server will hang. Also a clean reboot is no
longer possible, because also the shutdown-code running in the Kernel will hang
with a similar stack trace.

This bug is reproducible 100%.

Hardware: NVIDIA Corporation G86 [Quadro NVS 290] (rev a1)
          BOOT0  : 0x086f00a2
          Chipset: G86 (NV86)
          Family : NV50

Platform:     amd64
Linux-Kernel: 3.18.0-rc1
Distribution: Arch-Linux

Xorg server: xorg-server 1.16.1-1 (from Archlinux repository)
Xorg driver: xf86-video-nouveau 1.0.11-2 (from Archlinux repository)

Everything looks pretty unremarkable while using the computer normally running
X which is very stable, can run for days. Also terminating the X server looks
uneventful.

***
*** Starting the second X-server hangs...
***

[root&#64;optiplex ~]# ps axf | grep X
 4173 pts/1    D+     0:00  |                   \_ /usr/bin/Xorg.wrap

[root&#64;optiplex ~]# cat /proc/4173/wchan 
rpm_resume

[root&#64;optiplex ~]# cat /proc/4173/syscall 
2 0x7fffc7a788c0 0x2 0x7fffc7a788ce 0x690 0x7f0c3e0ed140 0x0 0x7fffc7a77fb0
0x7f0c3e06a330

[root&#64;optiplex ~]# cat /proc/4173/stack 
[&lt;ffffffff8146b222&gt;] rpm_resume+0x220/0x4b7
[&lt;ffffffff8146b4fb&gt;] __pm_runtime_resume+0x42/0x5e
[&lt;ffffffff8143064d&gt;] nouveau_drm_open+0x3d/0x249
[&lt;ffffffff8138fc3d&gt;] drm_open+0x235/0x43e
[&lt;ffffffff8139543f&gt;] drm_stub_open+0xc1/0xee
[&lt;ffffffff81169cb1&gt;] chrdev_open+0x151/0x18b
[&lt;ffffffff81163cde&gt;] do_dentry_open+0x245/0x2b7
[&lt;ffffffff81163fb3&gt;] finish_open+0x35/0x40
[&lt;ffffffff81171e14&gt;] do_last.isra.32+0x83a/0xa7c
[&lt;ffffffff8117226e&gt;] path_openat+0x218/0x5cd
[&lt;ffffffff811735fd&gt;] do_filp_open+0x49/0xad
[&lt;ffffffff81164fec&gt;] do_sys_open+0x15a/0x1fd
[&lt;ffffffff811650ad&gt;] SyS_open+0x1e/0x20
[&lt;ffffffff815c7529&gt;] system_call_fastpath+0x12/0x17
[&lt;ffffffffffffffff&gt;] 0xffffffffffffffff

***
*** Alternatively, after a new reboot, not trying to start a 2nd X-server,
*** and shutting down the machine, this hangcheck info appears on the serial
*** console two minutes after the shutdown...
***

[  240.486671] INFO: task kworker/0:3:126 blocked for more than 120 seconds.
[  240.493460]       Not tainted 3.18.0-rc1-cv+ #4
[  240.497980] &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&quot; disables this
message.
[  240.505796] kworker/0:3     D ffff880127c143c0     0   126      2 0x00000000
[  240.512849] Workqueue: pm pm_runtime_work
[  240.516858]  ffff8800cb3cfbd8 0000000000000046 00000000000003ff
ffff8800cb3cffd8
[  240.524264]  ffff8800cb1ae5c0 00000000000143c0 ffffffff81a18540
ffff8800cb1ae5c0
[  240.531668]  0000000000000000 0000000000000000 0000000000000000
0000000000000000
[  240.539087] Call Trace:
[  240.541538]  [&lt;ffffffff812b3001&gt;] ? cpumask_next_and+0x20/0x3e
[  240.547357]  [&lt;ffffffff81082838&gt;] ? load_balance+0x20e/0x893
[  240.552999]  [&lt;ffffffff81019bd3&gt;] ? native_sched_clock+0x28/0x93
[  240.558987]  [&lt;ffffffff815c3e43&gt;] schedule+0x69/0x6b
[  240.563936]  [&lt;ffffffff8146b222&gt;] rpm_resume+0x220/0x4b7
[  240.569231]  [&lt;ffffffff81088191&gt;] ? __wake_up_sync+0x12/0x12
[  240.574871]  [&lt;ffffffff8146b710&gt;] pm_runtime_forbid+0x42/0x4f
[  240.580599]  [&lt;ffffffff8142f6cd&gt;] nouveau_pmops_runtime_suspend+0x32/0xd2
[  240.587366]  [&lt;ffffffff812e2972&gt;] pci_pm_runtime_suspend+0x63/0x110
[  240.593612]  [&lt;ffffffff812e290f&gt;] ? pci_legacy_suspend+0xbe/0xbe
[  240.599598]  [&lt;ffffffff8146a40c&gt;] __rpm_callback+0x3a/0x62
[  240.605064]  [&lt;ffffffff8146a4a8&gt;] rpm_callback+0x74/0x8a
[  240.610357]  [&lt;ffffffff8146aa60&gt;] rpm_suspend+0x25b/0x459
[  240.615738]  [&lt;ffffffff8146b9d5&gt;] pm_runtime_work+0x7b/0x88
[  240.621292]  [&lt;ffffffff8106a735&gt;] process_one_work+0x1b5/0x365
[  240.627105]  [&lt;ffffffff8106b281&gt;] worker_thread+0x29d/0x381
[  240.632657]  [&lt;ffffffff8106afe4&gt;] ? rescuer_thread+0x24c/0x24c
[  240.638472]  [&lt;ffffffff8106ed95&gt;] kthread+0xf3/0xfb
[  240.643333]  [&lt;ffffffff8106eca2&gt;] ? kthread_create_on_node+0x1a9/0x1a9
[  240.649839]  [&lt;ffffffff815c747c&gt;] ret_from_fork+0x7c/0xb0
[  240.655219]  [&lt;ffffffff8106eca2&gt;] ? kthread_create_on_node+0x1a9/0x1a9</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414316235.bfEd41.549--

--===============0678870544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0678870544==--
