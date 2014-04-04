From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77073] [nouveaun NVE0] Attaching displayport spawns
 kworker taking up 100% cpu
Date: Fri, 04 Apr 2014 23:05:39 +0000
Message-ID: <bug-77073-8800-2s8psFqEdJ@http.bugs.freedesktop.org/>
References: <bug-77073-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2071062765=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77073-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2071062765==
Content-Type: multipart/alternative; boundary="1396652738.D58F1.21417"; charset="us-ascii"


--1396652738.D58F1.21417
Date: Fri, 4 Apr 2014 23:05:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77073

--- Comment #3 from Dale Hamel <daleha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Lots of this going on in the kernel log:

[  773.163695] [drm:drm_helper_hpd_irq_event], [CONNECTOR:17:eDP-1] status
updated from connected to connected
[  773.168560] [drm:drm_helper_hpd_irq_event], [CONNECTOR:19:DP-1] status
updated from disconnected to disconnected
[  773.226530] [drm:drm_helper_hpd_irq_event], [CONNECTOR:22:DP-2] status
updated from connected to connected
[  773.229800] [drm:drm_helper_hpd_irq_event], [CONNECTOR:25:HDMI-A-1] status
updated from disconnected to disconnected
[  773.236734] [drm:drm_helper_hpd_irq_event], [CONNECTOR:17:eDP-1] status
updated from connected to connected
[  773.241629] [drm:drm_helper_hpd_irq_event], [CONNECTOR:19:DP-1] status
updated from disconnected to disconnected
[  773.299627] [drm:drm_helper_hpd_irq_event], [CONNECTOR:22:DP-2] status
updated from connected to connected

Not sure if that's normal.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396652738.D58F1.21417
Date: Fri, 4 Apr 2014 23:05:38 +0000
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
   title="NEW --- - [nouveaun NVE0] Attaching displayport spawns kworker taking up 100% cpu"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77073#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveaun NVE0] Attaching displayport spawns kworker taking up 100% cpu"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77073">bug 77073</a>
              from <span class="vcard"><a class="email" href="mailto:daleha&#64;gmail.com" title="Dale Hamel &lt;daleha&#64;gmail.com&gt;"> <span class="fn">Dale Hamel</span></a>
</span></b>
        <pre>Lots of this going on in the kernel log:

[  773.163695] [drm:drm_helper_hpd_irq_event], [CONNECTOR:17:eDP-1] status
updated from connected to connected
[  773.168560] [drm:drm_helper_hpd_irq_event], [CONNECTOR:19:DP-1] status
updated from disconnected to disconnected
[  773.226530] [drm:drm_helper_hpd_irq_event], [CONNECTOR:22:DP-2] status
updated from connected to connected
[  773.229800] [drm:drm_helper_hpd_irq_event], [CONNECTOR:25:HDMI-A-1] status
updated from disconnected to disconnected
[  773.236734] [drm:drm_helper_hpd_irq_event], [CONNECTOR:17:eDP-1] status
updated from connected to connected
[  773.241629] [drm:drm_helper_hpd_irq_event], [CONNECTOR:19:DP-1] status
updated from disconnected to disconnected
[  773.299627] [drm:drm_helper_hpd_irq_event], [CONNECTOR:22:DP-2] status
updated from connected to connected

Not sure if that's normal.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396652738.D58F1.21417--

--===============2071062765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2071062765==--
