From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78116] Auto fan speed management doesn't do anything
 in non critical temperature range (NVC0)
Date: Mon, 26 May 2014 18:51:12 +0000
Message-ID: <bug-78116-8800-o4Jh2Ov6qr@http.bugs.freedesktop.org/>
References: <bug-78116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0894220249=="
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


--===============0894220249==
Content-Type: multipart/alternative; boundary="1401130271.Dd831312.5413"; charset="us-ascii"


--1401130271.Dd831312.5413
Date: Mon, 26 May 2014 18:51:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78116

--- Comment #23 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #22)
> (In reply to comment #21)
> > Could you try using a 3.15-rcX kernel instead of a 3.14?
> 
> It works correctly under 3.15-rc7 (fan starts at lowest pwm1 value and
> re-sets after re-enabling auto mode) so I guess that it resolves this issue.

Most likely fixed with the following

commit dcd9262b3baf881285e9e0fd5459d54723cc992e
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Mar 24 13:34:47 2014 +1000

    drm/nouveau/therm: check for sensor presence with requested mode, not
current


perhaps we can forward it to linus-stable ?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401130271.Dd831312.5413
Date: Mon, 26 May 2014 18:51:11 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78116#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Auto fan speed management doesn't do anything in non critical temperature range (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78116">bug 78116</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=78116#c22">comment #22</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=78116#c21">comment #21</a>)
&gt; &gt; Could you try using a 3.15-rcX kernel instead of a 3.14?
&gt; 
&gt; It works correctly under 3.15-rc7 (fan starts at lowest pwm1 value and
&gt; re-sets after re-enabling auto mode) so I guess that it resolves this issue.</span >

Most likely fixed with the following

commit dcd9262b3baf881285e9e0fd5459d54723cc992e
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Mon Mar 24 13:34:47 2014 +1000

    drm/nouveau/therm: check for sensor presence with requested mode, not
current


perhaps we can forward it to linus-stable ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401130271.Dd831312.5413--

--===============0894220249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0894220249==--
