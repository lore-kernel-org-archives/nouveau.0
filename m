From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58984] DRM NOUVEAU: probe of 0001:01:00.0 failed
	with error -12
Date: Wed, 13 Mar 2013 21:48:34 +0000
Message-ID: <bug-58984-8800-E70JDlYFFl@http.bugs.freedesktop.org/>
References: <bug-58984-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1346035084=="
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


--===============1346035084==
Content-Type: multipart/alternative; boundary="1363211313.e56D6BDc1.17557"; charset="us-ascii"


--1363211313.e56D6BDc1.17557
Date: Wed, 13 Mar 2013 21:48:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58984

--- Comment #15 from Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hmm, that does make sense. Alright then, since you seem to have more of an idea
of what is going on, how can I help?

Which makes sense / is the right route? A private PAGE_SHIFT|MASK|SIZE for GPUs
or using the system page size consistently? Are all NV GPUs that support paging
using 4K pages? (I say "support paging" because I had an NV17 GPU that worked
fine on SPARC, OpenGL games worked and all).

Should I just audit nouveau/*.c for any usage of "12" and try changing it to
PAGE_SHIFT to see what happens? Guide me and I'll do all the annoying busy
work. ;)


Patrick

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1363211313.e56D6BDc1.17557
Date: Wed, 13 Mar 2013 21:48:33 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58984#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - DRM NOUVEAU: probe of 0001:01:00.0 failed with error -12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58984">bug 58984</a>
              from <span class="vcard"><a class="email" href="mailto:baggett.patrick&#64;gmail.com" title="Patrick Baggett &lt;baggett.patrick&#64;gmail.com&gt;"> <span class="fn">Patrick Baggett</span></a>
</span></b>
        <pre>Hmm, that does make sense. Alright then, since you seem to have more of an idea
of what is going on, how can I help?

Which makes sense / is the right route? A private PAGE_SHIFT|MASK|SIZE for GPUs
or using the system page size consistently? Are all NV GPUs that support paging
using 4K pages? (I say &quot;support paging&quot; because I had an NV17 GPU that worked
fine on SPARC, OpenGL games worked and all).

Should I just audit nouveau/*.c for any usage of &quot;12&quot; and try changing it to
PAGE_SHIFT to see what happens? Guide me and I'll do all the annoying busy
work. ;)


Patrick</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1363211313.e56D6BDc1.17557--

--===============1346035084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1346035084==--
