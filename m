From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66177] pwm1 value not restored during
 hibernate/restore cycle in the event of manual fan management mode
Date: Wed, 26 Jun 2013 22:49:29 +0000
Message-ID: <bug-66177-8800-y5LU90DJ8e@http.bugs.freedesktop.org/>
References: <bug-66177-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1019239219=="
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


--===============1019239219==
Content-Type: multipart/alternative; boundary="1372286969.5F1B31.12077"; charset="us-ascii"


--1372286969.5F1B31.12077
Date: Wed, 26 Jun 2013 22:49:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66177

--- Comment #4 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
(In reply to comment #3)
> The real solution would be to restore all sysfs attributes after reboot.
Indeed, I agree.

> The proposed solution doesn't seem scalable :s
I never claimed that it is - the patch was submitted (note that it wasn't
formal submission either) barely as a guidance - it-works-for-me (tm) (;

> However, I fully agree something should be done here!
Yep.

> I would rather see an automatic fan management by default and some overrides
> to disable it though. Please use the "config" parameter to specify them
> instead of adding parameters to nouveau, it seems to be how darktama wants
> things to work.
How do I "use the config" exactly? And who is "darktama" - is that Ben Skeggs?

> Automatic fan management is supposed to work on all cards < NVC0 (which has
> it at boot time, by default). I discussed enabling it by default for Linux
> 3.11 but it seems we'll need to wait until 3.12.
I am, quite frankly, amazed that something so raw and incomplete as the
automatic fan management could make it into the mainstream kernel code - Ben is
usually thorough as far as these things are concerned and I don't know how this
slipped through.

The "automatic" mode doesn't work - far from it, as evident from my other
submission (and an additional feedback provided) - see Bug #66022 (and Comment
#5 in particular).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372286969.5F1B31.12077
Date: Wed, 26 Jun 2013 22:49:29 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66177#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - pwm1 value not restored during hibernate/restore cycle in the event of manual fan management mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66177">bug 66177</a>
              from <span class="vcard"><a class="email" href="mailto:mr.dash.four&#64;googlemail.com" title="Mr-4 &lt;mr.dash.four&#64;googlemail.com&gt;"> <span class="fn">Mr-4</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=66177#c3">comment #3</a>)
<span class="quote">&gt; The real solution would be to restore all sysfs attributes after reboot.</span >
Indeed, I agree.

<span class="quote">&gt; The proposed solution doesn't seem scalable :s</span >
I never claimed that it is - the patch was submitted (note that it wasn't
formal submission either) barely as a guidance - it-works-for-me (tm) (;

<span class="quote">&gt; However, I fully agree something should be done here!</span >
Yep.

<span class="quote">&gt; I would rather see an automatic fan management by default and some overrides
&gt; to disable it though. Please use the &quot;config&quot; parameter to specify them
&gt; instead of adding parameters to nouveau, it seems to be how darktama wants
&gt; things to work.</span >
How do I &quot;use the config&quot; exactly? And who is &quot;darktama&quot; - is that Ben Skeggs?

<span class="quote">&gt; Automatic fan management is supposed to work on all cards &lt; NVC0 (which has
&gt; it at boot time, by default). I discussed enabling it by default for Linux
&gt; 3.11 but it seems we'll need to wait until 3.12.</span >
I am, quite frankly, amazed that something so raw and incomplete as the
automatic fan management could make it into the mainstream kernel code - Ben is
usually thorough as far as these things are concerned and I don't know how this
slipped through.

The &quot;automatic&quot; mode doesn't work - far from it, as evident from my other
submission (and an additional feedback provided) - see <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - pwm1[_enable] faults after hibernate/restore related to automatic (or otherwise) fan management"
   href="show_bug.cgi?id=66022">Bug #66022</a> (and <a href="show_bug.cgi?id=66177#c5">Comment
#5</a> in particular).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372286969.5F1B31.12077--

--===============1019239219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1019239219==--
