From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE7] Failed to initialise context object:
 2D_NVC0 (0) (for my GeForce GT 750M)
Date: Sat, 14 Dec 2013 10:26:37 +0000
Message-ID: <bug-70354-8800-2Gk9c6ZxOl@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0729497361=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0729497361==
Content-Type: multipart/alternative; boundary="1387016797.36c8F07A2.9400"; charset="us-ascii"


--1387016797.36c8F07A2.9400
Date: Sat, 14 Dec 2013 10:26:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #19 from Joey 4712 <4712.joey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Sorry for posting too quickly: found it myself, I only had to "modprobe ttm"
first to fix these "Unknown symbol ttm_bo_mmap..." errors.

No the nouveau.ko from ben's repo loads successfully but I'm getting the
HUB_INIT timed out message again:

[   99.171109] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 1
[   99.314206] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x300000 [ IBUS ]
[   99.314232] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   99.314464] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[  101.316059] nouveau E[  PGRAPH][0000:01:00.0] HUB_INIT timed out

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387016797.36c8F07A2.9400
Date: Sat, 14 Dec 2013 10:26:37 +0000
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
   title="NEW --- - [NVE7] Failed to initialise context object: 2D_NVC0 (0) (for my GeForce GT 750M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Failed to initialise context object: 2D_NVC0 (0) (for my GeForce GT 750M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:4712.joey&#64;gmail.com" title="Joey 4712 &lt;4712.joey&#64;gmail.com&gt;"> <span class="fn">Joey 4712</span></a>
</span></b>
        <pre>Sorry for posting too quickly: found it myself, I only had to &quot;modprobe ttm&quot;
first to fix these &quot;Unknown symbol ttm_bo_mmap...&quot; errors.

No the nouveau.ko from ben's repo loads successfully but I'm getting the
HUB_INIT timed out message again:

[   99.171109] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 1
[   99.314206] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x300000 [ IBUS ]
[   99.314232] nouveau E[   PIBUS][0000:01:00.0] GPC0: 0x419eb4 0xbadf1000
(0x3800820c)
[   99.314464] nouveau E[   PIBUS][0000:01:00.0] HUB0: 0x404170 0x00000012
(0x0e008201)
[  101.316059] nouveau E[  PGRAPH][0000:01:00.0] HUB_INIT timed out</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387016797.36c8F07A2.9400--

--===============0729497361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0729497361==--
