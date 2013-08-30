From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64746] optimus don't use nouveau card
Date: Fri, 30 Aug 2013 13:53:15 +0000
Message-ID: <bug-64746-8800-uN5VDjUFnl@http.bugs.freedesktop.org/>
References: <bug-64746-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0981951377=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64746-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0981951377==
Content-Type: multipart/alternative; boundary="1377870795.DdaB0cA0.26664"; charset="us-ascii"


--1377870795.DdaB0cA0.26664
Date: Fri, 30 Aug 2013 13:53:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64746

--- Comment #7 from Marc Collin <marccollin7379-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
cat /sys/kernel/debug/vgaswitcheroo/switch 
0:DIS: :Pwr:0000:01:00.0
1:IGD:+:Pwr:0000:00:02.0

don't seem switched?

i tried
echo DIS > /sys/kernel/debug/vgaswitcheroo/switch

but the screen get completly black...

so i switched back with 
echo IGD > /sys/kernel/debug/vgaswitcheroo/switch

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377870795.DdaB0cA0.26664
Date: Fri, 30 Aug 2013 13:53:15 +0000
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
   title="NEW --- - optimus don't use nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64746#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - optimus don't use nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64746">bug 64746</a>
              from <span class="vcard"><a class="email" href="mailto:marccollin7379&#64;gmail.com" title="Marc Collin &lt;marccollin7379&#64;gmail.com&gt;"> <span class="fn">Marc Collin</span></a>
</span></b>
        <pre>cat /sys/kernel/debug/vgaswitcheroo/switch 
0:DIS: :Pwr:0000:01:00.0
1:IGD:+:Pwr:0000:00:02.0

don't seem switched?

i tried
echo DIS &gt; /sys/kernel/debug/vgaswitcheroo/switch

but the screen get completly black...

so i switched back with 
echo IGD &gt; /sys/kernel/debug/vgaswitcheroo/switch</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377870795.DdaB0cA0.26664--

--===============0981951377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0981951377==--
