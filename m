From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66022] pwm1[_enable] faults after hibernate/restore
 related to automatic (or otherwise) fan management
Date: Mon, 24 Jun 2013 03:30:29 +0000
Message-ID: <bug-66022-8800-x0UmtCR5T7@http.bugs.freedesktop.org/>
References: <bug-66022-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1439212531=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66022-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1439212531==
Content-Type: multipart/alternative; boundary="1372044629.ab2d621.5470"; charset="us-ascii"


--1372044629.ab2d621.5470
Date: Mon, 24 Jun 2013 03:30:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66022

--- Comment #4 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
(In reply to comment #2)
> This patch should resolve the first bug. Please give it a try and as usual
> observe the temperatures
OK, I've had mixed results so far.

The patch does work, but not always - sometimes even though the
hibernate/restore is successful (and the fans are running at low speed from the
beginning) my system locks up completely, usually a few seconds after restore
has done its job.

I'll keep testing this and post any new developments.

In the meantime, I just attached a patch of my own - I've modified nouveau_pm.c
to start in "automatic" fan mode from the very start. That is made possible by
specifying "nouveau.therm_fan_mode_auto=1" as kernel parameter, so that I don't
have to rely on my rc.local and other such scripts.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372044629.ab2d621.5470
Date: Mon, 24 Jun 2013 03:30:29 +0000
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
   title="NEW --- - pwm1[_enable] faults after hibernate/restore related to automatic (or otherwise) fan management"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66022#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - pwm1[_enable] faults after hibernate/restore related to automatic (or otherwise) fan management"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66022">bug 66022</a>
              from <span class="vcard"><a class="email" href="mailto:mr.dash.four&#64;googlemail.com" title="Mr-4 &lt;mr.dash.four&#64;googlemail.com&gt;"> <span class="fn">Mr-4</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=66022#c2">comment #2</a>)
<span class="quote">&gt; This patch should resolve the first bug. Please give it a try and as usual
&gt; observe the temperatures</span >
OK, I've had mixed results so far.

The patch does work, but not always - sometimes even though the
hibernate/restore is successful (and the fans are running at low speed from the
beginning) my system locks up completely, usually a few seconds after restore
has done its job.

I'll keep testing this and post any new developments.

In the meantime, I just attached a patch of my own - I've modified nouveau_pm.c
to start in &quot;automatic&quot; fan mode from the very start. That is made possible by
specifying &quot;nouveau.therm_fan_mode_auto=1&quot; as kernel parameter, so that I don't
have to rely on my rc.local and other such scripts.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372044629.ab2d621.5470--

--===============1439212531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1439212531==--
