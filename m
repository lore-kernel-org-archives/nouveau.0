From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68768] [NV92] PTHERM unhandled intr error during boot
Date: Fri, 30 Aug 2013 19:40:10 +0000
Message-ID: <bug-68768-8800-tDgCIw7TNU@http.bugs.freedesktop.org/>
References: <bug-68768-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0862770891=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68768-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0862770891==
Content-Type: multipart/alternative; boundary="1377891610.104ED2.32279"; charset="us-ascii"


--1377891610.104ED2.32279
Date: Fri, 30 Aug 2013 19:40:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68768

--- Comment #4 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #2)
> thank you,
> 
> I (apparently) haven't noticed problems, at least no big problem
> 
> but deeply investigating I could notice a bad fan management (could be
> PTHERM related....)

The PTHERM error is harmless. I'll fix it though :) That's funny though because
I was doing a round of PTHERM testing on nv50 and found this problem too.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377891610.104ED2.32279
Date: Fri, 30 Aug 2013 19:40:10 +0000
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
   title="NEW --- - [NV92] PTHERM unhandled intr error during boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68768#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] PTHERM unhandled intr error during boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68768">bug 68768</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=68768#c2">comment #2</a>)
<span class="quote">&gt; thank you,
&gt; 
&gt; I (apparently) haven't noticed problems, at least no big problem
&gt; 
&gt; but deeply investigating I could notice a bad fan management (could be
&gt; PTHERM related....)</span >

The PTHERM error is harmless. I'll fix it though :) That's funny though because
I was doing a round of PTHERM testing on nv50 and found this problem too.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377891610.104ED2.32279--

--===============0862770891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0862770891==--
