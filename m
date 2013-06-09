From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 65554] CPU lock with nouveau_fan_update
Date: Sun, 09 Jun 2013 00:40:47 +0000
Message-ID: <bug-65554-8800-jEY1xz2NvP@http.bugs.freedesktop.org/>
References: <bug-65554-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0677998291=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-65554-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0677998291==
Content-Type: multipart/alternative; boundary="1370738447.3c662.575"; charset="us-ascii"


--1370738447.3c662.575
Date: Sun, 9 Jun 2013 00:40:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=65554

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
nouveau_fan_update:
    spin_lock_irqsave(&fan->lock, flags);
    /* schedule next fan update, if not at target speed already */
    if (list_empty(&fan->alarm.head) && target != duty) {
        u16 bump_period = fan->bios.bump_period;
        u16 slow_down_period = fan->bios.slow_down_period;
...
        ptimer->alarm(ptimer, delay * 1000 * 1000, &fan->alarm);

If delay is somehow 0, the ->alarm will cause nouveau_fan_update to get called
immediately. Can you add a printk to that function that shows the values? (This
may end up totally flooding your dmesg too... but I think the values may be the
same across prints.)

e.g.

diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
b/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
index c728380..9453afd 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
@@ -88,7 +88,7 @@ nouveau_fan_update(struct nouveau_fan *fan, bool immediate,
int target)
                        delay = min(bump_period, slow_down_period) ;
                else
                        delay = bump_period;
-
+               nv_info(therm, "Scheduling fan update in %d (slow: %d, bump:
%d)\n", delay, slow_down_period, bump_period);
                ptimer->alarm(ptimer, delay * 1000 * 1000, &fan->alarm);
        }

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1370738447.3c662.575
Date: Sun, 9 Jun 2013 00:40:47 +0000
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
   title="NEW --- - CPU lock with nouveau_fan_update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65554#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - CPU lock with nouveau_fan_update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65554">bug 65554</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>nouveau_fan_update:
    spin_lock_irqsave(&amp;fan-&gt;lock, flags);
    /* schedule next fan update, if not at target speed already */
    if (list_empty(&amp;fan-&gt;alarm.head) &amp;&amp; target != duty) {
        u16 bump_period = fan-&gt;bios.bump_period;
        u16 slow_down_period = fan-&gt;bios.slow_down_period;
...
        ptimer-&gt;alarm(ptimer, delay * 1000 * 1000, &amp;fan-&gt;alarm);

If delay is somehow 0, the -&gt;alarm will cause nouveau_fan_update to get called
immediately. Can you add a printk to that function that shows the values? (This
may end up totally flooding your dmesg too... but I think the values may be the
same across prints.)

e.g.

diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
b/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
index c728380..9453afd 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
&#64;&#64; -88,7 +88,7 &#64;&#64; nouveau_fan_update(struct nouveau_fan *fan, bool immediate,
int target)
                        delay = min(bump_period, slow_down_period) ;
                else
                        delay = bump_period;
-
+               nv_info(therm, &quot;Scheduling fan update in %d (slow: %d, bump:
%d)\n&quot;, delay, slow_down_period, bump_period);
                ptimer-&gt;alarm(ptimer, delay * 1000 * 1000, &amp;fan-&gt;alarm);
        }</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1370738447.3c662.575--

--===============0677998291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0677998291==--
