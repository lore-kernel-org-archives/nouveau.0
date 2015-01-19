From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58615] [NV43] hangs with direct rendering since 3.7
	rework
Date: Mon, 19 Jan 2015 20:26:09 +0000
Message-ID: <bug-58615-8800-SpSpxV2jQu@http.bugs.freedesktop.org/>
References: <bug-58615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1893056946=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1893056946==
Content-Type: multipart/alternative; boundary="1421699169.fED6b2.1885"; charset="UTF-8"


--1421699169.fED6b2.1885
Date: Mon, 19 Jan 2015 20:26:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58615

--- Comment #13 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
I seems I  can avoid (workaround) this bug by simply changing in my .config
CONFIG_PREEMPT_NONE=y to CONFIG_PREEMPT_VOLUNTARY=y . I made  this  discovery 
while  trying  official Slackware kernel from Slackware-current. May be this
bug has something in  common with bug described  in
https://www.kernel.org/pub/linux/kernel/v3.x/ChangeLog-3.18.3 as "mm, vmscan:
prevent kswapd livelock due to pfmemalloc-throttled process being killed' . 
Bug seems to hit  only nv40 (and less?) codepath, because my nv50 works fine
without preemption.

Should I  leave  this  bugreport open, or resolve it as WORKSFORME? (currently
I'm  compiling additional test kernel based on nouveau/linux-2.6 linux-3.19
branch , just  to test my workaround one more time.)

Reclocking still seems to work only partially (lost  display  and  another 
kind  of  hang  after  just  few seconds of glxgears  on highest perf level,
lost  display after I switch clocks back to lower frequencies), but this is 
another  issue

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421699169.fED6b2.1885
Date: Mon, 19 Jan 2015 20:26:09 +0000
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
   title="NEW - [NV43] hangs with direct rendering since 3.7 rework"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58615#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV43] hangs with direct rendering since 3.7 rework"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58615">bug 58615</a>
              from <span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>I seems I  can avoid (workaround) this bug by simply changing in my .config
CONFIG_PREEMPT_NONE=y to CONFIG_PREEMPT_VOLUNTARY=y . I made  this  discovery 
while  trying  official Slackware kernel from Slackware-current. May be this
bug has something in  common with bug described  in
<a href="https://www.kernel.org/pub/linux/kernel/v3.x/ChangeLog-3.18.3">https://www.kernel.org/pub/linux/kernel/v3.x/ChangeLog-3.18.3</a> as &quot;mm, vmscan:
prevent kswapd livelock due to pfmemalloc-throttled process being killed' . 
Bug seems to hit  only nv40 (and less?) codepath, because my nv50 works fine
without preemption.

Should I  leave  this  bugreport open, or resolve it as WORKSFORME? (currently
I'm  compiling additional test kernel based on nouveau/linux-2.6 linux-3.19
branch , just  to test my workaround one more time.)

Reclocking still seems to work only partially (lost  display  and  another 
kind  of  hang  after  just  few seconds of glxgears  on highest perf level,
lost  display after I switch clocks back to lower frequencies), but this is 
another  issue</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421699169.fED6b2.1885--

--===============1893056946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1893056946==--
