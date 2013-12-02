From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71455] Thermal management in nouveau running hot
	3.12.0+ kernel
Date: Mon, 02 Dec 2013 04:59:27 +0000
Message-ID: <bug-71455-8800-mBDzoyYS9H@http.bugs.freedesktop.org/>
References: <bug-71455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1565626733=="
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


--===============1565626733==
Content-Type: multipart/alternative; boundary="1385960367.81De6AFC1.7532"; charset="us-ascii"


--1385960367.81De6AFC1.7532
Date: Mon, 2 Dec 2013 04:59:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71455

--- Comment #6 from Bob Gleitsmann <rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org> ---
In view of Ben's comment, I am stopping further research. However, I will offer
as a final remark that perfE.pstate = 0x20 on my card. It gets into
nv40_clock_ctor but the fan speed is never set. According to nvbios, for this
card the default setting for the fan speed is 50. 

Best Wishes,

Bob

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385960367.81De6AFC1.7532
Date: Mon, 2 Dec 2013 04:59:27 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71455#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Thermal management in nouveau running hot 3.12.0+ kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71455">bug 71455</a>
              from <span class="vcard"><a class="email" href="mailto:rjgleits&#64;bellsouth.net" title="Bob Gleitsmann &lt;rjgleits&#64;bellsouth.net&gt;"> <span class="fn">Bob Gleitsmann</span></a>
</span></b>
        <pre>In view of Ben's comment, I am stopping further research. However, I will offer
as a final remark that perfE.pstate = 0x20 on my card. It gets into
nv40_clock_ctor but the fan speed is never set. According to nvbios, for this
card the default setting for the fan speed is 50. 

Best Wishes,

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

--1385960367.81De6AFC1.7532--

--===============1565626733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1565626733==--
