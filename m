From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Wed, 24 Jul 2013 17:49:20 +0000
Message-ID: <bug-58556-8800-hbLDctsXvs@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1929653386=="
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


--===============1929653386==
Content-Type: multipart/alternative; boundary="1374688160.0866d2.16390"; charset="us-ascii"


--1374688160.0866d2.16390
Date: Wed, 24 Jul 2013 17:49:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

--- Comment #9 from Joanand <MacGyver031-S0/GAf8tV78@public.gmane.org> ---
(In reply to comment #7)
> Hi Joanand
Hi Emil

> "Worked" with our without acceleration ?

With GPUPWR, the discrete (nVidia 9600M GT) was no longer available. And as
nouveau works with 9400 and acceleration, it worked with acceleration.

> Did you had the chance to narrow down what caused the change (<3.4.9 vs
> 3.7.1) ? It may be due to nouveau, vgaswitcheroo and/or other kernel driver

3.4.9 did not have a viable vgaswitcheroo, but 3.7+ did. GPUPWR did no longer
help, as vgaswiteroo reactivated 9600m. So the sole solution was to use the
nouveau driver without acceleration.

> 
> There has been a brief discussion what is the best way to handle this
> (passing nouveau params to specific card, disabling certain card etc.)
> although implementation may be far off ;(
> 
> Meanwhile add a hack for your card by checking the PCI and returning early
> rather than initialising the card - not sure which location is better
> nouveau_drm_probe or nouveau_drm_load. Keep in mind to keep is symmetric
> (ie. handle the case in nouveau_drm_remove/nouveau_drm_unload)
> 
> Your code will look something similar to
> 
> if ((pdev->bus == xx) &&
>     (pdev->dev == xx) &&
>     (pdev->func == xx)) {
>       return 0; // you can also try return -E*
> }
> 
> Cheers
> Emil

Thanks for these pointers. I will try this hack on 3.10.2. I will report if I
get any further.

BR
Joanand

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374688160.0866d2.16390
Date: Wed, 24 Jul 2013 17:49:20 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:MacGyver031&#64;web.de" title="Joanand &lt;MacGyver031&#64;web.de&gt;"> <span class="fn">Joanand</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=58556#c7">comment #7</a>)
<span class="quote">&gt; Hi Joanand</span >
Hi Emil

<span class="quote">&gt; &quot;Worked&quot; with our without acceleration ?</span >

With GPUPWR, the discrete (nVidia 9600M GT) was no longer available. And as
nouveau works with 9400 and acceleration, it worked with acceleration.

<span class="quote">&gt; Did you had the chance to narrow down what caused the change (&lt;3.4.9 vs
&gt; 3.7.1) ? It may be due to nouveau, vgaswitcheroo and/or other kernel driver</span >

3.4.9 did not have a viable vgaswitcheroo, but 3.7+ did. GPUPWR did no longer
help, as vgaswiteroo reactivated 9600m. So the sole solution was to use the
nouveau driver without acceleration.

<span class="quote">&gt; 
&gt; There has been a brief discussion what is the best way to handle this
&gt; (passing nouveau params to specific card, disabling certain card etc.)
&gt; although implementation may be far off ;(
&gt; 
&gt; Meanwhile add a hack for your card by checking the PCI and returning early
&gt; rather than initialising the card - not sure which location is better
&gt; nouveau_drm_probe or nouveau_drm_load. Keep in mind to keep is symmetric
&gt; (ie. handle the case in nouveau_drm_remove/nouveau_drm_unload)
&gt; 
&gt; Your code will look something similar to
&gt; 
&gt; if ((pdev-&gt;bus == xx) &amp;&amp;
&gt;     (pdev-&gt;dev == xx) &amp;&amp;
&gt;     (pdev-&gt;func == xx)) {
&gt;       return 0; // you can also try return -E*
&gt; }
&gt; 
&gt; Cheers
&gt; Emil</span >

Thanks for these pointers. I will try this hack on 3.10.2. I will report if I
get any further.

BR
Joanand</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374688160.0866d2.16390--

--===============1929653386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1929653386==--
