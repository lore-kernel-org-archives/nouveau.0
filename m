From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51477] [NV10, NV20] bad/missing graphics,
	usually alpha-related
Date: Sun, 10 Aug 2014 15:08:53 +0000
Message-ID: <bug-51477-8800-psfmZWp7iU@http.bugs.freedesktop.org/>
References: <bug-51477-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1663191391=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51477-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1663191391==
Content-Type: multipart/alternative; boundary="1407683333.4B0B3.15332"; charset="us-ascii"


--1407683333.4B0B3.15332
Date: Sun, 10 Aug 2014 15:08:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51477

--- Comment #26 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #24)
> I noticed a weird thing in the bisected commit... does this patch help?
> 
This patch alone does not help (see comment 10 and 11). Although I would
suspect it's because of the incorrect mask (fixed by the patch linked in
comment 25). Or in other words - there is more than one bugger, thanks for
tracking them down :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407683333.4B0B3.15332
Date: Sun, 10 Aug 2014 15:08:53 +0000
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
   title="NEW --- - [NV10, NV20] bad/missing graphics, usually alpha-related"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51477#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV10, NV20] bad/missing graphics, usually alpha-related"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51477">bug 51477</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=51477#c24">comment #24</a>)
<span class="quote">&gt; I noticed a weird thing in the bisected commit... does this patch help?
&gt; </span >
This patch alone does not help (see <a href="show_bug.cgi?id=51477#c10">comment 10</a> and 11). Although I would
suspect it's because of the incorrect mask (fixed by the patch linked in
<a href="show_bug.cgi?id=51477#c25">comment 25</a>). Or in other words - there is more than one bugger, thanks for
tracking them down :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407683333.4B0B3.15332--

--===============1663191391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1663191391==--
