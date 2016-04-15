From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92077] nouveau graphics freeze when using KDE Plasma
 5; PGR engine fault
Date: Fri, 15 Apr 2016 16:03:55 +0000
Message-ID: <bug-92077-8800-TIL4asaBgR@http.bugs.freedesktop.org/>
References: <bug-92077-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0390723360=="
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


--===============0390723360==
Content-Type: multipart/alternative; boundary="14607362351.8DC4d.23554";
 charset="UTF-8"


--14607362351.8DC4d.23554
Date: Fri, 15 Apr 2016 16:03:55 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=92077

--- Comment #19 from Andrey Mazo <ahippo-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org> ---
(In reply to zoominee from comment #18)
> (In reply to Andrey Mazo from comment #17)
> > zoominee, have you tried disabling the system activity applet that you
> > suspected could trigger the issue?
> 
> If it's caused by an applet, it would be the clock in the top right corner,
> that's the only thing that updates the screen regularly...  But it seems
> that other larger-scale updates to the screen (e.g., processing pictures in
> the image processing program, or the weird scrolling thing I mentioned with
> the Opera and Vivaldi browsers) lead to this bug/freeze more quickly.

Looks like, I don't have the clock applet as you do, so for me, Network Monitor
and System Load Viewer applets are the only ones to update the screen every
second.

Will try to scroll web-pages in Opera like crazy while capturing an apitrace in
order to reproduce the problem.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14607362351.8DC4d.23554
Date: Fri, 15 Apr 2016 16:03:55 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077">bug 92077</a>
              from <span class="vcard"><a class="email" href="mailto:ahippo&#64;yandex.ru" title="Andrey Mazo &lt;ahippo&#64;yandex.ru&gt;"> <span class="fn">Andrey Mazo</span></a>
</span></b>
        <pre>(In reply to zoominee from <a href="show_bug.cgi?id=92077#c18">comment #18</a>)
<span class="quote">&gt; (In reply to Andrey Mazo from <a href="show_bug.cgi?id=92077#c17">comment #17</a>)
&gt; &gt; zoominee, have you tried disabling the system activity applet that you
&gt; &gt; suspected could trigger the issue?
&gt; 
&gt; If it's caused by an applet, it would be the clock in the top right corner,
&gt; that's the only thing that updates the screen regularly...  But it seems
&gt; that other larger-scale updates to the screen (e.g., processing pictures in
&gt; the image processing program, or the weird scrolling thing I mentioned with
&gt; the Opera and Vivaldi browsers) lead to this bug/freeze more quickly.</span >

Looks like, I don't have the clock applet as you do, so for me, Network Monitor
and System Load Viewer applets are the only ones to update the screen every
second.

Will try to scroll web-pages in Opera like crazy while capturing an apitrace in
order to reproduce the problem.</pre>
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
--14607362351.8DC4d.23554--

--===============0390723360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0390723360==--
