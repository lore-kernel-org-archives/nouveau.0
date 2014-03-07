From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Fri, 07 Mar 2014 23:21:06 +0000
Message-ID: <bug-58556-8800-GcXyzVgbe3@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1298394166=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1298394166==
Content-Type: multipart/alternative; boundary="1394234466.B0D1fAE5.2910"; charset="us-ascii"


--1394234466.B0D1fAE5.2910
Date: Fri, 7 Mar 2014 23:21:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

--- Comment #24 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Hi Joanand,

My HEAD before applying the patch was commit 34d5950
(http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=drm-nouveau-next&id=34d595081812da62b5357579267c4ab5eae64ac1).
The HEAD after the patch is just: 34d5950 + e18833a, nothing more. So I'm
running with both cards enabled.

I tried Ilias' patch (https://bugs.freedesktop.org/show_bug.cgi?id=27501#c27)
to test each card alone, and I got:

*   NVAC only: corrupted screen (without e18833a) + acceleration not working;
*   NV96 only: no corrupted screen (even without e18833a) + acceleration
working.

I wonder why we do have quite different results for the NV96...

Cheers,

Pierre

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394234466.B0D1fAE5.2910
Date: Fri, 7 Mar 2014 23:21:06 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Hi Joanand,

My HEAD before applying the patch was commit 34d5950
(<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=drm-nouveau-next&amp;id=34d595081812da62b5357579267c4ab5eae64ac1">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=drm-nouveau-next&amp;id=34d595081812da62b5357579267c4ab5eae64ac1</a>).
The HEAD after the patch is just: 34d5950 + e18833a, nothing more. So I'm
running with both cards enabled.

I tried Ilias' patch (<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="show_bug.cgi?id=27501#c27">https://bugs.freedesktop.org/show_bug.cgi?id=27501#c27</a>)
to test each card alone, and I got:

*   NVAC only: corrupted screen (without e18833a) + acceleration not working;
*   NV96 only: no corrupted screen (even without e18833a) + acceleration
working.

I wonder why we do have quite different results for the NV96...

Cheers,

Pierre</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394234466.B0D1fAE5.2910--

--===============1298394166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1298394166==--
