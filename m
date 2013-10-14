From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69982] [NV86] GPU+system crash with nouveau and
	kernel 3.12-rc3
Date: Mon, 14 Oct 2013 18:09:34 +0000
Message-ID: <bug-69982-8800-QGGhHLeLrw@http.bugs.freedesktop.org/>
References: <bug-69982-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0815117790=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69982-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0815117790==
Content-Type: multipart/alternative; boundary="1381774174.2D06881.18577"; charset="us-ascii"


--1381774174.2D06881.18577
Date: Mon, 14 Oct 2013 18:09:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69982

--- Comment #13 from Mike C <mike.cloaked-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
With the release of 3.12 rc5 yesterday I can finally run 3.12 rc5 with stable
operation and no freeze.  

I believe that it was this patch in the kernel release patchset in rc5 that
resulted in a fix for the moment:

Ben Skeggs (1):
drm/nouveau/mc: disable msi support by default, it's busted in
tons of places

I will continue to test as further 3.12-rcX releases happen, so in the meantime
it would be best to leave this bug not resolved and not closed, since whether
the bug re-surfaces or not will depend on whether there are more problems if
msi is set by default in the future and whether the associated code is buggy or
not. Therefore it will need to wait until 3.12 reaches final release and then
see if the kernel remains stable before closing this bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381774174.2D06881.18577
Date: Mon, 14 Oct 2013 18:09:34 +0000
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
   title="NEW --- - [NV86] GPU+system crash with nouveau and kernel 3.12-rc3"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69982#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] GPU+system crash with nouveau and kernel 3.12-rc3"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69982">bug 69982</a>
              from <span class="vcard"><a class="email" href="mailto:mike.cloaked&#64;gmail.com" title="Mike C &lt;mike.cloaked&#64;gmail.com&gt;"> <span class="fn">Mike C</span></a>
</span></b>
        <pre>With the release of 3.12 rc5 yesterday I can finally run 3.12 rc5 with stable
operation and no freeze.  

I believe that it was this patch in the kernel release patchset in rc5 that
resulted in a fix for the moment:

Ben Skeggs (1):
drm/nouveau/mc: disable msi support by default, it's busted in
tons of places

I will continue to test as further 3.12-rcX releases happen, so in the meantime
it would be best to leave this bug not resolved and not closed, since whether
the bug re-surfaces or not will depend on whether there are more problems if
msi is set by default in the future and whether the associated code is buggy or
not. Therefore it will need to wait until 3.12 reaches final release and then
see if the kernel remains stable before closing this bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381774174.2D06881.18577--

--===============0815117790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0815117790==--
