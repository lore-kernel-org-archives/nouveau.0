From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51477] [NV10, NV20] bad/missing graphics,
	usually alpha-related
Date: Tue, 09 Sep 2014 17:40:56 +0000
Message-ID: <bug-51477-8800-XCy9dOGs8e@http.bugs.freedesktop.org/>
References: <bug-51477-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1350812705=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51477-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1350812705==
Content-Type: multipart/alternative; boundary="1410284456.0e13dDF3.24410"; charset="us-ascii"


--1410284456.0e13dDF3.24410
Date: Tue, 9 Sep 2014 17:40:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51477

--- Comment #31 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #30)
> Thanks for the quick response. So it sounds like this fix should correct the
> issue for NV20 cards. The current nouveau package for Ubuntu 14.04 LTS is
> 1:1.0.10-1ubuntu2. I assume this is the same package used for Lubuntu. 
> 
> Do you know how I would go about requesting that this change be backported
> to 1.0.10? Would I have to create a bug report on Launchpad or is it
> sufficient to reference this bug report and fix?

There is no stable branch for xf86-video-nouveau (so no backporting). Upgrade
to 1.0.11, or ask your distro to add those in as extra patches.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410284456.0e13dDF3.24410
Date: Tue, 9 Sep 2014 17:40:56 +0000
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
   title="RESOLVED FIXED - [NV10, NV20] bad/missing graphics, usually alpha-related"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51477#c31">Comment # 31</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV10, NV20] bad/missing graphics, usually alpha-related"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51477">bug 51477</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=51477#c30">comment #30</a>)
<span class="quote">&gt; Thanks for the quick response. So it sounds like this fix should correct the
&gt; issue for NV20 cards. The current nouveau package for Ubuntu 14.04 LTS is
&gt; 1:1.0.10-1ubuntu2. I assume this is the same package used for Lubuntu. 
&gt; 
&gt; Do you know how I would go about requesting that this change be backported
&gt; to 1.0.10? Would I have to create a bug report on Launchpad or is it
&gt; sufficient to reference this bug report and fix?</span >

There is no stable branch for xf86-video-nouveau (so no backporting). Upgrade
to 1.0.11, or ask your distro to add those in as extra patches.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410284456.0e13dDF3.24410--

--===============1350812705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1350812705==--
