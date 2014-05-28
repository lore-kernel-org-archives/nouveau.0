From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75761] weston-launch no output - black screen
Date: Wed, 28 May 2014 18:57:37 +0000
Message-ID: <bug-75761-8800-rbfmjLMzAq@http.bugs.freedesktop.org/>
References: <bug-75761-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0021584458=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75761-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0021584458==
Content-Type: multipart/alternative; boundary="1401303456.80C2AED4.7134"; charset="us-ascii"


--1401303456.80C2AED4.7134
Date: Wed, 28 May 2014 18:57:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75761

--- Comment #25 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #24)
> Since Weston and Wayland 1.5.0 were released today, I wanted to ask about
> the status of this bug.
> 
> Does the patch which causes the regression have enough legitimacy to stay
> and break Weston?

It seems like a pretty correct fix, at first blush. And was necessary for
something else, IIRC.

> 
> Does someone understand the problem on a large scale?

It'll take someone with KMS API and Wayland experience to work out what's going
on. Probably would have to get a Wayland developer involved to figure this one
out.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401303456.80C2AED4.7134
Date: Wed, 28 May 2014 18:57:36 +0000
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
   title="REOPENED --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761">bug 75761</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=75761#c24">comment #24</a>)
<span class="quote">&gt; Since Weston and Wayland 1.5.0 were released today, I wanted to ask about
&gt; the status of this bug.
&gt; 
&gt; Does the patch which causes the regression have enough legitimacy to stay
&gt; and break Weston?</span >

It seems like a pretty correct fix, at first blush. And was necessary for
something else, IIRC.

<span class="quote">&gt; 
&gt; Does someone understand the problem on a large scale?</span >

It'll take someone with KMS API and Wayland experience to work out what's going
on. Probably would have to get a Wayland developer involved to figure this one
out.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401303456.80C2AED4.7134--

--===============0021584458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0021584458==--
