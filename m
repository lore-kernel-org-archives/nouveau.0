From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77361] [nve7] nouveau not working on 3.13 linux
	kernel
Date: Sun, 13 Apr 2014 12:04:38 +0000
Message-ID: <bug-77361-8800-3J8btmAR7a@http.bugs.freedesktop.org/>
References: <bug-77361-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0832984441=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77361-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0832984441==
Content-Type: multipart/alternative; boundary="1397390677.306ee21.13037"; charset="us-ascii"


--1397390677.306ee21.13037
Date: Sun, 13 Apr 2014 12:04:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77361

--- Comment #20 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #19)
> uugh, yeah that sounds nasty.
> 
It sounds nastier than what it really is. All you need is "how to compile a
kernel the debian way", and and to record the result after boot/testing the
respective kernel - $ git bisect {good,bad}. Afaics it should take ~8 steps
(reboots) to isolate the commit.

> I think I'll stick with the fbdev driver until I have some time do this.
> 
Btw. if you're betting on someone else to do the bisection you're in for some
tough time. I've been using 3.13 kernel since 3.13.1 came out and I've never
had such a problem. I'm betting that there is something subtle is your setup
that is causing this.

> Thanks so much for your help so far.
> 
> BTW, on both the nouveau and fbdev drivers, I get occassional horizontal
> lines flickering on the screen... is that a known glitch?
Not entirely sure what you mean with the flicker there. If you're talking about
tearing, yes that is kind of expected.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397390677.306ee21.13037
Date: Sun, 13 Apr 2014 12:04:37 +0000
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
   title="NEW --- - [nve7] nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nve7] nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361">bug 77361</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77361#c19">comment #19</a>)
<span class="quote">&gt; uugh, yeah that sounds nasty.
&gt; </span >
It sounds nastier than what it really is. All you need is &quot;how to compile a
kernel the debian way&quot;, and and to record the result after boot/testing the
respective kernel - $ git bisect {good,bad}. Afaics it should take ~8 steps
(reboots) to isolate the commit.

<span class="quote">&gt; I think I'll stick with the fbdev driver until I have some time do this.
&gt; </span >
Btw. if you're betting on someone else to do the bisection you're in for some
tough time. I've been using 3.13 kernel since 3.13.1 came out and I've never
had such a problem. I'm betting that there is something subtle is your setup
that is causing this.

<span class="quote">&gt; Thanks so much for your help so far.
&gt; 
&gt; BTW, on both the nouveau and fbdev drivers, I get occassional horizontal
&gt; lines flickering on the screen... is that a known glitch?</span >
Not entirely sure what you mean with the flicker there. If you're talking about
tearing, yes that is kind of expected.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397390677.306ee21.13037--

--===============0832984441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0832984441==--
