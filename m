From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70208] Nouveau driver doesn't find vbios for Geforce
 GT 750M on Asus N750JV laptop
Date: Thu, 10 Oct 2013 20:38:37 +0000
Message-ID: <bug-70208-8800-OKUAgaYYIA@http.bugs.freedesktop.org/>
References: <bug-70208-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1922311574=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70208-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1922311574==
Content-Type: multipart/alternative; boundary="1381437517.d1Cc41.11055"; charset="us-ascii"


--1381437517.d1Cc41.11055
Date: Thu, 10 Oct 2013 20:38:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70208

--- Comment #22 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #15)
> But for the nouveau: It fails to initialise the acceleration, as far as I
> can see.
> 
> The /var/log/Xorg.0.log shows: (i will attach the full log)
> 
> [    75.892] (II) NOUVEAU(G0): Opened GPU channel 0
> [    77.893] (EE) NOUVEAU(G0): Failed to initialise context object: 2D_NVC0
> (0)
> [    77.893] (EE) NOUVEAU(G0): Error initialising acceleration.  Falling
> back to NoAccel
> [    77.893] (==) NOUVEAU(G0): Backing store disabled
> [    77.893] (==) NOUVEAU(G0): Silken mouse enabled
> [    77.893] (==) NOUVEAU(G0): DPMS enabled
> [    77.893] (II) NOUVEAU(G0): RandR 1.2 enabled, ignore the following RandR
> disabled message.

Agree with Emil. See bug 70354 -- it covers this problem. Let's keep this issue
to just being about VBIOS failure.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381437517.d1Cc41.11055
Date: Thu, 10 Oct 2013 20:38:37 +0000
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
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208">bug 70208</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=70208#c15">comment #15</a>)
<span class="quote">&gt; But for the nouveau: It fails to initialise the acceleration, as far as I
&gt; can see.
&gt; 
&gt; The /var/log/Xorg.0.log shows: (i will attach the full log)
&gt; 
&gt; [    75.892] (II) NOUVEAU(G0): Opened GPU channel 0
&gt; [    77.893] (EE) NOUVEAU(G0): Failed to initialise context object: 2D_NVC0
&gt; (0)
&gt; [    77.893] (EE) NOUVEAU(G0): Error initialising acceleration.  Falling
&gt; back to NoAccel
&gt; [    77.893] (==) NOUVEAU(G0): Backing store disabled
&gt; [    77.893] (==) NOUVEAU(G0): Silken mouse enabled
&gt; [    77.893] (==) NOUVEAU(G0): DPMS enabled
&gt; [    77.893] (II) NOUVEAU(G0): RandR 1.2 enabled, ignore the following RandR
&gt; disabled message.</span >

Agree with Emil. See <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Failed to initialise context object: 2D_NVC0 (0) (for my GeForce GT 750M)"
   href="show_bug.cgi?id=70354">bug 70354</a> -- it covers this problem. Let's keep this issue
to just being about VBIOS failure.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381437517.d1Cc41.11055--

--===============1922311574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1922311574==--
