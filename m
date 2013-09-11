From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69203] [NVC1] Kernel 3.11 - Xorg hangs immediately
 after invocation
Date: Wed, 11 Sep 2013 14:00:47 +0000
Message-ID: <bug-69203-8800-hUzPgizYFd@http.bugs.freedesktop.org/>
References: <bug-69203-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1058026466=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69203-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1058026466==
Content-Type: multipart/alternative; boundary="1378908046.3f4Ac0.28661"; charset="us-ascii"


--1378908046.3f4Ac0.28661
Date: Wed, 11 Sep 2013 14:00:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69203

--- Comment #6 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
> Can you try
 git checkout 5ee86c4190f9e
 git cherry-pick d2989b534ef6834ebf2425aecc040b894b567c91
> And run that kernel?

Hi Ilia,

[~/linux]$ git status
# On branch master
nothing to commit, working directory clean

[~/linux]$ git checkout 5ee86c4190f9e
Note: checking out '5ee86c4190f9e'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b new_branch_name

HEAD is now at 5ee86c41... drm/nve0-/gr: some new gpc registers can have
multiple copies

[~/linux]$ git cherry-pick d2989b534ef6834ebf2425aecc040b894b567c91
error: could not apply d2989b5... drm/nvc0/gr: fix gpc firmware regression
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' or 'git rm <paths>'
hint: and commit the result with 'git commit'
-------------------------------------------------------------------------------
BTW (this might shed some extra light):
Yesterday, before resubmitting the bug, I tried to apply the
a0b7ebfb39bf80078d12bd1a46ec40d0d0dbdeef
patches to 5ee (edited to fit the master configuration).
I called the new patch "M.patch" (for Maarten).
This is what I got:

[~/linux]$ patch -p1 < /root/patches/M.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/graph/fuc/gpc.fuc
Hunk #1 succeeded at 353 (offset 1 line).
patching file drivers/gpu/drm/nouveau/core/engine/graph/fuc/gpcnvc0.fuc.h
Hunk #1 FAILED at 400.
1 out of 1 hunk FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/graph/fuc/gpcnvc0.fuc.h.rej
1

so I gave up.
Caveat:  it's possible I may have messed up the patches (original and edited)
I'll attach them for your critique.

-- Alex

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378908046.3f4Ac0.28661
Date: Wed, 11 Sep 2013 14:00:46 +0000
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
   title="NEW --- - [NVC1] Kernel 3.11 - Xorg hangs immediately after invocation"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69203#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] Kernel 3.11 - Xorg hangs immediately after invocation"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69203">bug 69203</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre><span class="quote">&gt; Can you try</span >
 git checkout 5ee86c4190f9e
 git cherry-pick d2989b534ef6834ebf2425aecc040b894b567c91
<span class="quote">&gt; And run that kernel?</span >

Hi Ilia,

[~/linux]$ git status
# On branch master
nothing to commit, working directory clean

[~/linux]$ git checkout 5ee86c4190f9e
Note: checking out '5ee86c4190f9e'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b new_branch_name

HEAD is now at 5ee86c41... drm/nve0-/gr: some new gpc registers can have
multiple copies

[~/linux]$ git cherry-pick d2989b534ef6834ebf2425aecc040b894b567c91
error: could not apply d2989b5... drm/nvc0/gr: fix gpc firmware regression
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add &lt;paths&gt;' or 'git rm &lt;paths&gt;'
hint: and commit the result with 'git commit'
-------------------------------------------------------------------------------
BTW (this might shed some extra light):
Yesterday, before resubmitting the bug, I tried to apply the
a0b7ebfb39bf80078d12bd1a46ec40d0d0dbdeef
patches to 5ee (edited to fit the master configuration).
I called the new patch &quot;M.patch&quot; (for Maarten).
This is what I got:

[~/linux]$ patch -p1 &lt; /root/patches/M.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/graph/fuc/gpc.fuc
Hunk #1 succeeded at 353 (offset 1 line).
patching file drivers/gpu/drm/nouveau/core/engine/graph/fuc/gpcnvc0.fuc.h
Hunk #1 FAILED at 400.
1 out of 1 hunk FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/graph/fuc/gpcnvc0.fuc.h.rej
1

so I gave up.
Caveat:  it's possible I may have messed up the patches (original and edited)
I'll attach them for your critique.

-- Alex</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378908046.3f4Ac0.28661--

--===============1058026466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1058026466==--
