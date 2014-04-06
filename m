From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Sun, 06 Apr 2014 10:36:19 +0000
Message-ID: <bug-76732-8800-HQFx8SKICW@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1307298849=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76732-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1307298849==
Content-Type: multipart/alternative; boundary="1396780579.7ac8ee2.24910"; charset="us-ascii"


--1396780579.7ac8ee2.24910
Date: Sun, 6 Apr 2014 10:36:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #34 from patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I have found an other strange behavior. I have used the latest kernel from the
torvalds git. With 3.14-rc8 it didn't happen.

Loading nouveau the first time results in the usual situation.
I unload it with "echo 0 | sudo tee /sys/class/vtconsole/vtcon1/bind" and "sudo
rmmod nouveau".
I load it again and the CPU is idle and interrupts are normal.
Screen and ttys seem to work as they should.

I cant start X (either the first time I load nouveau nor the second time) which
says
Fatal server error:
[    70.848] (EE) no screens found(EE)
But this is probably becouse I broke it with some updates.


For me at least this is reproducible every time.

I will attach both logiles with debug=PDISP=trace,VBIOS=trace of the first and
second load.

I noticed the following line was present only during the first load:
nouveau  [     DRM] unplugged eDP-1

This was present only on the second load:
nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised

I noticed that during the second load, the vbios is somehow executing
differently. After executing SUB_DIRECT opcodes, sometines it jums, sometimes
not. Maybe becouse it is initializing the gpu on the second load?

Probably there are more differences I did not notice.


@ Dale Hamel 
If you have time, could you please try if you can reproduce it?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396780579.7ac8ee2.24910
Date: Sun, 6 Apr 2014 10:36:19 +0000
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
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c34">Comment # 34</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:patrick.clara&#64;gmail.com" title="patrick.clara&#64;gmail.com">patrick.clara&#64;gmail.com</a>
</span></b>
        <pre>I have found an other strange behavior. I have used the latest kernel from the
torvalds git. With 3.14-rc8 it didn't happen.

Loading nouveau the first time results in the usual situation.
I unload it with &quot;echo 0 | sudo tee /sys/class/vtconsole/vtcon1/bind&quot; and &quot;sudo
rmmod nouveau&quot;.
I load it again and the CPU is idle and interrupts are normal.
Screen and ttys seem to work as they should.

I cant start X (either the first time I load nouveau nor the second time) which
says
Fatal server error:
[    70.848] (EE) no screens found(EE)
But this is probably becouse I broke it with some updates.


For me at least this is reproducible every time.

I will attach both logiles with debug=PDISP=trace,VBIOS=trace of the first and
second load.

I noticed the following line was present only during the first load:
nouveau  [     DRM] unplugged eDP-1

This was present only on the second load:
nouveau  [ DEVINIT][0000:01:00.0] adaptor not initialised

I noticed that during the second load, the vbios is somehow executing
differently. After executing SUB_DIRECT opcodes, sometines it jums, sometimes
not. Maybe becouse it is initializing the gpu on the second load?

Probably there are more differences I did not notice.


&#64; Dale Hamel 
If you have time, could you please try if you can reproduce it?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396780579.7ac8ee2.24910--

--===============1307298849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1307298849==--
