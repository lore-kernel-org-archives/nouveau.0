From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77003] [NV50] Fan speed to high with Kernel versions
 3.13.x - Nvidia GeForce GTS 240 (NV92)
Date: Sat, 05 Apr 2014 21:47:48 +0000
Message-ID: <bug-77003-8800-R7uq3tc01A@http.bugs.freedesktop.org/>
References: <bug-77003-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1369726629=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77003-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1369726629==
Content-Type: multipart/alternative; boundary="1396734468.fDc12.24780"; charset="us-ascii"


--1396734468.fDc12.24780
Date: Sat, 5 Apr 2014 21:47:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77003

--- Comment #6 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #5)
> > Could you try to check if manual fan management works perfectly (try 0 ->
> > 100% in 10 steps) both on the 3.12.9 and 3.13.x?
> 
> How can I set the fan management to manual mode? 
> With pwmconfig I can only test the fans on the motherboard apparently.

Silly me, I forgot to add the link! 

https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/Documentation/thermal/nouveau_thermal

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396734468.fDc12.24780
Date: Sat, 5 Apr 2014 21:47:48 +0000
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
   title="NEW --- - [NV50] Fan speed to high with Kernel versions 3.13.x - Nvidia GeForce GTS 240 (NV92)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77003#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50] Fan speed to high with Kernel versions 3.13.x - Nvidia GeForce GTS 240 (NV92)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77003">bug 77003</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77003#c5">comment #5</a>)
<span class="quote">&gt; &gt; Could you try to check if manual fan management works perfectly (try 0 -&gt;
&gt; &gt; 100% in 10 steps) both on the 3.12.9 and 3.13.x?
&gt; 
&gt; How can I set the fan management to manual mode? 
&gt; With pwmconfig I can only test the fans on the motherboard apparently.</span >

Silly me, I forgot to add the link! 

<a href="https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/Documentation/thermal/nouveau_thermal">https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/Documentation/thermal/nouveau_thermal</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396734468.fDc12.24780--

--===============1369726629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1369726629==--
