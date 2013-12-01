From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64323] Severe misrendering in Left 4 Dead 2
Date: Sun, 01 Dec 2013 18:29:01 +0000
Message-ID: <bug-64323-8800-7kVjVu9Haq@http.bugs.freedesktop.org/>
References: <bug-64323-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1214823829=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64323-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1214823829==
Content-Type: multipart/alternative; boundary="1385922541.14efBadC4.16758"; charset="us-ascii"


--1385922541.14efBadC4.16758
Date: Sun, 1 Dec 2013 18:29:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64323

--- Comment #27 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #26)
> I'd suggest you launch the game normally and use timedemo_runcount 3 +
> timedemo xx instead. I've seen that the first time you play the demo with
> timedemo, it is usually less accurate (probably because the game hasn't
> loaded yet most resources in memory).
> For example I'd sometimes get 55 FPS the first time, then a constant 62
> every time after.

Despite using the same engine dota2, is rather different from the other source
titles - tf2, cs:s, l4d2. It pre-loads (almost?) every resource required.

Thanks for the timedemo_runcount tip, although dota2 is a bit short in that
regard. Running a couple sequential runs, using "timedemoquit" provides rather
consistent results.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385922541.14efBadC4.16758
Date: Sun, 1 Dec 2013 18:29:01 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323">bug 64323</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=64323#c26">comment #26</a>)
<span class="quote">&gt; I'd suggest you launch the game normally and use timedemo_runcount 3 +
&gt; timedemo xx instead. I've seen that the first time you play the demo with
&gt; timedemo, it is usually less accurate (probably because the game hasn't
&gt; loaded yet most resources in memory).
&gt; For example I'd sometimes get 55 FPS the first time, then a constant 62
&gt; every time after.</span >

Despite using the same engine dota2, is rather different from the other source
titles - tf2, cs:s, l4d2. It pre-loads (almost?) every resource required.

Thanks for the timedemo_runcount tip, although dota2 is a bit short in that
regard. Running a couple sequential runs, using &quot;timedemoquit&quot; provides rather
consistent results.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385922541.14efBadC4.16758--

--===============1214823829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1214823829==--
