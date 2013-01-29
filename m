From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60020] New: Resuming Dell Precision M70 crashes
Date: Tue, 29 Jan 2013 14:04:44 +0000
Message-ID: <bug-60020-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0987372389=="
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


--===============0987372389==
Content-Type: multipart/alternative; boundary="1359468285.518c5d1.15016"; charset="us-ascii"


--1359468285.518c5d1.15016
Date: Tue, 29 Jan 2013 14:04:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60020

          Priority: medium
            Bug ID: 60020
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Resuming Dell Precision M70 crashes
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: rcbixler-0BtJm3PWb0s@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 73830
  --> https://bugs.freedesktop.org/attachment.cgi?id=73830&action=edit
dmesg output - first bootup

I am running Debian wheezy and I have found that, with the nouveau driver
loaded, suspend/resume results in a hung system.  Originally, I was using the
proprietary NVidia driver and suspend/resume worked with it.  However, I
switched to the Nouveau driver after I found that the system was unstable with
the NVidia driver while watching videos.  I have made sure that all traces of
the NVidia driver have been removed before reproducing the bug.  Except for
this problem, the Nouveau driver works well -- no more crashes while watching
videos.

I have also confirmed that suspend/resume works after I unload the nouveau
driver.  I use the following commands:

echo 0 > /sys/class/vtconsole/vtcon1/bind
rmmod nouveau
pm-suspend

I have also done a test of suspend/resume with Nouveau loaded after activating
pm_trace (i.e. echo 1 > /sys/power/pm_trace).  I attach a couple of "dmesg"
outputs.  The most interesting lines from the second "dmesg" command from
rebooting after the crash are the following:

[    0.726626] PM: Hibernation image not present or could not be loaded.
[    0.726635] registered taskstats version 1
[    0.727033]   Magic number: 0:56:725
[    0.727036]   hash matches drivers/base/power/main.c:571
[    0.727078] pci 0000:01:00.0: hash matches
[    0.727139] rtc_cmos 00:06: setting system clock to 1996-05-07 08:42:38 UTC
(831458558)

Complete "dmesg" output attached.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1359468285.518c5d1.15016
Date: Tue, 29 Jan 2013 14:04:45 +0000
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
   title="NEW --- - Resuming Dell Precision M70 crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60020">60020</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Resuming Dell Precision M70 crashes
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
          <td>rcbixler&#64;nyx.net
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
        <pre>Created <span class=""><a href="attachment.cgi?id=73830" name="attach_73830" title="dmesg output - first bootup">attachment 73830</a> <a href="attachment.cgi?id=73830&amp;action=edit" title="dmesg output - first bootup">[details]</a></span>
dmesg output - first bootup

I am running Debian wheezy and I have found that, with the nouveau driver
loaded, suspend/resume results in a hung system.  Originally, I was using the
proprietary NVidia driver and suspend/resume worked with it.  However, I
switched to the Nouveau driver after I found that the system was unstable with
the NVidia driver while watching videos.  I have made sure that all traces of
the NVidia driver have been removed before reproducing the bug.  Except for
this problem, the Nouveau driver works well -- no more crashes while watching
videos.

I have also confirmed that suspend/resume works after I unload the nouveau
driver.  I use the following commands:

echo 0 &gt; /sys/class/vtconsole/vtcon1/bind
rmmod nouveau
pm-suspend

I have also done a test of suspend/resume with Nouveau loaded after activating
pm_trace (i.e. echo 1 &gt; /sys/power/pm_trace).  I attach a couple of &quot;dmesg&quot;
outputs.  The most interesting lines from the second &quot;dmesg&quot; command from
rebooting after the crash are the following:

[    0.726626] PM: Hibernation image not present or could not be loaded.
[    0.726635] registered taskstats version 1
[    0.727033]   Magic number: 0:56:725
[    0.727036]   hash matches drivers/base/power/main.c:571
[    0.727078] pci 0000:01:00.0: hash matches
[    0.727139] rtc_cmos 00:06: setting system clock to 1996-05-07 08:42:38 UTC
(831458558)

Complete &quot;dmesg&quot; output attached.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359468285.518c5d1.15016--

--===============0987372389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0987372389==--
