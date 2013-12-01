From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71455] Thermal management in nouveau running hot
	3.12.0+ kernel
Date: Sun, 01 Dec 2013 21:09:52 +0000
Message-ID: <bug-71455-8800-A1QS623Kt1@http.bugs.freedesktop.org/>
References: <bug-71455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0389384158=="
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


--===============0389384158==
Content-Type: multipart/alternative; boundary="1385932192.DfBE11.11189"; charset="us-ascii"


--1385932192.DfBE11.11189
Date: Sun, 1 Dec 2013 21:09:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71455

--- Comment #4 from Bob Gleitsmann <rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org> ---
Oh, the value reported by the driver for the PWM setting is the value before it
is set by the driver. It doesn't say that in the kernel message.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385932192.DfBE11.11189
Date: Sun, 1 Dec 2013 21:09:52 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71455#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Thermal management in nouveau running hot 3.12.0+ kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71455">bug 71455</a>
              from <span class="vcard"><a class="email" href="mailto:rjgleits&#64;bellsouth.net" title="Bob Gleitsmann &lt;rjgleits&#64;bellsouth.net&gt;"> <span class="fn">Bob Gleitsmann</span></a>
</span></b>
        <pre>Oh, the value reported by the driver for the PWM setting is the value before it
is set by the driver. It doesn't say that in the kernel message.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385932192.DfBE11.11189--

--===============0389384158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0389384158==--
