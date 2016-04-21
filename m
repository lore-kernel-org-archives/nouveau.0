From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95031] [NVE4] 660 Ti Random GPU lockups
Date: Thu, 21 Apr 2016 17:15:12 +0000
Message-ID: <bug-95031-8800-Lo4ZC9Pli3@http.bugs.freedesktop.org/>
References: <bug-95031-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1373671461=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95031-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1373671461==
Content-Type: multipart/alternative; boundary="14612589111.B4F2.1497";
 charset="UTF-8"


--14612589111.B4F2.1497
Date: Thu, 21 Apr 2016 17:15:11 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95031

--- Comment #8 from Lucas Ribeiro <lucasout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Karol Herbst from comment #7)
> (In reply to Lucas Ribeiro from comment #4)
> > 
> > So maybe 07 pstate on Linux has a memory clock too high for its voltage.
> > Also, as it is the lowest pstate, maybe memory clock could be reduced
> > further to 162MHz (as in Windows).
> 
> And maybe not. There are other issues which aren't exactly voltage related.
> If such a high votlage won't help, then it is usually something else, we
> just have to figure out what it is.
> 
> Also regarding the lower clocks: yeah I know that sometimes nvidia clocks
> further down, but there is no real value in doing so if there is no voltage
> information for those low clocks and it doesn't make any difference
> regarding power consumption as far as I know.

Thanks for clearing that up.

I'm out of ideas, should I capture a mmiotrace?

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14612589111.B4F2.1497
Date: Thu, 21 Apr 2016 17:15:11 +0000
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
   title="NEW - [NVE4] 660 Ti Random GPU lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95031#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] 660 Ti Random GPU lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95031">bug 95031</a>
              from <span class="vcard"><a class="email" href="mailto:lucasout&#64;gmail.com" title="Lucas Ribeiro &lt;lucasout&#64;gmail.com&gt;"> <span class="fn">Lucas Ribeiro</span></a>
</span></b>
        <pre>(In reply to Karol Herbst from <a href="show_bug.cgi?id=95031#c7">comment #7</a>)
<span class="quote">&gt; (In reply to Lucas Ribeiro from <a href="show_bug.cgi?id=95031#c4">comment #4</a>)
&gt; &gt; 
&gt; &gt; So maybe 07 pstate on Linux has a memory clock too high for its voltage.
&gt; &gt; Also, as it is the lowest pstate, maybe memory clock could be reduced
&gt; &gt; further to 162MHz (as in Windows).
&gt; 
&gt; And maybe not. There are other issues which aren't exactly voltage related.
&gt; If such a high votlage won't help, then it is usually something else, we
&gt; just have to figure out what it is.
&gt; 
&gt; Also regarding the lower clocks: yeah I know that sometimes nvidia clocks
&gt; further down, but there is no real value in doing so if there is no voltage
&gt; information for those low clocks and it doesn't make any difference
&gt; regarding power consumption as far as I know.</span >

Thanks for clearing that up.

I'm out of ideas, should I capture a mmiotrace?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14612589111.B4F2.1497--

--===============1373671461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1373671461==--
