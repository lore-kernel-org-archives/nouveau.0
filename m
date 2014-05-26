From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78116] Auto fan speed management doesn't do anything
 in non critical temperature range (NVC0)
Date: Mon, 26 May 2014 19:55:29 +0000
Message-ID: <bug-78116-8800-UfpLv53uCS@http.bugs.freedesktop.org/>
References: <bug-78116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0714162565=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78116-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0714162565==
Content-Type: multipart/alternative; boundary="1401134129.C0182.17445"; charset="us-ascii"


--1401134129.C0182.17445
Date: Mon, 26 May 2014 19:55:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78116

--- Comment #24 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #22)
> (In reply to comment #21)
> > Could you try using a 3.15-rcX kernel instead of a 3.14?
> 
> It works correctly under 3.15-rc7 (fan starts at lowest pwm1 value and
> re-sets after re-enabling auto mode) so I guess that it resolves this issue.

I'm glad it works! That means we fixed all the bugs you reported (with the
exception of the i2c issue that still needs to be pulled by Ben before I can
close it)? If so, I would like to thank you again for being an exemplary bug
reporter!

Sorry for being slow to answer to your bug reports though...

Should we close this bug now?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401134129.C0182.17445
Date: Mon, 26 May 2014 19:55:29 +0000
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
   title="NEW --- - Auto fan speed management doesn't do anything in non critical temperature range (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78116#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Auto fan speed management doesn't do anything in non critical temperature range (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78116">bug 78116</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=78116#c22">comment #22</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=78116#c21">comment #21</a>)
&gt; &gt; Could you try using a 3.15-rcX kernel instead of a 3.14?
&gt; 
&gt; It works correctly under 3.15-rc7 (fan starts at lowest pwm1 value and
&gt; re-sets after re-enabling auto mode) so I guess that it resolves this issue.</span >

I'm glad it works! That means we fixed all the bugs you reported (with the
exception of the i2c issue that still needs to be pulled by Ben before I can
close it)? If so, I would like to thank you again for being an exemplary bug
reporter!

Sorry for being slow to answer to your bug reports though...

Should we close this bug now?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401134129.C0182.17445--

--===============0714162565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0714162565==--
