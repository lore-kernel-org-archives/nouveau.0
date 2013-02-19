From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Tue, 19 Feb 2013 16:08:48 +0000
Message-ID: <bug-59168-8800-ULKFUmdNgo@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1942397922=="
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


--===============1942397922==
Content-Type: multipart/alternative; boundary="1361290128.12AeD364.3884"; charset="us-ascii"


--1361290128.12AeD364.3884
Date: Tue, 19 Feb 2013 16:08:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #11 from Petr Stastny <p.stastny-Mmb7MZpHnFY@public.gmane.org> ---
Suspend/resume is working on my w520 with NV30 using kernel 3.4.32!

After trying many different vanilla kernel versions
(3.2.x/3.4.x/3.6.x/3.7x/3.8.x) I finally found out that using 3.4.32 the
suspend/resume works flawlessly!

As a side note: starting with the kernel versions 3.2.x up to 3.4.32 there is a
dedicated nv30x.c code (along with the nv40) in the kernel. Starting with 3.7
the code file for nv30 disappeared, however, the nv40 is still present.

This is somehow mysterious for me, as the nv30 family is a bit different from
nv40.. Does anybody have a clue for this?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361290128.12AeD364.3884
Date: Tue, 19 Feb 2013 16:08:48 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:p.stastny&#64;gmx.de" title="Petr Stastny &lt;p.stastny&#64;gmx.de&gt;"> <span class="fn">Petr Stastny</span></a>
</span></b>
        <pre>Suspend/resume is working on my w520 with NV30 using kernel 3.4.32!

After trying many different vanilla kernel versions
(3.2.x/3.4.x/3.6.x/3.7x/3.8.x) I finally found out that using 3.4.32 the
suspend/resume works flawlessly!

As a side note: starting with the kernel versions 3.2.x up to 3.4.32 there is a
dedicated nv30x.c code (along with the nv40) in the kernel. Starting with 3.7
the code file for nv30 disappeared, however, the nv40 is still present.

This is somehow mysterious for me, as the nv30 family is a bit different from
nv40.. Does anybody have a clue for this?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361290128.12AeD364.3884--

--===============1942397922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1942397922==--
