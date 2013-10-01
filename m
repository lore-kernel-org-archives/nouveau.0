From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66809] Compiz segfault with latest mesa-git
Date: Tue, 01 Oct 2013 23:13:38 +0000
Message-ID: <bug-66809-8800-y4xAKT4rqf@http.bugs.freedesktop.org/>
References: <bug-66809-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1897311906=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66809-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1897311906==
Content-Type: multipart/alternative; boundary="1380669218.CBfb1.4037"; charset="us-ascii"


--1380669218.CBfb1.4037
Date: Tue, 1 Oct 2013 23:13:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66809

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
My guess is that this is fixed in latest mesa-git. Can you test this out again?

Unfortunately you did not provide an annotated stack trace as requested, but
the commit you bisected to caused all sorts of problem for nouveau. It was
changed by
http://cgit.freedesktop.org/mesa/mesa/commit/?id=b217d48364f368f541e53006af5dd56f664be24d
in such a way that it appears to work much better for nouveau.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380669218.CBfb1.4037
Date: Tue, 1 Oct 2013 23:13:38 +0000
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
   title="NEW --- - Compiz segfault with latest mesa-git"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66809#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Compiz segfault with latest mesa-git"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66809">bug 66809</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>My guess is that this is fixed in latest mesa-git. Can you test this out again?

Unfortunately you did not provide an annotated stack trace as requested, but
the commit you bisected to caused all sorts of problem for nouveau. It was
changed by
<a href="http://cgit.freedesktop.org/mesa/mesa/commit/?id=b217d48364f368f541e53006af5dd56f664be24d">http://cgit.freedesktop.org/mesa/mesa/commit/?id=b217d48364f368f541e53006af5dd56f664be24d</a>
in such a way that it appears to work much better for nouveau.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380669218.CBfb1.4037--

--===============1897311906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1897311906==--
