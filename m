From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Mon, 03 Mar 2014 03:38:13 +0000
Message-ID: <bug-59168-8800-jt7gUn2XMB@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1775954650=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1775954650==
Content-Type: multipart/alternative; boundary="1393817893.F2Da1d61.19568"; charset="us-ascii"


--1393817893.F2Da1d61.19568
Date: Mon, 3 Mar 2014 03:38:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #44 from Laurence Lee <rubyjedi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Configured and compiled linux-3.14-rc4.tar.xz as found on kernel.org, and the
suspend/resume issue still exists.


"nvapeek 22500" and "nvapeek 22580" just yielded "...", so I'm posting the
contents of "nvapeek 22400 400" for a wider view of that area:

00022400: 00000000 00000000 00000000 00000002
00022410: 00000000 00000000 30000000 00000000
00022420: 00000000 00000000 00000800 00000000
00022430: 00000001 00000004 00000003 00000000
...
00022600: 0000001c 00000000 00000000 00000000
...
00022680: 8000001c 00000000 00000000 00000000
...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393817893.F2Da1d61.19568
Date: Mon, 3 Mar 2014 03:38:13 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c44">Comment # 44</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:rubyjedi&#64;gmail.com" title="Laurence Lee &lt;rubyjedi&#64;gmail.com&gt;"> <span class="fn">Laurence Lee</span></a>
</span></b>
        <pre>Configured and compiled linux-3.14-rc4.tar.xz as found on kernel.org, and the
suspend/resume issue still exists.


&quot;nvapeek 22500&quot; and &quot;nvapeek 22580&quot; just yielded &quot;...&quot;, so I'm posting the
contents of &quot;nvapeek 22400 400&quot; for a wider view of that area:

00022400: 00000000 00000000 00000000 00000002
00022410: 00000000 00000000 30000000 00000000
00022420: 00000000 00000000 00000800 00000000
00022430: 00000001 00000004 00000003 00000000
...
00022600: 0000001c 00000000 00000000 00000000
...
00022680: 8000001c 00000000 00000000 00000000
...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393817893.F2Da1d61.19568--

--===============1775954650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1775954650==--
