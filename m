From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66177] pwm1 value not restored during
 hibernate/restore cycle in the event of manual fan management mode
Date: Fri, 28 Jun 2013 16:36:47 +0000
Message-ID: <bug-66177-8800-drZv5DGizY@http.bugs.freedesktop.org/>
References: <bug-66177-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0737281561=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66177-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0737281561==
Content-Type: multipart/alternative; boundary="1372437406.B3A401.618"; charset="us-ascii"


--1372437406.B3A401.618
Date: Fri, 28 Jun 2013 16:36:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66177

--- Comment #7 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
Sorry, one other thing I forgot to mention, which should be pretty obvious,
given what I reported so far:

The "auto" fan management seems to work as expected when I do *not* use it
after hibernate/restore.

In other words, when I boot up my machine (which, by default, has fan
management disabled) and then select "auto" fan management with "echo 2 >
../pwm1_enable", then things are OK - the fan duty (pwm1) constantly hovers
between 20 and 28, depending on my card temperature, keeping that temperature
under control. No problems there.

Things are then *really* screwed up when I do hibernate/restore as reported
previously. So, I suspect the hibernate/restore does something to the nouveau
driver which prevents the auto mode from working properly.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372437406.B3A401.618
Date: Fri, 28 Jun 2013 16:36:46 +0000
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
   title="NEW --- - pwm1 value not restored during hibernate/restore cycle in the event of manual fan management mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66177#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - pwm1 value not restored during hibernate/restore cycle in the event of manual fan management mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66177">bug 66177</a>
              from <span class="vcard"><a class="email" href="mailto:mr.dash.four&#64;googlemail.com" title="Mr-4 &lt;mr.dash.four&#64;googlemail.com&gt;"> <span class="fn">Mr-4</span></a>
</span></b>
        <pre>Sorry, one other thing I forgot to mention, which should be pretty obvious,
given what I reported so far:

The &quot;auto&quot; fan management seems to work as expected when I do *not* use it
after hibernate/restore.

In other words, when I boot up my machine (which, by default, has fan
management disabled) and then select &quot;auto&quot; fan management with &quot;echo 2 &gt;
../pwm1_enable&quot;, then things are OK - the fan duty (pwm1) constantly hovers
between 20 and 28, depending on my card temperature, keeping that temperature
under control. No problems there.

Things are then *really* screwed up when I do hibernate/restore as reported
previously. So, I suspect the hibernate/restore does something to the nouveau
driver which prevents the auto mode from working properly.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372437406.B3A401.618--

--===============0737281561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0737281561==--
