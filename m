From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39550] [NV96] Brightness stuck to low value after
 suspend/resume on HP Elitebook 8530w
Date: Sat, 31 Aug 2013 12:22:23 +0000
Message-ID: <bug-39550-8800-nK6tMcWqu2@http.bugs.freedesktop.org/>
References: <bug-39550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1937350004=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39550-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1937350004==
Content-Type: multipart/alternative; boundary="1377951743.d4751D67.30541"; charset="us-ascii"


--1377951743.d4751D67.30541
Date: Sat, 31 Aug 2013 12:22:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=39550

--- Comment #40 from rick <rick.hendricksen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This bug is still present.


[root@s094648 rick]# nvapeek 0xe100; nvapeek 0xe28c; nvapeek 0xe104 8; nvapeek
0xe280 8
0000e100: 001c1100
0000e28c: 00000100
0000e104: 72266640 0441474b
0000e280: 44444747 00000000
[root@s094648 rick]# systemctl suspend
[root@s094648 rick]# nvapeek 0xe100; nvapeek 0xe28c; nvapeek 0xe104 8; nvapeek
0xe280 8
0000e100: 001c1100
0000e28c: 00000100
0000e104: 72266240 0441474b
0000e280: 44444444 00000000
[root@s094648 rick]# uname -a
Linux s094648 3.10.10-1-ARCH #1 SMP PREEMPT Fri Aug 30 11:30:06 CEST 2013
x86_64 GNU/Linux

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377951743.d4751D67.30541
Date: Sat, 31 Aug 2013 12:22:23 +0000
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
   title="NEW --- - [NV96] Brightness stuck to low value after suspend/resume on HP Elitebook 8530w"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39550#c40">Comment # 40</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] Brightness stuck to low value after suspend/resume on HP Elitebook 8530w"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39550">bug 39550</a>
              from <span class="vcard"><a class="email" href="mailto:rick.hendricksen&#64;gmail.com" title="rick &lt;rick.hendricksen&#64;gmail.com&gt;"> <span class="fn">rick</span></a>
</span></b>
        <pre>This bug is still present.


[root&#64;s094648 rick]# nvapeek 0xe100; nvapeek 0xe28c; nvapeek 0xe104 8; nvapeek
0xe280 8
0000e100: 001c1100
0000e28c: 00000100
0000e104: 72266640 0441474b
0000e280: 44444747 00000000
[root&#64;s094648 rick]# systemctl suspend
[root&#64;s094648 rick]# nvapeek 0xe100; nvapeek 0xe28c; nvapeek 0xe104 8; nvapeek
0xe280 8
0000e100: 001c1100
0000e28c: 00000100
0000e104: 72266240 0441474b
0000e280: 44444444 00000000
[root&#64;s094648 rick]# uname -a
Linux s094648 3.10.10-1-ARCH #1 SMP PREEMPT Fri Aug 30 11:30:06 CEST 2013
x86_64 GNU/Linux</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377951743.d4751D67.30541--

--===============1937350004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1937350004==--
