From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71455] Thermal management in nouveau running hot
	3.12.0+ kernel
Date: Sun, 01 Dec 2013 21:06:26 +0000
Message-ID: <bug-71455-8800-reGonXeFvD@http.bugs.freedesktop.org/>
References: <bug-71455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1329210369=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71455-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1329210369==
Content-Type: multipart/alternative; boundary="1385931986.8BD81.10691"; charset="us-ascii"


--1385931986.8BD81.10691
Date: Sun, 1 Dec 2013 21:06:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71455

--- Comment #3 from Bob Gleitsmann <rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org> ---
The fan PWM setting is derived from priv->cstate. The value it gets from there
is zero. So the setting of PWM for NV40 is working correctly, "inverting" the
percent setting to get the value set in 0xb20010f0. Probably priv->cstate is
never initialized. I'll bet that wasn't intentional.

Bob

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385931986.8BD81.10691
Date: Sun, 1 Dec 2013 21:06:26 +0000
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
   title="NEW --- - Thermal management in nouveau running hot 3.12.0+ kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71455#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Thermal management in nouveau running hot 3.12.0+ kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71455">bug 71455</a>
              from <span class="vcard"><a class="email" href="mailto:rjgleits&#64;bellsouth.net" title="Bob Gleitsmann &lt;rjgleits&#64;bellsouth.net&gt;"> <span class="fn">Bob Gleitsmann</span></a>
</span></b>
        <pre>The fan PWM setting is derived from priv-&gt;cstate. The value it gets from there
is zero. So the setting of PWM for NV40 is working correctly, &quot;inverting&quot; the
percent setting to get the value set in 0xb20010f0. Probably priv-&gt;cstate is
never initialized. I'll bet that wasn't intentional.

Bob</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385931986.8BD81.10691--

--===============1329210369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1329210369==--
