From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70213] [git-v3.12-rc3 + nouveau HEAD] Vmalloc
 failure -> pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x50 returns -12
Date: Thu, 23 Jan 2014 18:44:01 +0000
Message-ID: <bug-70213-8800-PhUu04GrIh@http.bugs.freedesktop.org/>
References: <bug-70213-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0875079032=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70213-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0875079032==
Content-Type: multipart/alternative; boundary="1390502641.bb1de4A2.23733"; charset="us-ascii"


--1390502641.bb1de4A2.23733
Date: Thu, 23 Jan 2014 18:44:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70213

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #3)
> This bug is tough and cumbersome to reproduce.

No kidding. However you could just add a "return false;" in nv84_fence_suspend,
which should have an identical effect.

> Is the patch going upstream anyway?

Not up to me, but I would assume so.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390502641.bb1de4A2.23733
Date: Thu, 23 Jan 2014 18:44:01 +0000
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
   title="NEW --- - [git-v3.12-rc3 + nouveau HEAD] Vmalloc failure -&gt; pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x50 returns -12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70213#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [git-v3.12-rc3 + nouveau HEAD] Vmalloc failure -&gt; pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x50 returns -12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70213">bug 70213</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=70213#c3">comment #3</a>)
<span class="quote">&gt; This bug is tough and cumbersome to reproduce.</span >

No kidding. However you could just add a &quot;return false;&quot; in nv84_fence_suspend,
which should have an identical effect.

<span class="quote">&gt; Is the patch going upstream anyway?</span >

Not up to me, but I would assume so.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390502641.bb1de4A2.23733--

--===============0875079032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0875079032==--
