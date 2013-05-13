From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58984] DRM NOUVEAU: probe of 0001:01:00.0 failed
	with error -12
Date: Mon, 13 May 2013 18:53:29 +0000
Message-ID: <bug-58984-8800-fzhgzZlvPY@http.bugs.freedesktop.org/>
References: <bug-58984-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0663612809=="
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


--===============0663612809==
Content-Type: multipart/alternative; boundary="1368471209.af446CfE1.22229"; charset="us-ascii"


--1368471209.af446CfE1.22229
Date: Mon, 13 May 2013 18:53:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58984

--- Comment #17 from Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hey all,

I was looking to audit the use of 12/PAGE_SHIFT in nouveau to help determine
the context of what is meant (i.e. host CPU page size or GPU page size?).
Marcin  Slusarz suggested that there be a private PAGE_XXX macro for NV cards;
would these then be 4KB pages only? I realize the GPUs may support other sizes,
but my understanding of the current situation is that they are not supported by
the current driver.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368471209.af446CfE1.22229
Date: Mon, 13 May 2013 18:53:29 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58984#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - DRM NOUVEAU: probe of 0001:01:00.0 failed with error -12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58984">bug 58984</a>
              from <span class="vcard"><a class="email" href="mailto:baggett.patrick&#64;gmail.com" title="Patrick Baggett &lt;baggett.patrick&#64;gmail.com&gt;"> <span class="fn">Patrick Baggett</span></a>
</span></b>
        <pre>Hey all,

I was looking to audit the use of 12/PAGE_SHIFT in nouveau to help determine
the context of what is meant (i.e. host CPU page size or GPU page size?).
Marcin  Slusarz suggested that there be a private PAGE_XXX macro for NV cards;
would these then be 4KB pages only? I realize the GPUs may support other sizes,
but my understanding of the current situation is that they are not supported by
the current driver.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368471209.af446CfE1.22229--

--===============0663612809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0663612809==--
