From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57034] [NVA0] second dp monitor stays powered off
Date: Fri, 14 Feb 2014 19:37:25 +0000
Message-ID: <bug-57034-8800-2Q93lFGHjY@http.bugs.freedesktop.org/>
References: <bug-57034-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0716598234=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57034-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0716598234==
Content-Type: multipart/alternative; boundary="1392406644.F6fD1D82.3256"; charset="us-ascii"


--1392406644.F6fD1D82.3256
Date: Fri, 14 Feb 2014 19:37:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57034

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #8)
> Could you test kernel 3.8.x? There another bug (#67628) which bisected a
> similar-sounding DP issue to commit 5cc027f6b1, which first appeared in
> 3.9-rc1.

http://lists.freedesktop.org/archives/nouveau/2014-February/016205.html

This patch fixed issues for the other users. Can you give it a shot?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392406644.F6fD1D82.3256
Date: Fri, 14 Feb 2014 19:37:24 +0000
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
   title="NEW --- - [NVA0] second dp monitor stays powered off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57034#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA0] second dp monitor stays powered off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57034">bug 57034</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=57034#c8">comment #8</a>)
<span class="quote">&gt; Could you test kernel 3.8.x? There another bug (#67628) which bisected a
&gt; similar-sounding DP issue to commit 5cc027f6b1, which first appeared in
&gt; 3.9-rc1.</span >

<a href="http://lists.freedesktop.org/archives/nouveau/2014-February/016205.html">http://lists.freedesktop.org/archives/nouveau/2014-February/016205.html</a>

This patch fixed issues for the other users. Can you give it a shot?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392406644.F6fD1D82.3256--

--===============0716598234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0716598234==--
