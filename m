From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Tue, 23 Sep 2014 17:18:51 +0000
Message-ID: <bug-27501-8800-GfeYq1TxIi@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0278817623=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0278817623==
Content-Type: multipart/alternative; boundary="1411492731.5BFEA56.25205"; charset="us-ascii"


--1411492731.5BFEA56.25205
Date: Tue, 23 Sep 2014 17:18:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #33 from Joanand <MacGyver031-S0/GAf8tV78@public.gmane.org> ---
I confirm that the patch works, screen is NOT scrambled.
Unsing my ancient gpupwr-programm to deactivate 9600M, I am able to start
xorg-x11 + fluxbox with accleration.

Pierre, thank you very much.

I have seen that vga-switcheroo does not get started, probably due to the 9600M
fallen off the bus.

I cannot await your fix for 9600M with acceleration.

BR.

(In reply to comment #29)
> Created attachment 106246 [details] [review]
> Temporary patch for 9400M GT acceleration
> 
> Could you please test this patch along with Ilia's one? It should fix
> acceleration on the 9400M GT, allowing you to boot without nouveau.noaccel=1
> and to launch X.
> 
> I'll need to refine the patch a bit as it introduces some errors on the
> 9600M.
> Another patch may be mandatory to get both cards to get along: for now, the
> laptop seems to be hitting an infinite loop when launching X with both cards
> enabled.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411492731.5BFEA56.25205
Date: Tue, 23 Sep 2014 17:18:51 +0000
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
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c33">Comment # 33</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:MacGyver031&#64;web.de" title="Joanand &lt;MacGyver031&#64;web.de&gt;"> <span class="fn">Joanand</span></a>
</span></b>
        <pre>I confirm that the patch works, screen is NOT scrambled.
Unsing my ancient gpupwr-programm to deactivate 9600M, I am able to start
xorg-x11 + fluxbox with accleration.

Pierre, thank you very much.

I have seen that vga-switcheroo does not get started, probably due to the 9600M
fallen off the bus.

I cannot await your fix for 9600M with acceleration.

BR.

(In reply to <a href="show_bug.cgi?id=27501#c29">comment #29</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=106246" name="attach_106246" title="Temporary patch for 9400M GT acceleration">attachment 106246</a> <a href="attachment.cgi?id=106246&amp;action=edit" title="Temporary patch for 9400M GT acceleration">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=27501&amp;attachment=106246'>[review]</a> [review]
&gt; Temporary patch for 9400M GT acceleration
&gt; 
&gt; Could you please test this patch along with Ilia's one? It should fix
&gt; acceleration on the 9400M GT, allowing you to boot without nouveau.noaccel=1
&gt; and to launch X.
&gt; 
&gt; I'll need to refine the patch a bit as it introduces some errors on the
&gt; 9600M.
&gt; Another patch may be mandatory to get both cards to get along: for now, the
&gt; laptop seems to be hitting an infinite loop when launching X with both cards
&gt; enabled.</span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411492731.5BFEA56.25205--

--===============0278817623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0278817623==--
