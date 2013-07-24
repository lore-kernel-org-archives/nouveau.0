From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Wed, 24 Jul 2013 22:51:47 +0000
Message-ID: <bug-58556-8800-Wrk0G5ZoHi@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0839295160=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0839295160==
Content-Type: multipart/alternative; boundary="1374706307.fBC27A3.10860"; charset="us-ascii"


--1374706307.fBC27A3.10860
Date: Wed, 24 Jul 2013 22:51:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

--- Comment #10 from Matyas <Markovics.matyas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Thanks for the pointers Emil.

I have tried the NvForcePost=1 configuration with noaccel=1, it only resulted
in the backlight being bumped to 100%. My screen was still meessed up. Doing
the suspend/resume trick fixed it.

Without noaccel I get a system crash too.

It would be nice to get acceleration.

Joanand, am I understanding it correctly that you could get your 9400 with
accel? If so was that prior to 3.7 kernels?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374706307.fBC27A3.10860
Date: Wed, 24 Jul 2013 22:51:47 +0000
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
   title="NEW --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:Markovics.matyas&#64;gmail.com" title="Matyas &lt;Markovics.matyas&#64;gmail.com&gt;"> <span class="fn">Matyas</span></a>
</span></b>
        <pre>Thanks for the pointers Emil.

I have tried the NvForcePost=1 configuration with noaccel=1, it only resulted
in the backlight being bumped to 100%. My screen was still meessed up. Doing
the suspend/resume trick fixed it.

Without noaccel I get a system crash too.

It would be nice to get acceleration.

Joanand, am I understanding it correctly that you could get your 9400 with
accel? If so was that prior to 3.7 kernels?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374706307.fBC27A3.10860--

--===============0839295160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0839295160==--
