From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] [NV84] Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
Date: Sat, 05 Apr 2014 19:34:38 +0000
Message-ID: <bug-70390-8800-Bgy9etnrnW@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0902788387=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70390-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0902788387==
Content-Type: multipart/alternative; boundary="1396726478.AbBB613.28732"; charset="us-ascii"


--1396726478.AbBB613.28732
Date: Sat, 5 Apr 2014 19:34:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70390

--- Comment #19 from Martin von Gagern <Martin.vGagern-hi6Y0CQ0nG0@public.gmane.org> ---
Just got flightgear (version 3 now) crash on me again, unfortunately without
anything saved to the log on disk. My kernel is 3.13.7 at the moment; 3.14.0 on
Gentoo still lacks support by the zfs module, but since I don't need that for
anything essential, I might give it a try now nevertheless.

I also often experience my UI freezing for perhaps 10 seconds or so, but
recovering after that. Apparently I haven't saved the dmesg for one such
incident, but it was something about invalid map address if I remember
correctly. Will try to save that next time around.

So on the whole, 3.13 is more stable for my NV84 than 3.12, but still less
stable than older kernels were for a long time. 3.14 to be tested next.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396726478.AbBB613.28732
Date: Sat, 5 Apr 2014 19:34:38 +0000
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
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390">bug 70390</a>
              from <span class="vcard"><a class="email" href="mailto:Martin.vGagern&#64;gmx.net" title="Martin von Gagern &lt;Martin.vGagern&#64;gmx.net&gt;"> <span class="fn">Martin von Gagern</span></a>
</span></b>
        <pre>Just got flightgear (version 3 now) crash on me again, unfortunately without
anything saved to the log on disk. My kernel is 3.13.7 at the moment; 3.14.0 on
Gentoo still lacks support by the zfs module, but since I don't need that for
anything essential, I might give it a try now nevertheless.

I also often experience my UI freezing for perhaps 10 seconds or so, but
recovering after that. Apparently I haven't saved the dmesg for one such
incident, but it was something about invalid map address if I remember
correctly. Will try to save that next time around.

So on the whole, 3.13 is more stable for my NV84 than 3.12, but still less
stable than older kernels were for a long time. 3.14 to be tested next.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396726478.AbBB613.28732--

--===============0902788387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0902788387==--
