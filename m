From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92077] nouveau graphics freeze when using KDE Plasma
 5; PGR engine fault
Date: Tue, 03 May 2016 17:01:44 +0000
Message-ID: <bug-92077-8800-6DYu4NHGri@http.bugs.freedesktop.org/>
References: <bug-92077-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1080139631=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92077-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1080139631==
Content-Type: multipart/alternative; boundary="14622949042.aF99a4.12737";
 charset="UTF-8"


--14622949042.aF99a4.12737
Date: Tue, 3 May 2016 17:01:44 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=92077

--- Comment #22 from Andrey Mazo <ahippo-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org> ---
(In reply to Karol Herbst from comment #21)
> > I tried to disable Network Monitor applet and to close the browser when
> > unused, and the system seems to survive longer (it's been almost 6 days of
> > uptime by now).
> > Not a solution, of course, but, at least, makes the system usable.
> 
> and maybe also tells us a fast way to reproduce.

Yeah, good point.
I'll try to run the applet under apitrace and reproduce the problem.

The system feels much better with the Network Monitor applet disabled -- it's
been 14 days of uptime now.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14622949042.aF99a4.12737
Date: Tue, 3 May 2016 17:01:44 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077">bug 92077</a>
              from <span class="vcard"><a class="email" href="mailto:ahippo&#64;yandex.ru" title="Andrey Mazo &lt;ahippo&#64;yandex.ru&gt;"> <span class="fn">Andrey Mazo</span></a>
</span></b>
        <pre>(In reply to Karol Herbst from <a href="show_bug.cgi?id=92077#c21">comment #21</a>)
<span class="quote">&gt; &gt; I tried to disable Network Monitor applet and to close the browser when
&gt; &gt; unused, and the system seems to survive longer (it's been almost 6 days of
&gt; &gt; uptime by now).
&gt; &gt; Not a solution, of course, but, at least, makes the system usable.
&gt; 
&gt; and maybe also tells us a fast way to reproduce.</span >

Yeah, good point.
I'll try to run the applet under apitrace and reproduce the problem.

The system feels much better with the Network Monitor applet disabled -- it's
been 14 days of uptime now.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14622949042.aF99a4.12737--

--===============1080139631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1080139631==--
