From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Wed, 18 Dec 2013 15:48:57 +0000
Message-ID: <bug-58378-8800-WNUeuujcJh@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1943293801=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1943293801==
Content-Type: multipart/alternative; boundary="1387381737.fAe26.7089"; charset="us-ascii"


--1387381737.fAe26.7089
Date: Wed, 18 Dec 2013 15:48:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #50 from anakin.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
For the reclocking to work on 3.13 you need to apply this patch:

http://cgit.freedesktop.org/~darktama/nouveau/commit/?h=devel-pm&id=74556533b2cc3dd787ba9fc8a346177116d1a68e

And you can change the performance level with
/sys/class/drm/card0/device/pstate
(I think the command line options don't do anything anymore)

This new 3.13 reclocking might just hang your system though (it does for mine
on the two computers I tested on).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387381737.fAe26.7089
Date: Wed, 18 Dec 2013 15:48:57 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c50">Comment # 50</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:anakin.cs&#64;gmail.com" title="anakin.cs&#64;gmail.com">anakin.cs&#64;gmail.com</a>
</span></b>
        <pre>For the reclocking to work on 3.13 you need to apply this patch:

<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?h=devel-pm&amp;id=74556533b2cc3dd787ba9fc8a346177116d1a68e">http://cgit.freedesktop.org/~darktama/nouveau/commit/?h=devel-pm&amp;id=74556533b2cc3dd787ba9fc8a346177116d1a68e</a>

And you can change the performance level with
/sys/class/drm/card0/device/pstate
(I think the command line options don't do anything anymore)

This new 3.13 reclocking might just hang your system though (it does for mine
on the two computers I tested on).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387381737.fAe26.7089--

--===============1943293801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1943293801==--
