From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69827] [NVC1] Uneven, jerky mouse movement,
 increasing CPU usage
Date: Thu, 01 May 2014 06:10:04 +0000
Message-ID: <bug-69827-8800-D3TlOBnbQR@http.bugs.freedesktop.org/>
References: <bug-69827-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1149638113=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69827-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1149638113==
Content-Type: multipart/alternative; boundary="1398924604.6A4DDF1.20657"; charset="us-ascii"


--1398924604.6A4DDF1.20657
Date: Thu, 1 May 2014 06:10:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69827

--- Comment #6 from James Moe <jimoe-zgPZrQL6nFyVmwMjj6irZQ@public.gmane.org> ---
linux 3.11.10-7-desktop x86_64
gnome 3.10.2
Gallium 0.4 on NVC1

This issue has surfaced again in a slightly different form recently, within the
last two weeks.

The mouse data stream is interrupted and restarted at random intervals, in
generally less than a minute. By "interrupted" I mean that the current mouse
state is cleared; if button1 is down, it appears no longer down. And
"restarted" means that the mouse state is restored immediately after it is
interrupted but it appears as a new state: button1 is now down.

It makes button1 click-drag a chancy process as the stream is sometimes
interrupted/restarted quickly enough that it appears as a double-click followed
by click-drag.

Still using a kernel "tainted" by VirtualBox.

This new aspect has no obvious affect on CPU usage.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398924604.6A4DDF1.20657
Date: Thu, 1 May 2014 06:10:04 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [NVC1] Uneven, jerky mouse movement, increasing CPU usage"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69827#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NVC1] Uneven, jerky mouse movement, increasing CPU usage"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69827">bug 69827</a>
              from <span class="vcard"><a class="email" href="mailto:jimoe&#64;sohnen-moe.com" title="James Moe &lt;jimoe&#64;sohnen-moe.com&gt;"> <span class="fn">James Moe</span></a>
</span></b>
        <pre>linux 3.11.10-7-desktop x86_64
gnome 3.10.2
Gallium 0.4 on NVC1

This issue has surfaced again in a slightly different form recently, within the
last two weeks.

The mouse data stream is interrupted and restarted at random intervals, in
generally less than a minute. By &quot;interrupted&quot; I mean that the current mouse
state is cleared; if button1 is down, it appears no longer down. And
&quot;restarted&quot; means that the mouse state is restored immediately after it is
interrupted but it appears as a new state: button1 is now down.

It makes button1 click-drag a chancy process as the stream is sometimes
interrupted/restarted quickly enough that it appears as a double-click followed
by click-drag.

Still using a kernel &quot;tainted&quot; by VirtualBox.

This new aspect has no obvious affect on CPU usage.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398924604.6A4DDF1.20657--

--===============1149638113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1149638113==--
