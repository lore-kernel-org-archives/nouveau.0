From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79266] [NVC1] GT 430 / GF108 sluggish,
 unstable performance and blue tint with vdpau
Date: Mon, 26 May 2014 16:57:05 +0000
Message-ID: <bug-79266-8800-Pe2rgXBf1q@http.bugs.freedesktop.org/>
References: <bug-79266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0862365321=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79266-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0862365321==
Content-Type: multipart/alternative; boundary="1401123425.078eC2.13504"; charset="us-ascii"


--1401123425.078eC2.13504
Date: Mon, 26 May 2014 16:57:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79266

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #4)
> Sorry, but I am just annoyed by your attitude. It is a bug that affects
> multiple things at once that are inconclusive each by themselves and you
> argue that you have to discard those kind of bugs because it conflicts with
> your problem solving approach... To put bluntly, it sounds like you are
> trying to grab excuses with your points a, b ,c and on top of all finish by
> telling me (in other words) "If I want help I should be less cocky about my
> problems." ....

I was merely making observations that I thought might help you out. They
didn't. There are two separate things... your problems, and your attitude. Your
problems are fine. I was suggesting taking a more collaborative and less
confrontational attitude. My goal here is to either get this bug into a state
where someone can do something (aka "actionable"), or to close it as invalid
because such a state is not achievable.

> 
> Someone just has to look at this in close detail, possibly testing with the
> hardware. Maybe that is not feasible to you currently, but it doesn't make
> the bug report invalid and it doesn't change that it is broken. If you can't
> fix it, you leave it, at least that's how I know bug reporting.

This approach, while initially friendlier to the bug submitter, leads to
enormous bug lists that nobody ever looks at, which in turn may as well not
exist. In the end, I believe that this does a disservice to bug submitters. I'm
trying to keep all of the open bugs actionable so that an interested party can
look and see what the things to do are. If you don't like my problem solving
approach, I would love nothing more than to hear a more effective one.

The way that resolving these issues tends to work is largely collaborative. You
have to describe the issues clearly, and perhaps do some tracing. If you're not
willing to help along, this issue becomes non-actionable (and thus invalid).

So.... let's start with the basics. Let's say I have a GT 430. What do I need
to do in order to reproduce one of the issues.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401123425.078eC2.13504
Date: Mon, 26 May 2014 16:57:05 +0000
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
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266">bug 79266</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=79266#c4">comment #4</a>)
<span class="quote">&gt; Sorry, but I am just annoyed by your attitude. It is a bug that affects
&gt; multiple things at once that are inconclusive each by themselves and you
&gt; argue that you have to discard those kind of bugs because it conflicts with
&gt; your problem solving approach... To put bluntly, it sounds like you are
&gt; trying to grab excuses with your points a, b ,c and on top of all finish by
&gt; telling me (in other words) &quot;If I want help I should be less cocky about my
&gt; problems.&quot; ....</span >

I was merely making observations that I thought might help you out. They
didn't. There are two separate things... your problems, and your attitude. Your
problems are fine. I was suggesting taking a more collaborative and less
confrontational attitude. My goal here is to either get this bug into a state
where someone can do something (aka &quot;actionable&quot;), or to close it as invalid
because such a state is not achievable.

<span class="quote">&gt; 
&gt; Someone just has to look at this in close detail, possibly testing with the
&gt; hardware. Maybe that is not feasible to you currently, but it doesn't make
&gt; the bug report invalid and it doesn't change that it is broken. If you can't
&gt; fix it, you leave it, at least that's how I know bug reporting.</span >

This approach, while initially friendlier to the bug submitter, leads to
enormous bug lists that nobody ever looks at, which in turn may as well not
exist. In the end, I believe that this does a disservice to bug submitters. I'm
trying to keep all of the open bugs actionable so that an interested party can
look and see what the things to do are. If you don't like my problem solving
approach, I would love nothing more than to hear a more effective one.

The way that resolving these issues tends to work is largely collaborative. You
have to describe the issues clearly, and perhaps do some tracing. If you're not
willing to help along, this issue becomes non-actionable (and thus invalid).

So.... let's start with the basics. Let's say I have a GT 430. What do I need
to do in order to reproduce one of the issues.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401123425.078eC2.13504--

--===============0862365321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0862365321==--
