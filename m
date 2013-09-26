From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69830] [NVC1] Kernel 3.11 and newer hang at X11
 start (bisected)
Date: Thu, 26 Sep 2013 22:47:07 +0000
Message-ID: <bug-69830-8800-y8gjGRIACv@http.bugs.freedesktop.org/>
References: <bug-69830-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0938300365=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69830-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0938300365==
Content-Type: multipart/alternative; boundary="1380235627.BaCD13dD1.10625"; charset="us-ascii"


--1380235627.BaCD13dD1.10625
Date: Thu, 26 Sep 2013 22:47:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69830

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=30f4e08

Note that the parent is 791dc143ed2c441f5202d8721609d94dce9fcf88. So I don't
know what tree you're on, but you should get on something closer to mainline :)

Anyways, duly noted that you don't get a hang until you start X. Could be a
fluke, or dumb luck, or some distro setup difference. I don't think it's a
coincidence that a lot of people are having trouble with precisely NVC1 on
3.11+ though.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380235627.BaCD13dD1.10625
Date: Thu, 26 Sep 2013 22:47:07 +0000
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
   title="RESOLVED DUPLICATE - [NVC1] Kernel 3.11 and newer hang at X11 start (bisected)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69830#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - [NVC1] Kernel 3.11 and newer hang at X11 start (bisected)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69830">bug 69830</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre><a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=30f4e08">https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=30f4e08</a>

Note that the parent is 791dc143ed2c441f5202d8721609d94dce9fcf88. So I don't
know what tree you're on, but you should get on something closer to mainline :)

Anyways, duly noted that you don't get a hang until you start X. Could be a
fluke, or dumb luck, or some distro setup difference. I don't think it's a
coincidence that a lot of people are having trouble with precisely NVC1 on
3.11+ though.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380235627.BaCD13dD1.10625--

--===============0938300365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0938300365==--
