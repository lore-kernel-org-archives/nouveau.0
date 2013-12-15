From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Sun, 15 Dec 2013 23:51:11 +0000
Message-ID: <bug-58378-8800-0z3hu6BF8q@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1002680719=="
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


--===============1002680719==
Content-Type: multipart/alternative; boundary="1387151472.aDCf3a6.12067"; charset="us-ascii"


--1387151472.aDCf3a6.12067
Date: Sun, 15 Dec 2013 23:51:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #36 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #35)
> Follow-up question note that I am digging deeper into git... ;-)
> 
> From the commits in the v3.4..v3.5 range, only two of them:
> 
> 9bd0c15fcfb42f6245447c53347d65ad9e72080b (dated Jun 26, 2012) and
> e9bf5f36b09f8ec6c168ef58ee7d4890545ede1c (dated Jun 27)
> 
> when looking at the global Makefile:
> 
> git show <commit-sha1>:Makefile
> 
> have been done on 3.5.0-rc4 version of the kernel.

Most assuredly not the right way to look at it.

> 
> All other commits in this range had been done on 3.4.0 and less:
> 
> 35916acedd8dadb361ef6439d05d60fbe8f53032 (dated May 31)

And of course date of the commit has nothing to do with anything either.

Think about the branched development model. Let's say I do some work, basing my
work on, say, 2.6.0. I spend a lot of time on it. Then I send a pull request to
Linus (or whoever). He merges it. When looking at my commits, you might think
that you're looking at a 2.6.0 kernel, based on the Makefile. And in a large
sense you are. But in reality the commits were merged into some much later
release. Same with dates.

You can either read about git and fully understand it, or you can kinda trust
that the tools aren't lying to you when you ask for a bisect in a range, or a
log of commits between two revisions.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387151472.aDCf3a6.12067
Date: Sun, 15 Dec 2013 23:51:12 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c36">Comment # 36</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=58378#c35">comment #35</a>)
<span class="quote">&gt; Follow-up question note that I am digging deeper into git... ;-)
&gt; 
&gt; From the commits in the v3.4..v3.5 range, only two of them:
&gt; 
&gt; 9bd0c15fcfb42f6245447c53347d65ad9e72080b (dated Jun 26, 2012) and
&gt; e9bf5f36b09f8ec6c168ef58ee7d4890545ede1c (dated Jun 27)
&gt; 
&gt; when looking at the global Makefile:
&gt; 
&gt; git show &lt;commit-sha1&gt;:Makefile
&gt; 
&gt; have been done on 3.5.0-rc4 version of the kernel.</span >

Most assuredly not the right way to look at it.

<span class="quote">&gt; 
&gt; All other commits in this range had been done on 3.4.0 and less:
&gt; 
&gt; 35916acedd8dadb361ef6439d05d60fbe8f53032 (dated May 31)</span >

And of course date of the commit has nothing to do with anything either.

Think about the branched development model. Let's say I do some work, basing my
work on, say, 2.6.0. I spend a lot of time on it. Then I send a pull request to
Linus (or whoever). He merges it. When looking at my commits, you might think
that you're looking at a 2.6.0 kernel, based on the Makefile. And in a large
sense you are. But in reality the commits were merged into some much later
release. Same with dates.

You can either read about git and fully understand it, or you can kinda trust
that the tools aren't lying to you when you ask for a bisect in a range, or a
log of commits between two revisions.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387151472.aDCf3a6.12067--

--===============1002680719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1002680719==--
