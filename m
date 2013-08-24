From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61069] [NV17] Crash while displaying large image
Date: Sat, 24 Aug 2013 00:43:15 +0000
Message-ID: <bug-61069-8800-38VZQZwy0S@http.bugs.freedesktop.org/>
References: <bug-61069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2134832907=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2134832907==
Content-Type: multipart/alternative; boundary="1377304995.ECA8cE62.29424"; charset="us-ascii"


--1377304995.ECA8cE62.29424
Date: Sat, 24 Aug 2013 00:43:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61069

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I still can't repro the issue. Another difference might be that I'm using xorg
1.13, whereas your original log is for 1.12. Is there anything in dmesg when
the hangs occur?

I did notice that if I'm running with a compositor, e.g. xcompmgr, then things
get REALLY slow when loading large images. Slow enough for watchdogs to fire,
rcu to complain, etc. But the system does come into its own, esp if I kill
xcompmgr. I don't know whether "standard KDE settings" include a compositor
(wouldn't be surprised), but if they do, can you try turning that off?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377304995.ECA8cE62.29424
Date: Sat, 24 Aug 2013 00:43:15 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV17] Crash while displaying large image"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61069#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV17] Crash while displaying large image"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61069">bug 61069</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I still can't repro the issue. Another difference might be that I'm using xorg
1.13, whereas your original log is for 1.12. Is there anything in dmesg when
the hangs occur?

I did notice that if I'm running with a compositor, e.g. xcompmgr, then things
get REALLY slow when loading large images. Slow enough for watchdogs to fire,
rcu to complain, etc. But the system does come into its own, esp if I kill
xcompmgr. I don't know whether &quot;standard KDE settings&quot; include a compositor
(wouldn't be surprised), but if they do, can you try turning that off?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377304995.ECA8cE62.29424--

--===============2134832907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2134832907==--
