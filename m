From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66177] pwm1 value not restored during
 hibernate/restore cycle in the event of manual fan management mode
Date: Fri, 28 Jun 2013 15:40:49 +0000
Message-ID: <bug-66177-8800-h5JSxM3amE@http.bugs.freedesktop.org/>
References: <bug-66177-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1062870543=="
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


--===============1062870543==
Content-Type: multipart/alternative; boundary="1372434049.D74eC5E2.17083"; charset="us-ascii"


--1372434049.D74eC5E2.17083
Date: Fri, 28 Jun 2013 15:40:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66177

--- Comment #5 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #4)
> (In reply to comment #3)
> > The real solution would be to restore all sysfs attributes after reboot.
> Indeed, I agree.
> 
> > The proposed solution doesn't seem scalable :s
> I never claimed that it is - the patch was submitted (note that it wasn't
> formal submission either) barely as a guidance - it-works-for-me (tm) (;

Ok.

> How do I "use the config" exactly? And who is "darktama" - is that Ben
> Skeggs?

Yes, Darktama is Ben Skeggs. The config option is a string that is used to pass
multiple parameters.

> > Automatic fan management is supposed to work on all cards < NVC0 (which has
> > it at boot time, by default). I discussed enabling it by default for Linux
> > 3.11 but it seems we'll need to wait until 3.12.
> I am, quite frankly, amazed that something so raw and incomplete as the
> automatic fan management could make it into the mainstream kernel code - Ben
> is usually thorough as far as these things are concerned and I don't know
> how this slipped through.
> 
> The "automatic" mode doesn't work - far from it, as evident from my other
> submission (and an additional feedback provided) - see Bug #66022 (and
> Comment #5 in particular).

Well, I agree that it is my fault that I may not have thought about the
suspend/resume cycle. Thanks for reporting that. However, I'm afraid you are
hit by another bug, a bug in the ALARM mechanism, which explains why sometimes,
the fan speed isn't updated anymore. This is very worrying and may force us to
move to using Linux's periodic tasks instead.

Thanks for this review. I'll work on fixing this ASAP. I can work on the sysfs
restoration but I have no card with a PWM fan with me here. I may then require
you to test some stuff.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372434049.D74eC5E2.17083
Date: Fri, 28 Jun 2013 15:40:49 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66177#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - pwm1 value not restored during hibernate/restore cycle in the event of manual fan management mode"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66177">bug 66177</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=66177#c4">comment #4</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=66177#c3">comment #3</a>)
&gt; &gt; The real solution would be to restore all sysfs attributes after reboot.
&gt; Indeed, I agree.
&gt; 
&gt; &gt; The proposed solution doesn't seem scalable :s
&gt; I never claimed that it is - the patch was submitted (note that it wasn't
&gt; formal submission either) barely as a guidance - it-works-for-me (tm) (;</span >

Ok.

<span class="quote">&gt; How do I &quot;use the config&quot; exactly? And who is &quot;darktama&quot; - is that Ben
&gt; Skeggs?</span >

Yes, Darktama is Ben Skeggs. The config option is a string that is used to pass
multiple parameters.

<span class="quote">&gt; &gt; Automatic fan management is supposed to work on all cards &lt; NVC0 (which has
&gt; &gt; it at boot time, by default). I discussed enabling it by default for Linux
&gt; &gt; 3.11 but it seems we'll need to wait until 3.12.
&gt; I am, quite frankly, amazed that something so raw and incomplete as the
&gt; automatic fan management could make it into the mainstream kernel code - Ben
&gt; is usually thorough as far as these things are concerned and I don't know
&gt; how this slipped through.
&gt; 
&gt; The &quot;automatic&quot; mode doesn't work - far from it, as evident from my other
&gt; submission (and an additional feedback provided) - see <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - pwm1[_enable] faults after hibernate/restore related to automatic (or otherwise) fan management"
   href="show_bug.cgi?id=66022">Bug #66022</a> (and
&gt; <a href="show_bug.cgi?id=66177#c5">Comment #5</a> in particular).</span >

Well, I agree that it is my fault that I may not have thought about the
suspend/resume cycle. Thanks for reporting that. However, I'm afraid you are
hit by another bug, a bug in the ALARM mechanism, which explains why sometimes,
the fan speed isn't updated anymore. This is very worrying and may force us to
move to using Linux's periodic tasks instead.

Thanks for this review. I'll work on fixing this ASAP. I can work on the sysfs
restoration but I have no card with a PWM fan with me here. I may then require
you to test some stuff.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372434049.D74eC5E2.17083--

--===============1062870543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1062870543==--
