From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62914] ZaphodHeads doesn't work after upgrading to
	xorg 1.14
Date: Fri, 31 May 2013 03:37:16 +0000
Message-ID: <bug-62914-8800-Vaukvr7zXr@http.bugs.freedesktop.org/>
References: <bug-62914-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0802446332=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62914-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0802446332==
Content-Type: multipart/alternative; boundary="1369971435.818eAE61.19876"; charset="us-ascii"


--1369971435.818eAE61.19876
Date: Fri, 31 May 2013 03:37:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62914

--- Comment #23 from Jason Stubbs <jasonbstubbs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #20)
> commit 1fdd7db94b55c65ea62cc9eaefff620b20e9e4ea
> Author: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date:   Mon Jan 7 15:28:53 2013 +1000
> 
> It didn't revert cleanly against master and how to fix the conflict wasn't
> clear to me so I haven't been able to test that.

I spoke too soon. Reverting was as easy as deleting all the additions, whereas
I was confused in thinking that the additions needed to be kept.

So, to cut a long story short, HEAD with the above patch reverted works for me.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369971435.818eAE61.19876
Date: Fri, 31 May 2013 03:37:15 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914">bug 62914</a>
              from <span class="vcard"><a class="email" href="mailto:jasonbstubbs&#64;gmail.com" title="Jason Stubbs &lt;jasonbstubbs&#64;gmail.com&gt;"> <span class="fn">Jason Stubbs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=62914#c20">comment #20</a>)
<span class="quote">&gt; commit 1fdd7db94b55c65ea62cc9eaefff620b20e9e4ea
&gt; Author: Dave Airlie &lt;<a href="mailto:airlied&#64;redhat.com">airlied&#64;redhat.com</a>&gt;
&gt; Date:   Mon Jan 7 15:28:53 2013 +1000
&gt; 
&gt; It didn't revert cleanly against master and how to fix the conflict wasn't
&gt; clear to me so I haven't been able to test that.</span >

I spoke too soon. Reverting was as easy as deleting all the additions, whereas
I was confused in thinking that the additions needed to be kept.

So, to cut a long story short, HEAD with the above patch reverted works for me.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369971435.818eAE61.19876--

--===============0802446332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0802446332==--
