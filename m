From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67878] [NV98] [BISECTED] Hardware freeze after
 resume from suspend
Date: Sat, 08 Feb 2014 06:30:32 +0000
Message-ID: <bug-67878-8800-sCt40MfpeM@http.bugs.freedesktop.org/>
References: <bug-67878-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1284415399=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67878-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1284415399==
Content-Type: multipart/alternative; boundary="1391841032.FF7Bc754.2848"; charset="us-ascii"


--1391841032.FF7Bc754.2848
Date: Sat, 8 Feb 2014 06:30:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67878

--- Comment #38 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #37)
> I've been following this ticket and attempting to poke around a bit. I just
> tested my hardware with various points in the 3.6, 3.7, and 3.7-rc kernels,
> and all of those still gave me a non-responsive screen with messages like
> the following after resume. e.g., on Linux 3.6:

Do you have any reason to believe that you have the same problem? This one was
bisected to commit 4f6029da58ba9204c98e33f4f3737fe085c87a6f which appeared in
v3.8 (which means that 3.7.x should all be fine).

Of course you have the additional problem of having a nva8 (this bug has nv98
hw users, although that doesn't exclude you from having the same issue -- the
bisected commit was fairly generic), which is still unstable for some users,
but was even more unstable in earlier kernels. As for not seeing a
PAGE_NOT_PRESENT -- are you sure that the kernels in question had code to emit
the error in the first place?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391841032.FF7Bc754.2848
Date: Sat, 8 Feb 2014 06:30:32 +0000
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
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878#c38">Comment # 38</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878">bug 67878</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67878#c37">comment #37</a>)
<span class="quote">&gt; I've been following this ticket and attempting to poke around a bit. I just
&gt; tested my hardware with various points in the 3.6, 3.7, and 3.7-rc kernels,
&gt; and all of those still gave me a non-responsive screen with messages like
&gt; the following after resume. e.g., on Linux 3.6:</span >

Do you have any reason to believe that you have the same problem? This one was
bisected to commit 4f6029da58ba9204c98e33f4f3737fe085c87a6f which appeared in
v3.8 (which means that 3.7.x should all be fine).

Of course you have the additional problem of having a nva8 (this bug has nv98
hw users, although that doesn't exclude you from having the same issue -- the
bisected commit was fairly generic), which is still unstable for some users,
but was even more unstable in earlier kernels. As for not seeing a
PAGE_NOT_PRESENT -- are you sure that the kernels in question had code to emit
the error in the first place?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391841032.FF7Bc754.2848--

--===============1284415399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1284415399==--
