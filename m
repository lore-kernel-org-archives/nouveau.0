From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Wed, 09 Jul 2014 16:35:04 +0000
Message-ID: <bug-80901-8800-KnnGduiESl@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1077725669=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80901-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1077725669==
Content-Type: multipart/alternative; boundary="1404923704.1Dd31.11650"; charset="us-ascii"


--1404923704.1Dd31.11650
Date: Wed, 9 Jul 2014 16:35:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80901

--- Comment #15 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #14)
> The problem I see with trip-points is that those allow to set a fixed PWM
> value when the sensors detect a certain temperature. The nouveau driver
> instead raises the fan speed "continuously" after a certain temperature is
> reached (would we need infinite trip-points for that?). 
> Please correct any error in my understanding here :)
> 
> Maybe we can use the trip points as a start/end point and then move
> autonomously disregarding the point[0-*]_pwm value?
> 
> 
> For now, if you agree, I will move the sysfs values as suggested (and change
> the documentation), hopefully before/during next weekend. 
> So this bug will still have an almost "clean" patch for anyone (included me)
> who want it.
> Then I will ask around in the lm-sensors mailing list (is it the correct
> one?). Hopefully someone can point me to a better solution.
> 
> Thanks for the review! :)

Yes, you understood my review and have a perfect todo list! Good luck with it
:)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404923704.1Dd31.11650
Date: Wed, 9 Jul 2014 16:35:04 +0000
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
   title="NEW --- - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901">bug 80901</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=80901#c14">comment #14</a>)
<span class="quote">&gt; The problem I see with trip-points is that those allow to set a fixed PWM
&gt; value when the sensors detect a certain temperature. The nouveau driver
&gt; instead raises the fan speed &quot;continuously&quot; after a certain temperature is
&gt; reached (would we need infinite trip-points for that?). 
&gt; Please correct any error in my understanding here :)
&gt; 
&gt; Maybe we can use the trip points as a start/end point and then move
&gt; autonomously disregarding the point[0-*]_pwm value?
&gt; 
&gt; 
&gt; For now, if you agree, I will move the sysfs values as suggested (and change
&gt; the documentation), hopefully before/during next weekend. 
&gt; So this bug will still have an almost &quot;clean&quot; patch for anyone (included me)
&gt; who want it.
&gt; Then I will ask around in the lm-sensors mailing list (is it the correct
&gt; one?). Hopefully someone can point me to a better solution.
&gt; 
&gt; Thanks for the review! :)</span >

Yes, you understood my review and have a perfect todo list! Good luck with it
:)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404923704.1Dd31.11650--

--===============1077725669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1077725669==--
