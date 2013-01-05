From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Sat, 05 Jan 2013 07:20:55 +0000
Message-ID: <bug-50121-8800-zfuo56lTCy@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2045825298=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2045825298==
Content-Type: multipart/alternative; boundary="1357370456.0FF7bA7b4.32040"; charset="us-ascii"


--1357370456.0FF7bA7b4.32040
Date: Sat, 5 Jan 2013 07:20:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

--- Comment #49 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
(In reply to comment #38)
> This patch is not directly applicable to kernels < 3.7, although porting it
> is trivial.
"Porting" of that patch against 3.6 is far from "trivial" - exercise in
futility more like!

There is no "nv50_fence.c" to start off with, "nouveau_drm" struct isn't there
either, let alone that "nv10_fence_priv" doesn't seem to have "base.resume"
defined at all.

I think I am going to stick with 3.3 until 3.7 comes out and then decide what
to do next...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357370456.0FF7bA7b4.32040
Date: Sat, 5 Jan 2013 07:20:56 +0000
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
   title="NEW --- - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c49">Comment # 49</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:mr.dash.four&#64;googlemail.com" title="Mr-4 &lt;mr.dash.four&#64;googlemail.com&gt;"> <span class="fn">Mr-4</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=50121#c38">comment #38</a>)
<span class="quote">&gt; This patch is not directly applicable to kernels &lt; 3.7, although porting it
&gt; is trivial.</span >
&quot;Porting&quot; of that patch against 3.6 is far from &quot;trivial&quot; - exercise in
futility more like!

There is no &quot;nv50_fence.c&quot; to start off with, &quot;nouveau_drm&quot; struct isn't there
either, let alone that &quot;nv10_fence_priv&quot; doesn't seem to have &quot;base.resume&quot;
defined at all.

I think I am going to stick with 3.3 until 3.7 comes out and then decide what
to do next...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357370456.0FF7bA7b4.32040--

--===============2045825298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2045825298==--
