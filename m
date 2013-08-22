From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Thu, 22 Aug 2013 02:00:11 +0000
Message-ID: <bug-67382-8800-CxRhWyp6F5@http.bugs.freedesktop.org/>
References: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0019832303=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0019832303==
Content-Type: multipart/alternative; boundary="1377136811.856eA2.29811"; charset="us-ascii"


--1377136811.856eA2.29811
Date: Thu, 22 Aug 2013 02:00:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67382

--- Comment #31 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #30)
> As the days went by. I'm wondering what I should do. Or what's the case with
> this report.
> Is it kind of a problem, that I need to take care myself? E.g. it cannot be
> patched/removed/altered, because this stabilisation is needed and would harm
> other cards?
> 
Point is I've asked a few people and no-one seems to have such issue like you.
So I'm suspecting that it's related to the original NV50. With that said the
only person I can think of having such a card to test is the nouveau/kernel
maintainer. Which is quite busy, but hopefully will have a moment to test.

Side effect of using the new "fix" is causing a regression on almost all other
cards, and/or the need to increase the delay to a silly value (as it was
before).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377136811.856eA2.29811
Date: Thu, 22 Aug 2013 02:00:11 +0000
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
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382#c31">Comment # 31</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382">bug 67382</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67382#c30">comment #30</a>)
<span class="quote">&gt; As the days went by. I'm wondering what I should do. Or what's the case with
&gt; this report.
&gt; Is it kind of a problem, that I need to take care myself? E.g. it cannot be
&gt; patched/removed/altered, because this stabilisation is needed and would harm
&gt; other cards?
&gt; </span >
Point is I've asked a few people and no-one seems to have such issue like you.
So I'm suspecting that it's related to the original NV50. With that said the
only person I can think of having such a card to test is the nouveau/kernel
maintainer. Which is quite busy, but hopefully will have a moment to test.

Side effect of using the new &quot;fix&quot; is causing a regression on almost all other
cards, and/or the need to increase the delay to a silly value (as it was
before).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377136811.856eA2.29811--

--===============0019832303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0019832303==--
