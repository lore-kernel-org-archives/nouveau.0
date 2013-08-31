From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51362] [NVE7] DisplayPort output on nVidia Quadro
 K2000M (ThinkPad W530) doesn't work
Date: Sat, 31 Aug 2013 02:56:58 +0000
Message-ID: <bug-51362-8800-Qq4kHaCtls@http.bugs.freedesktop.org/>
References: <bug-51362-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1934019080=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51362-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1934019080==
Content-Type: multipart/alternative; boundary="1377917818.6eB5CaCF2.25277"; charset="us-ascii"


--1377917818.6eB5CaCF2.25277
Date: Sat, 31 Aug 2013 02:56:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51362

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
There were a number of kepler-related initialization fixes that went into
3.11-rc1, perhaps they'll help. Worth testing, IMO.

BTW, please clarify -- are you using DP or HDMI? From my reading of your first
message, you're using a DP->HDMI adapter (square peg/round hole problem solver,
not a signal converter), so it's effectively using the HDMI machinery. Yes?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377917818.6eB5CaCF2.25277
Date: Sat, 31 Aug 2013 02:56:58 +0000
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
   title="NEW --- - [NVE7] DisplayPort output on nVidia Quadro K2000M (ThinkPad W530) doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51362#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] DisplayPort output on nVidia Quadro K2000M (ThinkPad W530) doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51362">bug 51362</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>There were a number of kepler-related initialization fixes that went into
3.11-rc1, perhaps they'll help. Worth testing, IMO.

BTW, please clarify -- are you using DP or HDMI? From my reading of your first
message, you're using a DP-&gt;HDMI adapter (square peg/round hole problem solver,
not a signal converter), so it's effectively using the HDMI machinery. Yes?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377917818.6eB5CaCF2.25277--

--===============1934019080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1934019080==--
