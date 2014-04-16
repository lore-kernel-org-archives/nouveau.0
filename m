From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77529] [NVE7] NVS 510 DP-3 output doesn't work
Date: Wed, 16 Apr 2014 14:44:41 +0000
Message-ID: <bug-77529-8800-sU3BUKfkIu@http.bugs.freedesktop.org/>
References: <bug-77529-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0173971652=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77529-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0173971652==
Content-Type: multipart/alternative; boundary="1397659481.EC28efa12.19792"; charset="us-ascii"


--1397659481.EC28efa12.19792
Date: Wed, 16 Apr 2014 14:44:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77529

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Is it some enormous monitor (resolution-wise)? If so, try a lower resolution.
(A change to add support for the higher frequencies went into 3.15-rc1.)

Is this a laptop + dock? If so, which ones?

Can you check if there's a kworker taking up 100% of cpu time (of 1 cpu)?

Is the monitor actually connected via DP, or is it a DP -> HDMI (or DVI)
situation?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397659481.EC28efa12.19792
Date: Wed, 16 Apr 2014 14:44:41 +0000
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
   title="NEW --- - [NVE7] NVS 510 DP-3 output doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77529#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] NVS 510 DP-3 output doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77529">bug 77529</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Is it some enormous monitor (resolution-wise)? If so, try a lower resolution.
(A change to add support for the higher frequencies went into 3.15-rc1.)

Is this a laptop + dock? If so, which ones?

Can you check if there's a kworker taking up 100% of cpu time (of 1 cpu)?

Is the monitor actually connected via DP, or is it a DP -&gt; HDMI (or DVI)
situation?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397659481.EC28efa12.19792--

--===============0173971652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0173971652==--
