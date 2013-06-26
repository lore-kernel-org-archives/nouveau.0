From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66176] nouveau.perflvl kernel parameter doesn't work
Date: Wed, 26 Jun 2013 15:37:28 +0000
Message-ID: <bug-66176-8800-5QS40dXSH8@http.bugs.freedesktop.org/>
References: <bug-66176-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2060265308=="
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


--===============2060265308==
Content-Type: multipart/alternative; boundary="1372261048.C6cEBD442.9032"; charset="us-ascii"


--1372261048.C6cEBD442.9032
Date: Wed, 26 Jun 2013 15:37:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66176

--- Comment #3 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #2)
> I am willing to give you a hand in the development and/or testing, if needed.
Glad to hear, there are a few notes further down that you can start with

> 
> I know for a fact that re-clocking is possible on this card - I do that
> (quite regularly) on Windows and if I remember correctly I've also done this
> "manually" using the pathscale tools.
Afaik Windows is another kettle of fish, although if it worked previously
that's a good starting point

On the other from you can work from the current state and nitpick until it
works

* The fanspeed set fails as the mode is not NOUVEAU_THERM_CTRL_MANUAL
Annoying but not crucial for the re-clocking to complete. Note I'm not entirely
sure where it should be set

* pclk->pll_calc seems to return 0, causing nv40_calc_pll() to throw ERANGE
* Some of the functions called within nouveau_mem_timing_calc() may need
tweaking depending on now well we generate the appropriate memory timings

Happy hacking :)

P.S.
Only one zero is required to change the perflvl - "0" rather than "0,0"

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372261048.C6cEBD442.9032
Date: Wed, 26 Jun 2013 15:37:28 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66176#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - nouveau.perflvl kernel parameter doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66176">bug 66176</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=66176#c2">comment #2</a>)
<span class="quote">&gt; I am willing to give you a hand in the development and/or testing, if needed.</span >
Glad to hear, there are a few notes further down that you can start with

<span class="quote">&gt; 
&gt; I know for a fact that re-clocking is possible on this card - I do that
&gt; (quite regularly) on Windows and if I remember correctly I've also done this
&gt; &quot;manually&quot; using the pathscale tools.</span >
Afaik Windows is another kettle of fish, although if it worked previously
that's a good starting point

On the other from you can work from the current state and nitpick until it
works

* The fanspeed set fails as the mode is not NOUVEAU_THERM_CTRL_MANUAL
Annoying but not crucial for the re-clocking to complete. Note I'm not entirely
sure where it should be set

* pclk-&gt;pll_calc seems to return 0, causing nv40_calc_pll() to throw ERANGE
* Some of the functions called within nouveau_mem_timing_calc() may need
tweaking depending on now well we generate the appropriate memory timings

Happy hacking :)

P.S.
Only one zero is required to change the perflvl - &quot;0&quot; rather than &quot;0,0&quot;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372261048.C6cEBD442.9032--

--===============2060265308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2060265308==--
