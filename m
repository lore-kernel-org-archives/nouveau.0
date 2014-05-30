From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78441] [NV46] X does not start under kernel 3.13.x
Date: Fri, 30 May 2014 19:47:42 +0000
Message-ID: <bug-78441-8800-I8GPIFqLc0@http.bugs.freedesktop.org/>
References: <bug-78441-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0122330248=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78441-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0122330248==
Content-Type: multipart/alternative; boundary="1401479261.CeBcB11.25038"; charset="us-ascii"


--1401479261.CeBcB11.25038
Date: Fri, 30 May 2014 19:47:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78441

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #9)
> So, I'm not sure about doing a bisect, but you can download the source RPMs
> for the two versions kernel-3.12.11-201.fc19 and kernel-3.13.4-100.fc19
> which Red Hat released, here:
> 
> http://koji.fedoraproject.org/koji/buildinfo?buildID=498402
> 
> and
> 
> http://koji.fedoraproject.org/koji/buildinfo?buildID=499637
> 
> You can download the .src.rpm easily and then diff the nouveau trees.  I can
> attach that diff if you like.

As something like "git diff v3.12..v3.13 -- drivers/gpu/drm/nouveau" would
provide. We know what changed. We don't know which change broke things.

> 
> Thing is I'm not enough of a developer to (easily) take that any further. 
> I'm happy to help, but otherwise I'm an IT geek and out of my depth trying
> to work on video drivers.  Sorry.
> 
> Let me know if I can assist further.  Otherwise, for the moment, I'm stuck
> on a 3.12.x kernel.  :(

OK, if you ever want to get unstuck, figure out how to build your own kernels
(loads of guides online), check out a git tree, and do a git bisect between
v3.12 and v3.13 (again, tons of online guides).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401479261.CeBcB11.25038
Date: Fri, 30 May 2014 19:47:41 +0000
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
   title="NEW --- - [NV46] X does not start under kernel 3.13.x"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV46] X does not start under kernel 3.13.x"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441">bug 78441</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=78441#c9">comment #9</a>)
<span class="quote">&gt; So, I'm not sure about doing a bisect, but you can download the source RPMs
&gt; for the two versions kernel-3.12.11-201.fc19 and kernel-3.13.4-100.fc19
&gt; which Red Hat released, here:
&gt; 
&gt; <a href="http://koji.fedoraproject.org/koji/buildinfo?buildID=498402">http://koji.fedoraproject.org/koji/buildinfo?buildID=498402</a>
&gt; 
&gt; and
&gt; 
&gt; <a href="http://koji.fedoraproject.org/koji/buildinfo?buildID=499637">http://koji.fedoraproject.org/koji/buildinfo?buildID=499637</a>
&gt; 
&gt; You can download the .src.rpm easily and then diff the nouveau trees.  I can
&gt; attach that diff if you like.</span >

As something like &quot;git diff v3.12..v3.13 -- drivers/gpu/drm/nouveau&quot; would
provide. We know what changed. We don't know which change broke things.

<span class="quote">&gt; 
&gt; Thing is I'm not enough of a developer to (easily) take that any further. 
&gt; I'm happy to help, but otherwise I'm an IT geek and out of my depth trying
&gt; to work on video drivers.  Sorry.
&gt; 
&gt; Let me know if I can assist further.  Otherwise, for the moment, I'm stuck
&gt; on a 3.12.x kernel.  :(</span >

OK, if you ever want to get unstuck, figure out how to build your own kernels
(loads of guides online), check out a git tree, and do a git bisect between
v3.12 and v3.13 (again, tons of online guides).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401479261.CeBcB11.25038--

--===============0122330248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0122330248==--
