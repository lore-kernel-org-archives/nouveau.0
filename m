From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74903] [NV34] TV Load not detected in X
Date: Sun, 16 Feb 2014 06:21:12 +0000
Message-ID: <bug-74903-8800-iMnSU6LjNs@http.bugs.freedesktop.org/>
References: <bug-74903-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0273884506=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74903-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0273884506==
Content-Type: multipart/alternative; boundary="1392531672.FB7ccC62.23147"; charset="us-ascii"


--1392531672.FB7ccC62.23147
Date: Sun, 16 Feb 2014 06:21:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74903

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #5)
> (In reply to comment #4)
> > But it's a little odd that it worked fine before -- what was the "before"
> > kernel?
> 
> I'm not sure anymore, but it wasn't so ancient. 3.8.x perhaps. I'll leave
> the (dirty, bad mannered) patch attached just in case someone else as lazy
> as me happens to find this report. 

Would you be willing to

(a) Verify whether 3.8.x was indeed good? There aren't a whole lot of changes
to the nv17 tv file since 3.8...
(b) Do a bisect between the good version and 3.13 (restricted to
drivers/gpu/drm/nouveau, so shouldn't be _too_ bad, but maybe like 10 steps).

Happy to provide help with the bisect if you're not sure how to do it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392531672.FB7ccC62.23147
Date: Sun, 16 Feb 2014 06:21:12 +0000
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
   title="NEW --- - [NV34] TV Load not detected in X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74903#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] TV Load not detected in X"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74903">bug 74903</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=74903#c5">comment #5</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=74903#c4">comment #4</a>)
&gt; &gt; But it's a little odd that it worked fine before -- what was the &quot;before&quot;
&gt; &gt; kernel?
&gt; 
&gt; I'm not sure anymore, but it wasn't so ancient. 3.8.x perhaps. I'll leave
&gt; the (dirty, bad mannered) patch attached just in case someone else as lazy
&gt; as me happens to find this report. </span >

Would you be willing to

(a) Verify whether 3.8.x was indeed good? There aren't a whole lot of changes
to the nv17 tv file since 3.8...
(b) Do a bisect between the good version and 3.13 (restricted to
drivers/gpu/drm/nouveau, so shouldn't be _too_ bad, but maybe like 10 steps).

Happy to provide help with the bisect if you're not sure how to do it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392531672.FB7ccC62.23147--

--===============0273884506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0273884506==--
