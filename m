From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59057] Black screen after resume from s2ram
Date: Sat, 05 Jan 2013 22:33:01 +0000
Message-ID: <bug-59057-8800-l2rbKOg4mV@http.bugs.freedesktop.org/>
References: <bug-59057-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1892745716=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59057-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1892745716==
Content-Type: multipart/alternative; boundary="1357425180.b1Fef1.18952"; charset="us-ascii"


--1357425180.b1Fef1.18952
Date: Sat, 5 Jan 2013 22:33:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59057

--- Comment #9 from Pontus Fuchs <pontus.fuchs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #8)
> Now, can you verify that with commit 186ecad21 and the fix from bug 58729
> you still see black screen on resume? I'm asking because I think you hit 2
> issues and you bisected the first one. If above combination work, can you
> bisect between 186ecad21 and 3.8rc1, applying fix from bug 58729 at each
> bisection step?

I tried 186ecad21 + "drm/nv50/disp: fix resume from s2ram for analog output"
but no luck. Still black screen :(

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357425180.b1Fef1.18952
Date: Sat, 5 Jan 2013 22:33:00 +0000
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
   title="NEW --- - Black screen after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59057#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Black screen after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59057">bug 59057</a>
              from <span class="vcard"><a class="email" href="mailto:pontus.fuchs&#64;gmail.com" title="Pontus Fuchs &lt;pontus.fuchs&#64;gmail.com&gt;"> <span class="fn">Pontus Fuchs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=59057#c8">comment #8</a>)
<span class="quote">&gt; Now, can you verify that with commit 186ecad21 and the fix from <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [bisected] Display fails to turn on after suspend/resume (NV86)"
   href="show_bug.cgi?id=58729">bug 58729</a>
&gt; you still see black screen on resume? I'm asking because I think you hit 2
&gt; issues and you bisected the first one. If above combination work, can you
&gt; bisect between 186ecad21 and 3.8rc1, applying fix from <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [bisected] Display fails to turn on after suspend/resume (NV86)"
   href="show_bug.cgi?id=58729">bug 58729</a> at each
&gt; bisection step?</span >

I tried 186ecad21 + &quot;drm/nv50/disp: fix resume from s2ram for analog output&quot;
but no luck. Still black screen :(</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357425180.b1Fef1.18952--

--===============1892745716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1892745716==--
