From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70464] [NVC3] runpm not working
Date: Tue, 15 Oct 2013 10:47:21 +0000
Message-ID: <bug-70464-8800-tSa1F1zQDC@http.bugs.freedesktop.org/>
References: <bug-70464-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2020659587=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70464-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2020659587==
Content-Type: multipart/alternative; boundary="1381834041.0761ddE1.30110"; charset="us-ascii"


--1381834041.0761ddE1.30110
Date: Tue, 15 Oct 2013 10:47:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70464

--- Comment #3 from Mike <michele.cane-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I do not have /sys/kernel/debug/vgaswitcheroo/state

I only have /sys/kernel/debug/vgaswitcheroo/switch

0:IGD:+:Pwr:0000:00:02.0
1:DIS: :DynOff:0000:01:00.0

I think in a way this bug is related to this other one which I reported
concerning reverse PRIME:

https://bugs.freedesktop.org/show_bug.cgi?id=69876

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381834041.0761ddE1.30110
Date: Tue, 15 Oct 2013 10:47:21 +0000
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
   title="NEEDINFO --- - [NVC3] runpm not working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70464#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NVC3] runpm not working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70464">bug 70464</a>
              from <span class="vcard"><a class="email" href="mailto:michele.cane&#64;gmail.com" title="Mike &lt;michele.cane&#64;gmail.com&gt;"> <span class="fn">Mike</span></a>
</span></b>
        <pre>I do not have /sys/kernel/debug/vgaswitcheroo/state

I only have /sys/kernel/debug/vgaswitcheroo/switch

0:IGD:+:Pwr:0000:00:02.0
1:DIS: :DynOff:0000:01:00.0

I think in a way this bug is related to this other one which I reported
concerning reverse PRIME:

<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC3] Reverse prime sometimes freezes the machine"
   href="show_bug.cgi?id=69876">https://bugs.freedesktop.org/show_bug.cgi?id=69876</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381834041.0761ddE1.30110--

--===============2020659587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2020659587==--
