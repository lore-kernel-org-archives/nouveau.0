From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Wed, 24 Jul 2013 13:17:29 +0000
Message-ID: <bug-58556-8800-dgaIDQJVEY@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0848041295=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0848041295==
Content-Type: multipart/alternative; boundary="1374671849.D3e3E0FD3.376"; charset="us-ascii"


--1374671849.D3e3E0FD3.376
Date: Wed, 24 Jul 2013 13:17:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

--- Comment #7 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Joanand

(In reply to comment #0)
> Resolution for kernels < 3.4.9: I made use of gpupwr to disable the discrete
> adapter and then loaded nouveau (without any parameters). The system was
> "programmed" to use 9400m as it starts. This worked quite fine over long
> time.
> 
"Worked" with our without acceleration ?

> Temporary resolution for 3.7.1: Use MacOSX to change the default adapter to
> the one which is "not" desired. Reboot, load nouveau with noaccel=1 (now
> screen gets scrambled), switch to the other device (in my case "echo DIGD >
> /sys/kernel/debug/vgaswitcheroo/switch"). Voila you have a readable screen.

Did you had the chance to narrow down what caused the change (<3.4.9 vs 3.7.1)
? It may be due to nouveau, vgaswitcheroo and/or other kernel driver


(In reply to comment #6)
> (In reply to comment #5)
> > Great find Matyas
> > 
> > If you're interested in cutting short the sequence you can forcepost the
> > card, thus it should have you the suspend/resume trick. Use
> > nouveau.config=NvForcePost=1
> > 
> > Curious if the above will give you acceleration or only a working
> > output/monitor
> > (ie. try it with and without noaccel=1)
> > 
> > Cheers
> 
> Hi,
> On my MBP, if I do not use noaccel=1, then the whole system crashes.
> 
> I have tried NvForcePost=1 with noaccel, the result was a switched off
> screen, but system seems to boot.
> With accel, screen switches off and crashes.
> 
> Is there any config which would activate accel for 9400 but no accel for
> 9600? This would be very helpful for me.
> 
> Thanks.

There has been a brief discussion what is the best way to handle this (passing
nouveau params to specific card, disabling certain card etc.) although
implementation may be far off ;(

Meanwhile add a hack for your card by checking the PCI and returning early
rather than initialising the card - not sure which location is better
nouveau_drm_probe or nouveau_drm_load. Keep in mind to keep is symmetric (ie.
handle the case in nouveau_drm_remove/nouveau_drm_unload)

Your code will look something similar to

if ((pdev->bus == xx) &&
    (pdev->dev == xx) &&
    (pdev->func == xx)) {
      return 0; // you can also try return -E*
}

Cheers
Emil

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374671849.D3e3E0FD3.376
Date: Wed, 24 Jul 2013 13:17:29 +0000
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
   title="NEW --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hi Joanand

(In reply to <a href="show_bug.cgi?id=58556#c0">comment #0</a>)
<span class="quote">&gt; Resolution for kernels &lt; 3.4.9: I made use of gpupwr to disable the discrete
&gt; adapter and then loaded nouveau (without any parameters). The system was
&gt; &quot;programmed&quot; to use 9400m as it starts. This worked quite fine over long
&gt; time.
&gt; </span >
&quot;Worked&quot; with our without acceleration ?

<span class="quote">&gt; Temporary resolution for 3.7.1: Use MacOSX to change the default adapter to
&gt; the one which is &quot;not&quot; desired. Reboot, load nouveau with noaccel=1 (now
&gt; screen gets scrambled), switch to the other device (in my case &quot;echo DIGD &gt;
&gt; /sys/kernel/debug/vgaswitcheroo/switch&quot;). Voila you have a readable screen.</span >

Did you had the chance to narrow down what caused the change (&lt;3.4.9 vs 3.7.1)
? It may be due to nouveau, vgaswitcheroo and/or other kernel driver


(In reply to <a href="show_bug.cgi?id=58556#c6">comment #6</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=58556#c5">comment #5</a>)
&gt; &gt; Great find Matyas
&gt; &gt; 
&gt; &gt; If you're interested in cutting short the sequence you can forcepost the
&gt; &gt; card, thus it should have you the suspend/resume trick. Use
&gt; &gt; nouveau.config=NvForcePost=1
&gt; &gt; 
&gt; &gt; Curious if the above will give you acceleration or only a working
&gt; &gt; output/monitor
&gt; &gt; (ie. try it with and without noaccel=1)
&gt; &gt; 
&gt; &gt; Cheers
&gt; 
&gt; Hi,
&gt; On my MBP, if I do not use noaccel=1, then the whole system crashes.
&gt; 
&gt; I have tried NvForcePost=1 with noaccel, the result was a switched off
&gt; screen, but system seems to boot.
&gt; With accel, screen switches off and crashes.
&gt; 
&gt; Is there any config which would activate accel for 9400 but no accel for
&gt; 9600? This would be very helpful for me.
&gt; 
&gt; Thanks.</span >

There has been a brief discussion what is the best way to handle this (passing
nouveau params to specific card, disabling certain card etc.) although
implementation may be far off ;(

Meanwhile add a hack for your card by checking the PCI and returning early
rather than initialising the card - not sure which location is better
nouveau_drm_probe or nouveau_drm_load. Keep in mind to keep is symmetric (ie.
handle the case in nouveau_drm_remove/nouveau_drm_unload)

Your code will look something similar to

if ((pdev-&gt;bus == xx) &amp;&amp;
    (pdev-&gt;dev == xx) &amp;&amp;
    (pdev-&gt;func == xx)) {
      return 0; // you can also try return -E*
}

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

--1374671849.D3e3E0FD3.376--

--===============0848041295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0848041295==--
