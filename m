From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57151] New: repeatable nouveau driver crashes/hangs
 during resume on Dell Latitude E6510 when drm.debug=14
Date: Thu, 15 Nov 2012 11:11:44 +0000
Message-ID: <bug-57151-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0133542675=="
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


--===============0133542675==
Content-Type: multipart/alternative; boundary="1352977905.De3acB0a1.15169"; charset="us-ascii"


--1352977905.De3acB0a1.15169
Date: Thu, 15 Nov 2012 11:11:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57151

          Priority: medium
            Bug ID: 57151
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: repeatable nouveau driver crashes/hangs during resume
                    on Dell Latitude E6510 when drm.debug=14
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: karolszk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: 7.6 (2010.12)
         Component: Driver/nouveau
           Product: xorg

I've added the following options drm.debug=14 log_buf_len=16M to grub config
and each time resume causes hang in logs appears:

ov 14 23:21:27 karolszk-lap kernel: [  613.414575] Call Trace:
Nov 14 23:21:27 karolszk-lap kernel: [  613.414648]  [<f8f34394>]
nv50_i2c_getscl+0x24/0x30 [nouveau]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414656]  [<f84fb052>]
sclhi+0x42/0x70 [i2c_algo_bit]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414663]  [<f84fb0ad>]
i2c_stop+0x2d/0x50 [i2c_algo_bit]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414671]  [<f84fb83f>]
try_address+0x3f/0x80 [i2c_algo_bit]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414679]  [<f84fb8f0>]
bit_doAddress.isra.7+0x70/0x180 [i2c_algo_bit]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414687]  [<f84fba76>]
bit_xfer+0x76/0x600 [i2c_algo_bit]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414697]  [<c1450f2d>]
i2c_transfer+0x8d/0xc0
Nov 14 23:21:27 karolszk-lap kernel: [  613.414727]  [<f8f34f55>]
nouveau_probe_i2c_addr+0x45/0x50 [nouveau]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414758]  [<f8f36854>]
nouveau_connector_detect+0xc4/0x280 [nouveau]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414769]  [<f8d77820>]
output_poll_execute+0x90/0x180 [drm_kms_helper]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414781]  [<c1072f00>] ?
queue_delayed_work_on+0x20/0x100
Nov 14 23:21:27 karolszk-lap kernel: [  613.414790]  [<c1476816>] ?
do_dbs_timer+0x66/0xc0
Nov 14 23:21:27 karolszk-lap kernel: [  613.414797]  [<c1074a21>]
process_one_work+0x101/0x3a0
Nov 14 23:21:27 karolszk-lap kernel: [  613.414806]  [<c15ae330>] ?
common_interrupt+0x30/0x38
Nov 14 23:21:27 karolszk-lap kernel: [  613.414816]  [<f8d77790>] ?
drm_helper_mode_fill_fb_struct+0x30/0x30 [drm_kms_helper]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414824]  [<c10754e4>]
worker_thread+0x124/0x2d0
Nov 14 23:21:27 karolszk-lap kernel: [  613.414831]  [<c10753c0>] ?
manage_workers.isra.28+0x110/0x110
Nov 14 23:21:27 karolszk-lap kernel: [  613.414839]  [<c10792dd>]
kthread+0x6d/0x80
Nov 14 23:21:27 karolszk-lap kernel: [  613.414846]  [<c1079270>] ?
flush_kthread_worker+0x80/0x80
Nov 14 23:21:27 karolszk-lap kernel: [  613.414853]  [<c15ae33e>]
kernel_thread_helper+0x6/0x10


my machine is Dell Laptop Latitude E6510. 12.04 ubuntu and kernel:

Linux karolszk-lap 3.2.0-32-generic-pae #51-Ubuntu SMP Wed Sep 26 21:54:23 UTC
2012 i686 i686 i386 GNU/Linux

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352977905.De3acB0a1.15169
Date: Thu, 15 Nov 2012 11:11:45 +0000
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
   title="NEW --- - repeatable nouveau driver crashes/hangs during resume on Dell Latitude E6510 when drm.debug=14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57151">57151</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>repeatable nouveau driver crashes/hangs during resume on Dell Latitude E6510 when drm.debug=14
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
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
          <td>karolszk&#64;gmail.com
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
          <td>7.6 (2010.12)
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
        <pre>I've added the following options drm.debug=14 log_buf_len=16M to grub config
and each time resume causes hang in logs appears:

ov 14 23:21:27 karolszk-lap kernel: [  613.414575] Call Trace:
Nov 14 23:21:27 karolszk-lap kernel: [  613.414648]  [&lt;f8f34394&gt;]
nv50_i2c_getscl+0x24/0x30 [nouveau]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414656]  [&lt;f84fb052&gt;]
sclhi+0x42/0x70 [i2c_algo_bit]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414663]  [&lt;f84fb0ad&gt;]
i2c_stop+0x2d/0x50 [i2c_algo_bit]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414671]  [&lt;f84fb83f&gt;]
try_address+0x3f/0x80 [i2c_algo_bit]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414679]  [&lt;f84fb8f0&gt;]
bit_doAddress.isra.7+0x70/0x180 [i2c_algo_bit]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414687]  [&lt;f84fba76&gt;]
bit_xfer+0x76/0x600 [i2c_algo_bit]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414697]  [&lt;c1450f2d&gt;]
i2c_transfer+0x8d/0xc0
Nov 14 23:21:27 karolszk-lap kernel: [  613.414727]  [&lt;f8f34f55&gt;]
nouveau_probe_i2c_addr+0x45/0x50 [nouveau]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414758]  [&lt;f8f36854&gt;]
nouveau_connector_detect+0xc4/0x280 [nouveau]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414769]  [&lt;f8d77820&gt;]
output_poll_execute+0x90/0x180 [drm_kms_helper]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414781]  [&lt;c1072f00&gt;] ?
queue_delayed_work_on+0x20/0x100
Nov 14 23:21:27 karolszk-lap kernel: [  613.414790]  [&lt;c1476816&gt;] ?
do_dbs_timer+0x66/0xc0
Nov 14 23:21:27 karolszk-lap kernel: [  613.414797]  [&lt;c1074a21&gt;]
process_one_work+0x101/0x3a0
Nov 14 23:21:27 karolszk-lap kernel: [  613.414806]  [&lt;c15ae330&gt;] ?
common_interrupt+0x30/0x38
Nov 14 23:21:27 karolszk-lap kernel: [  613.414816]  [&lt;f8d77790&gt;] ?
drm_helper_mode_fill_fb_struct+0x30/0x30 [drm_kms_helper]
Nov 14 23:21:27 karolszk-lap kernel: [  613.414824]  [&lt;c10754e4&gt;]
worker_thread+0x124/0x2d0
Nov 14 23:21:27 karolszk-lap kernel: [  613.414831]  [&lt;c10753c0&gt;] ?
manage_workers.isra.28+0x110/0x110
Nov 14 23:21:27 karolszk-lap kernel: [  613.414839]  [&lt;c10792dd&gt;]
kthread+0x6d/0x80
Nov 14 23:21:27 karolszk-lap kernel: [  613.414846]  [&lt;c1079270&gt;] ?
flush_kthread_worker+0x80/0x80
Nov 14 23:21:27 karolszk-lap kernel: [  613.414853]  [&lt;c15ae33e&gt;]
kernel_thread_helper+0x6/0x10


my machine is Dell Laptop Latitude E6510. 12.04 ubuntu and kernel:

Linux karolszk-lap 3.2.0-32-generic-pae #51-Ubuntu SMP Wed Sep 26 21:54:23 UTC
2012 i686 i686 i386 GNU/Linux</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352977905.De3acB0a1.15169--

--===============0133542675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0133542675==--
