From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Sat, 27 Jul 2013 10:32:03 +0000
Message-ID: <bug-67382-8800-ZPRLoXboTy@http.bugs.freedesktop.org/>
References: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1269022651=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1269022651==
Content-Type: multipart/alternative; boundary="1374921123.dd5Afe0C2.17915"; charset="us-ascii"


--1374921123.dd5Afe0C2.17915
Date: Sat, 27 Jul 2013 10:32:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67382

--- Comment #3 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #0)
> After looking at #66129 and testing linux 3.10.3 (includes the patches from
> 66129) and still having problems, I decided to open a bugreport, as the
> problem appears to be something else.
> I'm not sure if the topic describes the problem really well.
> 
> 
> First I should mention, that I wrote a bugreport on the kernel tracker:
> https://bugzilla.kernel.org/show_bug.cgi?id=60071
> Which was probably the wrong place, and a complete different description.
> 
> 
> Machine:
> One from the nv50 (8800 GTS) graphic cards. One monitor.
> 
So in case of 3.9.7 your system seems to be detecting a ghost monitor, hooked
up to your DVI-I-2. Did I get that right?

> Notes:
> *early KMS
> 
> 
> Issue:
> With 3.9.6 everything is working fine. Systems boots and I'm getting my DM
> 
> 3.9.7 introduced following changes:
> commit aed4802d2a0d2f6c7179a2c03e184860741788c0
> Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date: Mon Jun 3 16:40:14 2013 +1000
> 
> drm/nv50/kms: use dac loadval from vbios, where it's available
> 
> commit d40ee48acde16894fb3b241d7e896d5fa84e0f10 upstream.
> -------
> commit b242745947ed7562ad91dad9e9fde1a92e40d666
> Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date: Mon Jun 3 16:07:06 2013 +1000
> 
> drm/nv50/disp: force dac power state during load detect
> 
> commit ea9197cc323839ef3d5280c0453b2c622caa6bc7 upstream.
I would suspect this ^^ commit to be the one causing the issue. Can you please
revert it on top of 3.9.7 and confirm ?
How many monitors does that kernel detect ?

> -------
> 
> Since 3.9.7 (also tested with 3.9.8 and 3.10.3) the X-server won't be
> accessible. If that's the right description. I'm just seeing a black screen
> and I just can switch back to a tty (which takes it time).
> Tried it with a DM and without (plain xinit/startx from tty).
> 
A brief explanation what happens here:
Nouveau detects a phantom/ghost monitor hooked up to DVI-I-2, which on it's own
causes the DISPLAY engine to hang. Leading to the kernel being unable to change
the resolution(modesetting), and X failing to start and VT switch being dead
slow

Cheers
Emil

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374921123.dd5Afe0C2.17915
Date: Sat, 27 Jul 2013 10:32:03 +0000
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
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382">bug 67382</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67382#c0">comment #0</a>)
<span class="quote">&gt; After looking at #66129 and testing linux 3.10.3 (includes the patches from
&gt; 66129) and still having problems, I decided to open a bugreport, as the
&gt; problem appears to be something else.
&gt; I'm not sure if the topic describes the problem really well.
&gt; 
&gt; 
&gt; First I should mention, that I wrote a bugreport on the kernel tracker:
&gt; <a href="https://bugzilla.kernel.org/show_bug.cgi?id=60071">https://bugzilla.kernel.org/show_bug.cgi?id=60071</a>
&gt; Which was probably the wrong place, and a complete different description.
&gt; 
&gt; 
&gt; Machine:
&gt; One from the nv50 (8800 GTS) graphic cards. One monitor.
&gt; </span >
So in case of 3.9.7 your system seems to be detecting a ghost monitor, hooked
up to your DVI-I-2. Did I get that right?

<span class="quote">&gt; Notes:
&gt; *early KMS
&gt; 
&gt; 
&gt; Issue:
&gt; With 3.9.6 everything is working fine. Systems boots and I'm getting my DM
&gt; 
&gt; 3.9.7 introduced following changes:
&gt; commit aed4802d2a0d2f6c7179a2c03e184860741788c0
&gt; Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
&gt; Date: Mon Jun 3 16:40:14 2013 +1000
&gt; 
&gt; drm/nv50/kms: use dac loadval from vbios, where it's available
&gt; 
&gt; commit d40ee48acde16894fb3b241d7e896d5fa84e0f10 upstream.
&gt; -------
&gt; commit b242745947ed7562ad91dad9e9fde1a92e40d666
&gt; Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
&gt; Date: Mon Jun 3 16:07:06 2013 +1000
&gt; 
&gt; drm/nv50/disp: force dac power state during load detect
&gt; 
&gt; commit ea9197cc323839ef3d5280c0453b2c622caa6bc7 upstream.</span >
I would suspect this ^^ commit to be the one causing the issue. Can you please
revert it on top of 3.9.7 and confirm ?
How many monitors does that kernel detect ?

<span class="quote">&gt; -------
&gt; 
&gt; Since 3.9.7 (also tested with 3.9.8 and 3.10.3) the X-server won't be
&gt; accessible. If that's the right description. I'm just seeing a black screen
&gt; and I just can switch back to a tty (which takes it time).
&gt; Tried it with a DM and without (plain xinit/startx from tty).
&gt; </span >
A brief explanation what happens here:
Nouveau detects a phantom/ghost monitor hooked up to DVI-I-2, which on it's own
causes the DISPLAY engine to hang. Leading to the kernel being unable to change
the resolution(modesetting), and X failing to start and VT switch being dead
slow

Cheers
Emil</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374921123.dd5Afe0C2.17915--

--===============1269022651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1269022651==--
