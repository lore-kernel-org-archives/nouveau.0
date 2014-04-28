From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76483] [NV50, bisected,
 RFC patch] xset dpms force {on, off} does not work over DP
Date: Mon, 28 Apr 2014 18:49:32 +0000
Message-ID: <bug-76483-8800-C3dJS2xUnc@http.bugs.freedesktop.org/>
References: <bug-76483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0473349935=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76483-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0473349935==
Content-Type: multipart/alternative; boundary="1398710972.F617F2.10197"; charset="us-ascii"


--1398710972.F617F2.10197
Date: Mon, 28 Apr 2014 18:49:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76483

--- Comment #3 from Karl Schendel <schendel-zf86OBlHRo2+XT7JhA+gdA@public.gmane.org> ---
I think I'm seeing this too.  Mac Pro (2009) with GT120 (G96/NV50) and 24 inch
Apple Cinema display via MDP connection.  powersave blanking used to work in
3.6.3 which was the last kernel I used (opensuse 12.3 otherwise).  Now it does
nothing in opensuse 13.1 which has 3.11.10, also notwork with a 3.14.1 kernel. 
X thinks that it's turned off the display (according to xset q) but nothing
happened.

I would be happy to test a fix if and when a trial is ready.  I have all sorts
of trouble with nouveau on this hardware so I suspect it's not a common setup. 
:-)
Fortunately, recent versions seem pretty good other than the lack of powersave.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398710972.F617F2.10197
Date: Mon, 28 Apr 2014 18:49:32 +0000
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
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483">bug 76483</a>
              from <span class="vcard"><a class="email" href="mailto:schendel&#64;kbcomputer.com" title="Karl Schendel &lt;schendel&#64;kbcomputer.com&gt;"> <span class="fn">Karl Schendel</span></a>
</span></b>
        <pre>I think I'm seeing this too.  Mac Pro (2009) with GT120 (G96/NV50) and 24 inch
Apple Cinema display via MDP connection.  powersave blanking used to work in
3.6.3 which was the last kernel I used (opensuse 12.3 otherwise).  Now it does
nothing in opensuse 13.1 which has 3.11.10, also notwork with a 3.14.1 kernel. 
X thinks that it's turned off the display (according to xset q) but nothing
happened.

I would be happy to test a fix if and when a trial is ready.  I have all sorts
of trouble with nouveau on this hardware so I suspect it's not a common setup. 
:-)
Fortunately, recent versions seem pretty good other than the lack of powersave.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398710972.F617F2.10197--

--===============0473349935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0473349935==--
