From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64323] Severe misrendering in Left 4 Dead 2
Date: Mon, 28 Oct 2013 22:25:21 +0000
Message-ID: <bug-64323-8800-0eRPV4eDhd@http.bugs.freedesktop.org/>
References: <bug-64323-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0130727069=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64323-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0130727069==
Content-Type: multipart/alternative; boundary="1382999121.85Cc3.15790"; charset="us-ascii"


--1382999121.85Cc3.15790
Date: Mon, 28 Oct 2013 22:25:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64323

--- Comment #8 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #7)
> I'm getting similar rendering issues with a 8800 GT card in all Source
> Engine games (tested in Team Fortress 2, Counter-Strike Source and Dota 2),
> but I'm not sure if it's the same bug.
> Mine is similar to the one reported in Valve's tracker:
> https://github.com/ValveSoftware/Source-1-Games/issues/200
> There's a youtube video with show the exact same problem I am experiencing:
> https://www.youtube.com/watch?v=XLtl7VqnXoE
> 
You're experiencing exactly the same issue.

> Should I open another bug report, or is this the same problem?
> 
That should not be needed.

This issue is kind of a sore spot, as even calim (the developer who wrote the
gallium driver) is unsure why it occurs.
I'm suspecting some sort of a race/missing fence, although that's wild guess.
Note that nvc0+ cards seems to render fine with this commit - so either there
is some subtle difference between the nv50/c0 codebase or hardware.

Any input(comments, ideas, patches) would be appreciated :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382999121.85Cc3.15790
Date: Mon, 28 Oct 2013 22:25:21 +0000
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
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323">bug 64323</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=64323#c7">comment #7</a>)
<span class="quote">&gt; I'm getting similar rendering issues with a 8800 GT card in all Source
&gt; Engine games (tested in Team Fortress 2, Counter-Strike Source and Dota 2),
&gt; but I'm not sure if it's the same bug.
&gt; Mine is similar to the one reported in Valve's tracker:
&gt; <a href="https://github.com/ValveSoftware/Source-1-Games/issues/200">https://github.com/ValveSoftware/Source-1-Games/issues/200</a>
&gt; There's a youtube video with show the exact same problem I am experiencing:
&gt; <a href="https://www.youtube.com/watch?v=XLtl7VqnXoE">https://www.youtube.com/watch?v=XLtl7VqnXoE</a>
&gt; </span >
You're experiencing exactly the same issue.

<span class="quote">&gt; Should I open another bug report, or is this the same problem?
&gt; </span >
That should not be needed.

This issue is kind of a sore spot, as even calim (the developer who wrote the
gallium driver) is unsure why it occurs.
I'm suspecting some sort of a race/missing fence, although that's wild guess.
Note that nvc0+ cards seems to render fine with this commit - so either there
is some subtle difference between the nv50/c0 codebase or hardware.

Any input(comments, ideas, patches) would be appreciated :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382999121.85Cc3.15790--

--===============0130727069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0130727069==--
