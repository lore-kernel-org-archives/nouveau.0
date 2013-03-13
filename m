From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58984] DRM NOUVEAU: probe of 0001:01:00.0 failed
	with error -12
Date: Wed, 13 Mar 2013 02:28:20 +0000
Message-ID: <bug-58984-8800-gN7N5j5k9K@http.bugs.freedesktop.org/>
References: <bug-58984-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0358652404=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58984-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0358652404==
Content-Type: multipart/alternative; boundary="1363141700.16EF3b1.11366"; charset="us-ascii"


--1363141700.16EF3b1.11366
Date: Wed, 13 Mar 2013 02:28:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58984

--- Comment #12 from Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
OK, I found some time to dig into this. I'm now running linux + nouveau git
latest.

The error continues into nv50_display_create(), where nouveau_bo_new() returns
-12. Tracing into nouveau_bo_new(), the function ttm_bo_init() fails with -12.
This seems to be "outside" of the nouveau driver, however, since I've had
success with nouveau using NV17 hardware, I thought perhaps that the parameters
were somehow problematic.

I see these integer (non-pointer/boolean) parameters to ttm_bo_init():

size = 8192
type = 0
align >> PAGE_SHIFT = 0
acc_size = 17536


PAGE_SHIFT = 13


SPARC has 8KB pages by default (1<<13), if that helps explain anything.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1363141700.16EF3b1.11366
Date: Wed, 13 Mar 2013 02:28:20 +0000
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
   title="NEW --- - DRM NOUVEAU: probe of 0001:01:00.0 failed with error -12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58984#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - DRM NOUVEAU: probe of 0001:01:00.0 failed with error -12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58984">bug 58984</a>
              from <span class="vcard"><a class="email" href="mailto:baggett.patrick&#64;gmail.com" title="Patrick Baggett &lt;baggett.patrick&#64;gmail.com&gt;"> <span class="fn">Patrick Baggett</span></a>
</span></b>
        <pre>OK, I found some time to dig into this. I'm now running linux + nouveau git
latest.

The error continues into nv50_display_create(), where nouveau_bo_new() returns
-12. Tracing into nouveau_bo_new(), the function ttm_bo_init() fails with -12.
This seems to be &quot;outside&quot; of the nouveau driver, however, since I've had
success with nouveau using NV17 hardware, I thought perhaps that the parameters
were somehow problematic.

I see these integer (non-pointer/boolean) parameters to ttm_bo_init():

size = 8192
type = 0
align &gt;&gt; PAGE_SHIFT = 0
acc_size = 17536


PAGE_SHIFT = 13


SPARC has 8KB pages by default (1&lt;&lt;13), if that helps explain anything.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1363141700.16EF3b1.11366--

--===============0358652404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0358652404==--
