From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69488] GF108 (NVC1) GPU lockup
Date: Sat, 26 Oct 2013 13:38:25 +0000
Message-ID: <bug-69488-8800-1QjDRo9NhW@http.bugs.freedesktop.org/>
References: <bug-69488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0988965262=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0988965262==
Content-Type: multipart/alternative; boundary="1382794705.e5A3B1.14118"; charset="us-ascii"


--1382794705.e5A3B1.14118
Date: Sat, 26 Oct 2013 13:38:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69488

--- Comment #21 from Kevin N. <vekinn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #20)
> I'm not experiencing the hangs with 3.12-rc6 any longer.  Displayport is
> working with the Nvidia card as dedicated, but not with Optimus
> configuration DP-1-1 the TV shows no input.

Scratch that, it had been fine for a few days.  It hung again just this morning
when I ran xrandr, nothing relevant in dmesg, had to power off the machine. 
After a few power cycles it seems to be working again.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382794705.e5A3B1.14118
Date: Sat, 26 Oct 2013 13:38:25 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488">bug 69488</a>
              from <span class="vcard"><a class="email" href="mailto:vekinn&#64;gmail.com" title="Kevin N. &lt;vekinn&#64;gmail.com&gt;"> <span class="fn">Kevin N.</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=69488#c20">comment #20</a>)
<span class="quote">&gt; I'm not experiencing the hangs with 3.12-rc6 any longer.  Displayport is
&gt; working with the Nvidia card as dedicated, but not with Optimus
&gt; configuration DP-1-1 the TV shows no input.</span >

Scratch that, it had been fine for a few days.  It hung again just this morning
when I ran xrandr, nothing relevant in dmesg, had to power off the machine. 
After a few power cycles it seems to be working again.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382794705.e5A3B1.14118--

--===============0988965262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0988965262==--
