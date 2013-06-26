From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66176] nouveau.perflvl kernel parameter doesn't work
Date: Wed, 26 Jun 2013 23:04:47 +0000
Message-ID: <bug-66176-8800-Ce1Gs7Kle7@http.bugs.freedesktop.org/>
References: <bug-66176-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1171762414=="
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


--===============1171762414==
Content-Type: multipart/alternative; boundary="1372287887.Ec7e801.14172"; charset="us-ascii"


--1372287887.Ec7e801.14172
Date: Wed, 26 Jun 2013 23:04:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66176

--- Comment #4 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
(In reply to comment #3)
> * The fanspeed set fails as the mode is not NOUVEAU_THERM_CTRL_MANUAL
> Annoying but not crucial for the re-clocking to complete. Note I'm not
> entirely sure where it should be set
So, the logical solution to this particular problem would be for that mode to
be *forced* to MANUAL, regardless of its previous state (which I suspect is
NONE) and then try and set the fan speed.

> * pclk->pll_calc seems to return 0, causing nv40_calc_pll() to throw ERANGE
> * Some of the functions called within nouveau_mem_timing_calc() may need
> tweaking depending on now well we generate the appropriate memory timings
You've lost me! I am no expert in Nouveau development, although I am a
(willing) developer, so you need to explain the above a little bit.

> P.S.
> Only one zero is required to change the perflvl - "0" rather than "0,0"
Well, by looking at the code, the performance level consists of 2 parts - AC
(power) and DC (battery) separated by a comma (","), so I used "0,0" for the
sake of completeness.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372287887.Ec7e801.14172
Date: Wed, 26 Jun 2013 23:04:47 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66176#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - nouveau.perflvl kernel parameter doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66176">bug 66176</a>
              from <span class="vcard"><a class="email" href="mailto:mr.dash.four&#64;googlemail.com" title="Mr-4 &lt;mr.dash.four&#64;googlemail.com&gt;"> <span class="fn">Mr-4</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=66176#c3">comment #3</a>)
<span class="quote">&gt; * The fanspeed set fails as the mode is not NOUVEAU_THERM_CTRL_MANUAL
&gt; Annoying but not crucial for the re-clocking to complete. Note I'm not
&gt; entirely sure where it should be set</span >
So, the logical solution to this particular problem would be for that mode to
be *forced* to MANUAL, regardless of its previous state (which I suspect is
NONE) and then try and set the fan speed.

<span class="quote">&gt; * pclk-&gt;pll_calc seems to return 0, causing nv40_calc_pll() to throw ERANGE
&gt; * Some of the functions called within nouveau_mem_timing_calc() may need
&gt; tweaking depending on now well we generate the appropriate memory timings</span >
You've lost me! I am no expert in Nouveau development, although I am a
(willing) developer, so you need to explain the above a little bit.

<span class="quote">&gt; P.S.
&gt; Only one zero is required to change the perflvl - &quot;0&quot; rather than &quot;0,0&quot;</span >
Well, by looking at the code, the performance level consists of 2 parts - AC
(power) and DC (battery) separated by a comma (&quot;,&quot;), so I used &quot;0,0&quot; for the
sake of completeness.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372287887.Ec7e801.14172--

--===============1171762414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1171762414==--
