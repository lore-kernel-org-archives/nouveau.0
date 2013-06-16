From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 65827] New: computer often fails to boot with
 nouveau and GeForce GT 425M on newest Linux kernel
Date: Sun, 16 Jun 2013 13:49:33 +0000
Message-ID: <bug-65827-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2005689703=="
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


--===============2005689703==
Content-Type: multipart/alternative; boundary="1371390574.AdC43f0.30961"; charset="us-ascii"


--1371390574.AdC43f0.30961
Date: Sun, 16 Jun 2013 13:49:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=65827

          Priority: medium
            Bug ID: 65827
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: computer often fails to boot with nouveau and GeForce
                    GT 425M on newest Linux kernel
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: j.pertres-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 9.1
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 80911
  --> https://bugs.freedesktop.org/attachment.cgi?id=80911&action=edit
screen shot of my screen on boot

When I turn my computer on, at some point of the booting process I get an
endless cascade of almost-identical error messages like "[   45.935830] nouveau
E(   PFIFO][0000:01:00.0] SUBFIFO0: (unknown bits 0x00004000)" (see image
attached). Apparently the computer doesn't respond to any input, so the only
thing I can do is force it to shut down by pressing the power button long.

Most of the times, the system boots OK at the second try, but not even always.
If I'm not successful after several attempts, I choose the LTS kernel (3.0.82
instead of 3.9.6) from my GRUB and then this won't happen.

It looks like these error logs messages are not properly kept as log files,
probably because I have to interrupt the boot process this way. A 'grep -R
"unknown bits"' from /var/log only finds matches in five *.journal binary files
in the directory /var/log/journal. This is why I attach a real-world picture of
my screen instead of a log file.

One of the last times that I managed to boot with the 3.9 kernel, I noticed
that in the file /proc/fb I only had "0 inteldrmfb". Now I am on the 3.0 kernel
and I have
"0 inteldrmfb
1 nouveaufb"

On the other hand, the command 'lspci -v | grep VGA' returns similar output on
both kernels:
- On 3.9 kernel:
00:02.0 VGA compatible controller: Intel Corporation Core Processor Integrated
Graphics Controller (rev 02) (prog-if 00 [VGA controller])
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 425M]
(rev ff) (prog-if ff)

- And on 3.0 kernel:
00:02.0 VGA compatible controller: Intel Corporation Core Processor Integrated
Graphics Controller (rev 02) (prog-if 00 [VGA controller])
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 425M]
(rev a1) (prog-if 00 [VGA controller])

This has been happening for several months already, so the problem didn't start
with kernel 3.9 but earlier.

All this said, even if I manage to boot, it looks like my NVIDIA card is never
used by any program, only the Intel one. GPU never seems to be available.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1371390574.AdC43f0.30961
Date: Sun, 16 Jun 2013 13:49:34 +0000
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
   title="NEW --- - computer often fails to boot with nouveau and GeForce GT 425M on newest Linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65827">65827</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>computer often fails to boot with nouveau and GeForce GT 425M on newest Linux kernel
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
          <td>j.pertres&#64;gmail.com
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
          <td>9.1
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
        <pre>Created <span class=""><a href="attachment.cgi?id=80911" name="attach_80911" title="screen shot of my screen on boot">attachment 80911</a> <a href="attachment.cgi?id=80911&amp;action=edit" title="screen shot of my screen on boot">[details]</a></span>
screen shot of my screen on boot

When I turn my computer on, at some point of the booting process I get an
endless cascade of almost-identical error messages like &quot;[   45.935830] nouveau
E(   PFIFO][0000:01:00.0] SUBFIFO0: (unknown bits 0x00004000)&quot; (see image
attached). Apparently the computer doesn't respond to any input, so the only
thing I can do is force it to shut down by pressing the power button long.

Most of the times, the system boots OK at the second try, but not even always.
If I'm not successful after several attempts, I choose the LTS kernel (3.0.82
instead of 3.9.6) from my GRUB and then this won't happen.

It looks like these error logs messages are not properly kept as log files,
probably because I have to interrupt the boot process this way. A 'grep -R
&quot;unknown bits&quot;' from /var/log only finds matches in five *.journal binary files
in the directory /var/log/journal. This is why I attach a real-world picture of
my screen instead of a log file.

One of the last times that I managed to boot with the 3.9 kernel, I noticed
that in the file /proc/fb I only had &quot;0 inteldrmfb&quot;. Now I am on the 3.0 kernel
and I have
&quot;0 inteldrmfb
1 nouveaufb&quot;

On the other hand, the command 'lspci -v | grep VGA' returns similar output on
both kernels:
- On 3.9 kernel:
00:02.0 VGA compatible controller: Intel Corporation Core Processor Integrated
Graphics Controller (rev 02) (prog-if 00 [VGA controller])
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 425M]
(rev ff) (prog-if ff)

- And on 3.0 kernel:
00:02.0 VGA compatible controller: Intel Corporation Core Processor Integrated
Graphics Controller (rev 02) (prog-if 00 [VGA controller])
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 425M]
(rev a1) (prog-if 00 [VGA controller])

This has been happening for several months already, so the problem didn't start
with kernel 3.9 but earlier.

All this said, even if I manage to boot, it looks like my NVIDIA card is never
used by any program, only the Intel one. GPU never seems to be available.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1371390574.AdC43f0.30961--

--===============2005689703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2005689703==--
