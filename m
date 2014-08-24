From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61537] Screen flicker when using display with
	incorrect EDID
Date: Sun, 24 Aug 2014 17:07:23 +0000
Message-ID: <bug-61537-8800-EkVyS8YM7h@http.bugs.freedesktop.org/>
References: <bug-61537-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1929485196=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61537-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1929485196==
Content-Type: multipart/alternative; boundary="1408900043.e875A33.23043"; charset="us-ascii"


--1408900043.e875A33.23043
Date: Sun, 24 Aug 2014 17:07:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61537

--- Comment #2 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
I investigated this issue a little. The flickering happens when someone runs
xrandr. This is a hardware issue as the problem happens even with when using
the proprietary driver. This issue got fixed starting with the geforce 8.

The desktop environment shouldn't poll on xrandr like that, so there is a bug
on their side. On our side, the workaround suggested by Jan will be our
"solution" until someone really wants to dig into this issue and see if there
is a way to build a cache or something to avoid load detection.

In any case, I'm tempted to close this bug as "WONTFIX" but I'll wait for other
devs to agree before doing so.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408900043.e875A33.23043
Date: Sun, 24 Aug 2014 17:07:22 +0000
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
   title="NEW --- - Screen flicker when using display with incorrect EDID"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61537#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Screen flicker when using display with incorrect EDID"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61537">bug 61537</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>I investigated this issue a little. The flickering happens when someone runs
xrandr. This is a hardware issue as the problem happens even with when using
the proprietary driver. This issue got fixed starting with the geforce 8.

The desktop environment shouldn't poll on xrandr like that, so there is a bug
on their side. On our side, the workaround suggested by Jan will be our
&quot;solution&quot; until someone really wants to dig into this issue and see if there
is a way to build a cache or something to avoid load detection.

In any case, I'm tempted to close this bug as &quot;WONTFIX&quot; but I'll wait for other
devs to agree before doing so.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408900043.e875A33.23043--

--===============1929485196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1929485196==--
