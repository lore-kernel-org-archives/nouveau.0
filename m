From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80300] [NVE7] Fails to suspend on 3.15
Date: Fri, 20 Jun 2014 21:47:16 +0000
Message-ID: <bug-80300-8800-dL2tqNLoUl@http.bugs.freedesktop.org/>
References: <bug-80300-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1537019918=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80300-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1537019918==
Content-Type: multipart/alternative; boundary="1403300836.C552dD31.19008"; charset="us-ascii"


--1403300836.C552dD31.19008
Date: Fri, 20 Jun 2014 21:47:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80300

--- Comment #3 from e.swanson+xorgbugs-5lA2vZBjcqn3oGB3hsPCZA@public.gmane.org ---
eswanson@svoboda ~$ sudo cat /sys/kernel/debug/vgaswitcheroo/switch
0:DIS: :DynPwr:0000:01:00.0
1:IGD:+:Pwr:0000:00:02.0

I've always used bbswitch and multiple Xorg.conf files to manage my two GPUs,
so I'm not sure how to interpret the above, but it doesn't look the same as in
#80013.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403300836.C552dD31.19008
Date: Fri, 20 Jun 2014 21:47:16 +0000
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
   title="NEW --- - [NVE7] Fails to suspend on 3.15"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80300#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Fails to suspend on 3.15"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80300">bug 80300</a>
              from <span class="vcard"><a class="email" href="mailto:e.swanson+xorgbugs&#64;alloscomp.com" title="e.swanson+xorgbugs&#64;alloscomp.com">e.swanson+xorgbugs&#64;alloscomp.com</a>
</span></b>
        <pre>eswanson&#64;svoboda ~$ sudo cat /sys/kernel/debug/vgaswitcheroo/switch
0:DIS: :DynPwr:0000:01:00.0
1:IGD:+:Pwr:0000:00:02.0

I've always used bbswitch and multiple Xorg.conf files to manage my two GPUs,
so I'm not sure how to interpret the above, but it doesn't look the same as in
#80013.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403300836.C552dD31.19008--

--===============1537019918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1537019918==--
