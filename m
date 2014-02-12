From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67628] [NVC1] [BISECTED] Monitor on Display port
 shows distortions
Date: Wed, 12 Feb 2014 15:24:30 +0000
Message-ID: <bug-67628-8800-cpnEoEweVM@http.bugs.freedesktop.org/>
References: <bug-67628-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1151453797=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67628-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1151453797==
Content-Type: multipart/alternative; boundary="1392218670.BF387aAb3.22670"; charset="us-ascii"


--1392218670.BF387aAb3.22670
Date: Wed, 12 Feb 2014 15:24:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67628

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
One thing to note, the initial comment is VERY misleading, since it lists the
wrong hash! [but the right description, which no one looks at] The correct
commit that was bisected as the cause is:

commit 0a0afd282fd715dd63d64b243299a64da14f8e8d
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Feb 18 23:17:53 2013 -0500

    drm/nv50-/disp: move DP link training to core and train from supervisor

    We need to be able to do link training for PIOR-connected ANX9805 from
    the third supervisor handler (due to script ordering in the bios, can't
    have the "user" call train because some settings are overwritten from
    the modesetting bios scripts).

    This moves link training for SOR-connected DP encoders to the second
    supervisor interrupt, *before* we call the modesetting scripts (yes,
    different ordering from PIOR is necessary).  This is useful since we
    should now be able to remove some hacks to workaround races between
    the supervisor and link training paths.

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392218670.BF387aAb3.22670
Date: Wed, 12 Feb 2014 15:24:30 +0000
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
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628">bug 67628</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>One thing to note, the initial comment is VERY misleading, since it lists the
wrong hash! [but the right description, which no one looks at] The correct
commit that was bisected as the cause is:

commit 0a0afd282fd715dd63d64b243299a64da14f8e8d
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Mon Feb 18 23:17:53 2013 -0500

    drm/nv50-/disp: move DP link training to core and train from supervisor

    We need to be able to do link training for PIOR-connected ANX9805 from
    the third supervisor handler (due to script ordering in the bios, can't
    have the &quot;user&quot; call train because some settings are overwritten from
    the modesetting bios scripts).

    This moves link training for SOR-connected DP encoders to the second
    supervisor interrupt, *before* we call the modesetting scripts (yes,
    different ordering from PIOR is necessary).  This is useful since we
    should now be able to remove some hacks to workaround races between
    the supervisor and link training paths.

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392218670.BF387aAb3.22670--

--===============1151453797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1151453797==--
