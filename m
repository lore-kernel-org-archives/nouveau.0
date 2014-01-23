From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 43939] [NV96] monitor connected via HDMI->DVI
 adapter is blank / standby (9500GS)
Date: Thu, 23 Jan 2014 07:02:10 +0000
Message-ID: <bug-43939-8800-afPWEAcZja@http.bugs.freedesktop.org/>
References: <bug-43939-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2043420523=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-43939-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2043420523==
Content-Type: multipart/alternative; boundary="1390460530.3d6181B3.12844"; charset="us-ascii"


--1390460530.3d6181B3.12844
Date: Thu, 23 Jan 2014 07:02:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=43939

--- Comment #18 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Can you try drm-next? A patch fixing bug #60680 should be there
(http://cgit.freedesktop.org/~airlied/linux/commit/?h=drm-next&id=f87cd8b695d372087685976460fac1ec6ba2fca9)
and may resolve your issues as well.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390460530.3d6181B3.12844
Date: Thu, 23 Jan 2014 07:02:10 +0000
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
   title="NEW --- - [NV96] monitor connected via HDMI-&gt;DVI adapter is blank / standby (9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] monitor connected via HDMI-&gt;DVI adapter is blank / standby (9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939">bug 43939</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Can you try drm-next? A patch fixing <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="show_bug.cgi?id=60680">bug #60680</a> should be there
(<a href="http://cgit.freedesktop.org/~airlied/linux/commit/?h=drm-next&amp;id=f87cd8b695d372087685976460fac1ec6ba2fca9">http://cgit.freedesktop.org/~airlied/linux/commit/?h=drm-next&amp;id=f87cd8b695d372087685976460fac1ec6ba2fca9</a>)
and may resolve your issues as well.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390460530.3d6181B3.12844--

--===============2043420523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2043420523==--
