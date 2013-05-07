From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64323] Severe misrendering in Left 4 Dead 2
Date: Tue, 07 May 2013 16:55:43 +0000
Message-ID: <bug-64323-8800-lmbQ7m28Tc@http.bugs.freedesktop.org/>
References: <bug-64323-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0094622544=="
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


--===============0094622544==
Content-Type: multipart/alternative; boundary="1367945743.feab0.24071"; charset="us-ascii"


--1367945743.feab0.24071
Date: Tue, 7 May 2013 16:55:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64323

--- Comment #1 from Bryan Cain <bryancain3+fdo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Here is a much smaller (40 MB bz2'd, 74 MB uncompressed) trace that
demonstrates the regression in the loading and title screen of Portal:
http://plombofiles.pbworks.com/f/portal.trace.bz2

On the loading screen, the "Loading..." text in the bottom right corner is not
shown after the regression:
http://plombofiles.pbworks.com/f/loading_bad.png
http://plombofiles.pbworks.com/f/loading_good.png

On the title screen, several frames have significant rendering artifacts after
the regression:
http://plombofiles.pbworks.com/f/title_bad.png
http://plombofiles.pbworks.com/f/title_good.png

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1367945743.feab0.24071
Date: Tue, 7 May 2013 16:55:43 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323">bug 64323</a>
              from <span class="vcard"><a class="email" href="mailto:bryancain3+fdo&#64;gmail.com" title="Bryan Cain &lt;bryancain3+fdo&#64;gmail.com&gt;"> <span class="fn">Bryan Cain</span></a>
</span></b>
        <pre>Here is a much smaller (40 MB bz2'd, 74 MB uncompressed) trace that
demonstrates the regression in the loading and title screen of Portal:
<a href="http://plombofiles.pbworks.com/f/portal.trace.bz2">http://plombofiles.pbworks.com/f/portal.trace.bz2</a>

On the loading screen, the &quot;Loading...&quot; text in the bottom right corner is not
shown after the regression:
<a href="http://plombofiles.pbworks.com/f/loading_bad.png">http://plombofiles.pbworks.com/f/loading_bad.png</a>
<a href="http://plombofiles.pbworks.com/f/loading_good.png">http://plombofiles.pbworks.com/f/loading_good.png</a>

On the title screen, several frames have significant rendering artifacts after
the regression:
<a href="http://plombofiles.pbworks.com/f/title_bad.png">http://plombofiles.pbworks.com/f/title_bad.png</a>
<a href="http://plombofiles.pbworks.com/f/title_good.png">http://plombofiles.pbworks.com/f/title_good.png</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1367945743.feab0.24071--

--===============0094622544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0094622544==--
