From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67878] [NV98] [BISECTED] Hardware freeze after
 resume from suspend
Date: Tue, 15 Jul 2014 18:51:34 +0000
Message-ID: <bug-67878-8800-iLUT40OBjs@http.bugs.freedesktop.org/>
References: <bug-67878-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1212942928=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67878-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1212942928==
Content-Type: multipart/alternative; boundary="1405450294.aEe58d7A4.24462"; charset="us-ascii"


--1405450294.aEe58d7A4.24462
Date: Tue, 15 Jul 2014 18:51:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67878

--- Comment #49 from Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org> ---
(In reply to comment #48)
> (In reply to comment #47)
> > (In reply to comment #46)
> > > I tried to fix this a few months ago but failed. If someone with the right
> > > skills and time want to have a look at this problem, I'd be happy to give
> > > away a laptop with this chipset. Shipment cost on me. I can prepare a linux
> > > installation with sources of the kernel at the regression point. Contact me
> > > if you are up to the task.
> > 
> > Don't do that.
> > 
> > Read here: https://wiki.ubuntu.com/Kernel/KernelBisection
> > If you can follow those Ubuntu-specific instructions, that will narrow down
> > the problem.
> > 
> > If you can't follow those instructions, have you filed a Launchpad bug? If
> > so, please post the link or bug # (double-check that it's a public bug or
> > say it's private).
> 
> The problem is already bisected. The commit that introduces the regression
> switches nv50 to use nvc0's disp implementation. The commit is basically
> deleting all the nv50 code and changing a few function pointers to use the
> nvc0 implementation. I tried pin pointing what the problem was (see comment
> 34) but I was not able to fix the problem.

I saw Ben Gamari's bisection log (from 3.7->3.8), but I didn't realize that you
had duplicated the bisection; I only saw your bump 4 months later, on 3.13.

The OP reported this for a Dell Latitude E6400 with G98; are you running
similar hardware?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1405450294.aEe58d7A4.24462
Date: Tue, 15 Jul 2014 18:51:34 +0000
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
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878#c49">Comment # 49</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878">bug 67878</a>
              from <span class="vcard"><a class="email" href="mailto:peter&#64;hurleysoftware.com" title="Peter Hurley &lt;peter&#64;hurleysoftware.com&gt;"> <span class="fn">Peter Hurley</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67878#c48">comment #48</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=67878#c47">comment #47</a>)
&gt; &gt; (In reply to <a href="show_bug.cgi?id=67878#c46">comment #46</a>)
&gt; &gt; &gt; I tried to fix this a few months ago but failed. If someone with the right
&gt; &gt; &gt; skills and time want to have a look at this problem, I'd be happy to give
&gt; &gt; &gt; away a laptop with this chipset. Shipment cost on me. I can prepare a linux
&gt; &gt; &gt; installation with sources of the kernel at the regression point. Contact me
&gt; &gt; &gt; if you are up to the task.
&gt; &gt; 
&gt; &gt; Don't do that.
&gt; &gt; 
&gt; &gt; Read here: <a href="https://wiki.ubuntu.com/Kernel/KernelBisection">https://wiki.ubuntu.com/Kernel/KernelBisection</a>
&gt; &gt; If you can follow those Ubuntu-specific instructions, that will narrow down
&gt; &gt; the problem.
&gt; &gt; 
&gt; &gt; If you can't follow those instructions, have you filed a Launchpad bug? If
&gt; &gt; so, please post the link or bug # (double-check that it's a public bug or
&gt; &gt; say it's private).
&gt; 
&gt; The problem is already bisected. The commit that introduces the regression
&gt; switches nv50 to use nvc0's disp implementation. The commit is basically
&gt; deleting all the nv50 code and changing a few function pointers to use the
&gt; nvc0 implementation. I tried pin pointing what the problem was (see comment
&gt; 34) but I was not able to fix the problem.</span >

I saw Ben Gamari's bisection log (from 3.7-&gt;3.8), but I didn't realize that you
had duplicated the bisection; I only saw your bump 4 months later, on 3.13.

The OP reported this for a Dell Latitude E6400 with G98; are you running
similar hardware?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1405450294.aEe58d7A4.24462--

--===============1212942928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1212942928==--
