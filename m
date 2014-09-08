From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51477] [NV10, NV20] bad/missing graphics,
	usually alpha-related
Date: Mon, 08 Sep 2014 18:12:50 +0000
Message-ID: <bug-51477-8800-VLrqlUJedL@http.bugs.freedesktop.org/>
References: <bug-51477-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0399192114=="
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


--===============0399192114==
Content-Type: multipart/alternative; boundary="1410199970.7e773.8347"; charset="us-ascii"


--1410199970.7e773.8347
Date: Mon, 8 Sep 2014 18:12:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51477

--- Comment #29 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #28)
> The title of the bug includes NV10 and NV20. I am just a regular user (not a
> developer) but the fix below appears to only reference NV10. I have an
> Nvidia GeForece 3 Ti200 graphics card which is considered NV20. Does the fix
> also correct the issue for NV20 graphics cards?

NV20 uses the same accel logic as NV10 for exa. Reports are that it does indeed
fix the issue for NV20 iirc. xf86-video-nouveau 1.0.11 is now released and
should contain this fix.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410199970.7e773.8347
Date: Mon, 8 Sep 2014 18:12:50 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51477#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV10, NV20] bad/missing graphics, usually alpha-related"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51477">bug 51477</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=51477#c28">comment #28</a>)
<span class="quote">&gt; The title of the bug includes NV10 and NV20. I am just a regular user (not a
&gt; developer) but the fix below appears to only reference NV10. I have an
&gt; Nvidia GeForece 3 Ti200 graphics card which is considered NV20. Does the fix
&gt; also correct the issue for NV20 graphics cards?</span >

NV20 uses the same accel logic as NV10 for exa. Reports are that it does indeed
fix the issue for NV20 iirc. xf86-video-nouveau 1.0.11 is now released and
should contain this fix.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410199970.7e773.8347--

--===============0399192114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0399192114==--
