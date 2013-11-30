From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69180] [NVC1] Delays when using nouveau and
	switcheroo
Date: Sat, 30 Nov 2013 06:39:03 +0000
Message-ID: <bug-69180-8800-8jdJIZPCgK@http.bugs.freedesktop.org/>
References: <bug-69180-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0464365827=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69180-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0464365827==
Content-Type: multipart/alternative; boundary="1385793543.F31a2.5456"; charset="us-ascii"


--1385793543.F31a2.5456
Date: Sat, 30 Nov 2013 06:39:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69180

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Please try this with 3.11.10 or 3.12.2 or 3.13-rc2. There was a patch that
could help NVC1 cards included in all 3 of those (well, it went into 3.13-rc1).
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=13d2b35a065399
. Note that 3.12+ also have runtime pm for optimus setups, which will
automatically turn the nvidia card on/off depending on whether it's being used
(in theory).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385793543.F31a2.5456
Date: Sat, 30 Nov 2013 06:39:03 +0000
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
   title="NEW --- - [NVC1] Delays when using nouveau and switcheroo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69180#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] Delays when using nouveau and switcheroo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69180">bug 69180</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Please try this with 3.11.10 or 3.12.2 or 3.13-rc2. There was a patch that
could help NVC1 cards included in all 3 of those (well, it went into 3.13-rc1).
<a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=13d2b35a065399">https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=13d2b35a065399</a>
. Note that 3.12+ also have runtime pm for optimus setups, which will
automatically turn the nvidia card on/off depending on whether it's being used
(in theory).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385793543.F31a2.5456--

--===============0464365827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0464365827==--
