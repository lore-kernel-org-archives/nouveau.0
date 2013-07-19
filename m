From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Fri, 19 Jul 2013 20:00:50 +0000
Message-ID: <bug-67051-8800-oVnzrpS01d@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1712943053=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1712943053==
Content-Type: multipart/alternative; boundary="1374264049.0D4201281.4969"; charset="us-ascii"


--1374264049.0D4201281.4969
Date: Fri, 19 Jul 2013 20:00:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #23 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Alex, thanks for your thorough testing. Sad to hear that those patches don't do
anything :(

3.7.10 is not in between 3.7 and 3.8, it is on the "stable" release branch. But
it's good to know that it works fine. (And you should definitely stay on 3.7.10
vs 3.7 -- there were a couple of annoying bugs fixed in there, both nouveau-
and security-related.)

I'm afraid it might be bisect time -- if there are more differences, I don't
see them. Knowing the exact commit may be able to refocus things. However this
is not nearly as painful as you might think. I think it makes most sense to
only bisect in drivers/gpu/drm/nouveau. Here's a basic guide:
https://www.kernel.org/pub/software/scm/git/docs/git-bisect.html (you'll
obviously need a linux git checkout, as well as the git tool).

You'll want to do something like

git bisect start v3.8 v3.7 -- drivers/gpu/drm/nouveau

This should start you off (there will be ~7 kernel compiles, so really not that
bad). Then you mark the kernels as good/bad and proceed. Please provide the
full bisection log when you're done.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374264049.0D4201281.4969
Date: Fri, 19 Jul 2013 20:00:49 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Alex, thanks for your thorough testing. Sad to hear that those patches don't do
anything :(

3.7.10 is not in between 3.7 and 3.8, it is on the &quot;stable&quot; release branch. But
it's good to know that it works fine. (And you should definitely stay on 3.7.10
vs 3.7 -- there were a couple of annoying bugs fixed in there, both nouveau-
and security-related.)

I'm afraid it might be bisect time -- if there are more differences, I don't
see them. Knowing the exact commit may be able to refocus things. However this
is not nearly as painful as you might think. I think it makes most sense to
only bisect in drivers/gpu/drm/nouveau. Here's a basic guide:
<a href="https://www.kernel.org/pub/software/scm/git/docs/git-bisect.html">https://www.kernel.org/pub/software/scm/git/docs/git-bisect.html</a> (you'll
obviously need a linux git checkout, as well as the git tool).

You'll want to do something like

git bisect start v3.8 v3.7 -- drivers/gpu/drm/nouveau

This should start you off (there will be ~7 kernel compiles, so really not that
bad). Then you mark the kernels as good/bad and proceed. Please provide the
full bisection log when you're done.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374264049.0D4201281.4969--

--===============1712943053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1712943053==--
