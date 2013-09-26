From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69203] [NVC1] Kernel 3.11 - Xorg hangs immediately
 after invocation
Date: Thu, 26 Sep 2013 22:19:46 +0000
Message-ID: <bug-69203-8800-d6MGsVqfLj@http.bugs.freedesktop.org/>
References: <bug-69203-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2076312805=="
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


--===============2076312805==
Content-Type: multipart/alternative; boundary="1380233985.6Ce55Ce0.4731"; charset="us-ascii"


--1380233985.6Ce55Ce0.4731
Date: Thu, 26 Sep 2013 22:19:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69203

--- Comment #10 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
UPDATES and CLARIFICATIONS (to whom it may concern)

1. The bug persists in 3.11.1 ("Latest Stable Kernel").


2. The Boot-up hang problem
Encountered in bisecting for the subject bug.
Certain commits hang up on boot.  Hard (you have to press the Chernobyl button
to restart the machine.)
Note: as a "side effect" of those occurrences, the subject X11 bug becomes
moot.
(I suspect some would consider this a _good_ side effect).

I pinpointed the offending commit by looking at the parents of c03ff9e8:

c03ff9e8fa5fc0186158b99a89f613325ff352cf        hangs on boot-up
30f4e0870d1726f31aa59804337cfd5e0a3f2ec7        hangs on boot-up
791dc143ed2c441f5202d8721609d94dce9fcf88        GOOD
 ...
a0376b1481fdb9c9e8064ea0c5af8bd80da3f8f3        GOOD
 ...
79442c3af0525e81d4598e272abe5db60c489c62        GOOD
 ...
99bd5537bd22256866d83033e0aab2586616bcc2        GOOD

------
So the boot-up hard HANG problem starts with

commit 30f4e0870d1726f31aa59804337cfd5e0a3f2e

Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Sun Jun 9 16:08:22 2013 +1000

    drm/nvc0-/gr: make register lists from initvals functions

    Generated context verified to be the same for all supported chipsets.

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---------------------------------------------------------

3.  To clear up the confusion I created by confusing dates with commit order,
ancestors and the like.
I performed a "manual" bisect procedure in the "lineage" of 8f6fe267 where
the subject bug is introduced (and where 5ee86c41 is indeed an ancestor of
56fbd2b65).

Legend
GOOD - Clean boot-up to text/console mode (level 3).  Clean X11/Xorg (level 5)
HANG - Hard hang on boot-up (to text/console mode).
FLAKY - Flaky X11 cursor:  after, say, starting xterm and exiting it, the
        cursor disappears and you have to restart the machine.
BAD - X11/Xorg is hung.  FWIW, cursor can still be moved with the left mouse.
      No other reaction.  The Subject BUG.

The parents of 8f6fe267:
8f6fe26745d39299d43d79dd7ba9838517624c3f        BAD
960b4381c5fff0b0f16f4b812082811dde1ab7ab        B
0085a60524aeb743c15bbdf7354f4e4f6623243e        B
18ac4246510bee85d2efd6ed536b436e246f7624        B
9d1c4c51ce9cd133a25b339be398e35663cc2ae5        B
b054aadfb0030b9717bb22f4283bfe5aec13440b        B
9ec2dbba9fedbd1788849fb00d659ebdf549a4f8        B
56fbd2b65446d4fb4df7770c49a70d563b7569c9        B
26410c679865bcfcbe18422ca1eb472cf12ea82d        B
a32b2ffb82b5a386a13fde40dc131f853636dcf5        B
70f824ac8c369194e9499c59e687c6aa8b1a10c8        FLAKY
5ee86c4190f9e19a9e13906389069c73d7f75bfb        HANG
c03ff9e8fa5fc0186158b99a89f613325ff352cf        H
30f4e0870d1726f31aa59804337cfd5e0a3f2ec7        H
791dc143ed2c441f5202d8721609d94dce9fcf88        GOOD
 ...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380233985.6Ce55Ce0.4731
Date: Thu, 26 Sep 2013 22:19:45 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69203#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] Kernel 3.11 - Xorg hangs immediately after invocation"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69203">bug 69203</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>UPDATES and CLARIFICATIONS (to whom it may concern)

1. The bug persists in 3.11.1 (&quot;Latest Stable Kernel&quot;).


2. The Boot-up hang problem
Encountered in bisecting for the subject bug.
Certain commits hang up on boot.  Hard (you have to press the Chernobyl button
to restart the machine.)
Note: as a &quot;side effect&quot; of those occurrences, the subject X11 bug becomes
moot.
(I suspect some would consider this a _good_ side effect).

I pinpointed the offending commit by looking at the parents of c03ff9e8:

c03ff9e8fa5fc0186158b99a89f613325ff352cf        hangs on boot-up
30f4e0870d1726f31aa59804337cfd5e0a3f2ec7        hangs on boot-up
791dc143ed2c441f5202d8721609d94dce9fcf88        GOOD
 ...
a0376b1481fdb9c9e8064ea0c5af8bd80da3f8f3        GOOD
 ...
79442c3af0525e81d4598e272abe5db60c489c62        GOOD
 ...
99bd5537bd22256866d83033e0aab2586616bcc2        GOOD

------
So the boot-up hard HANG problem starts with

commit 30f4e0870d1726f31aa59804337cfd5e0a3f2e

Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Sun Jun 9 16:08:22 2013 +1000

    drm/nvc0-/gr: make register lists from initvals functions

    Generated context verified to be the same for all supported chipsets.

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
---------------------------------------------------------

3.  To clear up the confusion I created by confusing dates with commit order,
ancestors and the like.
I performed a &quot;manual&quot; bisect procedure in the &quot;lineage&quot; of 8f6fe267 where
the subject bug is introduced (and where 5ee86c41 is indeed an ancestor of
56fbd2b65).

Legend
GOOD - Clean boot-up to text/console mode (level 3).  Clean X11/Xorg (level 5)
HANG - Hard hang on boot-up (to text/console mode).
FLAKY - Flaky X11 cursor:  after, say, starting xterm and exiting it, the
        cursor disappears and you have to restart the machine.
BAD - X11/Xorg is hung.  FWIW, cursor can still be moved with the left mouse.
      No other reaction.  The Subject BUG.

The parents of 8f6fe267:
8f6fe26745d39299d43d79dd7ba9838517624c3f        BAD
960b4381c5fff0b0f16f4b812082811dde1ab7ab        B
0085a60524aeb743c15bbdf7354f4e4f6623243e        B
18ac4246510bee85d2efd6ed536b436e246f7624        B
9d1c4c51ce9cd133a25b339be398e35663cc2ae5        B
b054aadfb0030b9717bb22f4283bfe5aec13440b        B
9ec2dbba9fedbd1788849fb00d659ebdf549a4f8        B
56fbd2b65446d4fb4df7770c49a70d563b7569c9        B
26410c679865bcfcbe18422ca1eb472cf12ea82d        B
a32b2ffb82b5a386a13fde40dc131f853636dcf5        B
70f824ac8c369194e9499c59e687c6aa8b1a10c8        FLAKY
5ee86c4190f9e19a9e13906389069c73d7f75bfb        HANG
c03ff9e8fa5fc0186158b99a89f613325ff352cf        H
30f4e0870d1726f31aa59804337cfd5e0a3f2ec7        H
791dc143ed2c441f5202d8721609d94dce9fcf88        GOOD
 ...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380233985.6Ce55Ce0.4731--

--===============2076312805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2076312805==--
