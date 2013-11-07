From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69203] [NVC1] Kernel 3.11 - Xorg hangs immediately
 after invocation
Date: Thu, 07 Nov 2013 01:02:34 +0000
Message-ID: <bug-69203-8800-puXGV5OEIW@http.bugs.freedesktop.org/>
References: <bug-69203-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0085137093=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69203-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0085137093==
Content-Type: multipart/alternative; boundary="1383786154.8EE7cA83.14765"; charset="us-ascii"


--1383786154.8EE7cA83.14765
Date: Thu, 7 Nov 2013 01:02:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69203

--- Comment #27 from Marc Collin <marccollin7379-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
get same problem with other distribution..

downloaded directly final 3.12 and without passing theses values

ro showopts apm=off noresume edd=off powersaved=off nohz=off highres=off
processor.max_cstate=1 nomodeset x11failsafe

i can't boot and get

MMIO read of 0x000000000 fault a 1x10f20c
MMIO read of 0x000000000 fault a 1x17e8dc

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383786154.8EE7cA83.14765
Date: Thu, 7 Nov 2013 01:02:34 +0000
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
   title="NEW --- - [NVC1] Kernel 3.11 - Xorg hangs immediately after invocation"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69203#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] Kernel 3.11 - Xorg hangs immediately after invocation"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69203">bug 69203</a>
              from <span class="vcard"><a class="email" href="mailto:marccollin7379&#64;gmail.com" title="Marc Collin &lt;marccollin7379&#64;gmail.com&gt;"> <span class="fn">Marc Collin</span></a>
</span></b>
        <pre>get same problem with other distribution..

downloaded directly final 3.12 and without passing theses values

ro showopts apm=off noresume edd=off powersaved=off nohz=off highres=off
processor.max_cstate=1 nomodeset x11failsafe

i can't boot and get

MMIO read of 0x000000000 fault a 1x10f20c
MMIO read of 0x000000000 fault a 1x17e8dc</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383786154.8EE7cA83.14765--

--===============0085137093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0085137093==--
