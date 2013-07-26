From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Fri, 26 Jul 2013 18:08:14 +0000
Message-ID: <bug-67051-8800-wfliOK6G1Y@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0274263898=="
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


--===============0274263898==
Content-Type: multipart/alternative; boundary="1374862094.300dd520.16842"; charset="us-ascii"


--1374862094.300dd520.16842
Date: Fri, 26 Jul 2013 18:08:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #89 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ilia,

As promised:

(> my hdminva3.patch should already be part of 3.11, so I'm surprised
 you didn't get a conflict of some sort when applying it.)

These are the steps I did then and reproduced now to answer your question.
(Note: today, the git state machine is right after the debug-3 failure on
 88e9e3d2deacc460fbb8a4691140318f6e85e6891)

[~/linux]$ git checkout master ; echo $?
error: Your local changes to the following files would be overwritten by
checkout:
        drivers/gpu/drm/nouveau/core/engine/disp/hdminv84.c
        drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
        drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
Please, commit your changes or stash them before you can switch branches.
Aborting
1

[~/linux]$ git checkout drivers/gpu/drm/nouveau ; echo $?
0
[~/linux]$ git checkout master ; echo $?
Checking out files: 100% (24444/24444), done.
Previous HEAD position was 8e9e3d2... drm/nv84/disp: move hdmi control into
coreSwitched to branch 'master'
0

[~/linux]$ patch -p1 < /home/alex/hdmi-1.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdanva3.c
0
[~/linux]$ patch -p1 < /home/alex/hdminva3.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c.rej
1
[~/linux]$ patch -p1 < /home/alex/hdminva3-4.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminv84.c
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
0
[~/linux]$ patch -p1 < /home/alex/debug-3.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
patching file drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
patching file drivers/gpu/drm/nouveau/nv50_display.c
0

So basically I took the 'hdminva3.patch' skip in stride (then and now).
I agree, I should've mentioned this detail.  Hope it helps.

-- Alex

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374862094.300dd520.16842
Date: Fri, 26 Jul 2013 18:08:14 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c89">Comment # 89</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>Hi Ilia,

As promised:

(&gt; my hdminva3.patch should already be part of 3.11, so I'm surprised
 you didn't get a conflict of some sort when applying it.)

These are the steps I did then and reproduced now to answer your question.
(Note: today, the git state machine is right after the debug-3 failure on
 88e9e3d2deacc460fbb8a4691140318f6e85e6891)

[~/linux]$ git checkout master ; echo $?
error: Your local changes to the following files would be overwritten by
checkout:
        drivers/gpu/drm/nouveau/core/engine/disp/hdminv84.c
        drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
        drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
Please, commit your changes or stash them before you can switch branches.
Aborting
1

[~/linux]$ git checkout drivers/gpu/drm/nouveau ; echo $?
0
[~/linux]$ git checkout master ; echo $?
Checking out files: 100% (24444/24444), done.
Previous HEAD position was 8e9e3d2... drm/nv84/disp: move hdmi control into
coreSwitched to branch 'master'
0

[~/linux]$ patch -p1 &lt; /home/alex/hdmi-1.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdanva3.c
0
[~/linux]$ patch -p1 &lt; /home/alex/hdminva3.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c.rej
1
[~/linux]$ patch -p1 &lt; /home/alex/hdminva3-4.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminv84.c
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
0
[~/linux]$ patch -p1 &lt; /home/alex/debug-3.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
patching file drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
patching file drivers/gpu/drm/nouveau/nv50_display.c
0

So basically I took the 'hdminva3.patch' skip in stride (then and now).
I agree, I should've mentioned this detail.  Hope it helps.

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

--1374862094.300dd520.16842--

--===============0274263898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0274263898==--
