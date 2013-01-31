From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Thu, 31 Jan 2013 00:46:23 +0000
Message-ID: <bug-50121-8800-PjNAKr6glb@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1496111956=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1496111956==
Content-Type: multipart/alternative; boundary="1359593184.cCc8F4B5.25731"; charset="us-ascii"


--1359593184.cCc8F4B5.25731
Date: Thu, 31 Jan 2013 00:46:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

--- Comment #59 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
(In reply to comment #58)
> Created attachment 73597 [details] [review]
> Backport for 3.5 (and may be 3.6) - fixed again
I have to say, I didn't expect for this to be fixed, but this time it looks as
though this nasty bug is being squashed. I have been doing hibernate/restore
like mad (a couple of times a day) for the past week and not a single glitch,
not one!

My one-and-only gripe with this (and it really is a minor one, given the
circumstances) is that since I used a "fork" of the mainstream driver from
Martin Peres (mupuf) at gitorious
(http://gitorious.org/linux-nouveau-pm/linux-nouveau-pm/commits/thermal) to
take advantage of the automatic fan management so that I don't have to execute
"echo 40 > /sys/class/drm/card0/device/pwm0" every time I come out of
hibernation and stop my nvidia fan wailing like a jet engine, this is still not
implemented in the main stream driver code.

I used to have this so that when I come out of hibernate the automatic fan
management takes over and reduces my fan speed according to the current
temperature of the video card. It worked a treat, but I don't seem to be
getting this any more and applying the patch which fixed the above bug is not
possible against Martin's fork, unfortunately.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1359593184.cCc8F4B5.25731
Date: Thu, 31 Jan 2013 00:46:24 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c59">Comment # 59</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:mr.dash.four&#64;googlemail.com" title="Mr-4 &lt;mr.dash.four&#64;googlemail.com&gt;"> <span class="fn">Mr-4</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=50121#c58">comment #58</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=73597" name="attach_73597" title="Backport for 3.5 (and may be 3.6) - fixed again">attachment 73597</a> <a href="attachment.cgi?id=73597&amp;action=edit" title="Backport for 3.5 (and may be 3.6) - fixed again">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=50121&amp;attachment=73597'>[review]</a> [review]
&gt; Backport for 3.5 (and may be 3.6) - fixed again</span >
I have to say, I didn't expect for this to be fixed, but this time it looks as
though this nasty bug is being squashed. I have been doing hibernate/restore
like mad (a couple of times a day) for the past week and not a single glitch,
not one!

My one-and-only gripe with this (and it really is a minor one, given the
circumstances) is that since I used a &quot;fork&quot; of the mainstream driver from
Martin Peres (mupuf) at gitorious
(<a href="http://gitorious.org/linux-nouveau-pm/linux-nouveau-pm/commits/thermal">http://gitorious.org/linux-nouveau-pm/linux-nouveau-pm/commits/thermal</a>) to
take advantage of the automatic fan management so that I don't have to execute
&quot;echo 40 &gt; /sys/class/drm/card0/device/pwm0&quot; every time I come out of
hibernation and stop my nvidia fan wailing like a jet engine, this is still not
implemented in the main stream driver code.

I used to have this so that when I come out of hibernate the automatic fan
management takes over and reduces my fan speed according to the current
temperature of the video card. It worked a treat, but I don't seem to be
getting this any more and applying the patch which fixed the above bug is not
possible against Martin's fork, unfortunately.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359593184.cCc8F4B5.25731--

--===============1496111956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1496111956==--
