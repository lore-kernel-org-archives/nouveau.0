From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66177] pwm1 value not restored during
 hibernate/restore cycle in the event of manual fan management mode
Date: Fri, 28 Jun 2013 16:14:48 +0000
Message-ID: <bug-66177-8800-qpZybjCv3J@http.bugs.freedesktop.org/>
References: <bug-66177-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1464822045=="
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


--===============1464822045==
Content-Type: multipart/alternative; boundary="1372436088.AEaEDda1.26206"; charset="us-ascii"


--1372436088.AEaEDda1.26206
Date: Fri, 28 Jun 2013 16:14:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66177

--- Comment #6 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
(In reply to comment #5)
> Well, I agree that it is my fault that I may not have thought about the
> suspend/resume cycle. Thanks for reporting that. However, I'm afraid you are
> hit by another bug, a bug in the ALARM mechanism, which explains why
> sometimes, the fan speed isn't updated anymore. This is very worrying and
> may force us to move to using Linux's periodic tasks instead.
It is indeed a serious bug as the average user may not be as careful as I was
or may not necessarily pay attention to the card temperature after
hibernate/restore, particularly if the "auto" fan management was working prior
to that. If that happens, the video card is almost certain to burn out!

> Thanks for this review. I'll work on fixing this ASAP. I can work on the
> sysfs restoration but I have no card with a PWM fan with me here. I may then
> require you to test some stuff.
Have I ever let you down? (;

When you've made your first call for testing of the therm features over 18
months ago, I responded and did quite a lot of some testing (you can't deny
that, can you?), while also benefiting from the "auto" fan management which
was, at the time, working perfectly. It was simply sublime and was a great pity
that it didn't make it into the main nouveau repository at the end (I used your
git thermal fork for absolute ages).

So, I'll be able to help you here with the testing as well, as long as there is
willingness on your and Ben's part to fix these, in my view, very serious bugs.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372436088.AEaEDda1.26206
Date: Fri, 28 Jun 2013 16:14:48 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66177#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - pwm1 value not restored during hibernate/restore cycle in the event of manual fan management mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66177">bug 66177</a>
              from <span class="vcard"><a class="email" href="mailto:mr.dash.four&#64;googlemail.com" title="Mr-4 &lt;mr.dash.four&#64;googlemail.com&gt;"> <span class="fn">Mr-4</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=66177#c5">comment #5</a>)
<span class="quote">&gt; Well, I agree that it is my fault that I may not have thought about the
&gt; suspend/resume cycle. Thanks for reporting that. However, I'm afraid you are
&gt; hit by another bug, a bug in the ALARM mechanism, which explains why
&gt; sometimes, the fan speed isn't updated anymore. This is very worrying and
&gt; may force us to move to using Linux's periodic tasks instead.</span >
It is indeed a serious bug as the average user may not be as careful as I was
or may not necessarily pay attention to the card temperature after
hibernate/restore, particularly if the &quot;auto&quot; fan management was working prior
to that. If that happens, the video card is almost certain to burn out!

<span class="quote">&gt; Thanks for this review. I'll work on fixing this ASAP. I can work on the
&gt; sysfs restoration but I have no card with a PWM fan with me here. I may then
&gt; require you to test some stuff.</span >
Have I ever let you down? (;

When you've made your first call for testing of the therm features over 18
months ago, I responded and did quite a lot of some testing (you can't deny
that, can you?), while also benefiting from the &quot;auto&quot; fan management which
was, at the time, working perfectly. It was simply sublime and was a great pity
that it didn't make it into the main nouveau repository at the end (I used your
git thermal fork for absolute ages).

So, I'll be able to help you here with the testing as well, as long as there is
willingness on your and Ben's part to fix these, in my view, very serious bugs.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372436088.AEaEDda1.26206--

--===============1464822045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1464822045==--
