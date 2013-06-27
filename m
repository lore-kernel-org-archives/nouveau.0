From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66176] nouveau.perflvl kernel parameter doesn't work
Date: Thu, 27 Jun 2013 12:58:15 +0000
Message-ID: <bug-66176-8800-1gRsmv65o4@http.bugs.freedesktop.org/>
References: <bug-66176-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0481934806=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66176-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0481934806==
Content-Type: multipart/alternative; boundary="1372337895.2Fd02.10412"; charset="us-ascii"


--1372337895.2Fd02.10412
Date: Thu, 27 Jun 2013 12:58:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66176

--- Comment #5 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #4)
...
> to be *forced* to MANUAL, regardless of its previous state (which I suspect
> is NONE) and then try and set the fan speed.

I would call it "set", rather than "forced"

In the second part you'll need a "reference point" - which can be one of
* The kernel and/or "...I've also done this "manually" using the pathscale
tools"
* Mmio dump of the blob reclocking the card

Initially I would recommend the former

> 
> > * pclk->pll_calc seems to return 0, causing nv40_calc_pll() to throw ERANGE

Confirm if the function nv40_calc_pll() is the one throwing ERANGE. Then dwell
into the function, and analyse any differences with your "reff point".  There
may be a typo/inverted logic, as this code moved around in nouveau quite a few
times

> > * Some of the functions called within nouveau_mem_timing_calc() may need
> > tweaking depending on now well we generate the appropriate memory timings

nouveau_mem_timing_calc()
* parses the memory timing table stored in vbios - nouveau_perf_timing()
* generates the appropriate values based on the card generation -
nv**_mem_timing_calc()
* and the memory type - nouveau_mem_*ddr*()
* On newer cards (iirc nvc0+) it maps the timings with memory frequency range.
On previous generations the timings are related to the performance level rather
than the memory frequency (range)

> 
> > P.S.
> > Only one zero is required to change the perflvl - "0" rather than "0,0"
> Well, by looking at the code, the performance level consists of 2 parts - AC
> (power) and DC (battery) separated by a comma (","), so I used "0,0" for the
> sake of completeness.

You got me there, I have no recollection when AC/DC got introduced ^_^

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372337895.2Fd02.10412
Date: Thu, 27 Jun 2013 12:58:15 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - nouveau.perflvl kernel parameter doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66176#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - nouveau.perflvl kernel parameter doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66176">bug 66176</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=66176#c4">comment #4</a>)
...
<span class="quote">&gt; to be *forced* to MANUAL, regardless of its previous state (which I suspect
&gt; is NONE) and then try and set the fan speed.</span >

I would call it &quot;set&quot;, rather than &quot;forced&quot;

In the second part you'll need a &quot;reference point&quot; - which can be one of
* The kernel and/or &quot;...I've also done this &quot;manually&quot; using the pathscale
tools&quot;
* Mmio dump of the blob reclocking the card

Initially I would recommend the former

<span class="quote">&gt; 
&gt; &gt; * pclk-&gt;pll_calc seems to return 0, causing nv40_calc_pll() to throw ERANGE</span >

Confirm if the function nv40_calc_pll() is the one throwing ERANGE. Then dwell
into the function, and analyse any differences with your &quot;reff point&quot;.  There
may be a typo/inverted logic, as this code moved around in nouveau quite a few
times

<span class="quote">&gt; &gt; * Some of the functions called within nouveau_mem_timing_calc() may need
&gt; &gt; tweaking depending on now well we generate the appropriate memory timings</span >

nouveau_mem_timing_calc()
* parses the memory timing table stored in vbios - nouveau_perf_timing()
* generates the appropriate values based on the card generation -
nv**_mem_timing_calc()
* and the memory type - nouveau_mem_*ddr*()
* On newer cards (iirc nvc0+) it maps the timings with memory frequency range.
On previous generations the timings are related to the performance level rather
than the memory frequency (range)

<span class="quote">&gt; 
&gt; &gt; P.S.
&gt; &gt; Only one zero is required to change the perflvl - &quot;0&quot; rather than &quot;0,0&quot;
&gt; Well, by looking at the code, the performance level consists of 2 parts - AC
&gt; (power) and DC (battery) separated by a comma (&quot;,&quot;), so I used &quot;0,0&quot; for the
&gt; sake of completeness.</span >

You got me there, I have no recollection when AC/DC got introduced ^_^</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372337895.2Fd02.10412--

--===============0481934806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0481934806==--
