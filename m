From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Fri, 22 Feb 2013 07:59:14 +0000
Message-ID: <bug-59168-8800-fSPsdNkD5H@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0858552740=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0858552740==
Content-Type: multipart/alternative; boundary="1361519954.F3bFb65.8556"; charset="us-ascii"


--1361519954.F3bFb65.8556
Date: Fri, 22 Feb 2013 07:59:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #24 from Petr Stastny <p.stastny-Mmb7MZpHnFY@public.gmane.org> ---
I compiled the nouveau kernel yesterday in the hope that the newest nouveau
source will fix the suspend / resume issue and help with the hibernation.
Nevertheless, it does not help.
It is even a bit worse since normal work is impossible with that kernel - the
card seems to be very slow and locks..

However, I was able to use 3.4.32 for the normal suspend / resume without a
glitch (coming from hibernate results in black screen though) for the last 5
days..

So it mean to me, the card was working already, but stopped to work probably in
course of the 3.5.x refactoring..

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361519954.F3bFb65.8556
Date: Fri, 22 Feb 2013 07:59:14 +0000
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
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:p.stastny&#64;gmx.de" title="Petr Stastny &lt;p.stastny&#64;gmx.de&gt;"> <span class="fn">Petr Stastny</span></a>
</span></b>
        <pre>I compiled the nouveau kernel yesterday in the hope that the newest nouveau
source will fix the suspend / resume issue and help with the hibernation.
Nevertheless, it does not help.
It is even a bit worse since normal work is impossible with that kernel - the
card seems to be very slow and locks..

However, I was able to use 3.4.32 for the normal suspend / resume without a
glitch (coming from hibernate results in black screen though) for the last 5
days..

So it mean to me, the card was working already, but stopped to work probably in
course of the 3.5.x refactoring..</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361519954.F3bFb65.8556--

--===============0858552740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0858552740==--
