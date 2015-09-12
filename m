From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82527] xset dpms force {off, standby,
 suspend} returns after ~20 seconds (GeForce 8400 GS)
Date: Sat, 12 Sep 2015 15:24:13 +0000
Message-ID: <bug-82527-8800-0WtG71bgLc@http.bugs.freedesktop.org/>
References: <bug-82527-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1167160135=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82527-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1167160135==
Content-Type: multipart/alternative; boundary="1442071452.f74B52.30155"; charset="UTF-8"


--1442071452.f74B52.30155
Date: Sat, 12 Sep 2015 15:24:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82527

--- Comment #14 from Jimmie Mayfield <mayfield+bugzilla-IFvXyFRXtTIgsBAKwltoeQ@public.gmane.org> ---
For what it's worth, I see similar behavior with the Nouveau driver on OpenSUSE
13.2 (kernel 3.16.7-24, xf86-video-nouveau-1.0.11-1.3)

My office machine has two displays connected to a GTS450.  Both displays go
into standby mode.  After a short delay -- I haven't measured by hand but the
aforementioned 20-second value sounds about right -- the secondary display
comes out of standby.  Near as I can tell, this behavior only affects the
secondary display.  I can also confirm that the behavior did not occur when
using the proprietary nVidia drivers.

Another data point that may be useful when diagnosing the problem: I'm also
using the nVidia card for audio.  I'm away from the office for a few days but
I'm reasonably confident that both displays are connected via DVI and that my
speakers are connected to the secondary display's audio line-out jack.  Is it
possible that the secondary display's inability to remain in standby mode is
somehow audio-related?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1442071452.f74B52.30155
Date: Sat, 12 Sep 2015 15:24:12 +0000
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
   title="NEW - xset dpms force {off,standby,suspend} returns after ~20 seconds (GeForce 8400 GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82527#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - xset dpms force {off,standby,suspend} returns after ~20 seconds (GeForce 8400 GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82527">bug 82527</a>
              from <span class="vcard"><a class="email" href="mailto:mayfield+bugzilla&#64;sackheads.org" title="Jimmie Mayfield &lt;mayfield+bugzilla&#64;sackheads.org&gt;"> <span class="fn">Jimmie Mayfield</span></a>
</span></b>
        <pre>For what it's worth, I see similar behavior with the Nouveau driver on OpenSUSE
13.2 (kernel 3.16.7-24, xf86-video-nouveau-1.0.11-1.3)

My office machine has two displays connected to a GTS450.  Both displays go
into standby mode.  After a short delay -- I haven't measured by hand but the
aforementioned 20-second value sounds about right -- the secondary display
comes out of standby.  Near as I can tell, this behavior only affects the
secondary display.  I can also confirm that the behavior did not occur when
using the proprietary nVidia drivers.

Another data point that may be useful when diagnosing the problem: I'm also
using the nVidia card for audio.  I'm away from the office for a few days but
I'm reasonably confident that both displays are connected via DVI and that my
speakers are connected to the secondary display's audio line-out jack.  Is it
possible that the secondary display's inability to remain in standby mode is
somehow audio-related?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442071452.f74B52.30155--

--===============1167160135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1167160135==--
