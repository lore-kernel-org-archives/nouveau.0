From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77073] New: [nouveaun NVE0] Attaching displayport
 spawns kworker taking up 100% cpu
Date: Fri, 04 Apr 2014 22:40:45 +0000
Message-ID: <bug-77073-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0238099817=="
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


--===============0238099817==
Content-Type: multipart/alternative; boundary="1396651245.C4bD3C1.16555"; charset="us-ascii"


--1396651245.C4bD3C1.16555
Date: Fri, 4 Apr 2014 22:40:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77073

          Priority: medium
            Bug ID: 77073
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nouveaun NVE0] Attaching displayport spawns kworker
                    taking up 100% cpu
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: daleha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Symptoms:

Attaching a displayport (even in console, with no Xorg loaded) causes 100% CPU
usage in kworker, making system extremely unresponsive.

See referenced issue on ubuntu bug tracker:
https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1248256

I'm going to try to get additional logs, but my dmesg is pretty uninteresting.
I'll attached the vbios as well. Going to try booting with more debug info.
Right now system is too slow (because of this bug) to add the attachments.

It also happens with the intel driver, but I haven't been able to trace that
one as well. I don't think the cause of the problem is nouveau specific for
that reason, but the kworker that is constantly showing up is definitely part
of the nouveau code:

     kworker/0:3-1128 [000] d.s2 1973.688813: workqueue_queue_work: work
struct=ffff88046f2135d8 function=od_dbs_timer [cpufreq_ondemand]
workqueue=ffff88046d17ba00 req_cpu=0 cpu=0
     kworker/0:3-1128 [000] d.h2 1973.704711: workqueue_queue_work: work
struct=ffffffff819b85e0 function=push_to_pool workqueue=ffff88046d17ba00
req_cpu=32 cpu=0
     kworker/0:3-1128 [000] d.h3 1973.757128: workqueue_queue_work: work
struct=ffff88045db116e0 function=nouveau_connector_hotplug_work
workqueue=ffff88046d17ba00 req_cpu=32 cpu=0
     kworker/0:3-1128 [000] d.h3 1973.830281: workqueue_queue_work: work
struct=ffff88045db116e0 function=nouveau_connector_hotplug_work
workqueue=ffff88046d17ba00 req_cpu=32 cpu=0
     kworker/0:3-1128 [000] d.s3 1973.838757: workqueue_queue_work: work
struct=ffff88046f2135d8 function=od_dbs_timer [cpufreq_ondemand]
workqueue=ffff88046d17ba00 req_cpu=0 cpu=0
     kworker/0:3-1128 [000] d.h2 1973.859889: workqueue_queue_work: work
struct=ffffffff819b85e0 function=push_to_pool workqueue=ffff88046d17ba00
req_cpu=32 cpu=0
     kworker/0:3-1128 [000] d.h3 1973.903514: workqueue_queue_work: work
struct=ffff88045db116e0 function=nouveau_connector_hotplug_work
workqueue=ffff88046d17ba00 req_cpu=32 cpu=0


Affected hardware:

MacBook pro 10,11 with cinema display (thunderbolt and displayport)
IBM Thinkpad with dell display port.
Possibly others


Versions:
xf86-nouveau 1.0.11
kernel 3.14-rc8 (also happens on 3.14 final, as well as earlier versions)

Reference issues:
https://bugs.freedesktop.org/show_bug.cgi?id=76732
https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1248256
https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1020221

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396651245.C4bD3C1.16555
Date: Fri, 4 Apr 2014 22:40:45 +0000
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
   title="NEW --- - [nouveaun NVE0] Attaching displayport spawns kworker taking up 100% cpu"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77073">77073</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nouveaun NVE0] Attaching displayport spawns kworker taking up 100% cpu
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
          <td>daleha&#64;gmail.com
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
        <pre>Symptoms:

Attaching a displayport (even in console, with no Xorg loaded) causes 100% CPU
usage in kworker, making system extremely unresponsive.

See referenced issue on ubuntu bug tracker:
<a href="https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1248256">https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1248256</a>

I'm going to try to get additional logs, but my dmesg is pretty uninteresting.
I'll attached the vbios as well. Going to try booting with more debug info.
Right now system is too slow (because of this bug) to add the attachments.

It also happens with the intel driver, but I haven't been able to trace that
one as well. I don't think the cause of the problem is nouveau specific for
that reason, but the kworker that is constantly showing up is definitely part
of the nouveau code:

     kworker/0:3-1128 [000] d.s2 1973.688813: workqueue_queue_work: work
struct=ffff88046f2135d8 function=od_dbs_timer [cpufreq_ondemand]
workqueue=ffff88046d17ba00 req_cpu=0 cpu=0
     kworker/0:3-1128 [000] d.h2 1973.704711: workqueue_queue_work: work
struct=ffffffff819b85e0 function=push_to_pool workqueue=ffff88046d17ba00
req_cpu=32 cpu=0
     kworker/0:3-1128 [000] d.h3 1973.757128: workqueue_queue_work: work
struct=ffff88045db116e0 function=nouveau_connector_hotplug_work
workqueue=ffff88046d17ba00 req_cpu=32 cpu=0
     kworker/0:3-1128 [000] d.h3 1973.830281: workqueue_queue_work: work
struct=ffff88045db116e0 function=nouveau_connector_hotplug_work
workqueue=ffff88046d17ba00 req_cpu=32 cpu=0
     kworker/0:3-1128 [000] d.s3 1973.838757: workqueue_queue_work: work
struct=ffff88046f2135d8 function=od_dbs_timer [cpufreq_ondemand]
workqueue=ffff88046d17ba00 req_cpu=0 cpu=0
     kworker/0:3-1128 [000] d.h2 1973.859889: workqueue_queue_work: work
struct=ffffffff819b85e0 function=push_to_pool workqueue=ffff88046d17ba00
req_cpu=32 cpu=0
     kworker/0:3-1128 [000] d.h3 1973.903514: workqueue_queue_work: work
struct=ffff88045db116e0 function=nouveau_connector_hotplug_work
workqueue=ffff88046d17ba00 req_cpu=32 cpu=0


Affected hardware:

MacBook pro 10,11 with cinema display (thunderbolt and displayport)
IBM Thinkpad with dell display port.
Possibly others


Versions:
xf86-nouveau 1.0.11
kernel 3.14-rc8 (also happens on 3.14 final, as well as earlier versions)

Reference issues:
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="show_bug.cgi?id=76732">https://bugs.freedesktop.org/show_bug.cgi?id=76732</a>
<a href="https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1248256">https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1248256</a>
<a href="https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1020221">https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1020221</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396651245.C4bD3C1.16555--

--===============0238099817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0238099817==--
