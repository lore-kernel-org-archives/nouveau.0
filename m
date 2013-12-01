From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71455] Thermal management in nouveau running hot
	3.12.0+ kernel
Date: Sun, 01 Dec 2013 17:25:18 +0000
Message-ID: <bug-71455-8800-RE58WP53Pl@http.bugs.freedesktop.org/>
References: <bug-71455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0124042320=="
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


--===============0124042320==
Content-Type: multipart/alternative; boundary="1385918718.6B5C4D1.5545"; charset="us-ascii"


--1385918718.6B5C4D1.5545
Date: Sun, 1 Dec 2013 17:25:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71455

--- Comment #2 from Bob Gleitsmann <rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org> ---
Here is an additional data point. The problematic kernel sets 0xb20010f0 to
0x83ff03ff. The driver reports that the PWM is 100%. In fact it is 100% off. As
can be expected, the temperature immediately begins repidly rising.
Interestingly, the card seems to self protect by turning the fan on when the
temperature gets above the "critical" temperature and restoring the default PWM
(fan off). I suppose that is what "auto" means. The value in 0xb200010f0 never
changes while the fan speed goes up and down. 
The blob sets the same mmio address to 0x81ff03ff and reports the fan to be
50%. I can't tell you if "100%" PWM is fan off on all NV cards. I'm sure you
already know anyway. The fan speeds up significantly if the PWM setting is
either 0x00007fff or 0x80007fff. 
I guess that's more than one data point. Other than that, I'm completely in the
dark. However, I think I will patch my kernel so that it sets the PWM to 50%
instead of 100%. 50% off is a lot better than 100% off.

Bob

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385918718.6B5C4D1.5545
Date: Sun, 1 Dec 2013 17:25:18 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71455#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Thermal management in nouveau running hot 3.12.0+ kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71455">bug 71455</a>
              from <span class="vcard"><a class="email" href="mailto:rjgleits&#64;bellsouth.net" title="Bob Gleitsmann &lt;rjgleits&#64;bellsouth.net&gt;"> <span class="fn">Bob Gleitsmann</span></a>
</span></b>
        <pre>Here is an additional data point. The problematic kernel sets 0xb20010f0 to
0x83ff03ff. The driver reports that the PWM is 100%. In fact it is 100% off. As
can be expected, the temperature immediately begins repidly rising.
Interestingly, the card seems to self protect by turning the fan on when the
temperature gets above the &quot;critical&quot; temperature and restoring the default PWM
(fan off). I suppose that is what &quot;auto&quot; means. The value in 0xb200010f0 never
changes while the fan speed goes up and down. 
The blob sets the same mmio address to 0x81ff03ff and reports the fan to be
50%. I can't tell you if &quot;100%&quot; PWM is fan off on all NV cards. I'm sure you
already know anyway. The fan speeds up significantly if the PWM setting is
either 0x00007fff or 0x80007fff. 
I guess that's more than one data point. Other than that, I'm completely in the
dark. However, I think I will patch my kernel so that it sets the PWM to 50%
instead of 100%. 50% off is a lot better than 100% off.

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

--1385918718.6B5C4D1.5545--

--===============0124042320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0124042320==--
