From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78116] Auto fan speed management doesn't do anything
 in non critical temperature range (NVC0)
Date: Wed, 21 May 2014 17:48:13 +0000
Message-ID: <bug-78116-8800-D4pv0MuGtL@http.bugs.freedesktop.org/>
References: <bug-78116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0200142028=="
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


--===============0200142028==
Content-Type: multipart/alternative; boundary="1400694493.c2Ee325f2.21856"; charset="us-ascii"


--1400694493.c2Ee325f2.21856
Date: Wed, 21 May 2014 17:48:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78116

--- Comment #12 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #11)
> Thanks for taking a look. I still have older card (GTX 260) so I can try
> that (other disto too?) and maybe other cards as well. 

Well, you can try to check if they work but the point remains, your current
card doesn't work and it needs to be fixed.

> Can you confirm that it actually resets for you fan rpm to pwm 55 (or any
> other low/default value) once auto mode is enabled and the previous state
> was different/higher (say pwm 100)?

Yes, I confirm this. We'll check why it doesn't work on your card and fix it!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1400694493.c2Ee325f2.21856
Date: Wed, 21 May 2014 17:48:13 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78116#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Auto fan speed management doesn't do anything in non critical temperature range (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78116">bug 78116</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=78116#c11">comment #11</a>)
<span class="quote">&gt; Thanks for taking a look. I still have older card (GTX 260) so I can try
&gt; that (other disto too?) and maybe other cards as well. </span >

Well, you can try to check if they work but the point remains, your current
card doesn't work and it needs to be fixed.

<span class="quote">&gt; Can you confirm that it actually resets for you fan rpm to pwm 55 (or any
&gt; other low/default value) once auto mode is enabled and the previous state
&gt; was different/higher (say pwm 100)?</span >

Yes, I confirm this. We'll check why it doesn't work on your card and fix it!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1400694493.c2Ee325f2.21856--

--===============0200142028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0200142028==--
