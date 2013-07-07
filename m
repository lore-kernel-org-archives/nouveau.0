From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Sun, 07 Jul 2013 17:38:48 +0000
Message-ID: <bug-54700-8800-ZXD63Bdz93@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1360282733=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1360282733==
Content-Type: multipart/alternative; boundary="1373218728.B6ec62.4157"; charset="us-ascii"


--1373218728.B6ec62.4157
Date: Sun, 7 Jul 2013 17:38:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #19 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #13)
> Created attachment 82142 [details]
> distorted graphics
> 
> I agree that distorted is not the good wording, but I do not how to qualify
> this misbeaviour.
> 
> Just to have an idea of what I mean by distorted graphics I upload a
> snapshot of the iceweasel log.
> 
> The mostdisturbing feature is the doubling of the cursor arrows (and each
> one is distorted as the logo), which makes the system hard to use.

Looks like every other column is shifted to the right by x*2. I'll see if I can
get the number of X, unless you beat me to it :)

To be on the safe side, use the left mouse cursor :P

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373218728.B6ec62.4157
Date: Sun, 7 Jul 2013 17:38:48 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=54700#c13">comment #13</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=82142" name="attach_82142" title="distorted graphics">attachment 82142</a> <a href="attachment.cgi?id=82142&amp;action=edit" title="distorted graphics">[details]</a></span>
&gt; distorted graphics
&gt; 
&gt; I agree that distorted is not the good wording, but I do not how to qualify
&gt; this misbeaviour.
&gt; 
&gt; Just to have an idea of what I mean by distorted graphics I upload a
&gt; snapshot of the iceweasel log.
&gt; 
&gt; The mostdisturbing feature is the doubling of the cursor arrows (and each
&gt; one is distorted as the logo), which makes the system hard to use.</span >

Looks like every other column is shifted to the right by x*2. I'll see if I can
get the number of X, unless you beat me to it :)

To be on the safe side, use the left mouse cursor :P</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373218728.B6ec62.4157--

--===============1360282733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1360282733==--
