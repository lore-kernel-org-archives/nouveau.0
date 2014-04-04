From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Fri, 04 Apr 2014 23:19:11 +0000
Message-ID: <bug-76732-8800-G2tSvgn86V@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1833751417=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76732-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1833751417==
Content-Type: multipart/alternative; boundary="1396653551.4c102.23899"; charset="us-ascii"


--1396653551.4c102.23899
Date: Fri, 4 Apr 2014 23:19:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #30 from Dale Hamel <daleha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I recently generated this bug:

https://bugs.freedesktop.org/show_bug.cgi?id=77073

Which appears to only happen when external, displayport display is attached.

I'm going to try rolling back to kernel 3.8 to see if that resolves it.

I attached a bunch of debug info to my ticket which I hope will be useful. The
main thing of note is that the kworker is doing:



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



Over and over again.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396653551.4c102.23899
Date: Fri, 4 Apr 2014 23:19:11 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c30">Comment # 30</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:daleha&#64;gmail.com" title="Dale Hamel &lt;daleha&#64;gmail.com&gt;"> <span class="fn">Dale Hamel</span></a>
</span></b>
        <pre>I recently generated this bug:

<a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - [nouveaun NVE0] Attaching displayport spawns kworker taking up 100% cpu"
   href="show_bug.cgi?id=77073">https://bugs.freedesktop.org/show_bug.cgi?id=77073</a>

Which appears to only happen when external, displayport display is attached.

I'm going to try rolling back to kernel 3.8 to see if that resolves it.

I attached a bunch of debug info to my ticket which I hope will be useful. The
main thing of note is that the kworker is doing:



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



Over and over again.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396653551.4c102.23899--

--===============1833751417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1833751417==--
