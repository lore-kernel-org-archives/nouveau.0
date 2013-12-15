From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Sun, 15 Dec 2013 23:44:21 +0000
Message-ID: <bug-58378-8800-q6vmvYHF29@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0570087603=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0570087603==
Content-Type: multipart/alternative; boundary="1387151062.feEbf525.11031"; charset="us-ascii"


--1387151062.feEbf525.11031
Date: Sun, 15 Dec 2013 23:44:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #35 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Follow-up question note that I am digging deeper into git... ;-)

From the commits in the v3.4..v3.5 range, only two of them:

9bd0c15fcfb42f6245447c53347d65ad9e72080b (dated Jun 26, 2012) and
e9bf5f36b09f8ec6c168ef58ee7d4890545ede1c (dated Jun 27)

when looking at the global Makefile:

git show <commit-sha1>:Makefile

have been done on 3.5.0-rc4 version of the kernel.

All other commits in this range had been done on 3.4.0 and less:

35916acedd8dadb361ef6439d05d60fbe8f53032 (dated May 31)

and all earlier commits have been done on 3.4.0 and its rc builds.

As the issue is NOT present in the 3.4.x series anyway, I assume that only the
two commits on 3.5.0-rc4 above (if any) from this interval are relevant, and we
rather need to look at the subsequent v3.5..v3.6 range!?

Am I correct (and please bear with me in case I got it wrong - I had never used
git before looking into this...)?

Thanks & BR,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387151062.feEbf525.11031
Date: Sun, 15 Dec 2013 23:44:22 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c35">Comment # 35</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Follow-up question note that I am digging deeper into git... ;-)

From the commits in the v3.4..v3.5 range, only two of them:

9bd0c15fcfb42f6245447c53347d65ad9e72080b (dated Jun 26, 2012) and
e9bf5f36b09f8ec6c168ef58ee7d4890545ede1c (dated Jun 27)

when looking at the global Makefile:

git show &lt;commit-sha1&gt;:Makefile

have been done on 3.5.0-rc4 version of the kernel.

All other commits in this range had been done on 3.4.0 and less:

35916acedd8dadb361ef6439d05d60fbe8f53032 (dated May 31)

and all earlier commits have been done on 3.4.0 and its rc builds.

As the issue is NOT present in the 3.4.x series anyway, I assume that only the
two commits on 3.5.0-rc4 above (if any) from this interval are relevant, and we
rather need to look at the subsequent v3.5..v3.6 range!?

Am I correct (and please bear with me in case I got it wrong - I had never used
git before looking into this...)?

Thanks &amp; BR,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387151062.feEbf525.11031--

--===============0570087603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0570087603==--
