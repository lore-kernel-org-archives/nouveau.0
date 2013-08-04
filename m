From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 65827] computer often fails to boot with nouveau and
 GeForce GT 425M on newest Linux kernel
Date: Sun, 04 Aug 2013 20:52:30 +0000
Message-ID: <bug-65827-8800-9g13IndhBs@http.bugs.freedesktop.org/>
References: <bug-65827-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1484997287=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-65827-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1484997287==
Content-Type: multipart/alternative; boundary="1375649550.77E561.30454"; charset="us-ascii"


--1375649550.77E561.30454
Date: Sun, 4 Aug 2013 20:52:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=65827

--- Comment #4 from j.pertres-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Hi,

I'm running the 3.10 kernel and, even though not everything is perfect, now at
least this ugly problem seems gone. I didn't experience it, at least, the last
12 times (within 6 days) that I booted my laptop.

The result of 'lspci | grep VGA' is now:
00:02.0 VGA compatible controller: Intel Corporation Core Processor Integrated
Graphics Controller (rev 02)
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 425M]
(rev ff)

/proc/fb is still only
0 inteldrmfb

I attached a dmesg on my current kernel (3.10.3).

If I have time I'll try to provide more information as you suggest. Thanks for
your work!

Joan

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375649550.77E561.30454
Date: Sun, 4 Aug 2013 20:52:30 +0000
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
   title="NEW --- - computer often fails to boot with nouveau and GeForce GT 425M on newest Linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65827#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - computer often fails to boot with nouveau and GeForce GT 425M on newest Linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65827">bug 65827</a>
              from <span class="vcard"><a class="email" href="mailto:j.pertres&#64;gmail.com" title="j.pertres&#64;gmail.com">j.pertres&#64;gmail.com</a>
</span></b>
        <pre>Hi,

I'm running the 3.10 kernel and, even though not everything is perfect, now at
least this ugly problem seems gone. I didn't experience it, at least, the last
12 times (within 6 days) that I booted my laptop.

The result of 'lspci | grep VGA' is now:
00:02.0 VGA compatible controller: Intel Corporation Core Processor Integrated
Graphics Controller (rev 02)
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT 425M]
(rev ff)

/proc/fb is still only
0 inteldrmfb

I attached a dmesg on my current kernel (3.10.3).

If I have time I'll try to provide more information as you suggest. Thanks for
your work!

Joan</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375649550.77E561.30454--

--===============1484997287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1484997287==--
