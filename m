From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64323] Severe misrendering in Left 4 Dead 2
Date: Sat, 30 Nov 2013 13:37:24 +0000
Message-ID: <bug-64323-8800-9SZ9HHmBHs@http.bugs.freedesktop.org/>
References: <bug-64323-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0852907441=="
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


--===============0852907441==
Content-Type: multipart/alternative; boundary="1385818644.Ce553.24770"; charset="us-ascii"


--1385818644.Ce553.24770
Date: Sat, 30 Nov 2013 13:37:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64323

--- Comment #16 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #15)
> I've tested the last patch on TF2, it fixes the issue. I've done some
> benchmarking and there is some performance loss though:
> 
> 
> Without the patch: avg 62 fps
> With the patch: avg 45 fps
> (with and without done thrice)
> 
> 
> Mesa 9.2.4

Well that's a big drop... Of course it's not exactly a decrease since it
doesn't work otherwise. Could you try the other suggested patches and see what
their performance impact is?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385818644.Ce553.24770
Date: Sat, 30 Nov 2013 13:37:24 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323">bug 64323</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=64323#c15">comment #15</a>)
<span class="quote">&gt; I've tested the last patch on TF2, it fixes the issue. I've done some
&gt; benchmarking and there is some performance loss though:
&gt; 
&gt; 
&gt; Without the patch: avg 62 fps
&gt; With the patch: avg 45 fps
&gt; (with and without done thrice)
&gt; 
&gt; 
&gt; Mesa 9.2.4</span >

Well that's a big drop... Of course it's not exactly a decrease since it
doesn't work otherwise. Could you try the other suggested patches and see what
their performance impact is?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385818644.Ce553.24770--

--===============0852907441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0852907441==--
