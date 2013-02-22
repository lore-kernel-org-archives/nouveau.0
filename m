From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54786] random crashes of X with failed to idle
 channel 0xcccc0000
Date: Fri, 22 Feb 2013 18:03:45 +0000
Message-ID: <bug-54786-8800-rjIZJOQlrw@http.bugs.freedesktop.org/>
References: <bug-54786-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0400526400=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54786-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0400526400==
Content-Type: multipart/alternative; boundary="1361556225.1cfF4Fc2.30232"; charset="us-ascii"


--1361556225.1cfF4Fc2.30232
Date: Fri, 22 Feb 2013 18:03:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54786

--- Comment #6 from Steven Newbury <s_j_newbury-/E1597aS9LT10XsdtD+oqA@public.gmane.org> ---
(In reply to comment #5)
> Still happens here.  Both with linus/master and nouveau-drm-next.  I'm going
> to try reverting the above mentioned commit, although it's not obvious to me
> how it would be the cause...
As expected, reverting 7707b701ebfea64afa6bfb23aa318fd687892754 made no
difference. :(

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361556225.1cfF4Fc2.30232
Date: Fri, 22 Feb 2013 18:03:45 +0000
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
   title="NEW --- - random crashes of X with failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54786#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - random crashes of X with failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54786">bug 54786</a>
              from <span class="vcard"><a class="email" href="mailto:s_j_newbury&#64;yahoo.co.uk" title="Steven Newbury &lt;s_j_newbury&#64;yahoo.co.uk&gt;"> <span class="fn">Steven Newbury</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=54786#c5">comment #5</a>)
<span class="quote">&gt; Still happens here.  Both with linus/master and nouveau-drm-next.  I'm going
&gt; to try reverting the above mentioned commit, although it's not obvious to me
&gt; how it would be the cause...</span >
As expected, reverting 7707b701ebfea64afa6bfb23aa318fd687892754 made no
difference. :(</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361556225.1cfF4Fc2.30232--

--===============0400526400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0400526400==--
